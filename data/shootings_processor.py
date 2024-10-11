#!/usr/bin/env python
# coding: utf-8

# In[50]:


from urllib.request import urlopen
from PyPDF2 import PdfReader
import requests
import io
import pandas as pd
from bs4 import BeautifulSoup
import re
import csv
from datetime import datetime
import spacy
from spacy import displacy
from dateparser.search import search_dates


# In[6]:


def shooting_pdfurls():
    currentyear = 2024
    pdfurls = []
    srcurls = ['https://da.lacounty.gov/reports/ois/' + str(y) for y in range(2016, currentyear)] +         ['https://da.lacounty.gov/reports/ois/']
    for srcurl in srcurls:
        req=requests.get(srcurl)
        soup = BeautifulSoup(req.content,"html")
        content = soup.find_all("div", {"class": "field-items"})
        for p in content:
            for a in p("a"):
                filepath = a.get('href')
                rex = re.search("JSID-OIS.*\.pdf$", filepath)
                if rex:
                    pdfurl = 'https://da.lacounty.gov' + filepath
                    filename = rex[0]
                    pdfurls += [pdfurl]
    return list(set(pdfurls))


# In[145]:


# features to extract to database:
# name(s) of victim(s)
# officers involved: which agency, deputy names, and badge numbers. 
# jsid file number
# internal file number(s) for involved agencies
# date of filing
# conclusion text
# conclusion - maybe need NLP
# action taken - need NLP

# geolocation, incident date would be ideal. but those are not always available,
# and when available need to extracted from the document text, probably can only be 
# reliably accomplished by a finetuned powerful transformer. 
# or just human labor, since it's only a few hundred documents


# In[219]:


# first layer of processing: extract
# title
# departments 
# list of officers w/ badge numbers
# jsid number
# date of filing
# file numbers
# conclusion text

def shooting_process(url):
    try:
        response = requests.get(url)
    except:
        print('Malformed URL exception thrown at URL: ' + url)
        return False
    with io.BytesIO(response.content) as f:
        try:
            pdf = PdfReader(f)
            covertext = pdf.pages[0].extract_text() 
            # the first page contains fatal/nonftal, officers, jsid number district attorney, date of filing
            coverlines = covertext.splitlines()
            coverlines = [line for line in coverlines if line.strip()]
        except:
            print('404 exception thrown at URL: ' + url)
            return False
        try:
            # find the line which has "department," "patrol," or "administration" (modulo taxicab 1)
            # if multiple, throw a formatting exception
            deptlines = [s for s in coverlines                          if "depart" in s.lower() or "artment" in s.lower()                          or "patrol" in s.lower() or "admin" in s.lower() or "bureau" in s.lower()]
            if len(deptlines) != 1:
                print('Unable to recognize department line at URL: ' + url)
                return False
            deptindex = coverlines.index(deptlines[0])
            # title is concatenation of lines prior to department line. clean title. 
            title = ''.join(coverlines[0:deptindex])
            title = title.strip()
            title = re.sub(' +', ' ', title) # strip extra whitespaces
            title = re.sub(r'(?<=\W)\s', '',title) 
            title = re.sub(r' (?![a-zA-Z])', '',title) # remove all spaces between non-letters
            department = re.sub(r' ([^A-Z])', r'\1', deptlines[0]) # strip all spaces not before capital letters
            i = deptindex + 1
            # deputies are concatenation of lines following department line. clean deputies
            deputies = []
            while coverlines[i][0:7] != 'J.S.I.D':
                line = coverlines[i].replace(",", "") # strip commas
                line = line.replace("#", "") # strip number sign
                line = line.replace("and", "") # strip the word "and"
                line = re.sub(' +', ' ', line) # strip extra whitespaces
                line = line.strip() # strip beginning and trailing whitespace
                # strip all spaces between numbers
                line = re.sub(r'(\d)\s+(\d)', r'\1\2', line)
                # split at every number
                linesplit = re.split(r'(\d+)', line)
                linesplit = [re.sub(r' ([^A-Z])', r'\1', l.strip()) for l in linesplit if l and not l.isspace()]
                for j in range(0, len(linesplit), 2):
                    try:
                        deputies += [(linesplit[j], linesplit[j+1])]
                    except:
                        deputies += [(linesplit[j])]
                i += 1
            # if deputies is empty, throw exception
            if len(deputies) == 0:
                print('Empty deputies list at URL: ' + url)
                return False
            # until J.S.I.D., it's deputy names

            jsid = coverlines[i].split('#', 1)[-1] # jsid number after number sign
            jsid = re.sub(r' ', '', jsid) # remove all whitespace from jsid
            date = coverlines[-1]
            # strip date
            # remove all spaces not before capital letters or numbers
            date = re.sub(r'([0-9]) ([0-9])', r'\1\2', date) # strip all spaces between two numbers
            date = date.replace(",", "") # strip all commas
            date = re.sub(' +', ' ', date) # strip extra whitespaces
            date = re.sub(r'(?<=[a-z]) (?=[a-z])', '', date) # remove all whitespaces between lowercases
            date = date.strip() # strip beginning and trailing whitespace
            date = search_dates(date)[0][0]
            date = datetime.strptime(date, '%B %d %Y')
        except:
            print('Other text exception thrown at URL: ' + url)
            return False
        
        page1text = pdf.pages[1].extract_text()
        page1lines = page1text.splitlines()
        files = [] 
        for l in page1lines: # try this cruder way to get files
            if "#" in l and "J.S.I.D" not in l and "deputy" not in l.lower() and "officer" not in l.lower():
                files += [l.strip()] 
        
        maintext = [p.extract_text() for p in pdf.pages[1:]]
        wholetext = ''.join(maintext)
        '''
        subj = re.search(r"S[\s]*UBJEC[\s]*T[\s]*:(.*?)DA[\s]*T[\s]*E", wholetext, re.DOTALL)
        if not subj:
            subj = re.search(r"RE[\s]*:(.*?)DATE", wholetext, re.DOTALL)
            if not subj:
                print("no subject found at url " + url)
                return False
        subjinfo = subj.group(1).strip()
        # this should catch all of the subjects. now for each line with a # but no "J.S.I.D", capture it
        subjlines = subjinfo.splitlines()
        files = []
        for l in subjlines:
            if "#" in l and "J.S.I.D" not in l:
                files += [l.strip()]            
        '''
        
        # get everything from factual/summary heading until "LAW" or "LEGAL" or "ANALYSIS" or "CONCLUSION"
        # get everything after conclusion heading
        wholelines = wholetext.splitlines()
        # factstr = ""
        constr = ""
        # factflag = False
        conflag = False
        for l in wholelines:
            stripl = l.replace(" ", "")
            # if "LAW" in stripl or "LEGAL" in stripl or "ANALYSIS" in stripl:
                # factflag = False
            # if "FACT" in stripl or "SUMMARY" in stripl: 
                # factflag = True
            if "CONCLUSION" in stripl or stripl.upper() == "CONCLUSION":
                # factflag = False
                if conflag == True:
                    print("Multiple conclusions found at url " + url)
                conflag = True
            # if factflag:
                # factstr += l
            if conflag:
                constr += l     
        constr = constr.split('CONCLUSION', 1)[-1]
        constr = constr.strip()
        constr = re.sub('\n', '', constr)
        constr = re.sub(' +', ' ', constr) # strip extra whitespaces

        return [url, title, {department: deputies}, jsid, date, files, constr]
        # there's one random lowercase conclusion. one weird "attachment" with two conclusions.



