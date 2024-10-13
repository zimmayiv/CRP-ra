from flask import render_template, jsonify, request
from core import app
from sqlalchemy import and_, or_, cast, extract
from sqlalchemy.types import String
from datetime import date

@app.route('/')
def map():
    from .models import Case
    try:            
        cases = Case.query.all()
        caselist = [
                {
                    "id": case.id,
                    "code": case.code,
                    "title": case.title,
                    "url": case.url
                }
                for case in cases
        ]
    except e:
        return jsonify({"error": str(e)})
    title="Mapping California Police Data"
    return render_template('map.html',title=title, cases=caselist)

@app.route('/about')
def about():
    return render_template('about.html', title="About")

@app.route('/browse')
def browse():
    from .models import Gang
    try:
        gangs = Gang.query.all()
        ganglist = [gang.name for gang in gangs]
    except e:
        return jsonify({"error": str(e)})
    # return [ganglist, caselist]
    return render_template('browse.html', title="Browse data", gangs = ganglist)

@app.route('/deputy/<name>')
def deputy(name):
    from .models import GangMember
    try:
        dat = GangMember.query.filter(
            GangMember.officer == name
        ).first()
        dat = { 'badge': dat.badge, 'officer': dat.officer, 'bio': dat.bio, 'gangs': [g for g in dat.gangs], 'cases': [c for c in dat.cases] }
    except Exception as e:
        return render_template('deputy.html', title=name, record=None)
    return render_template('deputy.html', title=name, record=dat)

@app.route('/shooting/<name>')
def shooting(name):
    from .models import Shooting
    try:
        dat = Shooting.query.filter(
            Shooting.victim == name
        ).first()
        outc = 'Non-fatal' if dat.outcome == 0 else 'Fatal' if dat.outcome == 1 else 'Non-fatal (missed)'
        datestr  = dat.date.strftime('%B %-d, %Y')
        
        weap = "Unarmed" if dat.weapon[1] == "0" else dat.weapon.split(",")[1][1:-2]
        dat = { 'age': dat.age, 'victim': dat.victim, 'officer': dat.officer, 'id': dat.id, 'date': datestr, 'lat': dat.lat, 'lng': dat.lng, 'outcome': outc, 'weapon': weap }
    except Exception as e:
        return render_template('shooting.html', title=name, record=None)
    return render_template('shooting.html', title=name, record=dat)

@app.route('/search', methods=['GET'])
def search():
    from .models import GangMember, Shooting
    s = request.values.get("query")
    title = "Search for shootings/deputies"
    filters = [
        GangMember.officer.ilike('%' + s + '%'),
        cast(GangMember.badge, String) == s,
        GangMember.bio.ilike('%' + s + '%')
    ]
    try:
        deputies = GangMember.query.filter(
            or_(*filters)
        ).all()
    except Exception as e:
        return "There was an error fetching results: " + jsonify({"error": str(e)})
    filters = [
        Shooting.victim.ilike('%' + s + '%'),
        Shooting.officer.ilike('%' + s + '%'),
        Shooting.id.ilike('%' + s + '%')
    ]       
    try:
        shtings = Shooting.query.filter(
            or_(*filters)
        ).all()
    except Exception as e:
        return "There was an error fetching results: " + jsonify({"error": str(e)})
    return render_template('search.html', title=title, deps = deputies, sh = shtings, query = s)

@app.route('/deputy-json', methods=['POST'])
def deputy_json():
    # queries: name contains, in case, in gang
    from .models import GangMember, officergang, officercase, Gang, Case
    params = request.get_json()
    s = params.get("search")
    if s:
        # search text of name, bio, badge
        filters = [
            GangMember.officer.ilike('%' + s + '%'),
            cast(GangMember.badge, String) == s,
            GangMember.bio.ilike('%' + s + '%')
        ]
        try:
            deputies = GangMember.query.filter(
                or_(*filters)
            ).all()
        except Exception as e:
            return jsonify({"error": str(e)}), 500
    else:
        filters = []
        name = params.get("name")
        g = params.get("gang")
        c = params.get("case")
        if name:
            filters.append(GangMember.officer.ilike('%' + name + '%'))
        if g:
            gng = Gang.query.filter_by(name=g).first()
            if gng:
                filters.append(Gang.name == gng.name)
            else:
                return jsonify([]), 200
        if c:
            cse = Case.query.filter_by(id=c).first()
            if cse:
                filters.append(Case.id == cse.id)
            else:
                return jsonify([]), 200
        try:
            deputies = GangMember.query.outerjoin(officergang).outerjoin(Gang).outerjoin(officercase).outerjoin(Case).filter(
                and_(*filters)
            ).all()
        except Exception as e:
            return jsonify({"error": str(e)}), 500
    result = [
        {
            "badge": deputy.badge,
            "officer": deputy.officer,
            "bio": deputy.bio
        }
        for deputy in deputies
    ]
        
    # Return the result in JSON format
    return jsonify(result), 200
    

