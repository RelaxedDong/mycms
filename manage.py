#encoding:utf-8

from exct import db
from flask_migrate import Migrate,MigrateCommand
from flask_script import Manager
from mycms import app
from apps.admin import models as cms_model
from apps.front import models as fornt_model
from apps.common import models as common_model
from apps.groups import models as group_model
from apps.album import models as album_model

from apps.common.models import PostsModel

CMSUser = cms_model.CMSUserModel
FrontUser = fornt_model.FrontUserModel

manager = Manager(app)

Migrate(app,db)
manager.add_command('db',MigrateCommand)


@manager.option('-u','--u',dest='username')
@manager.option('-e','--e',dest='email')
@manager.option('-p','--p',dest='password')
def add_cms_user(username,email,password):
    user = CMSUser(username=username,email=email,password=password)
    db.session.add(user)
    db.session.commit()
    print('后台用户添加成功')



@manager.option('-u','--username',dest='username')
@manager.option('-e','--email',dest='email')
@manager.option('-p','--password',dest='password')
def add_front_user(username,email,password):
    user = FrontUser(username=username,email=email,password=password)
    db.session.add(user)
    db.session.commit()
    print('前台用户添加成功')

@manager.command
def create_posts():
    for x in range(1,100):
        title = '标题%s'%x
        content = '内容%s'%x
        author = FrontUser.query.first()
        post = PostsModel(title=title,content=content,author=author)
        db.session.add(post)
        db.session.commit()
    print('测试数据添加成功！')



if __name__ == '__main__':
    manager.run()


