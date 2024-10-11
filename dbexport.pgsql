--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: yiv
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO yiv;

--
-- Name: case; Type: TABLE; Schema: public; Owner: yiv
--

CREATE TABLE public."case" (
    id character varying(64) NOT NULL,
    title character varying(256) NOT NULL,
    code character varying(64) NOT NULL,
    url character varying(128)
);


ALTER TABLE public."case" OWNER TO yiv;

--
-- Name: gang; Type: TABLE; Schema: public; Owner: yiv
--

CREATE TABLE public.gang (
    name character varying(64) NOT NULL
);


ALTER TABLE public.gang OWNER TO yiv;

--
-- Name: gangmember; Type: TABLE; Schema: public; Owner: yiv
--

CREATE TABLE public.gangmember (
    badge integer,
    officer character varying(64) NOT NULL,
    bio character varying(512)
);


ALTER TABLE public.gangmember OWNER TO yiv;

--
-- Name: officercase; Type: TABLE; Schema: public; Owner: yiv
--

CREATE TABLE public.officercase (
    officer character varying(64),
    "case" character varying(64),
    id integer NOT NULL
);


ALTER TABLE public.officercase OWNER TO yiv;

--
-- Name: officercase_id_seq; Type: SEQUENCE; Schema: public; Owner: yiv
--

CREATE SEQUENCE public.officercase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.officercase_id_seq OWNER TO yiv;

--
-- Name: officercase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yiv
--

ALTER SEQUENCE public.officercase_id_seq OWNED BY public.officercase.id;


--
-- Name: officergang; Type: TABLE; Schema: public; Owner: yiv
--

CREATE TABLE public.officergang (
    officer character varying(64),
    gang character varying(64),
    id integer NOT NULL
);


ALTER TABLE public.officergang OWNER TO yiv;

--
-- Name: officergang_id_seq; Type: SEQUENCE; Schema: public; Owner: yiv
--

CREATE SEQUENCE public.officergang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.officergang_id_seq OWNER TO yiv;

--
-- Name: officergang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yiv
--

ALTER SEQUENCE public.officergang_id_seq OWNED BY public.officergang.id;


--
-- Name: shooting; Type: TABLE; Schema: public; Owner: yiv
--

CREATE TABLE public.shooting (
    age integer,
    victim character varying(64) NOT NULL,
    officer character varying(64) NOT NULL,
    id character varying(64),
    date date NOT NULL,
    lat real,
    lng real,
    weapon character varying(128),
    outcome integer
);


ALTER TABLE public.shooting OWNER TO yiv;

--
-- Name: officercase id; Type: DEFAULT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.officercase ALTER COLUMN id SET DEFAULT nextval('public.officercase_id_seq'::regclass);


