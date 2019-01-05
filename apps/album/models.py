#encoding:utf-8
from exct import db
from datetime import datetime
import shortuuid


class AlbumModel(db.Model):
    __tablename__ = 'album'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    name = db.Column(db.String(150),nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)
    see_count = db.Column(db.Integer,default=0)
    desc = db.Column(db.Text)
    power = db.Column(db.Integer,default=0)
    author_id = db.Column(db.String(150), db.ForeignKey("front_user.id"))
    author = db.relationship("FrontUserModel", backref='albums')

album_tag = db.Table(
    'album_tag',
    db.Column('album_id',db.ForeignKey("album.id"),primary_key=True),
    db.Column('tag_id',db.ForeignKey("img_tag.id"),primary_key=True)
)

# 标签
class AlbumTagsModel(db.Model):
    __tablename__ = 'img_tag'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    tagname = db.Column(db.String(150))
    album = db.relationship("AlbumModel",backref='tags',secondary=album_tag)


class ImagesModel(db.Model):
    __tablename__ = 'image'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    url = db.Column(db.String(150))
    create_time = db.Column(db.DateTime, default=datetime.now)

    album_id = db.Column(db.Integer,db.ForeignKey("album.id"))
    album = db.relationship("AlbumModel",backref='images')


# 点赞
class Album_StarModel(db.Model):
    __tablename__ = 'album_star'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    album_id = db.Column(db.Integer, db.ForeignKey("album.id"))
    author_id = db.Column(db.String(100),db.ForeignKey("front_user.id"))
    author = db.relationship("FrontUserModel",backref='album_stars')
    album = db.relationship("AlbumModel",backref='album_stars')

class Album_CommentModel(db.Model):
    __tablename__ = 'album_comment'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    content = db.Column(db.Text,nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)
    album_id = db.Column(db.Integer, db.ForeignKey("album.id"))
    author_id = db.Column(db.String(100),db.ForeignKey("front_user.id"))
    origin_comment_id = db.Column(db.Integer,db.ForeignKey("album_comment.id"))

    album = db.relationship("AlbumModel", backref='album_comments')
    author = db.relationship("FrontUserModel",backref="album_comments")
    origin_comment = db.relationship("Album_CommentModel",backref="album_replys",remote_side =[id])

