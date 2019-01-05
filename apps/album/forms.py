#encoding:utf-8
from wtforms import StringField,IntegerField,TextAreaField,TextField
from wtforms.validators import Length,InputRequired,regexp,Regexp,EqualTo,Email
from wtforms import Form

class CreateAlbumForm(Form):
    album_title = StringField(validators=[Length(min=1,max=10,message='相册名为1-10个字符')])
    desc = TextField(validators=[InputRequired(message='请输入简介')])

class CommentForm(Form):
    album_id = StringField(validators=[InputRequired(message='请传入相册Id')])
    content = TextField(validators=[InputRequired(message='请输入评论内容')])

class AcommentForm(Form):
    album_id = StringField(validators=[InputRequired(message='请传入相册Id')])
    content = TextField(validators=[InputRequired(message='请输入评论内容')])
    comment_id = IntegerField(validators=[InputRequired(message='请传入评论id')])