--
-- Name: officergang id; Type: DEFAULT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.officergang ALTER COLUMN id SET DEFAULT nextval('public.officergang_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: yiv
--

COPY public.alembic_version (version_num) FROM stdin;
eac190d3658a
\.


--
-- Data for Name: case; Type: TABLE DATA; Schema: public; Owner: yiv
--

COPY public."case" (id, title, code, url) FROM stdin;
austre	Austreberto Gonzalez v. County of Los Angeles, et al.	B317794	https://knock-la.com/the-compton-executioners-andres-guardado/
lockett	Sheldon Lockett, et al. v. County of Los Angeles, et al.	CV 18-05838	https://knock-la.com/the-compton-executioners-andres-guardado/
taylor	Andrew Taylor, et al. v. County of Los Angeles, et al.	TC028803	
quan	Al-Quan Jackson v. Leroy Baca, et al.	CV 12-10393	https://knockla.org/lasd-3000-boys-2000-boys-aclu-lawsuit/
martinez	Estate of Johnny Martinez, et al. v. County of Los Angeles, et al.	BC579140	https://knock-la.com/lasd-gang-regulators-shooting-zabala/
rosas	Alex Rosas v. Leroy Baca	CV 12-00428	https://knock-la.com/lasd-3000-boys-2000-boys-aclu-lawsuit/
villanueva	Alexandro Villanueva v. Los Angeles County Sheriff’s Department	BC342416	
jaimes	Angel Jaimes v. County of Los Angeles	BC331903	https://knock-la.com/lasd-gang-regulators-shooting-zabala/
hernandez	Art Hernandez, et al. v. County of Los Angeles, et al.	19STCV33158	https://knock-la.com/banditos-kennedy-hall-brawl-lasd-shot-caller/
willis	Bobby Willis v. Leroy Baca, et al.	CV 10-06357	https://knock-la.com/lasd-gang-3000-boys-mens-central-jail-abuse/
vasquez	Chris Vasquez, et al. v. County of Los Angeles, et al.	CV 11-03849	
carpenter	Christopher Carpenter v. Los Angeles County Sheriff’s Department	CSC 13-443	
gray	Christopher Gray v. County of Los Angeles, et al.	CV 13-07597	https://knock-la.com/banditos-kennedy-hall-brawl-lasd-shot-caller/
crawford	Crawford v. Block, et al.	2:90-cv-02649-TJH	https://knock-la.com/lasd-gangs-little-devils-wayside-whities-cavemen-vikings/
thomas	Darren Thomas, et al. v. County of Los Angeles, et al. Law Enforcement	CV 90-05217	https://knock-la.com/lynwood-vikings-darren-thomas-class-action/
cabrales	Estate of Arturo Cabrales, et al. v. County of Los Angeles	CV 13-01370	https://knock-la.com/grim-reapers-jump-out-boys-lasd-gangs/
tutt	Evans Tutt v. County of Los Angeles, et al.	CV 11-06126	https://knock-la.com/lasd-gang-3000-boys-mens-central-jail-abuse/
lopez	Guadalupe Lopez v. County of Los Angeles	BC540387; BC588302	https://knock-la.com/banditos-lasd-gang-sexual-harassment/
jones	Helen Jones, et al. v. County of Los Angeles, et al.	BC431634	https://knock-la.com/bruce-phillips-john-horton-hit-run/
rodriguez	Heriberto Rodriguez, et al. v. County of Los Angeles, et al.	CV 10-06342	https://knock-la.com/lasd-gang-3000-boys-mens-central-jail-abuse/
lanska	Jason Lanska v. Los Angeles County Sheriff’s Department	CSC 13-090	https://knock-la.com/grim-reapers-jump-out-boys-lasd-gangs/
snyder	Jason Snyder, et al. v. Paul Tanaka, et al.	CV 13-02546	https://knock-la.com/lasd-gang-3000-boys-mens-central-jail-abuse/
roble	Jorge Enrique Serrano Robles Senior et al. v. County of Los Angeles, et al.	2:20-CV-06648-ODW-PLA	
k.l.	K.L., a minor, et al. v. County Los Angeles, et al.	CV 18-04910; 2:2018cv04910	
rivera	Kenneth Rivera IV, et al. v. County of Los Angeles, et al.	CV 13-3806	https://knock-la.com/lasd-gang-regulators-shooting-zabala/
vargas	Lisa Vargas v. County of Los Angeles, et al.	CV 19-03279	https://knock-la.com/east-la-sheriff-gang-banditos-anthony-vargas/
moffett	Mark Moffett v. County of Los Angeles, et al.	BC445403	https://knock-la.com/paul-tanaka-lasd-whistleblowing-vikings/
holguin	Michael Holguin v. County of Los Angeles	CV 10-08011	https://knock-la.com/lasd-gang-3000-boys-mens-central-jail-abuse/
rathbun	Michael Rathbun, James Sexton v. County of Los Angeles	BC526951; CV 13-02863	https://knock-la.com/lasd-3000-boys-2000-boys-aclu-lawsuit/
n.g.	N.G. and L.G v. County of LA	CV 13-08312	
laffitte	Rodonna Laffitte, et al. v. County of Los Angeles, et al.	BC526786	
brock	Ronald Brock v. LA County	BC572875	https://knock-la.com/lasd-3000-boys-2000-boys-aclu-lawsuit/
sung lee	Sung Lee et al., v. Daniel McLeod	CV 8802067	
usa	USA v. Gonzalez	CR 13-0574	
boone	Velton Boone v. Lee Baca, et al.	CV 10-03418	https://knock-la.com/lasd-gang-3000-boys-mens-central-jail-abuse/
tillman	William Tillman v. Leroy Baca, et al.	BC471749	https://knock-la.com/lasd-3000-boys-2000-boys-aclu-lawsuit/
baraias	Consuelo Baraias, et al. v. County of Los Angeles, et al.	BC644126	
anderson	Timothy Anderson v. Los Angeles County Sheriff’s Department	BC094524	
carrillo	Francisco Carrillo Jr. v. County of Los Angeles	CV 11-10310	https://knock-la.com/lasd-franky-castillo-trial-settlement-donald-sarpy/
\.


--
-- Data for Name: gang; Type: TABLE DATA; Schema: public; Owner: yiv
--

COPY public.gang (name) FROM stdin;
Little Devils
Executioners
3000 Boys
2000 Boys
Spartans
Banditos
Jump Out Boys
Grim Reapers
Vikings
Regulators
Cavemen
Cowboys
Wayside Whites
\.


--
-- Data for Name: gangmember; Type: TABLE DATA; Schema: public; Owner: yiv
--

COPY public.gangmember (badge, officer, bio) FROM stdin;
\N	Marta Gonzales	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
\N	Robert S. Evans	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
11573	Clarence O. Buckingham	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
76574	William Rivera	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
35542	James Woofruff	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
\N	Steven Ruiz	\N
\N	Barragan	\N
\N	Bautista	\N
\N	Eugene Contreras	\N
\N	Edwin Barajas	\N
\N	Andy Leos	\N
\N	John Wargo	\N
\N	Iliana Vargas	\N
\N	Thatcher	\N
\N	Jesus Sandoval	\N
\N	Jaime Juarez	\N
\N	Rogelio Benzor	\N
532048	Mizrain Orrego	\N
531565	Samuel Aldama	\N
526362	Pedro Guerrero-Gonzales	\N
506633	Ernesto Hernandez Posadas	\N
526355	Jay Brown	\N
\N	John Davoren	\N
\N	Edgar Bonilla	\N
\N	Miguel Ruiz	\N
\N	Rene Barragan	\N
\N	Edward Martinez	\N
487906	Juan P. Rodriguez	\N
\N	Ryan Rothrock	\N
\N	Marc Elizondo	\N
\N	Alejandro Lomeli	\N
\N	Steven Miller	\N
\N	Monica Farias	\N
\N	Timothy Lee	\N
\N	Juan Sanchez	\N
\N	Edmundo Torres	\N
\N	Leo Noyola	\N
\N	Joe Mejia	\N
\N	Danny Batanero	\N
\N	Jose Aceituno	\N
\N	Christopher Moore	\N
\N	Braulio Robledo	\N
\N	Angelica Estrada	\N
\N	Zarendi	\N
\N	Alex Villanueva	\N
\N	Bob Denham	\N
\N	Jose J. Rios	\N
\N	Chris Perez	\N
\N	Ernie Chavez	\N
\N	Eric Smitson	\N
\N	Noel Lopez	\N
\N	Silvano Garcia	\N
\N	Raymond Mendoza	\N
\N	Vincent Moran	\N
\N	Carrie Esmeralda Robles-Placencia	\N
\N	Michael Hernandez	\N
\N	David Silverio	\N
\N	Gregory Rodriguez	\N
\N	Rafael Munoz	\N
\N	Mario Castro	\N
\N	Sara Rodriguez	\N
\N	James Duran Jr.	\N
602976	Jonathan Rojas	\N
602261	Nikolis Perez	\N
\N	Veronica De La Rosa	\N
\N	Henry Romero	\N
\N	David Infante	\N
\N	Troy Krautkramer	\N
\N	Christopher Valente	\N
\N	Eduardo Sanchez	\N
\N	Andrew Hernandez	\N
\N	Benjamin Zaredini	\N
\N	Joshua Smilor	\N
\N	Christopher Wargo	\N
\N	Eric Valdez	\N
\N	Christopher Carpenter	\N
\N	Eduardo Hernandez	\N
\N	Steve Espericueta	\N
\N	William Turpin	\N
\N	Steven Vargas	\N
\N	Julio Martinez	\N
\N	Curtis Sykes	\N
\N	Ronnie Perez	\N
\N	Douglas Parkhurst	\N
\N	Anthony Paez	\N
\N	Jason Lanska	\N
\N	Lawrence Del Mese	\N
\N	Caren Carl Mandoyan	\N
\N	Ramon Munoz	\N
\N	Joshua Kelley-Eklund	\N
\N	Samuel Gomez	\N
\N	Lawrence Swanson Jr	\N
\N	David Chevez	\N
\N	Daniel Chavez	\N
\N	Michael Shapiro	\N
\N	Joseph Nunez	\N
\N	Kimberly Milroy	\N
\N	Mark Renfrow	\N
\N	Mark Guerrero	\N
\N	Jason Rodriguez	\N
\N	Patrick Rivera	\N
\N	James Sharp	\N
\N	Salvador Valencia Jr.	\N
\N	Joshua Raniag	\N
\N	Kevin Ethridge	\N
\N	Augustine De La Torre Jr.	\N
\N	David Navarette	\N
207270	Kevin Roberts	\N
460227	Shawnee Hinchman	\N
48132	Nicole Zonver	\N
\N	Edwin Alvarez	\N
413093	Tracy Stewart	\N
\N	Dan Fedele	\N
\N	Ralph Ornelas	\N
\N	Mariano Ramirez	\N
\N	Joey Aguiar	\N
\N	Cecil Rhambo	\N
\N	Byron Dredd	\N
\N	Pantamitr Zunggeemoge	\N
\N	Sussie Ayala	\N
\N	Michael Ponce De Leon	\N
\N	Eric Gonzalez	\N
\N	Duane Harris	\N
\N	Noel Womack	\N
\N	Elizario Perez	\N
\N	David Bradley Vasquez	\N
\N	Fernando Vasquez	\N
\N	Scott Craig	\N
\N	Dennis Burns	\N
\N	Larry Waldie	\N
\N	Mauricio Rodriguez	\N
\N	Jeffrey Rivera	\N
\N	Juan Navarro	\N
\N	Joseph Gonzalez	\N
\N	Alfonso Andrade	\N
\N	Fernando Luviano	\N
\N	Engelbert Perez	\N
\N	Lance Moorman	\N
\N	Michael Thurman	\N
\N	Armando Ibarra	\N
\N	Alexander Yim	\N
\N	Jason Snyder	\N
\N	David Ortega	\N
\N	Clifford Yates	\N
\N	William Penhollow	\N
\N	Christopher Kidder	\N
495521	Adrian Zuniga	\N
533039	Carlos Castillo	\N
513456	David Aviles	\N
\N	Kelley Washington	\N
\N	Hector Vazquez	\N
\N	Matthew Thomas	\N
\N	Joseph Sanford	\N
\N	Aaron Rivera	\N
\N	Jason Puga	\N
\N	Blake Orlandos	\N
\N	Matthew Nowotny	\N
\N	Anthony Montes	\N
\N	Jose Mendoza	\N
\N	John McNicholas	\N
\N	Michel McGrattan	\N
\N	Mario Juarez	\N
\N	Brendon Jackson	\N
\N	Nicholas Graham	\N
\N	Armando Gonzalez	\N
\N	Antonio Galindo	\N
\N	Michael Frazier	\N
\N	Adolph Esqueda	\N
\N	Arthur Diaz Jr	\N
\N	Jeffrey Demooy	\N
\N	Ivan Delatorre	\N
\N	Alejandro Hernandez Castanon	\N
\N	Enrique Cano	\N
\N	Christopher Blasnek	\N
\N	Francisco Alonso	\N
\N	Carlos Ortega	\N
\N	Adrian Ruiz	\N
\N	Hernan Delgado	\N
\N	Javier Guzman	\N
\N	Frank Quintana	\N
\N	Justin Bravo	Lee Baca’s nephew
\N	Andrew Lyons	\N
\N	Clayton Stelter	\N
\N	Matt Ohnemus	\N
\N	Daniel Cruz	\N
\N	Jonathan Pera	\N
\N	Armando Diaz	\N
\N	James Krase	\N
\N	Scott Erskin	\N
\N	Timothy Mur	\N
196175	Jason Mann	\N
\N	Ramon Sanchez	\N
\N	Oscar Barrios	\N
489661	Jason Zabala	\N
\N	Norma Silva	\N
\N	Charles McDaniel	\N
\N	Xavier Aguilar	\N
\N	Daniel S./J. Cruz	\N
\N	Jorge F Sanchez	\N
\N	Mark V Farino	\N
\N	Pedro L Guerrero	\N
\N	Edward Herron Jr	\N
\N	Anthony D Vasquez	\N
\N	Angel Jaimes	\N
\N	Libel	\N
\N	Bemsick	\N
\N	Winston	\N
\N	Perez	\N
\N	Berk	\N
\N	Thrail	\N
\N	Johnson	\N
\N	Gill	\N
274628	John Bones	\N
273458	Ernesto De Armas	\N
284972	Frank La Flame	\N
\N	Paul Pietrantoni	\N
\N	Gutierrez	\N
\N	Noe Garcia	\N
\N	Remington Orr	\N
\N	Gerard Smith	\N
\N	Mickey Manzo	\N
\N	Matthew Thompson	Gregory Thompson’s son
\N	Michael Camacho	\N
\N	Joseph Britton	\N
\N	Perkins	\N
\N	Timothy Cooper	\N
\N	Michael M. Nagaoka	\N
\N	Gilbert Carrillo	Of Hillside Strangler and Night Stalker fame
\N	James D. Tatreau Jr.	\N
\N	Dennis Werner	LinkedIn
\N	Martinez	\N
\N	Norinie Plett	\N
\N	Richard Dinsmore	\N
\N	Michael Aranda	\N
\N	Ronnie Williams	LinkedIn
\N	Miller	\N
\N	Ralph Martin	\N
\N	Randy Olson	\N
\N	Gil Jurado	\N
\N	R. Doyle Campbell	\N
\N	Richard Adams	\N
\N	Thomas Zampiello	\N
248084	Chris James Young	\N
\N	Robert F. Windrim	\N
\N	Michael Wilber	\N
\N	James Whitten	\N
248032	John A. West	\N
248150	Todd Lawrence Wallace	\N
238868	K. Wall	\N
222015	Byron G. Wainie	\N
186761	Michael Voge	\N
\N	Patrick Valdez	\N
\N	Greg Thurman	\N
238853	Gerald Richard Thompson	\N
196144	Gregory Thompson	\N
244912	Jack Tarasiuk	\N
218524	Brian Steinwand	\N
\N	Lt. Michael D. Sparks	\N
222075	Elizabeth Smith	\N
\N	Samuel Silva	\N
\N	Larry Shultz	\N
207157	J. Sheehy	\N
244092	Michael Schneider	\N
44852	Michael Salvatore	\N
\N	Timothy Running	\N
111632	Thomas A. Rosas	\N
77668	William Roman	\N
\N	Martin Rodriguez	\N
\N	Allen Ripley	\N
207195	Robert Rifkin	\N
\N	Michael Reynolds	\N
236792	R.A. Reed	\N
208423	Jerold Reeves	\N
211246	Jack Ramirez	\N
207220	Dan Raimo	\N
\N	Lt. Radeleff	\N
116212	Michael Pippin	\N
260171	Andre Pinesett	\N
\N	James Pacina	\N
68734	Richard Orosco	\N
183119	O’Hara	\N
\N	Rodolfo O’Dell	\N
\N	Nunez	\N
241276	Edward M. Nordskog	\N
220245	Nelson	\N
\N	Jack Neihouse	\N
232692	John Mossotti	\N
195912	Abel A. Moreno	\N
248043	Scott Lee McCormick	\N
188894	Guy Mato	\N
223374	Allyn Lawrence Martin	\N
\N	Curtis Golden	\N
244674	Douglas Gillies	\N
223389	Jeffrey Leslie	\N
235151	Kevin J. Kiff	\N
265013	Dale Huffman	\N
37190	Eric Hubner	\N
41885	Joseph Holmes II	\N
209619	Holbrook	\N
\N	A. Herrera	\N
38535	T.J. Harvey	\N
\N	Tommy Harris	\N
\N	Allen Harris	\N
\N	Joseph Guzman	\N
34657	Albert Grotefend	\N
213459	Ruben Gracia	\N
222021	Kevin Goran	\N
\N	Frank Gonzales	\N
\N	Timothy Glover	\N
236616	Niels Gittisarn	\N
33144	Giron	\N
260309	Kelly	\N
207131	Ronald E. Gilbert	\N
207136	Micahel J. Garcia	\N
\N	Lance Tralick	\N
137451	Raymond Esquerra	\N
219137	Stephen Downey	\N
\N	Craig Ditsch	\N
\N	Robert Dillard	\N
\N	Devine	\N
\N	Frustino Delvalle	\N
230237	Robert Delgadillo	\N
173151	Costleigh	\N
213671	James Corrigan	\N
\N	Danielle Cormier	\N
\N	Daniel Cooper	\N
\N	Robert Papini	\N
\N	Javier Clift	\N
150582	Scott Carter	\N
13405	Anthony Campbell	\N
\N	Richard Calzada	\N
\N	T . Brownwell	\N
258489	Katherine Brown-Voyer	\N
\N	Timothy Broad	\N
\N	C. Brantley	\N
209523	Larry Brandenburg	\N
273451	Robert Blume	\N
236778	Steve Blair	\N
\N	Daniel McLeod	\N
246380	Timothy E. Benson	\N
\N	Charles Barton	\N
213669	Paul Archambault	\N
\N	Juan Alvarado	\N
\N	Brian Lee	\N
201663	Loy Luna	\N
160080	Anderson	\N
213435	John Corina	\N
\N	Gary Blackwell	\N
\N	Raymond Gott	\N
220837	John Chapman	\N
\N	Richard L. Castro	\N
\N	Bert J . Cueva	\N
\N	Richard Foreman	\N
\N	Jerry Harper	\N
\N	Paul Tan	\N
\N	Sherman Block	\N
\N	Leroy Baca	\N
56264	John MacQuarrie	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
\N	Dennis D. Crow	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
\N	Arthur Bardy	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
\N	John Wright	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
88753	Michael Sutchiffe	Named in December 5, 1973 memo from Captain R.D. Campbell in Administrative Services to T.H. Von Milden, Chief of Patrol Division East.
\N	Lee E. Everett	\N
\.


--
-- Data for Name: officercase; Type: TABLE DATA; Schema: public; Owner: yiv
--

COPY public.officercase (officer, "case", id) FROM stdin;
Rogelio Benzor	lockett	1
Mizrain Orrego	lockett	2
Mizrain Orrego	taylor	3
Samuel Aldama	lockett	4
Samuel Aldama	taylor	5
Samuel Aldama	quan	6
Pedro Guerrero-Gonzales	martinez	7
Ernesto Hernandez Posadas	martinez	8
Jay Brown	martinez	9
Jay Brown	baraias	10
John Davoren	k.l.	11
Edgar Bonilla	k.l.	12
Miguel Ruiz	k.l.	13
Rene Barragan	k.l.	14
Rene Barragan	baraias	15
Edward Martinez	k.l.	16
Juan P. Rodriguez	k.l.	17
Ryan Rothrock	k.l.	18
Marc Elizondo	gray	19
Alejandro Lomeli	gray	20
Steven Miller	gray	21
Monica Farias	gray	22
Timothy Lee	roble	23
Juan Sanchez	hernandez	24
Edmundo Torres	hernandez	25
Leo Noyola	hernandez	26
Joe Mejia	hernandez	27
Danny Batanero	hernandez	28
Jose Aceituno	hernandez	29
Christopher Moore	hernandez	30
Braulio Robledo	hernandez	31
Angelica Estrada	hernandez	32
Zarendi	hernandez	33
Alex Villanueva	hernandez	34
Bob Denham	hernandez	35
Jose J. Rios	hernandez	36
Chris Perez	hernandez	37
Ernie Chavez	hernandez	38
Eric Smitson	hernandez	39
Noel Lopez	hernandez	40
Silvano Garcia	hernandez	41
Raymond Mendoza	hernandez	42
Vincent Moran	hernandez	43
Carrie Esmeralda Robles-Placencia	hernandez	44
Michael Hernandez	hernandez	45
David Silverio	hernandez	46
Gregory Rodriguez	hernandez	47
Rafael Munoz	hernandez	48
Mario Castro	vargas	49
Sara Rodriguez	vargas	50
James Duran Jr.	vargas	51
Jonathan Rojas	vargas	52
Nikolis Perez	vargas	53
Veronica De La Rosa	lopez	54
David Infante	lopez	55
Troy Krautkramer	lopez	56
Christopher Valente	lopez	57
Eduardo Sanchez	lopez	58
Andrew Hernandez	lopez	59
Benjamin Zaredini	lopez	60
Joshua Smilor	lopez	61
Christopher Wargo	lopez	62
Eric Valdez	lopez	63
Christopher Carpenter	carpenter	64
Eduardo Hernandez	cabrales	65
Steve Espericueta	cabrales	66
William Turpin	cabrales	67
Steven Vargas	lanska	68
Julio Martinez	cabrales	69
Julio Martinez	lanska	70
Curtis Sykes	lanska	71
Ronnie Perez	lanska	72
Douglas Parkhurst	lanska	73
Anthony Paez	cabrales	74
Anthony Paez	lanska	75
Jason Lanska	lanska	76
Lawrence Del Mese	n.g.	77
Caren Carl Mandoyan	n.g.	78
Ramon Munoz	n.g.	79
Joshua Kelley-Eklund	n.g.	80
Samuel Gomez	n.g.	81
Lawrence Swanson Jr	n.g.	82
David Chevez	n.g.	83
Daniel Chavez	brock	84
Michael Shapiro	brock	85
Joseph Nunez	brock	86
Kimberly Milroy	brock	87
Mark Renfrow	brock	88
Mark Guerrero	brock	89
Jason Rodriguez	quan	90
Patrick Rivera	quan	91
James Sharp	quan	92
Salvador Valencia Jr.	quan	93
Joshua Raniag	quan	94
Kevin Ethridge	quan	95
Augustine De La Torre Jr.	quan	96
David Navarette	quan	97
Kevin Roberts	quan	98
Shawnee Hinchman	quan	99
Nicole Zonver	quan	100
Edwin Alvarez	quan	101
Tracy Stewart	quan	102
Dan Fedele	quan	103
Ralph Ornelas	quan	104
Mariano Ramirez	rosas	105
Joey Aguiar	rosas	106
Cecil Rhambo	quan	107
Cecil Rhambo	rosas	108
Byron Dredd	usa	109
Pantamitr Zunggeemoge	usa	110
Sussie Ayala	snyder	111
Sussie Ayala	usa	112
Michael Ponce De Leon	snyder	113
Eric Gonzalez	snyder	114
Eric Gonzalez	usa	115
Duane Harris	snyder	116
Noel Womack	snyder	117
Noel Womack	usa	118
Elizario Perez	snyder	119
David Bradley Vasquez	snyder	120
Fernando Vasquez	snyder	121
Scott Craig	snyder	122
Dennis Burns	quan	123
Dennis Burns	rosas	124
Dennis Burns	snyder	125
Larry Waldie	snyder	126
Mauricio Rodriguez	vasquez	127
Jeffrey Rivera	vasquez	128
Juan Navarro	vasquez	129
Joseph Gonzalez	vasquez	130
Alfonso Andrade	vasquez	131
Fernando Luviano	rosas	132
Fernando Luviano	holguin	133
Fernando Luviano	usa	134
Engelbert Perez	tillman	135
Lance Moorman	quan	136
Lance Moorman	tillman	137
Michael Thurman	tillman	138
Armando Ibarra	rosas	139
Armando Ibarra	tillman	140
Alexander Yim	tillman	141
Jason Snyder	rosas	142
Jason Snyder	vasquez	143
Jason Snyder	tutt	144
David Ortega	rosas	145
David Ortega	tutt	146
Clifford Yates	jones	147
William Penhollow	jones	148
Christopher Kidder	jones	149
Adrian Zuniga	rosas	150
Adrian Zuniga	willis	151
Carlos Castillo	willis	152
David Aviles	rosas	153
David Aviles	willis	154
David Aviles	tutt	155
Kelley Washington	rodriguez	156
Hector Vazquez	rodriguez	157
Matthew Thomas	rodriguez	158
Joseph Sanford	rodriguez	159
Aaron Rivera	tutt	160
Aaron Rivera	rodriguez	161
Jason Puga	rodriguez	162
Blake Orlandos	rodriguez	163
Matthew Nowotny	rodriguez	164
Anthony Montes	rodriguez	165
Jose Mendoza	rodriguez	166
John McNicholas	rodriguez	167
Michel McGrattan	rodriguez	168
Mario Juarez	rodriguez	169
Brendon Jackson	rodriguez	170
Nicholas Graham	rodriguez	171
Armando Gonzalez	rodriguez	172
Antonio Galindo	rodriguez	173
Michael Frazier	rodriguez	174
Adolph Esqueda	rodriguez	175
Arthur Diaz Jr	rodriguez	176
Jeffrey Demooy	rodriguez	177
Ivan Delatorre	rodriguez	178
Alejandro Hernandez Castanon	rodriguez	179
Enrique Cano	rodriguez	180
Christopher Blasnek	rodriguez	181
Francisco Alonso	rodriguez	182
Carlos Ortega	rodriguez	183
Adrian Ruiz	rodriguez	184
Hernan Delgado	rosas	185
Hernan Delgado	vasquez	186
Hernan Delgado	rodriguez	187
Javier Guzman	rodriguez	188
Frank Quintana	quan	189
Frank Quintana	rosas	190
Frank Quintana	villanueva	191
Frank Quintana	jaimes	192
Frank Quintana	snyder	193
Frank Quintana	rivera	194
Frank Quintana	sung lee	195
Frank Quintana	tillman	196
Justin Bravo	rodriguez	197
Andrew Lyons	rodriguez	198
Clayton Stelter	rodriguez	199
Matt Ohnemus	rodriguez	200
Daniel Cruz	rodriguez	201
Daniel Cruz	snyder	202
Jonathan Pera	boone	203
Armando Diaz	boone	204
James Krase	boone	205
James Krase	tillman	206
Scott Erskin	boone	207
Timothy Mur	hernandez	208
Oscar Barrios	laffitte	209
Jason Zabala	martinez	210
Jason Zabala	laffitte	211
Norma Silva	rivera	212
Charles McDaniel	jaimes	213
Xavier Aguilar	jaimes	214
Daniel S./J. Cruz	jaimes	215
Jorge F Sanchez	jaimes	216
Mark V Farino	jaimes	217
Pedro L Guerrero	jaimes	218
Edward Herron Jr	jaimes	219
Anthony D Vasquez	jaimes	220
Angel Jaimes	jaimes	221
Libel	crawford	222
Bemsick	crawford	223
Winston	crawford	224
Perez	crawford	225
Berk	crawford	226
Thrail	crawford	227
Johnson	crawford	228
Gill	crawford	229
John Bones	crawford	230
Ernesto De Armas	crawford	231
Frank La Flame	crawford	232
Paul Pietrantoni	rathbun	233
Gutierrez	rathbun	234
Noe Garcia	rathbun	235
Remington Orr	rathbun	236
Gerard Smith	rathbun	237
Mickey Manzo	rathbun	238
Matthew Thompson	rathbun	239
Michael Camacho	rathbun	240
Joseph Britton	rathbun	241
Perkins	rathbun	242
Timothy Cooper	moffett	243
Timothy Cooper	rathbun	244
Michael M. Nagaoka	villanueva	245
Gilbert Carrillo	villanueva	246
James D. Tatreau Jr.	villanueva	247
Dennis Werner	villanueva	248
Martinez	villanueva	249
Norinie Plett	villanueva	250
Richard Dinsmore	villanueva	251
Michael Aranda	villanueva	252
Ronnie Williams	villanueva	253
Miller	villanueva	254
Ralph Martin	villanueva	255
Randy Olson	villanueva	256
Gil Jurado	villanueva	257
R. Doyle Campbell	villanueva	258
Richard Adams	villanueva	259
Thomas Zampiello	thomas	260
Chris James Young	thomas	261
Robert F. Windrim	thomas	262
Michael Wilber	thomas	263
James Whitten	thomas	264
John A. West	thomas	265
Todd Lawrence Wallace	thomas	266
K. Wall	thomas	267
Byron G. Wainie	thomas	268
Michael Voge	thomas	269
Patrick Valdez	thomas	270
Greg Thurman	thomas	271
Gerald Richard Thompson	thomas	272
Gregory Thompson	thomas	273
Gregory Thompson	rathbun	274
Jack Tarasiuk	thomas	275
Brian Steinwand	thomas	276
Lt. Michael D. Sparks	thomas	277
Elizabeth Smith	thomas	278
Samuel Silva	thomas	279
Larry Shultz	thomas	280
J. Sheehy	thomas	281
Michael Schneider	thomas	282
Michael Salvatore	thomas	283
Timothy Running	thomas	284
Thomas A. Rosas	thomas	285
William Roman	thomas	286
Martin Rodriguez	thomas	287
Allen Ripley	thomas	288
Robert Rifkin	thomas	289
Michael Reynolds	thomas	290
R.A. Reed	thomas	291
Jerold Reeves	thomas	292
Jack Ramirez	thomas	293
Dan Raimo	thomas	294
Lt. Radeleff	thomas	295
Michael Pippin	thomas	296
Andre Pinesett	thomas	297
James Pacina	thomas	298
Richard Orosco	thomas	299
O’Hara	thomas	300
Rodolfo O’Dell	thomas	301
Nunez	thomas	302
Edward M. Nordskog	thomas	303
Nelson	thomas	304
Jack Neihouse	thomas	305
John Mossotti	thomas	306
Abel A. Moreno	thomas	307
Scott Lee McCormick	thomas	308
Guy Mato	thomas	309
Allyn Lawrence Martin	thomas	310
Curtis Golden	thomas	311
Douglas Gillies	thomas	312
Jeffrey Leslie	thomas	313
Kevin J. Kiff	thomas	314
Dale Huffman	thomas	315
Eric Hubner	thomas	316
Joseph Holmes II	thomas	317
Holbrook	thomas	318
A. Herrera	thomas	319
T.J. Harvey	thomas	320
Tommy Harris	thomas	321
Allen Harris	thomas	322
Joseph Guzman	thomas	323
Albert Grotefend	thomas	324
Ruben Gracia	thomas	325
Kevin Goran	thomas	326
Frank Gonzales	thomas	327
Timothy Glover	thomas	328
Niels Gittisarn	thomas	329
Giron	thomas	330
Kelly	thomas	331
Ronald E. Gilbert	thomas	332
Micahel J. Garcia	thomas	333
Lance Tralick	thomas	334
Raymond Esquerra	thomas	335
Stephen Downey	thomas	336
Craig Ditsch	thomas	337
Craig Ditsch	carrillo	338
Robert Dillard	thomas	339
Devine	thomas	340
Frustino Delvalle	thomas	341
Robert Delgadillo	thomas	342
Costleigh	thomas	343
James Corrigan	thomas	344
Danielle Cormier	thomas	345
Daniel Cooper	thomas	346
Robert Papini	thomas	347
Javier Clift	thomas	348
Scott Carter	thomas	349
Anthony Campbell	thomas	350
Richard Calzada	thomas	351
T . Brownwell	thomas	352
Katherine Brown-Voyer	thomas	353
Timothy Broad	thomas	354
C. Brantley	thomas	355
Larry Brandenburg	thomas	356
Robert Blume	thomas	357
Steve Blair	thomas	358
Daniel McLeod	thomas	359
Timothy E. Benson	thomas	360
Charles Barton	thomas	361
Paul Archambault	thomas	362
Juan Alvarado	thomas	363
Brian Lee	thomas	364
Loy Luna	thomas	365
Anderson	thomas	366
Anderson	anderson	367
John Corina	thomas	368
Gary Blackwell	thomas	369
Raymond Gott	thomas	370
John Chapman	thomas	371
Richard L. Castro	thomas	372
Bert J . Cueva	thomas	373
Richard Foreman	thomas	374
Jerry Harper	thomas	375
Paul Tan	quan	376
Paul Tan	rosas	377
Paul Tan	villanueva	378
Paul Tan	jaimes	379
Paul Tan	thomas	380
Paul Tan	snyder	381
Paul Tan	rivera	382
Paul Tan	brock	383
Paul Tan	tillman	384
Sherman Block	crawford	385
Sherman Block	thomas	386
Leroy Baca	quan	387
Leroy Baca	rosas	388
Leroy Baca	jaimes	389
Leroy Baca	willis	390
Leroy Baca	vasquez	391
Leroy Baca	gray	392
Leroy Baca	tutt	393
Leroy Baca	snyder	394
Leroy Baca	rivera	395
Leroy Baca	holguin	396
Leroy Baca	rathbun	397
Leroy Baca	n.g.	398
Leroy Baca	brock	399
Leroy Baca	boone	400
Leroy Baca	tillman	401
\.


--
-- Data for Name: officergang; Type: TABLE DATA; Schema: public; Owner: yiv
--

COPY public.officergang (officer, gang, id) FROM stdin;
Marta Gonzales	Little Devils	1
Robert S. Evans	Little Devils	2
Clarence O. Buckingham	Little Devils	3
William Rivera	Little Devils	4
James Woofruff	Little Devils	5
Steven Ruiz	Executioners	6
Barragan	Executioners	7
Bautista	Executioners	8
Eugene Contreras	Executioners	9
Edwin Barajas	Executioners	10
Andy Leos	Executioners	11
John Wargo	Executioners	12
Iliana Vargas	Executioners	13
Thatcher	Executioners	14
Jesus Sandoval	Executioners	15
Jaime Juarez	Executioners	16
Rogelio Benzor	Executioners	17
Mizrain Orrego	Executioners	18
Samuel Aldama	Executioners	19
Samuel Aldama	3000 Boys	20
Samuel Aldama	2000 Boys	21
Pedro Guerrero-Gonzales	Spartans	22
Ernesto Hernandez Posadas	Spartans	23
Ernesto Hernandez Posadas	Cowboys	24
Jay Brown	Spartans	25
John Davoren	Spartans	26
Edgar Bonilla	Spartans	27
Miguel Ruiz	Spartans	28
Rene Barragan	Spartans	29
Edward Martinez	Spartans	30
Juan P. Rodriguez	Spartans	31
Ryan Rothrock	Spartans	32
Marc Elizondo	Banditos	33
Alejandro Lomeli	Banditos	34
Steven Miller	Banditos	35
Monica Farias	Banditos	36
Timothy Lee	Banditos	37
Juan Sanchez	Banditos	38
Edmundo Torres	Banditos	39
Leo Noyola	Banditos	40
Joe Mejia	Banditos	41
Danny Batanero	Banditos	42
Jose Aceituno	Banditos	43
Christopher Moore	Banditos	44
Braulio Robledo	Banditos	45
Angelica Estrada	Banditos	46
Zarendi	Banditos	47
Alex Villanueva	Banditos	48
Bob Denham	Banditos	49
Jose J. Rios	Banditos	50
Chris Perez	Banditos	51
Ernie Chavez	Banditos	52
Eric Smitson	Banditos	53
Noel Lopez	Banditos	54
Silvano Garcia	Banditos	55
Raymond Mendoza	Banditos	56
Vincent Moran	Banditos	57
Carrie Esmeralda Robles-Placencia	Banditos	58
Michael Hernandez	Banditos	59
David Silverio	Banditos	60
Gregory Rodriguez	Banditos	61
Rafael Munoz	Banditos	62
Mario Castro	Banditos	63
Sara Rodriguez	Banditos	64
James Duran Jr.	Banditos	65
Jonathan Rojas	Banditos	66
Nikolis Perez	Banditos	67
Veronica De La Rosa	Banditos	68
Henry Romero	Banditos	69
David Infante	Banditos	70
Troy Krautkramer	Banditos	71
Christopher Valente	Banditos	72
Eduardo Sanchez	Banditos	73
Andrew Hernandez	Banditos	74
Benjamin Zaredini	Banditos	75
Joshua Smilor	Banditos	76
Christopher Wargo	Banditos	77
Eric Valdez	Banditos	78
Christopher Carpenter	Jump Out Boys	79
Eduardo Hernandez	Jump Out Boys	80
Steve Espericueta	Jump Out Boys	81
William Turpin	Jump Out Boys	82
Steven Vargas	Jump Out Boys	83
Julio Martinez	Jump Out Boys	84
Curtis Sykes	Jump Out Boys	85
Ronnie Perez	Jump Out Boys	86
Douglas Parkhurst	Jump Out Boys	87
Anthony Paez	Jump Out Boys	88
Jason Lanska	Jump Out Boys	89
Lawrence Del Mese	Grim Reapers	90
Caren Carl Mandoyan	Grim Reapers	91
Ramon Munoz	Grim Reapers	92
Joshua Kelley-Eklund	Grim Reapers	93
Samuel Gomez	Grim Reapers	94
Lawrence Swanson Jr	Grim Reapers	95
David Chevez	Grim Reapers	96
Daniel Chavez	3000 Boys	97
Daniel Chavez	2000 Boys	98
Michael Shapiro	3000 Boys	99
Michael Shapiro	2000 Boys	100
Joseph Nunez	3000 Boys	101
Joseph Nunez	2000 Boys	102
Kimberly Milroy	3000 Boys	103
Kimberly Milroy	2000 Boys	104
Mark Renfrow	3000 Boys	105
Mark Renfrow	2000 Boys	106
Mark Guerrero	3000 Boys	107
Mark Guerrero	2000 Boys	108
Jason Rodriguez	3000 Boys	109
Jason Rodriguez	2000 Boys	110
Patrick Rivera	3000 Boys	111
Patrick Rivera	2000 Boys	112
James Sharp	3000 Boys	113
James Sharp	2000 Boys	114
Salvador Valencia Jr.	3000 Boys	115
Salvador Valencia Jr.	2000 Boys	116
Joshua Raniag	3000 Boys	117
Joshua Raniag	2000 Boys	118
Kevin Ethridge	3000 Boys	119
Kevin Ethridge	2000 Boys	120
Augustine De La Torre Jr.	3000 Boys	121
Augustine De La Torre Jr.	2000 Boys	122
David Navarette	3000 Boys	123
David Navarette	2000 Boys	124
Kevin Roberts	3000 Boys	125
Kevin Roberts	2000 Boys	126
Shawnee Hinchman	3000 Boys	127
Shawnee Hinchman	2000 Boys	128
Nicole Zonver	3000 Boys	129
Nicole Zonver	2000 Boys	130
Edwin Alvarez	3000 Boys	131
Edwin Alvarez	2000 Boys	132
Tracy Stewart	3000 Boys	133
Tracy Stewart	2000 Boys	134
Dan Fedele	3000 Boys	135
Dan Fedele	2000 Boys	136
Ralph Ornelas	3000 Boys	137
Ralph Ornelas	2000 Boys	138
Mariano Ramirez	3000 Boys	139
Mariano Ramirez	2000 Boys	140
Joey Aguiar	3000 Boys	141
Joey Aguiar	2000 Boys	142
Cecil Rhambo	3000 Boys	143
Cecil Rhambo	2000 Boys	144
Byron Dredd	3000 Boys	145
Pantamitr Zunggeemoge	3000 Boys	146
Sussie Ayala	3000 Boys	147
Michael Ponce De Leon	3000 Boys	148
Eric Gonzalez	3000 Boys	149
Duane Harris	3000 Boys	150
Noel Womack	3000 Boys	151
Elizario Perez	3000 Boys	152
David Bradley Vasquez	3000 Boys	153
Fernando Vasquez	3000 Boys	154
Scott Craig	3000 Boys	155
Dennis Burns	3000 Boys	156
Dennis Burns	2000 Boys	157
Larry Waldie	3000 Boys	158
Mauricio Rodriguez	3000 Boys	159
Jeffrey Rivera	3000 Boys	160
Juan Navarro	3000 Boys	161
Joseph Gonzalez	3000 Boys	162
Alfonso Andrade	3000 Boys	163
Fernando Luviano	3000 Boys	164
Fernando Luviano	2000 Boys	165
Engelbert Perez	3000 Boys	166
Lance Moorman	3000 Boys	167
Lance Moorman	2000 Boys	168
Michael Thurman	3000 Boys	169
Armando Ibarra	3000 Boys	170
Armando Ibarra	2000 Boys	171
Alexander Yim	3000 Boys	172
Jason Snyder	3000 Boys	173
Jason Snyder	2000 Boys	174
David Ortega	3000 Boys	175
David Ortega	2000 Boys	176
Clifford Yates	3000 Boys	177
William Penhollow	3000 Boys	178
Christopher Kidder	3000 Boys	179
Adrian Zuniga	3000 Boys	180
Adrian Zuniga	2000 Boys	181
Carlos Castillo	3000 Boys	182
David Aviles	3000 Boys	183
David Aviles	2000 Boys	184
Kelley Washington	3000 Boys	185
Hector Vazquez	3000 Boys	186
Matthew Thomas	3000 Boys	187
Joseph Sanford	3000 Boys	188
Aaron Rivera	3000 Boys	189
Jason Puga	3000 Boys	190
Blake Orlandos	3000 Boys	191
Matthew Nowotny	3000 Boys	192
Anthony Montes	3000 Boys	193
Jose Mendoza	3000 Boys	194
John McNicholas	3000 Boys	195
Michel McGrattan	3000 Boys	196
Mario Juarez	3000 Boys	197
Brendon Jackson	3000 Boys	198
Nicholas Graham	3000 Boys	199
Armando Gonzalez	3000 Boys	200
Antonio Galindo	3000 Boys	201
Michael Frazier	3000 Boys	202
Adolph Esqueda	3000 Boys	203
Arthur Diaz Jr	3000 Boys	204
Jeffrey Demooy	3000 Boys	205
Ivan Delatorre	3000 Boys	206
Alejandro Hernandez Castanon	3000 Boys	207
Enrique Cano	3000 Boys	208
Christopher Blasnek	3000 Boys	209
Francisco Alonso	3000 Boys	210
Carlos Ortega	3000 Boys	211
Adrian Ruiz	3000 Boys	212
Hernan Delgado	3000 Boys	213
Hernan Delgado	2000 Boys	214
Javier Guzman	3000 Boys	215
Frank Quintana	3000 Boys	216
Frank Quintana	2000 Boys	217
Frank Quintana	Vikings	218
Frank Quintana	Regulators	219
Justin Bravo	3000 Boys	220
Andrew Lyons	3000 Boys	221
Clayton Stelter	3000 Boys	222
Matt Ohnemus	3000 Boys	223
Daniel Cruz	3000 Boys	224
Jonathan Pera	3000 Boys	225
Armando Diaz	3000 Boys	226
James Krase	3000 Boys	227
Scott Erskin	3000 Boys	228
Timothy Mur	Cavemen	229
Jason Mann	Vikings	230
Jason Mann	Cavemen	231
Ramon Sanchez	Cavemen	232
Oscar Barrios	Regulators	233
Jason Zabala	Regulators	234
Jason Zabala	Cowboys	235
Norma Silva	Regulators	236
Charles McDaniel	Regulators	237
Xavier Aguilar	Regulators	238
Daniel S./J. Cruz	Regulators	239
Jorge F Sanchez	Regulators	240
Mark V Farino	Regulators	241
Pedro L Guerrero	Regulators	242
Edward Herron Jr	Regulators	243
Anthony D Vasquez	Regulators	244
Angel Jaimes	Regulators	245
Paul Pietrantoni	3000 Boys	246
Paul Pietrantoni	Vikings	247
Paul Pietrantoni	Regulators	248
Gutierrez	3000 Boys	249
Gutierrez	Vikings	250
Gutierrez	Regulators	251
Noe Garcia	3000 Boys	252
Noe Garcia	Vikings	253
Noe Garcia	Regulators	254
Remington Orr	3000 Boys	255
Remington Orr	Vikings	256
Remington Orr	Regulators	257
Gerard Smith	3000 Boys	258
Gerard Smith	Vikings	259
Gerard Smith	Regulators	260
Mickey Manzo	3000 Boys	261
Mickey Manzo	Vikings	262
Mickey Manzo	Regulators	263
Matthew Thompson	3000 Boys	264
Matthew Thompson	Vikings	265
Matthew Thompson	Regulators	266
Michael Camacho	3000 Boys	267
Michael Camacho	Vikings	268
Michael Camacho	Regulators	269
Joseph Britton	3000 Boys	270
Joseph Britton	Vikings	271
Joseph Britton	Regulators	272
Perkins	3000 Boys	273
Perkins	Vikings	274
Perkins	Regulators	275
Timothy Cooper	Vikings	276
Timothy Cooper	Regulators	277
Michael M. Nagaoka	Vikings	278
Gilbert Carrillo	Vikings	279
James D. Tatreau Jr.	Vikings	280
Dennis Werner	Vikings	281
Martinez	Vikings	282
Norinie Plett	Vikings	283
Richard Dinsmore	Vikings	284
Michael Aranda	Vikings	285
Ronnie Williams	Vikings	286
Miller	Vikings	287
Ralph Martin	Vikings	288
Randy Olson	Vikings	289
Gil Jurado	Vikings	290
R. Doyle Campbell	Vikings	291
Richard Adams	Vikings	292
Thomas Zampiello	Vikings	293
Chris James Young	Vikings	294
Robert F. Windrim	Vikings	295
Michael Wilber	Vikings	296
James Whitten	Vikings	297
John A. West	Vikings	298
Todd Lawrence Wallace	Vikings	299
K. Wall	Vikings	300
Byron G. Wainie	Vikings	301
Michael Voge	Vikings	302
Patrick Valdez	Vikings	303
Greg Thurman	Vikings	304
Gerald Richard Thompson	Vikings	305
Gregory Thompson	Vikings	306
Jack Tarasiuk	Vikings	307
Brian Steinwand	Vikings	308
Lt. Michael D. Sparks	Vikings	309
Elizabeth Smith	Vikings	310
Samuel Silva	Vikings	311
Larry Shultz	Vikings	312
J. Sheehy	Vikings	313
Michael Schneider	Vikings	314
Michael Salvatore	Vikings	315
Timothy Running	Vikings	316
Thomas A. Rosas	Vikings	317
William Roman	Vikings	318
Martin Rodriguez	Vikings	319
Allen Ripley	Vikings	320
Robert Rifkin	Vikings	321
Michael Reynolds	Vikings	322
R.A. Reed	Vikings	323
Jerold Reeves	Vikings	324
Jack Ramirez	Vikings	325
Dan Raimo	Vikings	326
Lt. Radeleff	Vikings	327
Michael Pippin	Vikings	328
Andre Pinesett	Vikings	329
James Pacina	Vikings	330
Richard Orosco	Vikings	331
O’Hara	Vikings	332
Rodolfo O’Dell	Vikings	333
Nunez	Vikings	334
Edward M. Nordskog	Vikings	335
Nelson	Vikings	336
Jack Neihouse	Vikings	337
John Mossotti	Vikings	338
Abel A. Moreno	Vikings	339
Scott Lee McCormick	Vikings	340
Guy Mato	Vikings	341
Allyn Lawrence Martin	Vikings	342
Curtis Golden	Vikings	343
Douglas Gillies	Vikings	344
Jeffrey Leslie	Vikings	345
Kevin J. Kiff	Vikings	346
Dale Huffman	Vikings	347
Eric Hubner	Vikings	348
Joseph Holmes II	Vikings	349
Holbrook	Vikings	350
A. Herrera	Vikings	351
T.J. Harvey	Vikings	352
Tommy Harris	Vikings	353
Allen Harris	Vikings	354
Joseph Guzman	Vikings	355
Albert Grotefend	Vikings	356
Ruben Gracia	Vikings	357
Kevin Goran	Vikings	358
Frank Gonzales	Vikings	359
Timothy Glover	Vikings	360
Niels Gittisarn	Vikings	361
Giron	Vikings	362
Kelly	Vikings	363
Ronald E. Gilbert	Vikings	364
Micahel J. Garcia	Vikings	365
Lance Tralick	Vikings	366
Raymond Esquerra	Vikings	367
Stephen Downey	Vikings	368
Craig Ditsch	Vikings	369
Robert Dillard	Vikings	370
Devine	Vikings	371
Frustino Delvalle	Vikings	372
Robert Delgadillo	Vikings	373
Costleigh	Vikings	374
James Corrigan	Vikings	375
Danielle Cormier	Vikings	376
Daniel Cooper	Vikings	377
Robert Papini	Vikings	378
Javier Clift	Vikings	379
Scott Carter	Vikings	380
Anthony Campbell	Vikings	381
Richard Calzada	Vikings	382
T . Brownwell	Vikings	383
Katherine Brown-Voyer	Vikings	384
Timothy Broad	Vikings	385
C. Brantley	Vikings	386
Larry Brandenburg	Vikings	387
Robert Blume	Vikings	388
Steve Blair	Vikings	389
Daniel McLeod	Vikings	390
Timothy E. Benson	Vikings	391
Charles Barton	Vikings	392
Paul Archambault	Vikings	393
Juan Alvarado	Vikings	394
Brian Lee	Vikings	395
Loy Luna	Vikings	396
Anderson	Vikings	397
John Corina	Vikings	398
Gary Blackwell	Vikings	399
Raymond Gott	Vikings	400
John Chapman	Vikings	401
Richard L. Castro	Vikings	402
Bert J . Cueva	Vikings	403
Richard Foreman	Vikings	404
Jerry Harper	Vikings	405
Paul Tan	3000 Boys	406
Paul Tan	2000 Boys	407
Paul Tan	Vikings	408
Paul Tan	Regulators	409
Sherman Block	Vikings	410
Leroy Baca	3000 Boys	411
Leroy Baca	2000 Boys	412
Leroy Baca	Banditos	413
Leroy Baca	Grim Reapers	414
Leroy Baca	Vikings	415
Leroy Baca	Regulators	416
John MacQuarrie	Little Devils	417
Dennis D. Crow	Little Devils	418
Arthur Bardy	Little Devils	419
John Wright	Little Devils	420
Michael Sutchiffe	Little Devils	421
Lee E. Everett	Little Devils	422
\.


--
-- Data for Name: shooting; Type: TABLE DATA; Schema: public; Owner: yiv
--

COPY public.shooting (age, victim, officer, id, date, lat, lng, weapon, outcome) FROM stdin;
26	Glenn Joseph Gorio	David M. Furmanski	SH2569401	1984-10-26	34.10863	-118.766045	(1,Gun)	1
29	Larry Crookshanks (sergeant)	Cecil Rhambo	SH0000001	1987-11-13	33.889214	-118.32281	(1,"")	2
21	Hong Pyo Lee	Paul Tanaka	Unknown	1988-03-08	34.38718	-118.11227	(0,"")	1
27	Enrique Ricardo Gonzalez	Robert Thacker	SH2422335	1988-10-28	33.957253	-118.44859	(1,Gun)	1
27	Anthony Ward (deputy)	Cecil Rhambo	SH0000002	1988-12-20	33.952564	-118.27612	(1,"")	2
50	Betty Jean Arborn	William Phelton	Unknown	1989-04-11	34.38718	-118.11227	(1,"")	1
30	Marcus Donel	Patrick Maxwell	Unknown	1989-05-30	33.916405	-118.35258	(0,"")	1
20	Henry Williams	Unknown	Unknown	1989-06-17	\N	\N	(2,"")	2
32	Arthur Jones	Jason Mann	100-7112/91-0351	1990-03-01	\N	\N	(0,"")	1
21	German Alvarado Sanchez	Unknown	SH2422340	1990-07-04	33.989765	-118.25212	(1,Gun)	1
20	Mario Alberto Oreyno	Liam Gallagher	SH0523234	1991-06-07	34.149582	-118.1362	(0,"")	2
28	James Lee Minor	David Oliva	SH0523232	1991-06-30	34.09077	-118.35184	(0,"")	1
22	Porfirio Avila aka Uriel Benitez	Daniel K. Jackson	SH0523240	1991-07-29	33.818928	-118.16873	(1,Gun)	1
19	Arturo Jimenez	Jason Mann	Unknown	1991-08-03	34.058624	-118.19479	(0,"")	1
22	Donald Johnson	Bruce J. Jacquez	SH0523244	1991-08-15	33.799023	-118.12207	(0,"")	0
28	Steven Clark Clemons	Michael E. Staley	SH0523256	1991-09-02	34.38718	-118.11227	(1,Gun)	1
35	Ernie Lopez Solarzano	Ruben Naranjo	SH0523200	1991-10-03	33.886227	-118.17294	(1,Gun)	1
41	Vidal Nuela Arias	Daniel Adlai Natkan	SH0523201	1991-10-06	33.968903	-118.24994	(0,"")	2
34	Timothy Wayne Nelson	Michael Claus	SH0523199	1991-10-26	33.870625	-118.19694	(1,Gun)	0
28	Michael Allen Jones	Thomas Halstead	SH523004	1991-11-23	34.076874	-118.36291	(1,Gun)	0
18	Danny Leland Nellum	Thomas Halstead	SH523004	1991-11-23	34.076874	-118.36291	(1,Gun)	0
27	Harvey Townes	Richard Biddle	SH0523207	1991-11-25	\N	\N	(2,"")	2
27	Charles King	Guy Earl	SH0523005	1991-11-27	34.081356	-118.383224	(1,Gun)	1
19	Brian Mittenhuber	Scott Seeman	SH0523210	1991-11-29	34.436005	-118.53529	(1,Baton)	2
22	Leonard Ruiz Rojas	Gerald Vane Pillen	SH0523212	1991-12-16	33.878242	-118.17742	(0,"")	2
31	Sam Joseph Angichiodo	Richard Ben Orosco	SH0523213	1992-02-27	33.910625	-118.01906	(1,Knife)	2
25	Joseph R. Sampson	Unknown	SH0523146	1992-05-29	33.96782	-118.18627	(1,Gun)	2
18	Marlene Cruz	Daniel Nathan	SH0523225	1992-05-31	33.974575	-118.249756	(0,"")	2
19	Ricardo Arias	Daniel Nathan	SH0523225	1992-05-31	33.974575	-118.249756	(0,"")	2
20	Sophia Louisa Diaz	Daniel Nathan	SH0523225	1992-05-31	33.974575	-118.249756	(0,"")	2
29	Ruben Acevedo	Daniel Nathan	SH0523225	1992-05-31	33.974575	-118.249756	(0,"")	2
18	Jamie Cano	Daniel Nathan	SH0523225	1992-05-31	33.974575	-118.249756	(0,"")	2
33	Juan Rodriguez	Steven Winter	SH0523228	1992-06-18	\N	\N	(1,Gun)	2
25	Joseph Raymond Sampson	Jeffrey Hardt	SH0523019	1992-08-22	34.073605	-118.06849	(1,"Wooden Post")	2
23	Raul Rincon	Trent Denison	SH0523248	1992-08-24	34.01164	-117.925995	(1,Gun)	0
22	Guillermo Rincon	Trent Denison	SH0523248	1992-08-24	34.01164	-117.925995	(1,Gun)	0
18	Jeffrey Powell	Jonathan White	SH0523249	1992-08-24	34.67815	-118.097855	(1,Gun)	2
22	Eric Vincent Variel	James Lopez	SH0523027	1992-09-17	33.87483	-118.12503	(0,"")	2
22	Richard Forch	Darren Keith Hager	SH0523025	1992-09-23	34.615307	-118.14996	(0,"")	2
61	Donald Scott	Gary R. Spencer	SH0523007	1992-10-02	34.08211	-118.92011	(1,Gun)	1
24	Victor Mazo	Timothy Robarge	SH0523029	1992-10-14	33.8988	-118.17971	(1,Gun)	2
25	Mark Berryhill	David A. Dolson	SH0523018	1992-10-17	33.941254	-118.29193	(1,Gun)	2
26	Anthony Campbell	Angus Ferguson	SH0523020	1992-11-14	33.901978	-118.30479	(0,"")	1
49	Ruben Valber	David M. Carver	SH0523016	1992-11-17	33.972977	-118.2312	(1,Gun)	1
25	Luis Vargas Martinez	Thomas Gibson	SH0523023	1992-11-24	34.38718	-118.11227	(1,Knife)	1
39	Ismael Brito	David M. Willard	SH523014	1992-11-26	34.38718	-118.11227	(0,"")	2
21	Chris Wayne Gwinnett	Brian Torsney	SH0523026	1992-12-05	34.58668	-118.12088	(1,Knife)	1
40	Amado Escobedo	Salvador Velasquez	SH0523034	1993-01-13	33.90441	-118.19696	(1,Gun)	1
19	Larry Lipscomb, Jr	David M. Joyce	SH2006241	1993-01-22	33.891235	-118.090324	(0,"")	2
38	Stuart Rosenstein	Gary L. Brody	SH0523042	1993-03-25	34.561222	-118.03338	(1,Gun)	1
31	Kirk Douglas Ehinger	Richard Godfrey	SH0523013	1993-03-27	33.946117	-118.35493	(1,Gun)	2
19	David Jimenez	Michael Irving	SH523040	1993-04-04	33.908096	-118.1829	(1,Gun)	1
27	Osmin Antonio Carballo	Christopher Adam Ellison	SH0523037	1993-05-08	33.95633	-118.24739	(0,"")	2
30	Manuel Enrique Carballo	Christopher Adam Ellison	SH0523037	1993-05-08	33.95633	-118.24739	(1,Gun)	1
\N	Jesus Serrano	Morris	SH0523032	1993-06-04	34.059155	-118.24545	(1,Gun)	1
\N	Ramiro Serrano	Demilio	SH0523032	1993-06-04	34.059155	-118.24545	(1,Gun)	1
38	Oscar Javier Garcia	Craig Husbands	SH0523038	1993-06-24	34.19034	-118.149345	(1,Gun)	1
34	Jose Antonio Arias Osuna	Craig Husbands	SH0523038	1993-06-24	34.19034	-118.149345	(1,Gun)	1
16	Unknown Child	Joseph O'Connor	SH523044	1993-06-26	33.9485	-118.3087	(1,Gun)	1
18	Dante Terrell Goodrich	Eliezer Vera	SH2556390	1993-07-04	33.92959	-118.20882	(1,Gun)	2
21	Paris D Miller	William Bartlett	SH0523045	1993-07-09	33.915493	-118.26745	(1,Gun)	2
23	Travis Abner	Dennis Miller	SH0523058	1993-08-02	34.03371	-117.95859	(1,"Gun ")	0
23	Zuri Young	Dennis Miller	SH0523058	1993-08-02	34.03371	-117.95859	(1,Gun)	0
26	James Sutton	Edward G. Everett	SH0523048	1993-08-31	33.922115	-118.314224	(1,Knife)	0
\N	Ralph Drake	Edward G. Everett	SH0523048	1993-08-31	33.922115	-118.314224	(0,"")	0
49	Wayne Luster	Darren Keith Hager	SH0523151	1993-09-02	34.68122	-118.15032	(1,Gun)	0
32	Darren Carter	Darren Keith Hager	SH0523152	1993-10-03	34.688393	-118.16402	(1,Gun)	0
18	Leighton Corothers	Darren Keith Hager	SH0523152	1993-10-03	34.688393	-118.16402	(1,Gun)	0
18	Polo Rivera	Unknown	SH0523148	1993-11-07	33.869007	-118.171394	(1,Gun)	0
23	Cuong Tu Hong	Charles Prescott	SH0523055	1993-11-08	34.054665	-118.095116	(1,Gun)	0
18	Phong Tan Huynh	Charles Prescott	SH0523055	1993-11-08	34.054665	-118.095116	(1,Gun)	0
\N	Unknown	Charles Prescott	SH0523055	1993-11-08	34.054665	-118.095116	(1,Gun)	1
21	Creadell P. Polee	James C. Bald	SH0523052	1993-11-09	33.918808	-118.25951	(1,Gun)	2
24	Victor H. Velasco	Arthur Escamillas	SH0523041	1993-11-15	33.983284	-118.256454	(1,Gun)	1
24	Darrell W. Charles	Robert F. Windrim	SH0523150	1993-12-01	33.847286	-118.23793	(0,"")	0
28	Steve Yandrich	Corry Cline	SH0523053	1993-12-25	34.75645	-118.796585	(1,Gun)	2
23	Timothy Lucious	Edward G. Everett	SH0523065	1994-01-19	33.946144	-118.29218	(1,Gun)	2
\N	Russell Hinman	Garcia	SH0523066	1994-02-16	33.820457	-118.308655	(1,Gun)	2
52	Miguel Ruiz	Unknown	SH0523068	1994-02-27	33.950497	-118.25425	(1,Gun)	1
44	Benjamin Sedano	Darrel Airhart	SH0523072	1994-03-04	33.870834	-118.07489	(1,Gun)	1
18	Raymond Jess Reyes	Allen Harris	SH0523259	1994-03-06	34.124104	-118.46421	(1,Gun)	0
\N	R. Hill	Michael James Rothans	SH0523067	1994-03-31	33.919273	-118.30917	(1,Gun)	0
\N	Herbert Robinson	Unknown	SH2566746	1994-04-07	33.984623	-118.25615	(1,"BB Gun")	0
\N	Jorge Barajas	Raye Morales	SH0523076	1994-06-27	34.38718	-118.11227	(1,Gun)	1
\N	Mario Garcia	Mitchell Hodrick	SH0523078	1994-08-18	33.938805	-118.344376	(1,Gun)	0
25	David Chacon	Sean C. Hoodye	SH0523083	1994-08-26	34.052654	-118.218254	(0,"")	1
25	Robert Almeida	Scott Orr	SH0523079	1994-09-10	33.831673	-118.28169	(1,Gun)	1
\N	Young Lee	Benny Hollowell	SH0523162	1994-10-16	33.960823	-118.16967	(0,"")	0
19	Cecil Jenkins	Eliezer Vera	SH523089	1994-10-26	33.92359	-118.20373	(0,"")	0
20	Anthony P. Turner	Eliezer Vera	SH523089	1994-10-26	33.92359	-118.20373	(1,Gun)	0
26	Mark Mullins	Richard Schlegel	SH0523160	1994-10-28	34.38718	-118.11227	(0,"")	0
21	Roland Holloway	Richard Schlegel	SH0523160	1994-10-28	34.38718	-118.11227	(0,"")	0
27	Tomas A. Figueroa	Gregg Hopping	SH0523085	1994-11-02	34.120926	-117.99103	(1,Knife)	1
27	Jeffrey Konrath	Ernest "Ernie Chavez	SH0523090	1994-11-05	33.96695	-118.224815	(0,"")	1
24	Mark A. Bryant	Lawrence Adams	SH0523093	1994-12-05	33.994083	-117.92351	(1,Gun)	1
30	Aaron Wesley Cease	Gregory Gabriel	SH0523069	1994-12-18	34.21598	-118.23996	(0,"")	1
22	Jose M. Sanchez	Jeffrey Perry	SH1070393	1995-01-03	34.04621	-118.443924	(0,"")	0
25	Carl Edward Hanible	Lauren Brown	SH0523097	1995-01-11	34.69299	-118.165764	(1,Gun)	2
23	Carl Jones	Unknown	SH0523102	1995-02-05	33.937252	-118.25783	(1,Gun)	2
19	Chris Anthony Shannon	Bruce D. Chase	SH0523104	1995-02-21	33.928493	-118.2109	(1,Gun)	2
\N	Markus Hurd	Daniel Ross	SH0523103	1995-02-27	34.12452	-117.99564	(1,Gun)	2
22	Tourmaria Foreman	Richard A. Ellis	SH0523167	1995-03-18	34.183212	-118.14574	(1,Gun)	0
\N	James E. King	Boskovic	SH0523101	1995-03-28	33.953415	-118.13009	(1,Gun)	1
30	Samuel Daniel	Eliezer Vera	SH523189	1995-04-20	33.904877	-118.224884	(1,Gun)	0
20	Manuel Garcia	Miguel A. Macedo	SH0523176	1995-06-05	34.058193	-118.17396	(1,Gun)	0
23	Robert Smith	Nicholas Rampone	SH0523123	1995-06-06	33.86777	-118.04771	(0,"")	1
24	Terris D. Crews	Raymond Bernasconi	SH0523095	1995-06-29	33.742393	-118.28791	(1,Gun)	2
20	Hunh-An T Le	Frank Trabbie	SH0523177	1995-08-11	33.864716	-118.30259	(0,"")	0
25	Michael Nides	Wayne Stricklin	SH0523116	1995-08-13	34.100136	-117.85766	(1,Gun)	1
20	Irving D. Carrier	Christopher Adam Ellison	SH0523171	1995-09-06	34.343216	-118.36072	(1,Gun)	0
22	Raymond J. Caudillo	Marcus Hershey	SH0523175	1995-09-12	34.09143	-118.365944	(0,"")	0
23	Angel Arredondo	Steven Newman	SH0523105	1995-09-25	33.78081	-118.30984	(0,"")	2
40	Frank D. Gonzales	Daniel Batanero	SH0523119	1995-10-07	34.0406	-118.16703	(1,Gun)	2
32	Clifford Verdell Ingram	Eliezer Vera	SH523181	1995-11-03	33.92731	-118.21052	(1,Gun)	0
19	Keith K. Russell	Bruce D. Chase	SH0523129	1995-11-27	33.926003	-118.23629	(1,Gun)	2
25	Latece Brown	Bruce D. Chase	SH0523129	1995-11-27	33.926003	-118.23629	(1,Gun)	0
25	Miguel A. Martinez	Thomas E. Dobis	SH0523130	1995-12-03	33.962368	-118.200134	(1,Gun)	2
57	Alfredo Terrazas	Edward G. Everett	SH0523133	1996-01-07	33.94099	-118.3632	(1,Gun)	1
46	Richard Smith	Todd Kocisko	SH0523134	1996-02-02	33.96011	-118.254	(1,Gun)	2
19	Sebastian Ramirez	Daniel Batanero	SH0523135	1996-03-22	34.020145	-118.16511	(1,Gun)	1
\N	Timothy Coleman)	Francis Espeleta	SH0523139	1996-04-06	33.93196	-118.248405	(1,Gun)	1
57	Jesus Rocha	Joseph Acevedo	SH0523138	1996-05-17	33.94182	-118.36135	(1,Gun)	1
\N	Tyquann Benson	Crystal Miranda	SH1067942	1996-05-27	33.90745	-118.26742	(0,"")	0
22	Joseph Dillard Jr.	Crystal Miranda	SH1067942	1996-05-27	33.90745	-118.26742	(1,Gun)	0
30	Sheldon Walker	Allen Mullins	SH1120330	1996-08-02	34.693073	-118.13035	(1,Gun)	0
27	Armando Mora	Charles Fallon	SH1069634	1996-08-13	34.034866	-117.97457	(1,Gun)	1
\N	P. Carrillo	David Busk	SH1205152	1996-09-17	34.067936	-118.80748	(1,Gun)	2
\N	H. Camacho	David Busk	SH1205152	1996-09-17	34.067936	-118.80748	(0,"")	0
48	Raymond Sanchez Rivas	Joseph John Miskevics	SH0523086	1996-09-24	33.95328	-118.239685	(1,Gun)	2
27	Ray A. Lozoya	James Bush	SH1150533	1996-10-02	34.22354	-118.24327	(0,"")	0
50	Scott Douglas Vern	Florentino Madrid	SH1180651	1996-11-19	33.98679	-117.82342	(1,Knife)	1
26	Manuel Painia	Unknown	SH1198242	1996-11-30	33.856342	-118.07046	(1,Gun)	2
21	David Baez	Russell Stover	SH1204950	1997-01-01	\N	\N	(1,Gun)	2
26	Armando Gutierrez Jr.	Dennis A. Clark Jr.	SH1197241	1997-01-01	33.948727	-118.041626	(1,Gun)	2
23	Otto Yovany Oliva	Phillip Marquez	SH1139436	1997-01-03	33.91306	-118.20155	(2,"")	0
19	Ralph Conrado Drumal	Phillip Marquez	SH1139436	1997-01-03	33.91306	-118.20155	(2,"")	2
22	Monica Esparza	Phillip Marquez	SH1139436	1997-01-03	33.91306	-118.20155	(2,"")	2
21	Caesar Manuel Rios	Keith Wall	SH1141025	1997-01-25	34.053814	-117.96118	(1,Gun)	0
\N	Mario Ramos	Millette	SH1076024	1997-02-18	33.960987	-118.241806	(1,Gun)	0
35	Todd Tetrick	Unknown	SH1025440	1997-03-08	34.58238	-118.13722	(1,Knife)	1
34	Gregory Franklin Brandon	Aaron Maready	SH1033665	1997-03-21	33.93018	-118.210945	(0,"")	1
\N	C. Osequesada-Perez	Richard Pfeiffer	SH1053766	1997-04-24	33.957798	-118.2311	(1,Gun)	2
42	Charles Stewart Friddle	Frank Jinright	SH1072778	1997-05-14	34.692192	-118.10534	(1,Gun)	2
39	Daniel Lawrence Collins	Clarence G. Gallegos	SH1084850	1997-06-11	33.974777	-118.1128	(1,Gun)	1
\N	Tyler Lyle	Richard Engles	SH1094942	1997-06-27	34.513775	-117.99247	(1,Gun)	1
38	Jesus Zazueta	Joseph McCleary	SH1100855	1997-07-07	34.001453	-118.16313	(1,Knife)	1
30	Cameron Caldwell	Jonathan Aujay	SH1108529	1997-07-22	34.022835	-118.41017	(1,Gun)	1
32	Michael Lambert	John Donaldson	SH1110967	1997-07-27	33.74747	-118.37387	(1,Knife)	1
26	Ebon Todd Leggs	Corey Fletcher	SH1132696	1997-09-03	33.87573	-118.08057	(1,Gun)	1
29	Roland Hernandez	Ralph Ruedas	SH1138000	1997-09-11	33.96154	-118.11094	(1,Gun)	2
28	Albert Beltran	Jenny Bethune	SH1172598	1997-11-16	33.779312	-118.14863	(1,Gun)	2
18	Ernest Jacinto Velasco	Sean Van Leeuwen	SH1184392	1997-12-09	34.045914	-118.18232	(1,Gun)	2
18	Carlos Javier Sanchez	Sean Van Leeuwen	SH1184392	1997-12-09	34.045914	-118.18232	(1,Gun)	0
20	Carlyn McDonald	John Hocking	SH1185629	1997-12-11	33.846592	-118.223785	(1,Gun)	0
\N	N. Antuna	Michael Winter	SH1188991	1997-12-25	34.091965	-118.30249	(1,Gun)	2
39	Michael W. Arnold	Curt Messerschmidt	SH1203201	1998-03-27	34.38718	-118.11227	(1,Gun)	1
32	Mark Kuklock	Robert Farkas	SH1208071	1998-04-25	\N	\N	(1,Gun)	1
\N	Juan Ramirez Rendon	Matthew C. Rodriguez	SH1211915	1998-05-26	\N	\N	(0,"")	2
19	M. Mendez	Mark Kocisko	SH1214373	1998-06-14	33.912464	-118.195206	(0,"")	0
24	Lorenzo Anguiano	Hector Velasquez	SH1218403	1998-07-09	34.01233	-117.908775	(1,Gun)	0
32	Daniel Velasquez	Unknown	SH1225031	1998-08-31	33.9148	-118.20915	(1,Gun)	2
19	Dwayne Weathersby	William Wicker	SH1226479	1998-09-08	33.923527	-118.20523	(0,"")	0
\N	Joseph Nicassio	William Wicker	SH1226479	1998-09-08	33.923527	-118.20523	(1,Gun)	2
15	Andrew Tomas Reyes	Timothy Phillips	SH1229491	1998-10-04	34.01482	-118.163	(0,"")	0
16	Charles Joseph Frias	Timothy Phillips	SH1229491	1998-10-04	34.01482	-118.163	(1,Gun)	0
19	Alfredo Carrizoza	Javier Valencia	SH1232466	1998-10-27	33.972305	-118.25191	(0,"")	0
29	Adolfo Molina	Javier Valencia	SH1232466	1998-10-27	33.972305	-118.25191	(1,Gun)	0
18	Ricardo A Cueliar	Jeffrey Coates	SH1235781	1998-11-20	33.930916	-118.2979	(1,Gun)	1
31	Thomas Freeman	Martin Klaus	SH1236001	1998-11-24	34.38718	-118.11227	(0,"")	1
35	Tracy Melrose	Michael Voge	SH1236071	1998-11-25	34.67495	-118.1524	(1,Gun)	1
18	Jose Lerma	Mario Castro	SH1236005	1998-11-27	34.011364	-118.16049	(1,Gun)	0
16	Julio Castillo	Alfonso Garcia	SH1240801	1999-01-10	33.921703	-118.20139	(0,"")	1
19	Dion Goodloe	Sean C. Hoodye	SH1241435	1999-01-16	33.95793	-118.29181	(1,Gun)	1
48	Lawrence Jones	Kenneth Scheum	SH1241431	1999-01-16	33.789486	-118.31125	(1,scissors)	1
32	Alvaro Dominguez	Robert Knudson	SH1244281	1999-02-09	34.167866	-118.58478	(0,"")	2
25	Christopher Frank	William Farrell	SH1245301	1999-02-18	33.764923	-118.30102	(1,Gun)	2
35	Juan Carlos Close	John Guerrero	SH1246521	1999-02-23	34.021595	-118.15171	(1,Knife)	1
26	Armando Rodriguez	Morrie Zager	SH1251919	1999-04-21	34.038754	-118.08232	(1,Gun)	1
32	Gina Simental	Michael Wilber	SH1259831	1999-06-29	34.008923	-118.22287	(1,Gun)	1
42	Rodney Sexton	Partick Nelson	SH1260001	1999-06-30	34.610634	-118.24774	(1,Gun)	0
23	James Aguilar	Kenneth R. Fontanilla	SH1260541	1999-07-10	33.945393	-118.35914	(1,Gun)	2
20	Daniel Rodriguez	Michael Joyce	SH1261521	1999-07-18	33.878906	-118.07699	(1,Gun)	2
24	David Rico	Bruce A. Strelow	SH1263371	1999-07-28	34.05598	-118.177055	(1,Gun)	0
28	Michael Gonzalez	Bruce A. Strelow	SH1263371	1999-07-28	34.05598	-118.177055	(1,Gun)	0
34	Robert Vandevort	Sean Klenin	SH1263871	1999-08-07	33.902264	-118.06122	(1,Gun)	1
36	Edward Rojas	Michael D. Galvan	SH1264292	1999-08-11	33.928177	-118.12954	(1,Gun)	2
\N	Tommy Ray Holly	Mario Jimenez	SH1265451	1999-08-25	33.96125	-118.2916	(1,Gun)	1
37	Robert Phen	Terance Holden	SH1271471	1999-10-12	34.092846	-118.37907	(1,"Knife, hatchet")	1
19	Luis Sosa	Timothy Phillips	SH1273723	1999-10-27	34.016315	-118.14464	(1,Gun)	2
44	Raymond Arvizu	Joe L. Ochoa	SH2000944	1999-11-22	32.267647	-109.23193	(1,Gun)	1
34	James Eugene Bowles	Victor J. Naranjo	SH1045155	1999-12-25	33.983307	-118.07059	(1,Gun)	1
25	Alex Montelongo	Philip Hansen	SH2005203	2000-02-06	34.005325	-118.073105	(1,Gun)	1
50	Louis Thomas Pass	David Holwager	SH2005084	2000-02-08	34.211143	-118.232155	(0,"")	1
20	Jason P. Rodriguez	Unknown	Unknown	2000-02-18	33.987385	-118.454025	(0,"")	1
18	Sergio Jesus Sarmiento	Jeffrey Riggins	SH2006926	2000-02-29	33.82611	-118.18378	(1,Gun)	0
17	Randall Raymond Ramsey	Francis Ruiz	SH2010762	2000-04-26	34.001213	-118.333244	(1,Gun)	1
34	Richard Navarro Garcia	Steven Velasquez	SH2013164	2000-05-21	34.032196	-118.14696	(1,Knife)	1
29	Brian Brouwer	Carlos Parga	SH2014835	2000-06-13	34.085426	-118.0345	(1,Gun)	2
35	James Everitte Jenkins	Michael Yocum	SH2015757	2000-07-07	33.91852	-118.20244	(0,"")	1
58	John Dennis Marshall	Ron Miranda	SH2016325	2000-07-20	33.854877	-118.24177	(1,Gun)	1
25	Shawn Anderson	Louis Suazo	SH2017524	2000-08-07	33.83051	-118.27779	(0,"")	0
36	Ming Chinh Ly	Richard Hirsch	SH2017863	2000-08-13	34.07671	-118.073044	(0,"")	1
23	Terrell James Towns	Unknown	Unknown	2000-08-13	33.90301	-118.32065	(2,"")	1
47	Martin Garcia Escobar	Thomas Carter	SH2018726	2000-08-25	34.686707	-118.15064	(1,Machete)	1
46	Trinidad Norman Rodriguez	Alan Healy	SH2018833	2000-08-29	33.917076	-118.06997	(1,Gun)	1
29	Darnell Anthony Gray	Eliezer Vera	SH2019284	2000-09-04	34.38718	-118.11227	(1,Gun)	2
22	Devon Leon Brown	Eliezer Vera	SH2019284	2000-09-04	34.38718	-118.11227	(1,Gun)	2
31	Yvette Rios	Robert Chivas	SH2021648	2000-10-05	34.08011	-118.0646	(1,Knife)	2
37	Ricky Leo Alkana	Jeffrey Moore	SH2023136	2000-11-03	34.13055	-118.06933	(1,Gun)	1
36	Mark John Gault	Jonathan Melville	SH2025381	2000-11-18	34.438522	-118.40559	(1,Gun)	1
18	Daniel Becerra	Michael Austin	SH2026417	2000-11-21	33.89137	-118.29389	(1,Gun)	0
22	Daios Retzepis	Robert Payne	SH2025848	2000-12-14	34.095448	-118.05592	(1,Knife)	1
23	Sergio Ruiz	Noe Garcia	SH2026781	2000-12-31	33.98788	-118.25305	(0,"")	2
22	Charles Robinson	William Farrell	SH2027107	2001-01-04	33.832127	-118.29615	(1,"")	2
34	Gustavo Roman	Anthony Lazo	SH2028178	2001-01-22	33.985554	-118.24807	(0,"")	1
26	Gustavo Roman aka Gilberto Garcia (per LASD)	Marcelo J. Sampedro	SH2028178	2001-01-22	33.985588	-118.247375	(2,"")	1
28	Samuel Cortez Jr.	Unknown	Unknown	2001-02-08	33.989223	-118.23255	(2,"")	1
38	Robert Eugene Jones, Jr.	Joey Stoker	SH2029390	2001-02-11	33.943592	-118.30878	(0,"")	1
43	Rosa Viera	Unknown	Unknown	2001-02-18	33.934696	-118.30012	(2,"")	1
30	Juan De La Cruz Reyes	Albert Ortiz	SH2029880	2001-02-18	33.934696	-118.30012	(1,boxcutter)	1
\N	Francisco Reyes	Michael Galvan	SH2007412	2001-03-06	34.019005	-118.03472	(0,"")	0
24	Servando Villalobos	Adan Torres	SH2031317	2001-03-12	33.98614	-118.25212	(0,"")	2
18	Jose Monterosa	Kamal Ahmad	SH2032740	2001-03-31	33.985718	-118.24775	(0,"")	0
20	Enoc Cabrera	Kamal Ahmad	SH2032740	2001-03-31	33.985718	-118.24775	(1,Gun)	0
28	Olegario Granados	Kamal Ahmad	SH2032740	2001-03-31	33.985718	-118.24775	(0,"")	0
56	Lorenz Vilim Karlic	Keith Gibbons	SH2033094	2001-04-02	34.221542	-118.23075	(0,"")	0
29	Ricardo Esparza	Jason Diplock	SH2033090	2001-04-03	34.149582	-118.1362	(2,"")	1
34	Donald Orville Smith	Rick O'Neill Rector	SH2033946	2001-04-18	33.874176	-118.15014	(1,Knife)	1
45	John Joseph Pasko	Fray Lupian	SH2035583	2001-05-09	34.13553	-118.64485	(1,Gun)	1
29	Dana Micah Lindeman	Mark Sunagawa	SH2035601	2001-05-13	33.923878	-118.35629	(1,Knife)	1
38	Santiago Gutierrez	Clarence G. Gallegos	SH2038321	2001-06-21	34.38718	-118.11227	(1,Gun)	1
25	Maziar Badie	Unknown	Unknown	2001-07-16	34.095078	-118.36547	(2,"")	1
28	Louis Corswell	Adan Torres	SH2041496	2001-07-31	33.956535	-118.25643	(0,"")	2
47	Francisco Cerda Ortiz	Oscar Butao	SH2043906	2001-08-27	33.90429	-118.15814	(1,Knife)	1
35	James Allen Beck	Clarence G. Gallegos	SH2044547	2001-08-31	34.38661	-118.600334	(1,Gun)	1
22	Alex Quincy Carter	Joseph Vasquez	SH2045400	2001-09-14	33.888752	-118.35567	(0,"")	1
30	Ernest Guillen	Sean A. Heieck	SH2047138	2001-10-06	34.05174	-117.9997	(1,Gun)	1
28	Bernardo Rogelio Sanchez	Brian Walker	SH2051750	2001-11-01	34.001156	-117.810524	(1,Gun)	1
46	Benny Norton	Angelica Vargas	SH2049707	2001-11-10	34.38718	-118.11227	(0,"")	1
38	Lorenzo Hardis Howard	Angelica Vargas	SH2049707	2001-11-10	34.38718	-118.11227	(0,"")	1
26	Miguel Briones Cesena	Unknown	Unknown	2001-11-12	33.965073	-118.22243	(2,"")	1
18	Sergio Cerda	Nicholas Budge	SH2051739	2001-11-18	34.06361	-118.08419	(1,Gun)	2
26	Zeferino Betancourt	Unknown	Unknown	2001-12-08	34.041073	-118.243805	(2,"")	1
47	Howard L. Michael	Robert Leyba	SH2053430	2001-12-31	34.008244	-118.09985	(0,"")	0
19	Leonard Garcia	James J. North	SH2053327	2002-01-01	33.922832	-118.18467	(1,Gun)	1
19	Ramin Antonio Isayo	Marion Tucker	SH2057715	2002-02-18	34.574406	-117.96515	(1,Gun)	1
46	Cayetano Melendez	Robert Guilbault	SH2060706	2002-04-06	34.38718	-118.11227	(1,Gun)	2
27	Eddie Montes Dominguez	Marc Lucio	SH2061419	2002-04-16	33.986607	-118.05986	(0,"")	1
26	Jesus Robles	Richard McKaig	SH2062117	2002-04-28	33.932327	-118.20182	(1,Gun)	1
42	Brian Keith Miller	Michael Austin	SH2062537	2002-04-29	33.819794	-118.28077	(1,Axe)	1
19	Herbert Celestine	Unknown	SH2063089	2002-05-14	33.93819	-118.36245	(1,Gun)	2
24	Robert L. Romero	Robert Leyba	SH2064761	2002-05-31	33.9971	-118.17174	(1,Gun)	2
29	Feras Abdelrazzaq	John Detreville	SH2065694	2002-06-14	34.106598	-117.889175	(1,Knife)	1
18	Lavell Houston	Regan Fitzgerald	SH2068762	2002-08-02	33.91758	-118.29157	(1,Gun)	0
21	Anthony Grandberry	Regan Fitzgerald	SH2068762	2002-08-02	33.91758	-118.29157	(1,Gun)	2
21	Robert Wayne Klingman III	Gregory Kelly	SH2070458	2002-08-23	34.660507	-118.103386	(1,Gun)	1
32	Jose Brito	John MacDonald	SH2070675	2002-09-01	33.929337	-118.23905	(1,Gun)	1
34	Ricky Harris	Gerald Berry	SH2073206	2002-09-25	33.87645	-118.0359	(0,"")	0
29	Hugh Goode	Neil Thomas	SH2073636	2002-10-06	33.94311	-118.04645	(1,Gun)	0
23	Joseph Renee Queen	Jason Bowley	SH2078688	2002-11-10	33.858242	-118.26601	(1,Gun)	1
40	Robert Connie Mitchell	Rick Manes	SH2076232	2002-11-20	34.539555	-117.96574	(0,"")	1
20	Elijah Towner	Regan Fitzgerald	SH2076559	2002-11-26	33.87716	-118.33634	(0,"")	2
45	Gino Giovanni Dellacqua	Unknown	Unknown	2002-12-09	34.38718	-118.11227	(2,"")	1
44	Jimmy Sum	Unknown	Unknown	2002-12-14	34.080486	-118.08967	(2,"")	1
19	Rafael Barajas	Unknown	SH2079492	2003-01-07	34.035835	-118.03672	(1,Gun)	1
63	J C (Joseph) Jones	Sean Carrion	SH2080656	2003-01-25	33.916832	-118.30742	(1,Gun)	1
25	Dewayne Davenport	Allen Dollens	SH2081149	2003-01-28	33.89593	-118.202934	(1,Gun)	1
23	Anthony James Barnett	Allen Dollens	SH2081149	2003-01-28	33.89593	-118.202934	(1,Gun)	1
22	Ronnie James Chavez	Unknown	Unknown	2003-02-23	34.069992	-118.027084	(0,"")	1
34	Frank Guzman	Unknown	SH2086464	2003-04-02	34.111877	-118.01068	(1,Gun)	1
27	Brice Everett Ross	Max Fernandez /	SH2085362	2003-04-04	33.8957	-118.22909	(0,"")	1
19	Julio Nuno	Unknown	SH2087112	2003-05-01	33.990467	-118.25551	(0,"")	2
20	Macario Jesus Martinez	Unknown	SH2087112	2003-05-01	33.990467	-118.25551	(0,"")	1
29	Robert Joseph Dingman	Brian Bishop	SH2087436	2003-05-08	33.927135	-118.03073	(0,"")	1
22	Traveon Henderson	Anthony Baudino	SH2088731	2003-05-20	33.92118	-118.29183	(1,Gun)	2
20	Kenneth Bell	Anthony Baudino	SH2088731	2003-05-20	33.92118	-118.29183	(1,Gun)	0
32	Johnson Schneider	Steven Velasquez	SH2088921	2003-05-21	33.995785	-118.14841	(0,"")	0
27	Alunad Brown	Anthony Bowie	SH2088917	2003-05-27	33.896835	-118.2339	(1,Gun)	2
33	Lawrence Raul Licano	Unknown	Unknown	2003-06-09	34.078953	-117.75694	(2,"")	1
20	Sabino Gallardo	Julio Martinez	SH2090991	2003-06-17	33.855087	-118.196846	(1,Gun)	0
39	Manuel Ernesto Garcia	Joseph Valencia	SH2093009	2003-07-08	33.88664	-118.25237	(1,"metal pipe")	1
52	Donald Charles Kueck	Jack Demelo	SH2095119	2003-08-09	34.57306	-117.797104	(1,Gun)	1
18	Edgar A Zelaya	Robert Heins	SH2099405	2003-08-20	34.561417	-118.06678	(1,Gun)	1
19	Ronald Eduardo Guzman	Terrence Bell	SH2101474	2003-08-22	33.985226	-118.25648	(0,"")	1
23	Deandre Brunston	William Zollo	SH2099172	2003-08-24	33.918507	-118.22919	(0,"")	1
41	Natalio Molano	Unknown	Unknown	2003-09-02	34.090073	-117.957985	(2,"")	1
19	Ronald Joseph Carlos	Unknown	Unknown	2003-10-09	34.081406	-117.98012	(2,"")	1
20	Kristian Amacker	Joseph Valencia	SH2101485	2003-10-18	33.89788	-118.242096	(0,"")	0
33	Tommie Campbell	Troy Ewing	SH2103454	2003-11-11	34.125	-117.99327	(0,"")	2
27	Simona Goods	Troy Ewing	SH2103454	2003-11-11	34.125	-117.99327	(0,"")	2
18	Alan Hoyos	Thomas Mayberry	SH2103334	2003-11-13	33.932003	-118.193306	(1,Gun)	1
26	Maximino Reyes	Scott Gage	SH2104168	2003-11-13	33.896374	-118.195656	(1,Gun)	1
32	Shawn Berry	Bobby Lyons	SH2105975	2003-12-17	34.057507	-117.91188	(0,"")	2
22	Arturo Saldana	Unknown	SH2108825	2004-01-05	33.909355	-118.20887	(1,Gun)	1
24	Abelardo Saldana	Unknown	SH2108825	2004-01-05	33.909355	-118.20887	(1,Gun)	1
21	Johntae Carr	Mark Wood	SH2107430	2004-01-21	34.420666	-118.564156	(1,Gun)	0
20	Andony Corleto	Mark Wood	SH2107430	2004-01-21	34.420666	-118.564156	(1,Gun)	0
33	Eric Lamont Wilson	Regan Fitzgerald	SH2108254	2004-02-02	33.946987	-118.30897	(1,Gun)	1
37	Hector Reyes	James Beamon	SH2086434	2004-02-03	34.01648	-117.91121	(1,Gun)	2
28	Kenneth Counts	Timothy Alsky	SH2108758	2004-02-06	33.898354	-118.21061	(1,Gun)	2
18	Josue Antonio Guardado	Noe Garcia	SH2110176	2004-02-23	34.02553	-118.332634	(0,"")	0
24	Michael Rodeghier	Salvador Munoz	SH2111823	2004-02-27	33.919	-118.0926	(0,"")	0
27	Antonio Sapien	Salvador Munoz	SH2111823	2004-02-27	33.919	-118.0926	(1,Gun)	2
56	Dennis Fetters	Michael Mileski	SH2112508	2004-03-05	33.90362	-118.08736	(0,"")	0
49	Donald Keith Franks	Michael Mileski	SH2112508	2004-03-05	33.90362	-118.08736	(1,"Pellet Gun")	1
34	Roy Rodriguez	Gerald Plent	SH2113634	2004-03-16	34.074303	-117.939	(1,Gun)	0
26	Jamaal Neal	Mark Schultz	SH2114392	2004-03-18	33.89225	-118.26006	(1,Gun)	2
39	Kevin Ellis	Tina Kelley	SH2114412	2004-03-29	34.072426	-118.09962	(0,"")	2
31	Salvador Mosqueda	Kevin Berger	SH2114924	2004-03-31	33.842663	-118.29893	(1,Gun)	1
25	Ricardo Rodriguez	Daniel Dail	SH2114941	2004-04-09	33.925056	-118.29324	(1,Gun)	1
39	Marcelo Ruiz	Donald Wyman	SH2116540	2004-04-20	34.41137	-118.55764	(0,"")	2
22	Junas Anthony Taclay	Carlos Jaen	SH2118458	2004-04-21	33.831947	-118.272675	(1,"Gun ")	2
43	Cephas Hendricks	Anthony Willis	SH2116212	2004-04-23	33.896378	-118.22502	(0,"")	1
22	Ronald Thomas	Dennis Missel	SH2116404	2004-04-24	33.935135	-118.23798	(1,"Gun ")	2
63	Luis Fabian Delgado	Christopher Deaville	SH2117965	2004-05-05	34.70063	-118.12051	(1,Knife)	1
25	Dwight La Vincent Slater	Steven Lespron	SH2117436	2004-05-05	33.9441	-118.296234	(1,Gun)	1
22	Christopher Daniels	Richard Conley	SH2119005	2004-05-20	33.91451	-118.20494	(1,Gun)	2
\N	Izell Gaston	Neil Kimball	SH2120423	2004-06-08	33.909634	-118.21641	(1,Gun)	0
\N	Manuel Willis	Neil Kimball	SH2120423	2004-06-08	33.909634	-118.21641	(1,Gun)	0
51	Paul Smith	Michael Arruda	SH2121392	2004-06-09	34.38718	-118.11227	(1,"Pellet Gun")	1
35	Michael R. Arruda (deputy)	Michael Arruda	SH2121392	2004-06-09	34.38718	-118.11227	(1,"Gun ")	1
24	Chris Perkins	Joseph Valencia	SH2130216	2004-07-12	33.883625	-118.22322	(1,Gun)	0
27	Brian Graham	David Joyce	SH2123975	2004-07-18	33.84059	-118.16113	(0,"")	2
19	Freddy Albert Nilo	Unknown	Unknown	2004-07-19	34.074863	-118.09072	(2,"")	1
21	Mario Rodriguez	James Ponsford	SH2124993	2004-08-01	33.91357	-118.189964	(0,"")	2
24	Gerardo Macias	Anthony Geisbauer	SH2126128	2004-08-13	34.000927	-118.24245	(1,Gun)	1
23	Dorian Efrain Flores	Luis  Ortiz	SH2126728	2004-08-19	34.001095	-118.2431	(1,Gun)	1
29	David Perez	Richard Canfield	SH2126769	2004-08-24	33.982063	-118.10541	(1,board)	1
25	Salvador Montoya	Anthony Forlano	SH2128169	2004-09-12	33.895866	-118.24415	(0,"")	2
28	Dsean Lafayette Tyson	Anthony Forlano	SH2133512	2004-11-23	33.892403	-118.20137	(1,Gun)	0
\N	Ruben Rojas	Robert Shaw	SH2134904	2004-12-10	34.106804	-117.9076	(1,Gun)	0
48	Cruz Rivera	Alan Bash	SH2136291	2005-01-05	34.036793	-118.07713	(1,Spear)	1
18	Francisco Ronquillo	Armando Arevalo	SH2137140	2005-01-05	33.83325	-118.22175	(0,"")	0
23	Sergio Rodriguez	Hugo Ramos	SH2137568	2005-01-23	34.38718	-118.11227	(1,Gun)	2
74	Maynard King	Robert Weltee	SH2138235	2005-01-23	33.869846	-118.14225	(1,Gun)	1
22	Kazi Shinda Bell	Carlos Lopez	SH2138293	2005-01-24	33.91833	-118.29185	(1,Gun)	1
25	Marvin Daniel Vasquez	Froilan Dinco	SH2138282	2005-01-30	33.804943	-118.26394	(1,"Knife, rake Deputy Efran Quintana recanted, said unarmed")	1
30	Ruben Sifuentes	Glenn Spruil	SH2138482	2005-01-31	34.02455	-118.1414	(1,Machete)	2
20	Rashad Bazley	Robert Aceves	SH2138491	2005-02-02	33.930977	-118.29038	(0,"")	0
20	Andre White	Robert Aceves	SH2138491	2005-02-02	33.930977	-118.29038	(0,"")	0
19	Tony Hunt Jr.	Scott Harper	SH2142447	2005-03-27	33.90788	-118.20848	(0,"")	2
30	Jesus Manuel Montano	Philip Santisteven	SH2145049	2005-03-31	33.89839	-118.117516	(1,Gun)	1
19	Jorge Ruiz	Eric Metten	SH2144589	2005-04-01	34.580948	-118.07537	(1,Gun)	2
44	Winston Hayes	Henry Aguilar	SH2145843	2005-05-08	34.04838	-118.4544	(0,"")	2
27	Miguel Angel Carlos	Joshua Corrales	SH2149480	2005-05-29	33.919876	-118.21031	(1,Knife)	1
45	Dennis Shellhouse	Jeffrey Coates	SH2148043	2005-06-07	34.081367	-118.15187	(1,Gun)	2
29	Lazaro Evarista Leyva	Rick Manes	SH2149573	2005-06-29	34.579453	-118.12877	(1,Gun)	1
44	Bruce Alan Smith	Randall Slate	SH2149895	2005-06-29	34.058304	-118.360214	(1,Knife)	1
29	Johnny Alfred Padilla	Noe Garcia	SH2150710	2005-07-07	33.91529	-118.270935	(1,Gun)	1
20	Fredrick Island	Christopher Smelser	SH2150783	2005-07-15	33.957256	-118.24965	(1,Gun)	0
49	Clint Edward Updyke	Stephen O'Neal	SH2152392	2005-08-08	34.693203	-118.18389	(0,"")	1
23	Theodore Millender	Frederick Morse	SH2152827	2005-08-13	33.92214	-118.234276	(1,Gun)	2
25	Alvin Jenkins	Frederick Morse	SH2152827	2005-08-13	33.92214	-118.234276	(0,"")	0
34	Eric Smith	Jason Phillippi	SH2154541	2005-09-08	33.901558	-118.35963	(1,Gun)	2
24	Harold Tassin	Francisco Maldonado	SH2155180	2005-09-17	33.919804	-118.22806	(1,Gun)	2
18	Alejandro Jimenez	Jesse Melgoza	SH2155758	2005-09-23	34.048744	-118.190796	(1,Gun)	0
19	Erik DeSantiago	Jesse Melgoza	SH2155758	2005-09-23	34.048744	-118.190796	(1,Gun)	2
25	Linord Griffin	Roman Castillo	SH2156973	2005-10-14	34.702297	-118.13597	(1,Gun)	1
20	Frank Morado	Russell Helbing	SH2163787	2006-01-26	33.895473	-118.25534	(1,Gun)	0
21	Erick Nunez	Russell Helbing	SH2163787	2006-01-26	33.895473	-118.25534	(1,Gun)	0
39	Brian Anthony Earle	Nader Chahine	SH2164595	2006-01-28	33.911125	-118.238045	(1,"BB Gun")	0
25	Arnold Fernandez	Jaime Juarez	SH2163795	2006-01-29	33.786564	-118.210495	(0,"")	0
25	Daniel Jacinto	Jaime Juarez	SH2163795	2006-01-29	33.786564	-118.210495	(0,"")	0
42	Carlos Cuellar Jr.	Robert Erickson	SH2164739	2006-02-06	34.083744	-118.412186	(1,"Pellet Gun")	1
22	Remy Navarro	Juan Chavez	SH2164888	2006-02-15	34.008255	-118.08328	(0,"")	0
21	Keyante Davis	Russell Helbing	SH2164948	2006-02-17	33.898617	-118.25258	(1,Gun)	2
22	Freddy Davis Jr.	Russell Helbing	SH2164948	2006-02-17	33.898617	-118.25258	(1,Gun)	1
34	Tony Martinez Jr.	George Creamer	SH2165564	2006-03-01	34.038864	-118.03984	(1,Gun)	1
32	Alexander Diaz	Robert Dean	SH2166138	2006-03-10	33.90163	-118.20202	(1,Gun)	2
27	Luis Guerrero	James Delgado	SH2176533	2006-04-19	33.874752	-118.14251	(0,"")	2
52	Kurt Guenther	Joseph Fender	SH2170359	2006-04-25	34.66087	-118.397156	(1,Gun)	2
28	Pedrio Bacio	Gonzalo Galvan	SH2169418	2006-05-01	33.93819	-118.36134	(1,Gun)	0
29	Jesus Guerra	Darell Edwards	SH2169604	2006-05-06	34.020752	-118.332596	(1,Gun)	0
48	Thomas Wilkinson	Unknown	SH2172209	2006-06-05	33.80801	-118.29046	(0,"")	2
27	Carl Williams	Rafael Cardenas	SH2173534	2006-06-13	33.949486	-118.25346	(0,"")	1
43	Susan Dyer	Grant Roth	SH2176359	2006-07-21	34.57763	-118.116104	(1,Gun)	2
44	Lawrence Ronnell Taylor	James Wheeler	SH2177347	2006-08-01	33.903408	-118.25114	(0,"")	1
20	Bryan Smith	David Joyce	SH2178604	2006-08-23	33.882935	-118.138306	(0,"")	2
58	Andres Garcia	Thomas Drake	SH2178932	2006-08-28	34.858242	-118.16233	(1,Gun)	1
27	Craig Jacobi Hill	Oscar Veloz	SH2180613	2006-09-07	33.901985	-118.23225	(1,Gun)	1
32	Johnny Landeros	Robert Leyba	SH2180053	2006-09-16	34.05089	-118.10673	(1,"Pellet Gun")	2
30	Jesus Jimenez	Robert Risiglione	SH2181812	2006-10-15	33.90236	-118.218376	(1,Gun)	0
23	Juan Alberto Mora	Grant Roth	SH2182693	2006-10-29	34.583004	-118.06869	(1,Gun)	1
38	Alfredo Valdivia	Corey Morning	SH2182908	2006-10-31	33.868614	-118.061646	(1,Gun)	1
40	Arthur Mike Nava	Enrique Godinez	SH2183541	2006-11-06	34.042545	-118.173256	(1,Gun)	1
18	Ernesto Orozco	Steven Longan	SH2188086	2007-01-20	33.96581	-118.2461	(1,Gun)	2
19	Jonathan Maihart	Unknown	SH2190984	2007-03-12	34.03019	-118.43752	(0,"")	2
51	Antonio Escareal	Stephen Glass	SH2191426	2007-03-15	33.764153	-118.27107	(1,Knives)	1
23	Miguel Carrera	Daniel Welle	SH2191846	2007-03-25	34.685577	-118.14904	(0,"")	2
29	Jaime Flores	Ronald DiGiovanni	SH2192337	2007-04-02	33.938446	-118.3616	(1,Gun)	1
25	Anthony Valdez	Arthur Perez	SH2192947	2007-04-14	33.806206	-118.19699	(1,Gun)	0
49	Domingo Gomez	Raul Magadan	SH2193328	2007-04-22	33.90197	-118.18728	(1,"Metal pipe, toy gun, knife")	2
30	Juan Velasco	Armando Arevalo	SH2194545	2007-05-11	34.013218	-118.144585	(1,"blunt object")	1
30	Jose Flores	Armando Arevalo	SH2194545	2007-05-11	34.013218	-118.144585	(1,"Barbed wire")	0
19	Ventura Saenz	David Howard	SH2194857	2007-05-12	33.902576	-118.20209	(1,Gun)	1
19	Derrell Perkins	Ronald Navarrete	SH2194940	2007-05-14	33.882763	-118.204124	(1,Gun)	0
36	Ronald Clark	Ronald Navarrete	SH2194940	2007-05-14	33.882763	-118.204124	(1,Gun)	0
23	Peter Rodríguez	Luis Alva	SH2201446	2007-08-13	34.057274	-118.18348	(1,Gun)	1
26	Jesus De La Cruz	Antonio Garcia	SH2194885	2007-10-23	33.959957	-118.20399	(0,"")	2
21	Albert Jackson	Alexander Vallozzi	SH2206548	2007-10-24	33.917698	-118.23902	(1,Gun)	2
23	Manuel Gonzalez	Pablo Partida	SH2206930	2007-10-27	33.916447	-118.32408	(1,Gun)	0
23	Terry Scott	Darell Edwards	SH2207388	2007-10-29	33.905914	-118.274025	(1,Gun)	0
20	Nathan Gonzalez	Joel Flores	SH2208192	2007-11-09	34.033234	-118.18581	(1,Gun)	0
24	Marvin Andrade	Joel Flores	SH2208192	2007-11-09	34.033234	-118.18581	(0,"")	2
30	Jose Jimenez	Samuel Valente	SH2208197	2007-11-10	33.98703	-118.25212	(1,Gun)	1
19	Jose Ruiz	Unknown	SH2217586	2008-04-01	33.909756	-118.32661	(1,Knife)	2
21	Fernando Cortez	William Cordero	SH2218495	2008-04-12	33.953	-118.24699	(1,Gun)	1
18	Ahmad Whitfield	Raul Magadan	SH2219217	2008-04-29	34.03923	-118.26334	(1,Gun)	0
26	Glenn Patrick Rose	Calvin Mah	SH2220365	2008-05-13	34.136032	-118.02806	(0,"")	1
25	Sarah Morales	Calvin Mah	SH2220365	2008-05-13	34.136032	-118.02806	(0,"")	2
26	Bryan Davis Moore	Raul Ibarra	SH2222911	2008-06-26	33.89641	-118.25826	(0,"")	1
22	Oscar Martinez	Edward Martinez	SH2223922	2008-07-14	33.881954	-118.16867	(0,"")	0
34	Christian Portillo	Bryan Lamb	SH2224639	2008-07-23	33.935684	-118.360016	(0,"")	1
32	Gerardo Arvallo	Clarence G. Gallegos	SH2225821	2008-08-10	33.932205	-118.21383	(1,Gun)	1
24	Enrique Iribe	Juan Alvarado	SH2226579	2008-08-19	33.91441	-118.14143	(1,Gun)	2
35	Francisco Carranza	William Bevans	SH2226571	2008-08-23	33.941166	-118.21454	(0,"")	0
23	Masi Abson	Theodor Baljet	SH2227267	2008-08-26	33.941856	-118.317764	(1,Gun)	2
25	Joshua Stephenson	Jason Phillippi	SH2229364	2008-09-30	34.06738	-118.08049	(1,"Metal stake")	1
18	Mark Nazareno	John Ybarra	Unknown	2008-10-16	33.90646	-118.10324	(0,"")	2
33	Abraham Olivas Sanchez	Julio Jove	SH2230378	2008-10-17	33.981953	-118.18611	(1,Concrete)	1
20	Joshua Maravilla	Patricia Rines	SH2231988	2008-10-27	33.91623	-118.24622	(0,"")	1
30	Kurt Cabreros	Darell Edwards	SH2232297	2008-11-17	34.38718	-118.11227	(0,"")	2
18	Salvador Zepeda-Alarcon	Joseph Manfree	SH2233356	2008-11-30	34.04534	-118.17216	(1,"Air pistol")	1
19	DeAnthony Blivins	Anthony Paez	SH2235183	2008-12-19	33.788094	-118.16875	(0,"")	2
22	Ricardo Badillo	Levi Belville	SH2236597	2009-01-24	33.907677	-118.2894	(1,Gun)	1
30	Nicholas Alcantar	Roverto Valles	SH2237358	2009-02-04	34.055386	-118.08505	(0,"")	0
23	Christopher Morales	Mat Taylor	SH2240336	2009-03-04	33.81093	-118.271996	(1,"")	2
22	Ernesto Castaneda	Mario Contreras	SH2239808	2009-03-15	34.07423	-118.058876	(1,"Baseball bat, knife")	1
54	Stuart Bird	Eduardo Labayna	SH2240121	2009-03-19	34.05606	-118.34289	(0,"")	0
28	Francisco Nevarez	Noah Corrales	SH2241882	2009-04-16	33.916447	-118.30905	(0,"")	0
25	Fredrick Ham	Noah Corrales	SH2241882	2009-04-16	33.916447	-118.30905	(1,Gun)	2
29	Alfredo Montalvo	Joshua Bardon	SH2242537	2009-04-26	33.93403	-118.22281	(1,"")	1
18	Gene C. Valdez	Eric Moreno	SH2242518	2009-04-26	33.901806	-118.2159	(1,"Pellet Gun")	1
18	Amelia Williams	Anthony Paez	SH2242904	2009-05-03	34.38718	-118.11227	(0,"")	0
17	Danny James	Casey Cheshier	SH2243273	2009-05-06	33.928406	-118.31147	(1,"Plastic water gun")	2
21	Daniel Martinez	Alberto Hernandez	SH2243898	2009-05-24	33.903446	-118.21719	(0,"")	2
16	Avery Cody, Jr.	Sergio Reyes	SH2246245	2009-07-05	33.888737	-118.20889	(0,"")	1
22	Woodrow Player III	Michael Carpenter	SH2246590	2009-07-10	33.915855	-118.29488	(0,"")	1
23	Maynor Guerra	Chad Sessman	SH2246663	2009-07-10	33.974945	-118.24617	(1,Gun)	0
23	Alexander Marquez	Noel  Lopez	SH2246592	2009-07-11	34.022526	-118.18832	(1,Gun)	2
18	Dejon King	Unknown	SH2246631	2009-07-12	34.587254	-118.109726	(1,Gun)	2
20	Charles Gonzalez	Benjamin Alvarado	SH2249118	2009-07-24	33.87025	-118.117226	(0,"")	0
19	Raul Hidalgo	Benjamin Alvarado	SH2249118	2009-07-24	33.87025	-118.117226	(1,Gun)	2
29	Rashad Boling	Frank Alvarado	SH2247465	2009-07-25	33.876743	-118.15655	(1,Gun)	2
57	Howard Charles Gross	David Johnson	SH2247861	2009-08-01	34.076874	-118.00133	(1,"Two meat cleavers")	1
58	Raymond Finley	Daryl Gaunt	SH2247918	2009-08-01	34.03672	-118.13052	(0,"")	0
23	Guillermo Saucedo	Raquel Gonzales	SH2248403	2009-08-07	33.907375	-118.197174	(1,Gun)	1
33	Ezequiel Jacobo	Mat Taylor	SH2249218	2009-08-08	33.8159	-118.26155	(0,"")	1
21	Carlos Aguirre	Tony Franklin	SH2248852	2009-08-12	33.935825	-118.20682	(0,"")	0
40	Luis Sandoval	Lennox	SH2249964	2009-08-30	33.971634	-118.07112	(1,Knife)	2
36	Darrick Collins	Kevin Brown	SH2251370	2009-09-14	33.925236	-118.29715	(0,"")	1
17	Travion Richard	Marcelo Campos	SH2251372	2009-09-19	34.04925	-118.233246	(1,Gun)	1
27	Felipe Valdovinos	Jaime Juarez	SH2252404	2009-09-20	33.88902	-118.19164	(1,Gun)	1
24	Leopoldo Huizar	David Contreras	SH2252396	2009-09-20	33.917133	-118.013466	(1,Gun)	1
31	Efrain Lara Gutierrez	David Salazar	SH2252199	2009-10-02	34.111275	-117.89607	(1,Knife)	1
29	Juan Carlos Aguiar	Jeffrey Alvarado	SH2254639	2009-11-03	33.88181	-118.34287	(1,"")	1
24	Jose Hernandez-Luna	Rulon Green	SH2254517	2009-11-03	33.75898	-117.9901	(1,"BB Gun")	0
18	Dalton Edward Rahman	Spencer Reedy	SH2254709	2009-11-05	34.11221	-117.914505	(0,"")	1
32	Jerry Herrera	Jimmy Yee	SH2255621	2009-11-21	33.999218	-117.93902	(0,"")	0
24	Davon Williams	Ronnie Perez	SH2256034	2009-11-30	33.938595	-118.252075	(0,"")	0
27	Ray Houston Jr.	Ronnie Perez	SH2256034	2009-11-30	33.938595	-118.252075	(1,Gun)	0
23	Eric Brown	Ronnie Perez	SH2256034	2009-11-30	33.938595	-118.252075	(1,Gun)	0
31	Juan Arreola	Kenneth Fitch	SH2256410	2009-12-05	34.02389	-118.19273	(0,Hands/Feet)	2
37	Rosa Loera	Kenneth Fitch	SH2256410	2009-12-05	34.02389	-118.19273	(0,Hands/Feet)	0
38	Ignacio Loera Sr.	Kenneth Fitch	SH2256410	2009-12-05	34.02389	-118.19273	(0,Hands/Feet)	0
20	Marco Ruano	Kenneth Fitch	SH2256410	2009-12-05	34.02389	-118.19273	(0,Hands/Feet)	0
20	Ignacio Loera Jr.	Kenneth Fitch	SH2256410	2009-12-05	34.02389	-118.19273	(0,Hands/Feet)	0
29	Thad Downs	Kenneth Fitch	SH2256410	2009-12-05	34.02389	-118.19273	(0,Hands/Feet)	0
23	Bernardo Fuentes	Unknown	SH2257614	2009-12-19	33.93824	-118.23904	(1,Gun)	2
43	Adrian Alonzo	Unknown	SH2258903	2010-01-14	33.882225	-118.28336	(0,"")	2
19	Allen Gonzalez	Dejay Barber	SH2260482	2010-02-10	33.90593	-118.2673	(1,Gun)	2
35	Darren Thompson	Benjamin Alvarado	SH2261796	2010-02-26	33.85705	-118.0723	(0,"")	2
29	Shawn Cooper	Benjamin Alvarado	SH2261796	2010-02-26	33.85705	-118.0723	(0,"")	0
20	Daniel Garcia-Munoz	Joshua Bardon	SH2262624	2010-03-06	33.953995	-118.206505	(0,"")	2
18	Erick Avila	Joshua Bardon	SH2262624	2010-03-06	33.953995	-118.206505	(1,Gun)	2
50	Arturo Perez	John MacDonald	SH2262863	2010-03-09	33.977165	-118.1981	(1,Gun)	2
35	Arnie Gonzalez	Troy Krautkramer	SH2263754	2010-03-24	34.049694	-118.19391	(0,"")	2
28	Alejandro DeLeon	Unknown	SH2264969	2010-04-13	34.022198	-118.16575	(0,"")	2
24	Ivan Romero	Mark Collins	SH2265120	2010-04-18	34.557507	-117.9199	(1,Gun)	2
26	Joseph Mercado	Freddy Brown	SH2266258	2010-05-06	33.829514	-118.07737	(1,Gun)	2
29	Ernesto Casillas	Lorena Rosales	SH2266368	2010-05-06	33.790493	-118.30768	(1,Gun)	1
21	Christopher Wheeler	Victor Solis	SH2266395	2010-05-07	34.38718	-118.11227	(0,"")	0
25	Feliz Lopez	Omar Escobar	SH2267995	2010-06-05	34.016396	-118.18692	(0,"")	2
25	Anthony Ray Aguilar	Jaime Magana	SH2268577	2010-06-09	34.15665	-117.91087	(1,Screwdriver)	1
32	Judy Cisneros	Jaime Magana	SH2268577	2010-06-09	34.15665	-117.91087	(0,"")	0
61	Unknown (withheld)	Tareq Abdulfattah	SH2268489	2010-06-10	34.19314	-118.13406	(1,Gun)	1
23	Dexter Luckett	Daniel Mailloux	SH2268975	2010-06-15	33.887665	-118.12252	(0,"")	1
29	Alejandro Barajas	Alexander Khasaempanth	SH2268662	2010-06-15	34.017727	-117.91691	(1,Gun)	2
30	Samuel Hammond	John Denney	SH2268955	2010-06-19	33.833973	-118.16352	(1,Knife)	2
20	Aaron Cochran	Michael Miller	SH2269365	2010-06-27	\N	\N	(0,"")	0
25	Shawn Earnest	Michael Miller	SH2269365	2010-06-27	\N	\N	(0,"")	0
21	Cory Earnest	Michael Miller	SH2269365	2010-06-27	\N	\N	(0,"")	0
41	Ralph Noriega	Eric Acosta	SH2270109	2010-07-09	34.43821	-118.337494	(0,"")	0
32	Eric Clark	Unknown	SH2271066	2010-07-27	33.892155	-118.26528	(0,"")	2
29	David Hernandez	Jason Puga	SH2274799	2010-07-27	33.933918	-118.27813	(0,"")	2
36	Joseph Jenkins	Richard Harpham	JSID 11-0740	2010-08-17	33.87241	-118.11077	(2,"")	1
49	Ronald Teeman	Desmond Carter	SH2275251	2010-08-20	34.37798	-118.56704	(0,"")	0
24	Kevin Kirkwood	Kason Barraclough	SH2276178	2010-08-21	33.92345	-118.25374	(0,"")	2
29	Schuyler Ester	Armando Orellana	SH2272659	2010-08-25	33.95743	-118.26079	(1,Gun)	0
30	Angel Mendez	Unknown	SH2274774	2010-10-01	34.69317	-118.16354	(1,"BB Gun")	2
21	Ronisha "Ronni" Reed	Jacob Goble	SH2274895	2010-10-03	34.09076	-118.36701	(1,"")	0
20	David Alexander Pere	Chad Sessman	SH2275272	2010-10-09	34.014946	-118.16364	(1,Gun)	2
20	Jonathan Cuevas	Julio Jove	SH2275293	2010-10-10	33.921265	-118.20974	(1,"")	1
28	Eric Valdez	Andrea Sandoval	SH2276042	2010-10-19	33.986073	-118.217125	(0,"")	0
46	Mohamad Ahmad	John Werner	SH2276092	2010-10-22	33.908375	-118.28938	(0,"")	2
21	Kyle Craig Traub	Ronnie Manier	SH2276405	2010-10-28	34.196632	-118.1572	(0,"")	0
27	Daniel Webster	Isidro Villasenor	SH2276842	2010-11-05	34.38718	-118.11227	(0,"")	0
21	Robert Thomas	Victor Lemus	SH2276878	2010-11-08	33.92108	-118.243965	(1,Gun)	1
21	Reginald Davis	Unknown	SH2277067	2010-11-11	33.885914	-118.226265	(1,Gun)	0
21	Sean Merritt	Raul Regalado	SH2277326	2010-11-17	33.908764	-118.21063	(0,"")	2
31	Alexander Acosta	Daniel Torres	SH2277798	2010-11-26	33.988106	-117.901184	(1,Knife)	1
25	Daniel Williams	Unknown	SH2278189	2010-12-01	33.79703	-118.27507	(0,"")	0
20	Saul Tapia	Hector Contreras	SH2278275	2010-12-01	34.04224	-118.16468	(0,"")	2
44	Chris Walter Barrett	Paul Parkhurst	SH2279155	2010-12-21	34.647076	-118.252266	(0,"")	1
20	Derrick Abernathy	Carlos Parga	SH2280365	2011-01-08	33.966236	-118.25841	(1,Gun)	1
39	Ryan Ernest Moore	Alejandro Ramirez	SH2280567	2011-01-10	34.099792	-118.01036	(1,Knife)	2
37	Nestor Torres	Daniel Reyes	SH2280312	2011-01-11	34.04438	-118.17802	(1,Gun)	1
43	Romarion White	Scott E. Sorrow	SH2281936	2011-02-05	34.38718	-118.11227	(0,"")	2
25	Arnaldo Gonzalez	Juan C. Rodriguez	SH2282364	2011-02-11	34.102825	-118.02973	(1,Gun)	2
31	Osvaldo Ureta	Anthony Forlano	SH2282402	2011-02-14	34.38718	-118.11227	(0,"")	2
33	Stephen Bullock	Jonathan Lested	SH2282797	2011-02-18	34.178036	-118.13099	(1,Gun)	1
24	Anthony C. Carlin	George Aguilera	SH2283105	2011-02-26	34.03303	-118.1689	(1,Knife)	2
24	Tommy Salas	Angel Rodriguez	SH2283530	2011-03-01	34.04713	-117.99275	(0,"")	0
17	Christopher Glass	Victor Hess	SH2283791	2011-03-01	34.601875	-118.12006	(1,Knife)	1
23	Channing Douglas	Michael Herrera	SH2284201	2011-03-10	33.83883	-118.105125	(0,"")	2
23	Justin Cary Ford	Richard Rubalcaba	SH2284262	2011-03-12	33.91625	-118.28882	(1,"Replica gun")	1
29	Mark Lewis	Robert Alvarez	SH2285143	2011-03-26	34.14232	-118.07295	(0,"")	2
26	Aaron Beierschmitt	Robert Alvarez	SH2285143	2011-03-26	34.14232	-118.07295	(0,"")	2
21	Nathaniel Bangs	Victor Lemus	SH2285757	2011-03-29	33.924652	-118.2826	(1,Gun)	0
23	Jaime Burgos	Adrian Dominguez	SH2286274	2011-04-04	33.97106	-118.25768	(1,Gun)	2
24	Oscar Ramirez	Adrian Dominguez	SH2286274	2011-04-04	33.97106	-118.25768	(1,Gun)	2
31	Tennell Billups, Jr.	Gonzalo Inzunza, Jr.	SH2285686	2011-04-04	33.953148	-118.251884	(1,"Gun ")	2
19	Jose David Monteon	Andrew Campbell	SH2286320	2011-04-08	34.56894	-118.127426	(1,"Airsoft gun")	1
21	Nicholas Raynell Hankins	Juan P. Rodriguez	SH2288886	2011-05-22	33.93113	-118.2463	(0,"")	2
20	Eduardo Gomez	Daniel Castro	SH2286367	2011-05-22	34.091022	-118.39005	(0,"")	0
22	Julio C. Haro	Adam F. Stoll	SH2288996	2011-05-24	33.971935	-118.23471	(0,"")	2
18	Alexander A. Trejo	Adam F. Stoll	SH2288996	2011-05-24	33.971935	-118.23471	(1,Gun)	2
19	William Lusk	Oscar Barrios	SH2289268	2011-05-25	33.927246	-118.25378	(0,"")	1
44	Hesham Sultan	Steven Shirley	SH2290740	2011-06-22	34.031982	-118.23227	(0,"")	2
32	William Quiros Jr.	David Chevez	SH2291408	2011-06-23	33.91579	-118.343895	(1,Gun)	1
26	Manuel Osuna	Vincent Cisneros	SH2292855	2011-07-21	33.969555	-118.20096	(0,"")	2
29	Juan Perdomo	Roger Flores	SH2292874	2011-07-21	34.038227	-118.28115	(0,"")	2
27	Jason Terpstra	Anthony Duran	SH2292862	2011-07-23	34.235653	-118.48508	(0,"")	2
22	Brian Jones	Jaime Juarez	SH2296738	2011-09-09	33.88739	-118.254845	(0,"")	2
27	Del L. Smith	Damon Jones	SH2298451	2011-10-05	33.872684	-118.056526	(0,"")	2
25	Vincent Cooper	Damon Jones	SH2298451	2011-10-05	33.872684	-118.056526	(0,"")	2
32	Darrell Logan	Gustavo Munoz	SH2298829	2011-10-13	34.56705	-118.074036	(1,Gun)	1
\N	Off Duty deputy	Judith Gonzalez	SH2334374	2011-10-14	33.90663	-118.006775	(0,"")	2
32	Michael Marer	Daniel Hoyos	SH2301830	2011-11-26	34.00725	-117.898056	(1,"Plastic replica gun")	2
39	Arthur Bates, Jr	Brent Del Valle	SH2301967	2011-11-29	33.92605	-118.09571	(1,Gun)	2
39	Emiliano Amaya	John MacDonald	SH2302306	2011-12-01	33.927414	-118.08215	(0,"")	1
22	Ricky De Paz	Marco Esperanza	SH2302529	2011-12-06	34.175785	-118.451035	(0,"")	0
26	Kristy Banuelos	Marco Esperanza	SH2302529	2011-12-06	34.175785	-118.451035	(0,"")	0
25	Cody Stark	Marco Esperanza	SH2302529	2011-12-06	34.175785	-118.451035	(0,"")	0
32	Roberto Rodriguez, Jr.	David De La O	SH2303242	2011-12-16	34.072906	-118.23118	(1,Gun)	1
29	Esteban Carreon	Eric Moreno	SH2303209	2011-12-16	34.034798	-117.97491	(1,"Pellet Gun")	2
48	Robert Evan La Rue	Joseph Vasquez	SH2304896	2011-12-27	33.768627	-118.40346	(1,"Steak knife")	1
22	Joseph Robert Guevara	Victor J Fernandez	SH2303930	2011-12-28	34.03879	-118.276306	(1,Gun)	2
40	Jazmyne Eng	Brian Vance	SH2304350	2012-01-04	34.081367	-118.0679	(1,Hammer)	1
28	Paul Acosta	Michael Mabee	SH2304436	2012-01-05	33.909573	-118.15858	(1,"BB Gun")	2
18	Edson Esacolona	Isidro Villasenor	SH2304737	2012-01-10	33.928135	-118.25269	(0,"")	2
26	Christian Cobian	Uriel Cruz	SH2305899	2012-01-21	34.686146	-118.14838	(0,"")	1
25	Isiah Hampton	Unknown	SH2305755	2012-01-25	33.902504	-118.23014	(1,Gun)	0
18	Abraham Alejandro Granillo	Silvio Paz	SH2305842	2012-01-28	33.938194	-118.36024	(1,Gun)	0
68	Donald Handy	Jeremi Edwards	SH2306279	2012-02-01	34.699604	-118.13272	(1,"")	1
19	Robert Amanal	Carlos Nuques	SH2306563	2012-02-08	33.904743	-118.21436	(1,Gun)	2
27	Angel Viera	Cuauhtemol Gonzalez	SH2306811	2012-02-11	34.01371	-118.081	(0,"")	0
22	Robert Chester Henning II	Nicholas Stewart	SH2307689	2012-02-22	33.882744	-118.1604	(0,"")	1
29	Eddie Albert Luna	John Castro	SH2307685	2012-02-22	33.98678	-118.09398	(1,Gun)	2
46	Eduardo Armas	Michael Espinosa	SH2307799	2012-02-26	33.877907	-118.066956	(0,"")	1
23	Michael Atkins	Christopher Quintero	SH2308242	2012-03-04	33.901714	-118.25317	(1,Gun)	2
22	Arturo Cabrales	Anthony Paez	SH2308453	2012-03-07	33.94244	-118.23513	(0,"")	1
24	Jose Ortiz	David Faria	SH2308622	2012-03-08	33.834057	-118.07654	(0,"")	2
35	Raul Chavarria	James Norville II	SH2311518	2012-04-16	33.798946	-118.19482	(0,"")	2
29	Matthew J. Ridgway	Daniel Welle	SH2312180	2012-05-05	34.603374	-117.8316	(0,"")	1
30	Xavier Gonzalez-Torres	Tim Wolford	SH2312667	2012-05-12	34.38718	-118.11227	(1,Gun)	1
22	Daniel Ramirez	Sergio Jimenez	SH2312742	2012-05-13	33.881485	-118.227776	(0,"")	0
35	Michael Benitez	Sergio Jimenez	SH2312742	2012-05-13	33.881485	-118.227776	(1,Gun)	2
18	Jonathan Vargas	Calvert Rosborough	SH2313179	2012-05-23	33.90531	-118.23633	(0,"")	0
19	Antonio Montoya	Calvert Rosborough	SH2313179	2012-05-23	33.90531	-118.23633	(0,"")	2
27	Carlos Mercado	Ian Stade	SH2313309	2012-05-25	33.786568	-118.27262	(1,Gun)	0
28	Aaron Collins	Ian Stade	SH2313309	2012-05-25	33.786568	-118.27262	(1,Gun)	0
29	Tyrone Estes	Unknown	SH2313814	2012-05-30	33.88809	-118.239944	(1,Gun)	2
27	Kenneth Rivera III	Norma Silva	SH2315077	2012-06-21	33.918976	-118.188675	(0,"")	1
30	Juan Serna	Lucio Venegas	SH2315102	2012-06-24	33.90988	-118.207886	(1,Gun)	1
21	Ramon Diaz	Salvador Esquivel	SH2315579	2012-07-01	33.89157	-118.20706	(1,Gun)	2
31	Javier Salvador Ortiz	Frank Huelga	SH2318393	2012-08-03	34.582607	-118.12213	(1,Gun)	1
25	Joshua Brown	Unknown	SH2318732	2012-08-16	33.9174	-118.300415	(1,Gun)	0
32	Marcell Maurice Parker	Jerry Lopez	SH2318852	2012-08-16	33.898354	-118.21061	(1,Gun)	2
21	Tony Francis	Sergio Cosio	SH2319289	2012-08-24	33.89036	-118.13377	(0,"")	1
28	Juan Carlos Alamo-Perales	Clayton Stetler	SH2319638	2012-08-29	33.78268	-118.215485	(0,"")	2
34	Anthony Michael Axe	Rudolpho Santana	SH2319642	2012-08-29	33.836662	-118.285355	(0,"")	1
26	Ramon Flores	Clayton Stetler	SH2319638	2012-08-29	33.78268	-118.215485	(0,"")	0
35	Jamar Kiper	Raul Magadan	SH2319772	2012-08-31	34.38718	-118.11227	(1,Gun)	0
28	Brandon Kiper	Raul Magadan	SH2319772	2012-08-31	34.38718	-118.11227	(1,Gun)	0
25	Tania Washington	John Marquez	SH2319756	2012-09-02	34.040745	-118.03675	(0,"")	0
24	Darnell K. Washington	John Marquez	SH2319756	2012-09-02	34.040745	-118.03675	(1,Gun)	0
15	Benjamin Hernandez	Daniel Hoyos	SH2320635	2012-09-08	33.795437	-118.18908	(0,"")	2
27	Vincent Thomas Param	Gregory Berg	SH2320834	2012-09-17	33.884792	-118.14774	(1,Gun)	1
27	Jilberto Gutierrez	David Chevez	SH2322988	2012-09-28	33.950317	-118.34837	(0,"")	1
20	Antonio Garcia	Unknown	SH2321692	2012-09-28	34.037243	-118.159225	(1,Gun)	2
22	Robert Cooper	John Werner	SH2323207	2012-10-24	33.896957	-118.199974	(0,"")	0
24	Dennis Keahey	John Werner	SH2323207	2012-10-24	33.896957	-118.199974	(0,"")	2
27	Lawrence Tate	John Werner	SH2323207	2012-10-24	33.896957	-118.199974	(0,"")	2
60	Steven Bowman	Richard Nagler	SH2324672	2012-11-09	34.717888	-118.14753	(1,Gun)	1
36	Jose De la Trinidad	Alexandro Gonzalez	SH2324530	2012-11-10	33.9217	-118.23901	(1,Gun)	1
35	Jose Toloza	Michael Coberg	SH2324397	2012-11-14	33.905346	-118.19479	(1,Gun)	1
24	Joe Childs	Gerardo Magos	SH2324519	2012-11-16	33.965816	-118.24994	(1,Gun)	2
36	Darnell Michael Cones	Gerardo Magos	SH2324519	2012-11-16	33.965816	-118.24994	(0,"")	0
24	Anthony Brendan Caveness	Gerardo Magos	SH2324519	2012-11-16	33.965816	-118.24994	(0,"")	2
31	Bruce Lee Sullivan	Tony Franklin	SH2324827	2012-11-23	33.92517	-118.246284	(1,Gun)	2
35	Joshua Shoop	Casey Cheshier	SH2326539	2012-12-23	33.975075	-118.074745	(1,Gun)	1
16	Jesse Max Rubalcava	John Padilla	SH2328967	2013-01-09	34.001553	-118.08976	(1,Knife)	1
\N	Jermaine Toomer	Lawrence Swanson	Federal Court case 2:14-cv-02780-R-CW	2013-01-21	\N	\N	(0,"")	2
35	Michael Lobrano	Ray Huang	SH2328951	2013-02-01	34.01174	-117.85995	(0,"")	2
26	Miguel Angel Anaya Jr.	Andrew Leos	Unknown	2013-02-08	33.84271	-118.29658	(2,"")	1
25	Edgar Villareal	Carlos Cueva	SH2334985	2013-04-09	33.916336	-118.19806	(1,Gun)	1
24	Brice Quintin Jefferson	Jonathan Paik	SH2333612	2013-04-26	33.930367	-118.29239	(0,"")	1
35	Edward Angel Ramirez	Rafael  Munoz	SH2334307	2013-04-29	34.053318	-118.22084	(1,Gun)	1
34	Rigoberto Arceo	Luis Mendoza	SH2335335	2013-05-11	33.97008	-118.195206	(0,"")	1
37	Ignacio Ochoa	Michael Mabee	SH2334516	2013-05-14	33.901634	-118.17176	(0,"")	1
49	Terry Laffitte	Jason Zabala	SH2334807	2013-05-18	33.984734	-118.24486	(0,"")	1
27	Rayshawn Marquis Brown	Dru Strong	SH2335077	2013-05-23	33.898315	-118.20552	(1,Gun)	1
24	Mark Beasley	Caren Mandoyan,	SH2336689	2013-06-21	33.944103	-118.29192	(1,Gun)	2
24	Cesar Mendoza	Chad Sessman	SH2336691	2013-06-22	34.03465	-117.94654	(1,Gun)	1
22	Deangelo Lopez	Jason  Pearson	J.S.I.D. File #13-0465	2013-06-27	33.899406	-118.24346	(1,Gun)	1
80	Eugene Mallory	John Bones	SH2336880	2013-06-27	34.54765	-117.91919	(0,"")	1
29	Robert Michael McAfee	Pablo Partida	SH2338198, SH2383553	2013-07-19	33.9813	-118.06388	(1,Gun)	1
42	Luis A. Juarez	Alejandro Ramirez	SH2338561	2013-07-24	33.88436	-118.206055	(0,"")	1
17	Dennis Vasquez	Jason Puga	SH2340691	2013-08-28	33.908657	-118.23428	(0,"")	1
23	Carlos Ernesto Oliva-Sola	Nicholas Castellanos	SH2341381	2013-09-10	34.05279	-118.17839	(1,Gun)	1
49	Darrell Atkinson	Paul Morales	J.S.I.D. File #13-0679	2013-10-06	34.034634	-118.3788	(1,"Wooden Stick")	1
53	Bruce Graham	Delicia Hernandez	J.S.I.D. File #13-0685	2013-10-06	34.48492	-118.63664	(1,"")	1
57	William Alfred Harvey III	Monica Vargas	SH2344276	2013-10-26	33.884956	-118.11784	(0,"")	1
49	Quentin E. Hicks	Kelly Marchello	SH2344520	2013-10-28	33.945385	-118.34356	(1,Gun)	1
52	Gilbert Ramirez	David Avila	SH2345313	2013-11-01	33.988453	-118.19831	(1,Knife)	2
27	Carlos Saenz-Campana	Marc Schultz	SH2344747	2013-11-01	34.051014	-118.23268	(1,Gun)	1
21	Paul Aguilar	Ricky Gutierrez	SH2345764	2013-11-15	34.055386	-118.08505	(1,Knife)	1
24	Andre Goto	Oscar Calderon	SH2347822	2013-12-29	34.118965	-117.99278	(1,Gun)	2
36	Frank Acosta	Oscar Calderon	SH2347822	2013-12-29	34.118965	-117.99278	(0,"")	2
18	Angel Aceituno	Michael McMorrow	SH2323528	2014-01-18	33.884445	-118.077736	(1,Gun)	2
44	Felipe Garcia	Carlos De La Torre	SH2349925	2014-01-26	33.918022	-118.23213	(1,Gun)	2
47	Steven Burke Pettersen	Edgar Quintana	SH2349802	2014-01-30	34.41597	-118.45867	(1,"Sand spike")	1
56	Jesus Rojo	Jose L. Hernandez	SH2349805	2014-02-04	34.031322	-118.387634	(1,Machete)	2
35	Javier Mendez	Luis Mrad	SH2351000	2014-02-13	34.00976	-117.884834	(0,"")	1
27	Roxanne Sanjurjo	Unknown	SH2351218	2014-02-14	33.79012	-118.17768	(0,"")	0
39	Carl Chavis	Unknown	SH2351218	2014-02-14	33.79012	-118.17768	(1,"")	2
\N	J. Gallaga	Unknown	SH2356033	2014-02-21	\N	\N	(2,"")	1
28	Dajuan Spears	Lewis Orantes	SH2351042	2014-03-16	34.67163	-118.15931	(1,Gun)	2
24	Anthony Alexander	Andrew Leos	SH2353284	2014-03-25	33.886772	-118.22592	(1,Gun)	0
30	John Winkler	Byron Holloway	SH2353685	2014-04-07	34.190437	-118.301834	(0,"")	1
28	David Martinez	Alejandro Lomeli	SH2353622	2014-04-12	34.38718	-118.11227	(1,Gun)	0
45	Agustin Hernandez	Armando Hernandez	SH2353662	2014-04-13	33.936275	-118.20979	(1,Gun)	2
42	Salvador Palencia-Cruz	Andrew Alatorre	SH2354798	2014-04-24	33.991314	-118.19538	(1,"Cake spatula")	1
26	Daniel Ibarra	James Ponsford	SH2354585	2014-04-29	34.03651	-118.18493	(1,Gun)	1
34	Altriki Brown	Zenon Porche	SH2355933	2014-05-24	34.094917	-118.37353	(0,"")	2
24	Noel Enrique Aguilar	Albert Murad	SH2355927	2014-05-26	33.88052	-118.204346	(1,Gun)	1
18	Zachary Champommier	Mark Brewster	SH2269296	2014-06-24	34.14364	-118.39773	(0,"")	1
24	Antoine Hunter	Timothy Lee	SH2358120	2014-06-24	33.898357	-118.20953	(1,Gun)	1
\N	Geremy Evans	Timothy Lee	SH2358120	2014-06-24	33.898357	-118.20953	(0,"")	2
18	Douglas Ryan Oeters	Mark Brewster	SH2269296	2014-06-24	34.14364	-118.39773	(0,"")	0
29	James Jaimez	Donnie Johnson	SH2358213	2014-06-25	34.38718	-118.11227	(1,Gun)	1
25	Lashelle Ruiz	Scott Guthrie	SH2360451	2014-07-10	33.84218	-118.277306	(0,"")	0
25	Jonathan De La Torre	Deanna Ballesteros	SH2365671	2014-07-17	33.895847	-118.22007	(1,Gun)	2
24	Cedric Oscar Ramirez	Anselmo Gonzalez	SH2362639	2014-08-02	33.99338	-118.087006	(1,Gun)	1
54	Frank Al Mendoza	Anselmo Gonzalez	SH2362639	2014-08-02	33.99338	-118.087006	(0,"")	1
41	Alberto Cornelio Morales	Edson Salazar	SH2362771	2014-08-09	34.025616	-118.273026	(1,Gun)	1
18	Saulo Solares	Raul Guerrero	SH2362775	2014-08-10	33.92623	-118.27365	(1,Gun)	2
38	Luther Lathron Walker	Carlos Lopez	SH2363209	2014-08-18	33.874283	-118.146194	(0,"")	1
53	Kerry Eric Wesson	Ricardo Munoz	SH2364142	2014-08-26	33.87343	-118.21437	(1,Gun)	1
28	Johnny Martinez	Pedro Guerrero-Gonzales	SH2367931	2014-10-04	33.972244	-118.25606	(0,"")	1
19	Eduardo Romero	Edwardo Sanchez	SH2368395	2014-10-08	34.01723	-118.16295	(1,Gun)	2
28	Oscar Alberto Ramirez	Bryan Moreno	SH2369175	2014-10-27	33.90052	-118.158264	(0,"")	1
41	Tarvis Herr	Marco Magana	SH2369362	2014-10-29	33.881466	-118.330795	(1,Gun)	2
36	William Forrest Spargur	Justin Auldridge	SH2370349	2014-11-07	34.615707	-118.204666	(1,Gun)	1
26	Eduardo Bermudez	Daniel Marquez	SH2370134	2014-11-16	34.01803	-118.15698	(1,"Replica gun")	1
57	Ricardo Avelar Lara	Daniel Marquez	SH2370134	2014-11-16	34.01803	-118.15698	(0,"")	1
19	Fernando Escobedo	Enrique Cano	SH2370720	2014-11-30	33.80737	-118.27096	(1,Knife)	1
34	Mayra Salome Cornejo	Jorge Ortiz	SH2372358	2014-12-31	33.89489	-118.276405	(1,Gun)	1
30	Jesse Tucker	Clarence Hodge	SH2370002	2015-02-02	34.370075	-118.50822	(0,"")	0
25	Averey Robinson	Steven Sather	SH2374167	2015-02-05	33.852364	-118.24608	(1,Gun)	0
18	Marcus McGlothurn	Jonathan Lested	SH2374385	2015-02-12	34.180927	-118.13606	(0,"")	0
50	James Babakitis	David Swanson	SH2374877	2015-02-19	34.322704	-118.47468	(0,"")	0
50	Steven Hohn	Sergio Santoyo	SH2375405	2015-03-03	33.83399	-118.25022	(1,"Utility knife")	2
32	Antonio Perez	Eric Espinoza	SH2375947	2015-03-12	34.02857	-118.27379	(0,"")	1
25	Hector Puga	Javier Estrella	SH2375981	2015-03-13	33.945965	-118.29593	(1,Gun)	2
31	Arthur Thomas	Caren Mandoyan	SH2376276	2015-03-20	33.939884	-118.291595	(1,Gun)	2
28	Victor Daniel Terrazas	Lawrence Swanson	SH2376887	2015-03-25	33.94362	-118.29139	(1,Gun)	1
38	Teshawn Gathier	Jay Brown	SH2377694	2015-04-10	33.95562	-118.23293	(0,"")	2
32	Thong Kien Ma	Joseph Nunez	SH2378885	2015-05-05	34.05326	-118.043755	(1,"Meat Cleaver")	1
22	Nephi Arreguin	Edward Fitzgerald	SH2379076	2015-05-07	33.875805	-118.05045	(0,"")	1
52	Jeffrey Morriss	Randolph Springer	SH2380778	2015-06-01	34.186237	-118.4885	(1,"Pellet Gun")	2
32	Paul Valenzuela	Gilbert Lozano	SH2380533	2015-06-04	34.128857	-117.89017	(1,Gun)	2
18	Minor (withheld)	Mizrain Orrego	SH2381667	2015-06-27	33.888256	-118.24581	(1,Gun)	0
46	Arturo Robert Lopez	Daniel Welle	SH2381947	2015-07-03	34.67042	-118.18512	(1,"")	1
42	Johnny Ray Anderson	Karlos Milan	SH2382214	2015-07-05	33.833282	-118.072044	(0,"")	1
31	John Leonard Berry	Anthony Johnson	SH2382110	2015-07-06	33.856533	-118.12377	(0,"")	1
48	Tracey Harris	Jeffrey Johnsen	SH2382540	2015-07-10	34.138466	-118.081314	(1,Gun)	2
47	Oscar Lptari Romero	Steven Huerta	SH2386874	2015-07-29	33.972263	-118.05515	(1,"Metal broom handle")	1
18	Angel Saldana-Duran	Unknown	SH2383665	2015-07-31	33.89195	-118.23621	(1,Gun)	0
19	Christopher Avalos	Unknown	SH2383665	2015-07-31	33.89195	-118.23621	(0,"")	0
41	Eddie Junior Tapia	Kamal Ahmad	SH2386375	2015-09-10	33.954838	-118.11378	(1,Gun)	1
45	Leopoldo Valencia	Arthur Perez	SH2387075	2015-09-24	33.90936	-118.11634	(1,Gun)	0
38	Aurelio Cantor	Dru Strong	SH2387545	2015-09-28	33.890053	-118.19299	(1,Gun)	2
41	Jesse Grijalva	Brady Kline	SH2387539	2015-10-02	34.030323	-118.00708	(1,Gun)	2
25	John Angel Rangel	Brian Richards	SH2388439	2015-10-16	34.031208	-117.91609	(0,"")	1
53	Dion L. Ramirez aka Dion Gossett	Robert Maas	SH2388831	2015-10-20	33.934834	-118.28113	(0,"")	1
28	Victor Prieto III	Adam Navarrette	SH2390859	2015-11-24	34.03994	-118.082825	(1,Gun)	0
18	Jobani Meza	Steven Velasquez	SH2390966	2015-12-01	33.917034	-118.08176	(1,Gun)	0
18	John A. Gonzalez	Steven Velasquez	SH2390966	2015-12-01	33.917034	-118.08176	(1,Gun)	1
28	Nicholas Robertson	Richard Ochoa-Garcia	SH2391485	2015-12-12	33.917217	-118.20975	(1,Gun)	1
30	Leroy Browning	Brett Nolin	SH2391928	2015-12-20	34.57133	-118.044586	(1,"")	1
31	Derrick Munzel Wright	Omar Covarrubias	SH2393052	2016-01-01	33.886524	-118.262054	(1,Gun)	2
21	Jeremy James	Christopher Keeling	SH2393284	2016-01-12	34.70561	-118.15011	(1,"Airsoft gun")	2
39	Miguel Hernandez	Nathan Gillespie	SH2393517	2016-01-14	34.419594	-118.45993	(1,Switchblade)	1
35	Gary Hudson	Adam Navarrette	SH2395478	2016-02-10	33.89056	-118.20423	(1,Gun)	0
45	Matthew T. Quinn	Arnold Camacho	SH2395381	2016-02-11	34.682037	-118.07974	(1,Axe)	1
24	Edwin Rodriguez	Andrew Alatorre	SH2395472	2016-02-14	34.021545	-118.16361	(0,"")	1
34	Reginald Dillard	Curtis Brown	SH2396335	2016-02-20	33.89391	-118.175095	(0,"")	2
30	Deon Butler	Curtis Brown	SH2396335	2016-02-20	33.89391	-118.175095	(0,"")	2
26	Francisco Garcia	Luke Lui	SH2396488	2016-02-24	33.88705	-118.10043	(0,"")	1
24	Fernando Hernandez	Unknown	SH2397208	2016-03-04	33.944702	-118.352356	(1,Gun)	2
29	Norvell Fobi	Brad Witkosky	SH2397223	2016-03-05	33.923466	-118.289276	(0,"")	2
23	Cristian Rene Medina	Jay Brown	SH2398032	2016-03-16	33.98107	-118.24156	(0,"")	1
33	Angel Montion	Ervin Francois	SH2399501	2016-03-30	34.012386	-118.12701	(1,Gun)	1
31	Jesus Alfredo Duran Sr.	Eric Chinaerian	SH2405395	2016-06-11	33.994457	-118.193275	(1,"Homemade spear")	1
39	Juan Martinez	Christopher Aliende	SH2406271	2016-06-23	33.88374	-118.14103	(1,Gun)	0
27	Donnell Thompson	James Ponsford	SH2408614	2016-07-28	33.909042	-118.23918	(0,"")	1
51	William Armand Bowers	Jeffrey Brito	SH2408949	2016-08-02	34.492504	-118.618225	(0,"")	1
23	Robert Corral	Ruben Quintero	SH2409314	2016-08-07	33.94284	-118.36112	(0,"")	2
55	Gerry White	Arin Davidian	SH2410098	2016-08-17	34.22123	-118.42922	(1,"Folding knife")	2
31	Donta Gurrel Taylor	Samuel Aldama	SH2410691	2016-08-25	33.899208	-118.239975	(0,"")	1
23	Joshua Quintero	Richard Ochoa-Garcia	SH2411259	2016-09-01	33.9625	-118.243126	(1,Gun)	1
30	Jason Dyer	Justin Smith	SH2411882	2016-09-08	33.78955	-118.325424	(1,Gun)	2
33	Thomas Napack	Vincent Cisneros	SH2413687	2016-10-04	34.014023	-118.491356	(1,Knives)	2
29	Trenton Lovell	Zachary Anderson	SH2413823	2016-10-06	34.684425	-118.191414	(1,Gun)	2
24	Alejandro Gomez	David Pantoja	SH2413839	2016-10-07	33.925713	-118.10735	(1,Gun)	1
55	Jose A. Cueva	Rizaldy Reantaso	SH2415580	2016-10-31	34.24538	-118.5696	(1,Knife)	1
45	Mark Daniel Sly	Casey Cheshier	SH2416630	2016-11-22	33.908653	-117.97717	(1,Gun)	1
32	Rudolfo Martinez	Antonio Chavez	SH2510487	2016-12-01	33.897175	-118.179695	(0,"")	2
25	Jonathan Salas	Jason Leach	SH2417768	2016-12-12	33.957924	-118.29591	(1,Gun)	2
60	Robert Hess	Ernesto Magana	SH2418067	2016-12-15	33.978966	-117.97609	(1,Gun)	1
33	Fidel Barrios	Miguel Ortiz	SH2418104	2016-12-17	34.021545	-118.16263	(1,Gun)	1
48	Zhonghua Li	Jose Hernandez	SH2418523	2016-12-24	34.018368	-118.06349	(1,"")	1
21	Robert Farias	Guillermo Anaya	SH2418661	2016-12-27	33.896114	-118.23311	(0,"")	0
18	Jeremiah Cook	Joshua Ramirez	SH2419182	2017-01-09	34.38718	-118.11227	(1,Gun)	0
18	Eric Bell	Joshua Ramirez	SH2419182	2017-01-09	34.38718	-118.11227	(0,"")	2
39	Arnold Castro	Eric Valdez Banditos, tattooed member	SH2420112	2017-01-21	34.024075	-118.15733	(1,Gun)	0
24	Peter Firchow	Jorge Perez	SH2421808	2017-02-13	34.204014	-118.448326	(1,Gun)	2
41	Dennis T. Rogers	Ryan Imaizumi	SH2423038	2017-03-07	33.987904	-118.36679	(1,"Hair clippers")	1
22	Bobby Escobar	Matthew Landreth	SH2423578	2017-03-14	33.958805	-118.050735	(1,Gun)	2
21	Andrew Lane	Nathan Botten	SH2423868	2017-03-20	34.103	-118.07587	(1,Gun)	1
29	Robert Soto	Shawn Merrick	SH2425038	2017-04-09	34.38718	-118.11227	(0,"")	0
27	Brian Gonzalez	Shawn Merrick	SH2425038	2017-04-09	34.38718	-118.11227	(1,Gun)	0
28	Zelalem E. Ewnetu	Shane Lattuca	SH2425342	2017-04-12	33.954525	-118.246735	(1,Gun)	1
25	Luis Garcia	Miguel Garcia	SH2428248	2017-05-25	33.902645	-118.216545	(1,Gun)	1
17	Armando Garcia-Muro	James Dillard	J.S.I.D. File #17-0324	2017-06-22	34.581623	-118.11164	(0,"")	1
61	Alfredo Remijio	Luis Monreal	SH2430280	2017-06-26	33.990967	-118.09	(0,"")	0
31	Jeremias Lopez	Murray Jacob	SH2431214	2017-07-04	34.577446	-118.09843	(1,"Folding knife")	2
45	Roberto Bernal	Jesus Jimenes Jr.	SH2431912	2017-07-22	33.933956	-118.182365	(1,"Replica gun")	0
34	Kenneth Lewis	Ryan Rothrock	SH2434406	2017-08-16	33.931026	-118.24779	(1,Gun)	1
52	Ruben Armendariz	Joseph Mendoza	SH2435366	2017-09-08	34.022396	-117.91197	(1,Gun)	0
39	Vincent Edward Hernandez, Jr.	Benny Khounthavong	SH2435972	2017-09-11	34.062614	-117.97685	(1,"Pellet guns")	1
33	Sason Malca	Charles Moylan	SH2439345	2017-10-31	34.220997	-118.51864	(1,"Mop handle")	2
20	Ricardo D. Cendejas	Juan P. Rodriguez	SH2439504	2017-11-02	33.910225	-118.23363	(0,"")	1
20	Raymond Perez	David Pantoja	SH2440728	2017-11-20	33.88039	-118.079765	(1,Gun)	0
29	Monolito A. Guerra	Albert S. White	SH2441479	2017-11-28	34.376064	-118.509056	(1,Gun)	2
28	Carolina Perez Pena	Nicholas Alerich	SH2442200	2017-12-06	33.936474	-118.26518	(0,"")	0
48	Frank D. Lopez	Christopher Cadman	SH2442509	2017-12-10	33.863884	-118.07242	(1,"")	1
26	David Douglas	Jose Morales	SH2445343	2018-01-06	33.885464	-118.20588	(1,Gun)	2
16	Anthony Weber	Gregory Van Hoesen	SH2447484	2018-02-04	33.938484	-118.296745	(0,"")	1
21	Michael Lombardi	Elsa Buonarigo	SH2447480	2018-02-05	33.873173	-118.07263	(0,"")	2
37	Cesar Bautista	Christopher Gonzalez	SH2447621	2018-02-06	34.03363	-118.15647	(0,"")	1
19	Jessica R. Cortez	Todd A Campbell	SH2450197	2018-03-06	34.38718	-118.11227	(0,"")	2
40	Manuel Anthony Borrego	Bradley Dietze	SH2450947	2018-03-18	34.033703	-118.04757	(1,Knife)	1
42	Frank Robles	John Rogart	SH2452326	2018-04-04	34.020004	-118.14242	(1,"Kitchen knife")	2
21	Michael Contreras	Brandon Barr	SH2455168	2018-05-08	34.061344	-118.0528	(1,"Pellet Gun")	2
55	Pedro Garcia	Timothy Lovitt	SH2458357	2018-06-28	34.059574	-118.064255	(1,Knife)	2
25	Carmelo Pizarro Jr.	Michael Stephenson	SH2460275	2018-07-19	33.97277	-118.086395	(1,Gun)	1
28	James Keoni Kalaau	Roberto Solorio	SH2461587	2018-08-10	33.851418	-118.1331	(1,Taser)	2
21	Anthony Daniel Vargas	Jonathan Rojas	SH2461585	2018-08-12	34.38718	-118.11227	(0,"")	1
28	Jahsha Shepherd	Unknown	SH2462080	2018-08-17	33.9018	-118.20005	(0,"")	0
22	Trayvon Douglas	Unknown	SH2462080	2018-08-17	33.9018	-118.20005	(0,"")	0
28	Cornell Glass	Joshua Smilor	SH2461902	2018-08-17	33.938198	-118.35699	(1,Gun)	1
18	Fernando Cruz	Sergio Trejo	SH2464820	2018-09-19	34.023556	-118.19002	(0,"")	1
18	Hector Martinez	Sergio Trejo	SH2464820	2018-09-19	34.023556	-118.19002	(0,"")	0
39	Rene Herrera	Sergio Trejo	SH2464820	2018-09-19	34.023556	-118.19002	(1,Gun)	1
18	Halcyon Johnson	Jesus Sandoval	SH2465543	2018-09-24	33.90258	-118.236275	(1,Gun)	2
42	Ivan Pena	John Strosnider	SH2464907	2018-09-24	34.05031	-118.18707	(1,Gun)	1
36	Enrique Lopez	Francisco Quinones-Medina	SH2465847	2018-10-07	33.91058	-118.20949	(1,Knife)	2
20	Alvaro Jimenez	Luis Cano	SH2467502	2018-10-27	34.38718	-118.11227	(1,Gun)	2
30	Rashaad Franco	Clarence McZeal	SH2467505	2018-11-01	34.026787	-118.03521	(0,"")	2
21	Eduardo Sanchez	Parker Driscoll	SH2469350	2018-11-25	34.684834	-118.19254	(1,"Folding knife")	2
32	Steven Lopez	Anthony Delia	19-03454-11	2019-02-17	34.69636	-118.13719	(1,Knife)	2
24	Nancy Herrera	Jonathan Cufley	SH2478178	2019-03-14	33.970276	-118.222664	(0,"")	2
41	Timothy John Beckwith	Ronald Barrientos	SH2485801	2019-03-16	34.56299	-118.05689	(1,"Bicycle part")	1
17	Johnny B.	Eric Moreno	SH2479783	2019-03-31	33.88833	-118.23456	(0,"")	2
19	Jose G.	Eric Moreno	SH2479783	2019-03-31	33.88833	-118.23456	(1,Gun)	2
24	Dylan Lindsey	Art Hernandez	19-00046-31	2019-05-10	34.00869	-118.20493	(1,Gun)	1
27	Alyson Hart	Art Hernandez	19-00046-31	2019-05-10	34.00869	-118.20493	(0,"")	2
37	Alison Hart	Jonathan Charrette	19-00046-31	2019-05-10	34.00869	-118.20493	(0,"")	2
28	Mario Morales Blas	Edgar Cuevas	SH2483294	2019-05-12	33.90679	-118.20709	(1,Gun)	0
44	Pablo Garcia	Brian Ciscel	19-07931-21	2019-05-21	33.930748	-118.197815	(1,Hammer)	1
24	Ryan Twyman	Andrew Lyons	19-08973-21	2019-06-06	33.91374	-118.26989	(0,"")	1
27	Edtwon Stamps	Michael Lee	SH2485799	2019-06-06	33.930965	-118.33747	(1,Gun)	1
35	Jose Salvador Meza	Grant Roth	SH2485902	2019-06-06	34.192703	-118.337135	(1,Gun)	1
35	Robert Ball	Zachary Marshall	SH2486168	2019-06-14	34.503677	-117.89329	(1,"BB Gun")	2
26	Andy Ramirez	Timothy Cho	SH2493251	2019-06-18	33.83131	-118.30402	(1,Gun)	2
27	Jorge Ramirez-Madrigal	Timothy Cho	SH2493251	2019-06-18	33.83131	-118.30402	(0,"")	2
18	Paul Rea	Hector  Saavedra	SH2487204	2019-06-27	34.029804	-118.14368	(0,"")	1
28	James Earl Harris	Edwin Barajas	SH2487616	2019-07-03	33.924633	-118.239006	(1,Gun)	0
32	Timothy Neal	Ian Walker	SH2489851	2019-07-26	34.00975	-118.799355	(1,"Knives and champagne bottle")	2
21	Jamaal Michael Simpson	Gregory Van Hoesen	SH2490361	2019-08-01	33.97526	-118.33408	(1,Gun)	1
25	Joseph Young	Andrew Makins	SH2490169	2019-08-02	33.914562	-118.168884	(0,"")	2
20	Gustavo Uribe	Luis Carbajal	SH2492655	2019-09-02	34.02683	-118.17296	(0,"")	2
24	Jason Uribe	Luis Carbajal	SH2492655	2019-09-02	34.02683	-118.17296	(0,"")	2
35	Alvaro Venegas	Michael Miller	SH2493696	2019-09-12	34.431988	-118.587944	(1,"piece of wood")	1
37	Marco A. Vasquez	Vincent Cisneros	SH2495363	2019-10-07	33.968967	-118.073395	(0,"")	1
29	Brandon McClure	Unknown	SH2496380	2019-10-23	34.573708	-118.08443	(1,Gun)	0
26	Devon Miles	Juan Bonilla	SH2496704	2019-10-24	34.13126	-118.38567	(1,Gun)	2
62	Ricardo Myers	Jonathan Lee	SH2502967	2019-10-30	34.66869	-118.07501	(1,Axe)	1
37	Omar Espinoza-Garcia	Dwight Aguayo	19-15834-02	2019-11-13	34.04091	-118.176285	(1,Sword)	1
32	Robert Evangelista	Juan Sanchez	SH2498761	2019-11-25	34.008244	-118.09985	(1,Gun)	2
25	Jorge Serrano	Kevin Thompson	19-17470-02	2019-12-16	34.03227	-118.18742	(1,Gun)	1
32	Raymundo Aaron Ceja	Tarek Salah	SH2504902	2020-03-01	34.415836	-118.551346	(1,"Replica gun")	1
31	Edward Sanderson	Jonathon Livingston	20-03610-26	2020-03-05	34.200977	-118.18842	(1,Gun)	0
38	Jesse Janto	Collin Reddy	20-03610-26	2020-03-05	34.200977	-118.18842	(1,"Gun ")	2
38	David Albala	Brittany Page	20-00155-44	2020-04-03	34.183254	-118.44697	(1,Hammer)	2
36	Richard Sean Lugo	Vincent Fratianne	SH2507873	2020-04-19	34.70467	-118.14921	(0,"")	1
18	Robert Avitia	David Rodriguez	SH2510292	2020-05-26	33.936615	-118.29592	(1,Gun)	1
39	Robert Melton Colvin	Nicholas Hernandez	20-09658-11	2020-05-29	34.67439	-118.16259	(1,"Replica gun")	1
37	Jose Martinez	Nicholas Carey	20-07905-21	2020-05-30	33.93059	-118.21599	(1,Gun)	2
35	Jarrid Hurst	Carlos Jover	SH2511293	2020-06-07	34.001926	-117.92801	(1,Knife)	1
61	Michael L. Thomas	Ty Shelton	SH2511478	2020-06-11	34.70773	-118.14185	(0,"")	1
38	Ranfere Pina	Joshua Mejia	SH2511304	2020-06-12	34.57902	-118.09198	(1,Gun)	2
19	Anthony Cardozo	Joshua Mejia	SH2511304	2020-06-12	34.57902	-118.09198	(1,Gun)	0
26	Tony Rocha Lugo	Joshua Mejia	SH2511304	2020-06-12	34.57902	-118.09198	(1,Gun)	1
26	Terron Jammal Boone	Unknown	20-10705-11	2020-06-17	34.669197	-118.1568	(1,Gun)	1
18	Andres Guardado	Miguel Vega	20-07557-28	2020-06-18	33.89234	-118.281586	(1,"Gun ")	1
31	Erik Hudson	Jonathan Alvarez	SH2512392	2020-06-28	33.885666	-118.32478	(0,"")	2
56	Kirk Campbell	Tanner Harris	20-13251-11	2020-07-30	34.697758	-118.10466	(0,"")	2
22	Rogelio Ochoa	Adam Nelson	20-07771-14	2020-08-07	34.03139	-118.008316	(1,Gun)	2
27	Rigoberto Moreno	Daniel Saldivar	SH2516197	2020-08-22	34.01339	-118.16856	(0,"")	0
29	Dijon Kizzee	Cristian Morales	20-07618-03	2020-08-31	33.936653	-118.29708	(0,"")	1
25	Samuel Herrera Jr.	Adonay Molina	20-11174-28	2020-09-10	33.891705	-118.203064	(1,"")	1
23	Samuel Nelson	Raymond Chavez	SH2517670	2020-09-23	33.975437	-118.03269	(1,"Folding knife")	2
22	Alvaro Herrera	Sergio Patino	SH2517827	2020-09-24	34.035923	-118.366936	(1,Gun)	2
22	Matthew Maldonado	Sergio Patino	SH2517827	2020-09-24	34.035923	-118.366936	(1,Gun)	2
34	Hermes Aparicio	Tarsicio De La Torre	20-19024-13	2020-10-06	33.903187	-118.17014	(1,"Glass jar")	2
38	Nicholas Burgos	Dalia Gonzalez	20-01613-85	2020-10-06	33.830284	-118.29198	(1,"Medical device")	1
47	Dana Young	Kevin Walker	SH2518988	2020-10-15	33.9383	-118.29401	(0,"")	1
25	Fred Williams III	Adrian Ines	SH2519110	2020-10-16	33.921417	-118.23193	(1,Gun)	1
26	Avery Davis	Justin San Juan	SH2519113	2020-10-17	34.69121	-118.19185	(1,Gun)	0
18	Damien Reyna	Bryan Cendejas	SH2520252	2020-10-28	33.917034	-118.08176	(1,Gun)	0
56	Sam Conner	Raymond Johnson	SH2520874	2020-11-15	33.935047	-118.31778	(1,Gun)	1
28	Christian Sotelo Juarez	Ryan Goff	SH2521959	2020-12-06	33.9841	-117.90391	(0,"")	1
32	Moises Arreola	Kevin Honea	SH2522837	2020-12-19	33.9416	-118.353485	(1,Gun)	1
48	Allen Mirzayan	Raul Reyes	21-00071-07	2021-01-10	34.187336	-118.15999	(0,"")	1
34	Abraham Esquivel	Juan Bendezu	21-01842-04	2021-02-12	33.89828	-118.0885	(0,"")	2
34	David Ordaz Jr.	Remin Pineda	21-03539-02	2021-03-14	34.036285	-118.18687	(1,Knife)	1
25	Isaias Cervantes	David Vega	21-04312-02	2021-03-31	33.966553	-118.17647	(0,"")	2
27	Kyle Rogers	Daisy Rosales	21-04146-04	2021-04-09	33.923782	-117.994125	(1,Gun)	2
\N	Miguel De Los Santos	Erasto Granados	21-05414-21	2021-04-23	33.97901	-118.25396	(1,Knives)	2
64	Alfredo Aceves	Scott Smith	21-06915-11	2021-04-29	34.59691	-117.83253	(1,"Metal taped together")	1
21	Eddie Caldera	Jose Nanquil	SH2531680	2021-05-13	34.03364	-117.93485	(1,Gun)	0
22	Raymond Cabral	Jose Nanquil	SH2531680	2021-05-13	34.03364	-117.93485	(0,"")	0
38	Armando Casillas	Francisco “Frank” Gamez II	Unknown	2021-06-17	34.295223	-118.44732	(0,"")	1
28	Frederick Holder	Jackie Rojas	21-06937-04	2021-06-23	33.887566	-118.10591	(1,"Butane lighter")	1
34	Adrian Sanchez	Kenneth Borbon	21-10950-06	2021-08-11	34.58749	-118.71537	(0,"")	1
28	Kevin Hernandez	Unknown	21-11523-02	2021-08-26	34.019012	-118.21737	(1,"Baseball hat")	2
28	Victor Alonsa	Jonathan Cufley	SH2538692	2021-08-30	34.044373	-118.1732	(1,Gun)	0
29	Christian Jaimes-Lopez	Jonathan Cufley	SH2538692	2021-08-30	34.044373	-118.1732	(1,Gun)	2
29	Edwin Pizarro	Larry Aguilar	21-11704-26	2021-09-11	34.572258	-118.12542	(0,"")	2
35	Julio King	Jesus Chamorro	21-15868-11	2021-09-22	34.689358	-118.135216	(1,Gun)	2
34	Berry Ross	Trevor Moore	21-15897-11	2021-09-23	34.806244	-118.15378	(1,Gun)	1
43	Shane Whelchel	Blake Corrigan	21-07807-03	2021-09-30	33.961487	-118.28222	(1,Gun)	2
32	Christopher Mosco	Rudy Hernandez	21-13593-06	2021-10-03	34.3721	-118.57002	(1,Gun)	1
35	Jesse Medrano	Chase Morales	21-13354-21	2021-10-05	33.928135	-118.25269	(1,Gun)	1
18	Isaiah Guevara	Frank Parga	21-05801-15	2021-10-10	34.000336	-118.06858	(1,Gun)	1
25	Adrian Abelar	Yen Liu	21-10833-05	2021-10-19	34.05226	-118.09009	(1,Gun)	2
24	Daniel Cardenas	Unknown	SH2542156	2021-10-21	34.01508	-118.13598	(1,Gun)	0
40	Franklin Moran	Jacob Dominguez	21-15192-02	2021-11-12	34.018185	-118.147766	(1,"Folding knife")	2
32	Manuel Chaves	Michael Thompson	21-15456-06	2021-11-12	34.440132	-118.295784	(0,"")	2
25	Wendy Flores de Rouque	Jacob Dominguez	21-15192-02	2021-11-12	34.018185	-118.147766	(0,"")	1
28	John Holenbeck	Alfonso Valenzuela	21-01549-60	2021-11-21	33.923283	-118.2354	(1,Gun)	1
23	Juan Marquez	Joshua Corrales	21-13466-04	2021-12-15	33.919052	-118.05481	(1,Gun)	2
32	Nicholas Hernandez	Aaron Agajanian	21-13600-04	2021-12-18	33.94676	-118.10349	(1,Gun)	2
26	Katlan Marshall	Jose Ramirez	21-12504-16	2021-12-29	33.838966	-118.22157	(1,"Gun, Knife")	2
29	Javier Torres	Adrian Ines	22-01199-21	2022-01-24	33.96256	-118.227936	(1,Gun)	2
40	Stephanie Browne	Luis Valle	22-02322-06	2022-02-15	34.38718	-118.11227	(1,Knife)	1
29	Andre Mora	Unknown	22-01832-04	2022-02-17	33.906166	-118.07522	(1,Gun)	2
67	Pedro Manuel Morales	Unknown	22-01832-04	2022-02-17	33.906166	-118.07522	(0,"")	1
24	Unknown woman	Sergio Campos	22-02016-04	2022-02-23	33.920437	-118.02132	(0,"")	2
21	Adrian Romero	Sergio Campos	22-02016-04	2022-02-23	33.920437	-118.02132	(0,"")	2
20	Aldo Romero	Sergio Campos	22-02016-04	2022-02-23	33.920437	-118.02132	(1,Gun)	2
32	Edgar Ortiz	Erin Herring	22-04000-13	2022-03-03	33.87468	-118.1513	(1,"Garden tool")	1
26	Samuel Nunez	Chad Melton	22-03330-26	2022-03-13	34.56709	-118.00649	(1,Gun)	1
56	Trinidad Velasco	Ernest Magana	22-03580-14	2022-04-01	34.013348	-117.99663	(1,Screwdriver)	2
33	Gabriel Samaniego	Juan Lopez	22-80007-68	2022-05-24	34.027798	-118.169716	(1,Gun)	1
51	Ricky Jimenez	Danny Soto	22-09621-11	2022-06-05	34.6899	-118.16388	(1,"Knife, pistol grip crossbow")	1
42	Rafael Salazar	Jaime Gallegos	22-10756-28	2022-08-16	33.892857	-118.2787	(1,Gun)	2
41	Augustin Flores	Raymond Romero Soto	22-13318-21	2022-08-31	33.95388	-118.24306	(1,Machete)	1
41	Rushdee Anderson	Justin Sabatine	22-07453-03	2022-09-02	33.938225	-118.30905	(1,Gun)	1
18	Corey Crittenden	Michael Alburez	22-15398-11	2022-09-05	34.69147	-118.13535	(1,Gun)	2
67	Arthur Wright	Joseph Welch	22-14389-21	2022-09-21	33.929497	-118.24627	(1,"Airsoft gun")	2
46	Ramiro Lozano	Adonay Molina	22-14323-28	2022-11-03	33.878105	-118.220726	(1,Hatchet)	1
40	Thomas Phan	Carlos Martinez	22-16247-06	2022-11-16	34.4266	-118.55889	(1,Knives)	1
25	Bridget Blaney	Ernesto Valencia	22-05647-08	2022-11-26	34.095886	-117.92539	(1,Wrench)	2
24	Fernando Fierro	Robert Maas	22-21667-11	2022-12-21	34.704304	-118.08596	(1,Gun)	1
61	Willie Pendleton	Erving Francois	22-00116-31	2022-12-22	33.900112	-118.30916	(1,Gun)	1
44	Alon Foster	Adam Carreon	023-00373-2654-013	2023-01-08	34.60294	-118.38592	(1,Knife)	1
50	Christopher Lee Mercurio	Lorena Gonzalez	023-00463-0608-013	2023-01-11	34.412746	-118.55478	(0,"")	1
47	Charles Towns	Eliezer Morales	023-00208-0772-013	2023-01-22	34.086052	-118.178276	(1,Scissors)	1
70	Miguel Lopez	Edward Martinez	023-01205-0250-013	2023-01-26	33.98348	-118.18706	(1,Gun)	1
36	Mario Bustillos	Edwin Barajas	023-01400-2873-055	2023-01-31	33.8938	-118.26016	(1,Gun)	2
\N	Byram Everett	Blake Runge	023-02034-2608-013	2023-02-10	34.38718	-118.11227	(1,Sword)	1
\.


