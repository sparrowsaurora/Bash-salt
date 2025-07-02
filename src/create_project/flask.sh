#!/bin/bash

# ANSI color codes
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

print_msg() {
    echo -e "${1}${2}${RESET}"
}

APP_NAME=${1:-flask_app}
print_msg "$CYAN" "Setting up Flask project: $APP_NAME"

# Create directory structure
mkdir -p "$APP_NAME"/{app,app/templates/components,app/static}
cd "$APP_NAME" || exit

print_msg "$CYAN" "Creating folders and files..."

# Touch base files
touch app/__init__.py
touch app/routes.py
touch app/auth.py
touch app/templates/base.html
touch app/templates/components/nav.html
touch app/templates/components/footer.html
touch app/static/style.css
touch config.py
touch run.py
touch .env
touch .gitignore
touch ReadMe.md
touch ToDo.md

# __init__.py
cat <<EOF > app/__init__.py
from flask import Flask
from dotenv import load_dotenv
import os
from flask_login import LoginManager
from flask_bcrypt import Bcrypt

load_dotenv()

app = Flask(__name__)
app.config.from_object('config')

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = "login"

bcrypt = Bcrypt(app)

from app import routes, auth
EOF

# routes.py
cat <<EOF > app/routes.py
from app import app

@app.route("/")
def home():
    return "Hello from Flask!"
EOF

# auth.py
cat <<EOF > app/auth.py
from flask import render_template, redirect, url_for, request, flash
from app import app, bcrypt
from flask_login import login_user, logout_user, login_required
# NOTE: You should implement User model and FlaskForm classes for real usage.

@app.route("/login", methods=["GET", "POST"])
def login():
    return "Login page (to be implemented)"

@app.route("/signup", methods=["GET", "POST"])
def signup():
    return "Signup page (to be implemented)"

@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for('home'))
EOF

# config.py
cat <<EOF > config.py
import os

class Config:
    SECRET_KEY = os.getenv('SECRET_KEY', 'you-will-never-guess')
EOF

# run.py
cat <<EOF > run.py
from app import app

if __name__ == "__main__":
    app.run(debug=True)
EOF

# .env
cat <<EOF > .env
SECRET_KEY=super-secret-key
EOF

# .gitignore
cat <<EOF > .gitignore
venv/
__pycache__/
*.pyc
.env
EOF

# Set up virtual environment
print_msg "$CYAN" "Creating virtual environment..."
python -m venv .venv

# Activate and install packages
source .venv/Scripts/activate
print_msg "$CYAN" "Installing Flask and python-dotenv packages..."
pip install Flask python-dotenv flask-bcrypt flask-login

# Freeze requirements
pip freeze > requirements.txt

# Final messages
print_msg "$GREEN" "Flask app: '$APP_NAME' setup complete!"

print_msg "$YELLOW" "To run your app:"
print_msg "$YELLOW" "   source venv/bin/activate"
print_msg "$YELLOW" "   python run.py"

print_msg "$CYAN" " Recommended extra packages:"
print_msg "$YELLOW" "   pip install flask-wtf flask-sqlalchemy flask-migrate"