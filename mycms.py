#encoding:utf-8

from apps.admin import bp as cms_bp
from apps.front import bp as front_bp
from apps.common import bp as common_bp
from apps.groups import bp as group_bp
from apps.album import bp as album_bp


import config
from exct import db,mail
from flask import Flask,render_template

from flask_wtf.csrf import CSRFProtect


csrf = CSRFProtect()

def create_app():
    app = Flask(__name__)
    app.config.from_object(config)
    app.register_blueprint(cms_bp)
    app.register_blueprint(front_bp)
    app.register_blueprint(common_bp)
    app.register_blueprint(group_bp)
    app.register_blueprint(album_bp)
    csrf.init_app(app)
    db.init_app(app)
    mail.init_app(app)
    return app

app = create_app()

@app.errorhandler(404)
def page_not_find(e):
    return render_template('common/404.html'),404

if __name__ == '__main__':
    app.run(threaded=True,debug=True)
