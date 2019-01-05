#encoding:utf-8
from wtforms import StringField,IntegerField,TextAreaField,TextField
from wtforms.validators import Length,InputRequired,regexp,Regexp,EqualTo
from wtforms import Form


class LoginForm(Form):
    email = StringField(validators=[Length(5,20,message='邮箱长度不正确'),InputRequired(message='请输入工号')])
    password = StringField(validators=[Length(5, 20, message='密码长度不对')])

class ResetpwdForm(Form):
    oldpwd = StringField(validators=[InputRequired(message='请输旧新密码'),Length(6,18,message='密码长度不正确')])
    newpwd = StringField(validators=[InputRequired(message='请输入新密码'),Length(6,18,message='密码长度不正确')])
    newpwd2 = StringField(validators=[EqualTo('newpwd',message='确认密码必须和新密码保持一致')])


#添加banner
class Abanner(Form):
    filename = StringField(validators=[InputRequired(message='请选择插入的图片！')])
    banner_content = TextField()
    link_url = StringField(validators=[InputRequired(message='请输入跳转链接')])
    priority = IntegerField(validators=[InputRequired(message='请输入权重')])

#删除banner
class BannerForm(Form):
    banner_id = StringField(validators=[InputRequired(message='请传入banner  id')])


