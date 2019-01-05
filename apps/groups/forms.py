#encoding:utf-8
from wtforms import StringField,IntegerField,TextAreaField,TextField
from wtforms.validators import Length,InputRequired,regexp,Regexp,EqualTo,Email
from wtforms import Form

class CreateGroupForm(Form):
    group_img = StringField(validators=[InputRequired(message='请输入图片连接地址')])
    group_name = StringField(validators=[InputRequired(message='请输入组名'),Length(min=1,max=10,message='组名为1~10字符')])
    desc = TextField(validators=[InputRequired(message='请输入简介')])



class TopicForm(Form):
    title = StringField(validators=[InputRequired(message='请输入标题')])
    content = TextField(validators=[InputRequired(message='请输入内容')])
    group_id = IntegerField()

class Updesc(Form):
    group_id = StringField(validators=[InputRequired(message='组不存在')])
    desc = TextField(validators=[InputRequired(message='请输入内容')])