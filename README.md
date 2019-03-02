`大型FLask CMS管理系统`

flask大型cms系统
`部分相关：`
```bash
三方登陆：微博登陆 三方登陆流程(https://blog.csdn.net/qq_42239520/article/details/85851232)

支付：PaysApi

基于Pyhon3.6的大型CMS管理系统

内容存储：mysql

图片存储：阿里云对象存储oss

邮箱注册: flask_email  邮件支持流程(https://blog.csdn.net/qq_42239520/article/details/80368733)

邮箱验证码：redis

celery email task
...... 

```


** How to use **
```bash
# 克隆到本地
git clone https://github.com/1417766861/mycms

# 安装依赖
pip install -r requiremets.text

# 数据库迁移
python manage.py db migrate

# 映射数据库
python manage.py db upgrade

#管理员创建：
python manage.py add_cms_user -u your_username -p your_passowrd -e your_email

#快捷创建前端用户
python manage.py add_front_user -u your_username -p your_passowrd -e your_email

```

`前台部分展示：`
GIF: https://flask-callback.oss-cn-hangzhou.aliyuncs.com/99.gif

`后台部分截图：`

![在这里插入图片描述](https://img-blog.csdnimg.cn/2019030121564570.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMjM5NTIw,size_16,color_FFFFFF,t_70)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190301215701465.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMjM5NTIw,size_16,color_FFFFFF,t_70)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190301215731214.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMjM5NTIw,size_16,color_FFFFFF,t_70)
