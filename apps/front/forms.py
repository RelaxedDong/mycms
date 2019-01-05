#encoding:utf-8
from wtforms import StringField,IntegerField,TextAreaField,TextField
from wtforms.validators import Length,InputRequired,regexp,Regexp,EqualTo,Email
from wtforms import Form
from apps.front.tools import cache
from wtforms import ValidationError
from utils import mychache

class SignUpForm(Form):
    email = StringField(validators=[Email(message='请输入正确格式的邮箱！')])
    password1 = StringField(validators=[Length(6,15,message='请输入正确格式的密码')])
    password2 = StringField(validators=[EqualTo("password1",message='两次输入的密码不一致！')])
    captcha = StringField(validators=[Length(min=4, max=4, message='请输入正确长度的验证码！')])
    def validate_captcha(self,field):
        email = self.email.data
        captcha = field.data
        captcha_cache = cache.get(email)
        if not captcha_cache or captcha.lower() != captcha_cache.lower():
            raise ValidationError('邮箱验证码错误！')


class LoginForm(Form):
    email = StringField(validators=[Length(5,20,message='邮箱长度不正确'),InputRequired(message='请输入工号')])
    password = StringField(validators=[Length(5, 20, message='密码长度不对')])


class ApostForm(Form):
    title = StringField(validators=[InputRequired(message='请输入标题')])
    content = TextField(validators=[InputRequired(message='请输入内容')])


class Setting_profile_Form(Form):
    qq = StringField()
    gender = StringField()
    real_name = StringField()
    my_web = StringField()
    desc = TextField(validators=[Length(0,100,message='简介长度过长')])

class PostIdForm(Form):
    post_id = StringField(validators=[InputRequired(message='请传入帖子Id')])

class CommentForm(Form):
    post_id = StringField(validators=[InputRequired(message='请传入帖子Id')])
    content = TextField(validators=[InputRequired(message='请输入评论内容')])

class FocusForm(Form):
    own_user_id = StringField(validators=[InputRequired(message='请传入关注用户id')])

class AcommentForm(Form):
    post_id = StringField(validators=[InputRequired(message='请传入帖子Id')])
    content = TextField(validators=[InputRequired(message='请输入评论内容')])
    comment_id = IntegerField(validators=[InputRequired(message='请传入评论id')])

class ResetPwdForm(Form):
    oldpwd = StringField(validators=[InputRequired(message='请输旧新密码'), Length(6, 18, message='密码长度不正确')])
    newpwd = StringField(validators=[InputRequired(message='请输入新密码'), Length(6, 18, message='密码长度不正确')])
    captcha = StringField(validators=[Length(min=4,max=4,message='验证码长度不正确')])
    def validate_captcha(self,field):
        inputcaptcha = field.data
        getcaptcha = cache.get(inputcaptcha)
        if not getcaptcha or getcaptcha.lower()!=inputcaptcha.lower():
            raise ValidationError('验证码错误！')




class SendMsgModel(Form):
    reciver_id = StringField(validators=[InputRequired(message='请传入接收者Id')])
    content = TextField(validators=[InputRequired(message='请输入内容！')])

class MyErrorForm(Form):
    user_id = StringField(validators=[InputRequired(message='没有登陆')])
    type = StringField()
    url = StringField(validators=[InputRequired(message='目标不存在')])
    bereport_id = StringField(validators=[InputRequired(message='对象不存在')])
    desc = TextField(validators=[InputRequired(message='请输入举报理由，不少于10个字符'),Length(10,80,message='理由长度不对')])


class ForgetpwdForm(Form):
    email = StringField(validators=[Email(message='请输入正确格式的邮箱！')])
    newpwd = StringField(validators=[InputRequired(message='请输入新密码'), Length(6, 18, message='密码长度不正确')])
    captcha = StringField(validators=[Length(min=4, max=4, message='验证码长度不正确')])
    email_captcha = StringField(validators=[Length(min=4, max=4, message='请输入正确长度的邮箱验证码！')])
    def validate_email_captcha(self,field):
        email = self.email.data
        captcha = field.data
        captcha_cache = cache.get(email)
        if not captcha_cache or captcha.lower() != captcha_cache.lower():
            raise ValidationError('邮箱验证码错误！')

    def validate_captcha(self,field):
        inputcaptcha = field.data
        getcaptcha = cache.get(inputcaptcha)
        if not getcaptcha or getcaptcha.lower()!=inputcaptcha.lower():
            raise ValidationError('验证码错误！')

class BindWeiboForm(Form):
    email = StringField(validators=[Email(message='请输入正确格式的邮箱！')])