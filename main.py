from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from werkzeug.utils import secure_filename
import json
from datetime import datetime
import os
import math

with open('config.json') as f:
    parameters = json.load(f)["parameters"]

local_server = True

app = Flask(__name__)
app.secret_key = 'the-super-secret-key'
app.config['Upload_Folder'] = parameters['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME="parameters['gmail_user']",
    MAIL_PASSWORD="parameters['gmail_password']"
)
mail = Mail(app)
if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['prod_uri']

db = SQLAlchemy(app)


class Contact(db.Model):
    '''
    sno, FirstName, LastName, Email, Phone, msg, dt
    '''
    sno = db.Column(db.Integer, primary_key=True)
    FirstName = db.Column(db.String(50), nullable=False)
    LastName = db.Column(db.String(50), nullable=False)
    Email = db.Column(db.String(50), nullable=False)
    Phone = db.Column(db.String(120), nullable=False)
    Msg = db.Column(db.String(250), nullable=False)
    Email = db.Column(db.String(120), nullable=False)
    dt = db.Column(db.String(12),  nullable=True)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12),  nullable=True)
    img_file = db.Column(db.String(50),  nullable=True)


@app.route('/')
def home():
    # Pagination Logic
    '''
    First Page
        prev = #
        next = page + 1
    Middle Page
        prev = page - 1
        next = page + 1
    Last Page
        prev = page - 1
        next = #

    '''
    posts = Posts.query.filter_by().all()
    # [0:parameters['no_of_posts']]
    last = math.ceil(len(posts)/int(parameters['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1

    page = int(page)
    posts = posts[(page-1)*int(parameters['no_of_posts']): (page-1) *
                  int(parameters['no_of_posts']) + int(parameters['no_of_posts'])]

    # First Page
    if(page == 1):
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif(page == last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', parameters=parameters, posts=posts, prev=prev, next=next)


@app.route("/blogpost/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('blogpost.html', parameters=parameters, post=post)


@app.route('/about')
def about():
    return render_template('about.html', parameters=parameters)


@app.route('/edit/<string:sno>', methods=['GET', 'POST'])
def edit(sno):
    if 'admin' in session and session['admin'] == parameters['admin_username']:
        if request.method == 'POST':
            new_img_file = request.form.get('img_file')
            new_title = request.form.get('title')
            new_slug = request.form.get('slug')
            new_content = request.form.get('content')
            new_date = datetime.now()

            if sno == '0':
                post = Posts(img_file=new_img_file, title=new_title,
                             slug=new_slug, content=new_content, date=new_date)
                db.session.add(post)
                db.session.commit()

            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.img_file = new_img_file
                post.title = new_title
                post.slug = new_slug
                post.content = new_content
                post.date = new_date

                db.session.commit()
                return redirect('/edit/' + sno)
        post = Posts.query.filter_by(sno=sno).first()

        return render_template('edit.html', parameters=parameters, post=post)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if(request.method == 'POST'):
        # Fetching all the entry of the user
        fname = request.form.get('fname')
        lname = request.form.get('lname')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('msg')

        # Adding Entries to the database

        # contact(class variable = input variable)
        entry = Contact(FirstName=fname, LastName=lname, Email=email,
                        Phone=phone, Msg=message, dt=datetime.now())

        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Message From ' + fname + ' ' + lname,
                          sender=email,
                          recipients=[parameters['gmail_user']],
                          body=message + "\n" + phone
                          )
    return render_template('contact.html', parameters=parameters)


@app.route('/search')
def search():
    return render_template('search.html', parameters=parameters)


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():

    if 'admin' in session and session['admin'] == parameters['admin_username']:
        posts = Posts.query.all()
        return render_template('dashboard.html', parameters=parameters, posts=posts)

    if request.method == 'POST':
        user = request.form.get('username')
        userpass = request.form.get('password')
        if(user == parameters['admin_username'] and userpass == parameters['admin_password']):
            # Setting The Session Variable
            session['admin'] = user
            posts = Posts.query.all()
            return render_template('dashboard.html', parameters=parameters, posts=posts)
    return render_template('login.html', parameters=parameters)


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if 'admin' in session and session['admin'] == parameters['admin_username']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(
                app.config['Upload_Folder'], secure_filename(f.filename)))
            return "Your File Is Uploaded Successfully!"


@app.route('/logout')
def logout():
    session.pop('admin')
    return redirect('/dashboard')


@app.route('/delete/<string:sno>', methods=['GET', 'POST'])
def delete(sno):
    if 'admin' in session and session['admin'] == parameters['admin_username']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


# @app.route('/blogpost')
# def blogpost():
#     return render_template('blogpost.html', parameters=parameters)

app.run(debug=True)
