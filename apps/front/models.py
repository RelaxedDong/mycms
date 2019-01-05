from exct import db
from datetime import datetime
from werkzeug.security import generate_password_hash,check_password_hash
import shortuuid

class FrontUserModel(db.Model):
    __tablename__ = 'front_user'
    id = db.Column(db.String(100),primary_key=True,default=shortuuid.uuid)
    username = db.Column(db.String(50))
    _password = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(50),unique=True,nullable=False)
    telephone = db.Column(db.String(11))
    qq = db.Column(db.String(20),default='未填写')
    avatar = db.Column(db.String(300),default='https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/default.jpg')
    old_avater = db.Column(db.String(300))
    my_web = db.Column(db.String(100))
    address = db.Column(db.String(150))
    weibo_id = db.Column(db.String(80))
    gender = db.Column(db.String(100),default='秘密')
    signature = db.Column(db.Text,default='这家伙很懒，什么都没有留下~')
    join_time = db.Column(db.DateTime,default=datetime.now)
    points = db.Column(db.Integer, default=0)
    nickname = db.Column(db.String(100),default='新用户')
    realname = db.Column(db.String(100),default='未填写')
    charactors = db.Column(db.Integer,default=0)
    is_active = db.Column(db.Integer,default=1)
    color = db.Column(db.String(20),default='#ffffff')

    def __init__(self,*args,**kwargs):
        if 'password' in kwargs:
            self.password = kwargs.get('password')
            kwargs.pop('password')
        super(FrontUserModel, self).__init__(*args,**kwargs)

    @property
    def password(self):
        return self._password

    @password.setter
    def password(self,raw_password):
        self._password = generate_password_hash(raw_password)

    def check_pwd(self,raw_password):
        result = check_password_hash(self.password,raw_password)
        return result