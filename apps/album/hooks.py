#encoding:utf-8

from apps.front.models import FrontUserModel
from .views import bp
from flask import session,g
import config

@bp.before_request
def before_request():
    if config.FRONT_USER_ID in session:
        user_id = session.get(config.FRONT_USER_ID)
        user = FrontUserModel.query.get(user_id)
        if user:
            g.front_user = user
    else:
        g.front_user = ''




