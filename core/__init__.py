import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
app = Flask(__name__)
from sqlalchemy import Table

from core import views

database_url = os.environ.get('DATABASE_URL')

if database_url and database_url.startswith('postgres:'):
    database_url = database_url.replace('postgres:', 'postgresql:', 1)

app.config['SQLALCHEMY_DATABASE_URI'] = database_url 
# 'postgres://ua0r6rukoilnjm:p4ba19785c7f62b33ec59fa4fdca3a4a4f2c372306df42a2f354266f76b4d9b28@caij57unh724n3.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d7kfescnbc07c3'
# 'postgresql://yiv:postgres@localhost/postgres'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

from .models import GangMember, Shooting, Case, Gang, officergang, officercase

migrate = Migrate(app, db)


