from flask import Flask, render_template, request, redirect, url_for, flash
from flask_login import LoginManager, login_user, logout_user, login_required, UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SelectField
from wtforms.validators import DataRequired
import os
import pymysql
import pandas as pd

app = Flask(__name__)
app.secret_key = os.urandom(24)

# Database configuration
DB_HOST = os.environ.get('DB_HOST', 'localhost')
DB_PORT = int(os.environ.get('DB_PORT', 3306))
DB_USER = os.environ.get('DB_USER', 'root')
DB_PASSWORD = os.environ.get('DB_PASSWORD', '')
DB_NAME = os.environ.get('DB_NAME', 'scrapping_pbs')

# Initialize Flask-Login
login_manager = LoginManager(app)
login_manager.login_view = 'login'

# Configure MySQL connection
conn = None

# User model
class User(UserMixin):
    def __init__(self, user_id, username, password):
        self.id = user_id
        self.username = username
        self.password = password

    @staticmethod
    def get(user_id):
        with get_db_connection() as cursor:
            sql = "SELECT * FROM users WHERE id = %s"
            cursor.execute(sql, (user_id,))
            result = cursor.fetchone()
            if result:
                return User(result['id'], result['username'], result['password'])
            else:
                return None

    @staticmethod
    def get_by_username(username):
        with get_db_connection() as cursor:
            sql = "SELECT * FROM users WHERE username = %s"
            cursor.execute(sql, (username,))
            result = cursor.fetchone()
            if result:
                return User(result['id'], result['username'], result['password'])
            else:
                return None

# Login callback
@login_manager.user_loader
def load_user(user_id):
    return User.get(user_id)

# Database connection management
def get_db_connection():
    global conn
    if conn is None or not conn.open:
        conn = pymysql.connect(
            host=DB_HOST,
            port=DB_PORT,
            user=DB_USER,
            password=DB_PASSWORD,
            db=DB_NAME,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
    return conn.cursor()

# Registration form
class RegistrationForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password', validators=[DataRequired()])
    sex = SelectField('Sex', choices=[('M', 'Male'), ('F', 'Female')], validators=[DataRequired()])
    address = StringField('Address', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired()])

# Login form
class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])

# Load the data
event_types = pd.read_excel('data/event_types.xlsx')
properties = pd.read_csv('data/property.csv')
user_activity = pd.read_csv('data/user_activity.csv')

# Calculate property popularity
property_frequency = user_activity['item_id'].value_counts().to_dict()

# Routes
@app.route('/')
def index():
    return render_template('home.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        user = User.get_by_username(username)
        if user and check_password_hash(user.password, password):
            login_user(user)
            flash('Logged in successfully!', 'success')
            return redirect(url_for('index'))
        else:
            flash('Invalid username or password', 'error')
    return render_template('login.html', form=form)

@app.route('/user/register', methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        confirm_password = form.confirm_password.data
        sex = form.sex.data
        address = form.address.data
        email = form.email.data

        if password != confirm_password:
            flash('Passwords do not match', 'error')
        else:
            hashed_password = generate_password_hash(password)
            with get_db_connection() as cursor:
                sql = "INSERT INTO users (username, password, sex, address, email) VALUES (%s, %s, %s, %s, %s)"
                cursor.execute(sql, (username, hashed_password, sex, address, email))
                conn.commit()
            flash('Registration successful! You can now log in.', 'success')
            return redirect(url_for('login'))
    return render_template('register.html', form=form)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('Logged out successfully!', 'success')
    return redirect(url_for('index'))

@app.route('/recommendations', methods=['GET', 'POST'])
def recommendations():
    keywords = str(request.args.get('keywords', ''))
    location = str(request.args.get('location', ''))

    # Convert monthly_rent column to string type
    properties['has_elevator'] = properties['has_elevator'].astype(str)
    properties['room_qty'] = properties['room_qty'].astype(str)


    # Filter the dataset based on user input
    filtered_properties = properties[
        properties['has_elevator'].str.contains(keywords, case=False, na=False) &
        properties['room_qty'].str.contains(location, case=False, na=False)
    ]
    
    # Generate recommendations based on user input and popularity
    #print(filtered_properties.head())
    recommendations = filtered_properties[
        filtered_properties['item_id'].isin(property_frequency.keys())
    ].sort_values(by='item_id', ascending=False).head(10)

    if recommendations.empty:
        error_message = "No recommendations found for the given criteria."
        return render_template('no_recommendation.html', error_message=error_message)

    return render_template('recommendations.html', recommendations=recommendations)


@app.errorhandler(404)
def page_not_found(error):
    error_message = f"Error 404: Page not found ({request.url})"
    return render_template('error.html', error_message=error_message), 404

@app.errorhandler(500)
def internal_server_error(error):
    error_message = "Error 500: Internal Server Error"
    return render_template('error.html', error_message=error_message), 500

if __name__ == '__main__':
    app.run(debug=True)
