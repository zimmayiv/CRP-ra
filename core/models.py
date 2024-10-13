from core import db

officergang = db.Table('officergang', db.Model.metadata,
    db.Column('officer', db.ForeignKey('gangmember.officer'), unique=False),
    db.Column('gang', db.ForeignKey('gang.name')),
    db.Column('id', db.Integer, primary_key=True))

officercase = db.Table('officercase', db.Model.metadata,
    db.Column('officer', db.ForeignKey('gangmember.officer')),
    db.Column('case', db.ForeignKey('case.id')),
    db.Column('id', db.Integer, primary_key=True))

class GangMember(db.Model):
    __tablename__ = "gangmember"
    badge = db.Column(db.Integer, unique=True,nullable=True)
    officer = db.Column(db.String(64), primary_key=True, unique=True)
    bio = db.Column(db.String(512), unique=False, nullable=True)
    gangs = db.relationship('Gang', secondary=officergang, back_populates='members')
    cases = db.relationship('Case', secondary=officercase, back_populates='officers')

class Shooting(db.Model):
    __tablename__ = "shooting"
    age = db.Column(db.Integer, nullable=True,unique=False)
    victim = db.Column(db.String(64), primary_key=True, unique=True)
    officer = db.Column(db.String(64), nullable=False)
    id = db.Column(db.String(64), unique=False, nullable=True)
    date = db.Column(db.Date, unique=False, nullable=False)
    lat = db.Column(db.Float(8), unique=False,nullable=True)
    lng = db.Column(db.Float(8), unique=False, nullable=True)
    weapon=db.Column(db.String(128), unique=False, nullable=True)
    outcome=db.Column(db.Integer, unique=False, nullable=True)

class Case(db.Model):
    __tablename__ = "case"
    id = db.Column(db.String(64), primary_key=True, unique=True)
    title = db.Column(db.String(256), nullable=False, unique=True)
    code = db.Column(db.String(64), nullable=False, unique=True)
    url = db.Column(db.String(128), unique=False, nullable=True)
    officers = db.relationship('GangMember', secondary=officercase, back_populates='cases')

class Gang(db.Model):
    __tablename__ = "gang"
    name = db.Column(db.String(64), primary_key=True)
    members = db.relationship('GangMember', secondary=officergang, back_populates='gangs')