--
-- Name: officercase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yiv
--

SELECT pg_catalog.setval('public.officercase_id_seq', 401, true);


--
-- Name: officergang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yiv
--

SELECT pg_catalog.setval('public.officergang_id_seq', 422, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: case case_code_key; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public."case"
    ADD CONSTRAINT case_code_key UNIQUE (code);


--
-- Name: case case_id_key; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public."case"
    ADD CONSTRAINT case_id_key UNIQUE (id);


--
-- Name: case case_pkey; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public."case"
    ADD CONSTRAINT case_pkey PRIMARY KEY (id);


--
-- Name: case case_title_key; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public."case"
    ADD CONSTRAINT case_title_key UNIQUE (title);


--
-- Name: gang gang_pkey; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.gang
    ADD CONSTRAINT gang_pkey PRIMARY KEY (name);


--
-- Name: gangmember gangmember_badge_key; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.gangmember
    ADD CONSTRAINT gangmember_badge_key UNIQUE (badge);


--
-- Name: gangmember gangmember_officer_key; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.gangmember
    ADD CONSTRAINT gangmember_officer_key UNIQUE (officer);


--
-- Name: gangmember gangmember_pkey; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.gangmember
    ADD CONSTRAINT gangmember_pkey PRIMARY KEY (officer);


--
-- Name: officercase officercase_pkey; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.officercase
    ADD CONSTRAINT officercase_pkey PRIMARY KEY (id);


--
-- Name: officergang officergang_pkey; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.officergang
    ADD CONSTRAINT officergang_pkey PRIMARY KEY (id);


--
-- Name: shooting shooting_pkey; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.shooting
    ADD CONSTRAINT shooting_pkey PRIMARY KEY (victim);


--
-- Name: shooting shooting_victim_key; Type: CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.shooting
    ADD CONSTRAINT shooting_victim_key UNIQUE (victim);


--
-- Name: officercase officercase_case_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.officercase
    ADD CONSTRAINT officercase_case_fkey FOREIGN KEY ("case") REFERENCES public."case"(id);


--
-- Name: officercase officercase_officer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.officercase
    ADD CONSTRAINT officercase_officer_fkey FOREIGN KEY (officer) REFERENCES public.gangmember(officer);


--
-- Name: officergang officergang_gang_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.officergang
    ADD CONSTRAINT officergang_gang_fkey FOREIGN KEY (gang) REFERENCES public.gang(name);


--
-- Name: officergang officergang_officer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yiv
--

ALTER TABLE ONLY public.officergang
    ADD CONSTRAINT officergang_officer_fkey FOREIGN KEY (officer) REFERENCES public.gangmember(officer);


--
-- PostgreSQL database dump complete
--

