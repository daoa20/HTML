from flask import *

app = Flask(__name__, static_url_path='')
app.secret_key = 1234567890

@app.route('/')
def home():
    return render_template('users.html')

@app.route('/')
def root():
    return app.send_static_file('/static/script.js')

@app.route('/')
def root1():
    return app.send_static_file('/static/users.json')
