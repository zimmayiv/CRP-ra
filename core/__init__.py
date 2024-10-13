import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
app = Flask(__name__)
from sqlalchemy import Table

from core import views

app.config['SQLALCHEMY_DATABASE_URI'] = postgres://ua0r6rukoilnjm:p4ba19785c7f62b33ec59fa4fdca3a4a4f2c372306df42a2f354266f76b4d9b28@caij57unh724n3.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d7kfescnbc07c3
# os.environ.get('DATABASE_URL') # 'postgresql://yiv:postgres@localhost/postgres'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

from .models import GangMember, Shooting, Case, Gang, officergang, officercase

migrate = Migrate(app, db)


