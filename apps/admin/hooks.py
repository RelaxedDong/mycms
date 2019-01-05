#encoding:utf-8
from .models import CMSUserModel
from .views import bp
from flask import session,g
import config

@bp.before_request
def before_request():
    if config.CMS_USER_ID in session:
        user_id = session.get(config.CMS_USER_ID)
        user = CMSUserModel.query.get(user_id)
        if user:
            g.cms_user = user

