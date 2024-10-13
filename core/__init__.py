from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
app = Flask(__name__)
from sqlalchemy import Table

from core import views

app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL') # 'postgresql://yiv:postgres@localhost/postgres'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

from .models import GangMember, Shooting, Case, Gang, officergang, officercase

migrate = Migrate(app, db)