@app.route('/shooting-json', methods=['POST'])
def shooting_json():
    # query by year, officer, gang, fatal/nonfatal, armed/unarmed
    # search text of victim, officer, id
    from .models import Shooting, Gang, officergang, GangMember
    params = request.get_json()
    # params = request.values
    s = params.get("search")
    if s:
        # search text of victim, officer, id
        filters = [
            Shooting.victim.ilike('%' + s + '%'),
            Shooting.officer.ilike('%' + s + '%'),
            Shooting.id.ilike('%' + s + '%')
        ]
        try:
            shtings = Shooting.query.filter(
                or_(*filters)
            ).all()
        except Exception as e:
            return jsonify({"error": str(e)}), 500
    else:
        filters = []
        try:
            syear = int(params.get("start"))
            eyear = int(params.get("end"))
        except:
            syear = None
            eyear = None
        dep = params.get("dep")
        fat = params.get("fat") # fatal parameters: miss 0, fatal 1, non-fatal hit 2
        arm = params.get("arm") # armed parameters: 0 unarmed, 1 armed
        gang = params.get("gang")
        if syear and eyear:
            filters.append(
                extract('year', Shooting.date).between(syear, eyear)
            )
        if dep:
           filters.append(
               Shooting.officer == dep
           )
        if arm:
           filters.append(
               cast(Shooting.weapon, String).ilike('%' + arm + '%')
           )
        if fat:
           filters.append(
               cast(Shooting.outcome, String) == fat
           )
        try:
            if gang:
                filters.append(Gang.name == gang)
                shtings = Shooting.query.outerjoin(GangMember, Shooting.officer == GangMember.officer).outerjoin(officergang).outerjoin(Gang).filter(
                    and_(*filters)
                ).all()
            else:
                shtings = Shooting.query.filter(
                    and_(*filters)
                ).all()
        except Exception as e:
            return jsonify({"error": str(e)}), 500
    result = [
        {
            "age": sh.age,
            "victim": sh.victim,
            "officer": sh.officer,
            "id": sh.id,
            "date": sh.date.isoformat() if sh.date else None,  # Convert date to string
            "lat": sh.lat,
            "lng": sh.lng,
            "weapon": sh.weapon,
            "outcome": sh.outcome
        }
        for sh in shtings
    ]
    return jsonify(result), 200

@app.route('/gang-json', methods=['POST'])
def gang_json():
    from .models import Gang, officergang
    from core import db
    params = request.get_json()
    if params.get("officer"):   
        query = db.select(officergang).where(officergang.c.officer == params.get("officer"))
        pairs = db.session.execute(query).fetchall()
        return [pair.gang for pair in pairs]
    if params.get("gang"):
        query = db.select(officergang).where(officergang.c.gang == params.get("gang"))
        pairs = db.session.execute(query).fetchall()        
        return [pair.officer for pair in pairs]
    try:
        gangs = Gang.query.all()

        # Format the results into a list of dictionaries
        result = [gang.name for gang in gangs]

        # Return the result in JSON format
        return jsonify(result), 200
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/case-json', methods=['POST'])
def case_json():
    from core import db
    from .models import Case, officercase
    params = request.get_json()
    if params.get("officer"):
        query = db.select(officercase).where(officercase.c.officer == params.get("officer"))
        pairs = db.session.execute(query).fetchall()
        return [pair.case for pair in pairs]
    if params.get("case"):
        query = db.select(officercase).where(officercase.c.case == params.get("case"))
        pairs = db.session.execute(query).fetchall()
        return [pair.officer for pair in pairs]
    try:
        cases = Case.query.all()

        # Format the results into a list of dictionaries
        result = [
		{ 
		    "id": case.id,
		    "code": case.code,
		    "title": case.title,
		    "url": case.url
		}
		for case in cases
	]

        # Return the result in JSON format
        return jsonify(result), 200
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

