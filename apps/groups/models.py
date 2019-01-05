#encoding:utf-8
from exct import db
from datetime import datetime
import shortuuid

user_group = db.Table(
    'user_group',
    db.Column('user_id',db.ForeignKey("front_user.id"),primary_key=True),
    db.Column('group_id',db.ForeignKey("group.id"),primary_key=True),
)

class GroupModel(db.Model):
    __tablename__ = 'group'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    name = db.Column(db.String(150))
    avatar = db.Column(db.String(150))
    create_time = db.Column(db.DateTime,default=datetime.now)
    create_user = db.Column(db.String(100),nullable=False)
    point = db.Column(db.Integer,default=0)
    desc = db.Column(db.Text)

    users = db.relationship("FrontUserModel",backref='groups',secondary=user_group)

class TopicModel(db.Model):
    __tablename__ = 'topic'
    id = db.Column(db.String(150),primary_key=True,default=shortuuid.uuid)
    title = db.Column(db.String(150),nullable=False)
    content = db.Column(db.Text,nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)
    group_id = db.Column(db.Integer,db.ForeignKey("group.id"))
    author_id = db.Column(db.String(150),db.ForeignKey("front_user.id"))
    author = db.relationship("FrontUserModel",backref='topics')
    group = db.relationship("GroupModel",backref='topics')


# 组管理
class GroupManageModel(db.Model):
    __tablename__ = 'group_manage'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    group_id = db.Column(db.Integer, db.ForeignKey("group.id"))
    author_id = db.Column(db.String(150), db.ForeignKey("front_user.id"))

    author = db.relationship("FrontUserModel",backref='manager')
    group = db.relationship("GroupModel",backref='managers')




class TopicCommentModel(db.Model):
    __tablename__ = 'topcomment'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    content = db.Column(db.Text,nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)

    topic_id = db.Column(db.String(150),db.ForeignKey("topic.id"))
    author_id = db.Column(db.String(100),db.ForeignKey("front_user.id"))
    origin_comment_id = db.Column(db.Integer,db.ForeignKey("topcomment.id"))

    topic = db.relationship("TopicModel",backref="topcomments")
    author = db.relationship("FrontUserModel",backref="topcomments")
    origin_comment = db.relationship("TopicCommentModel",backref="topreplys",remote_side =[id])

