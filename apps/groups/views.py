#encoding:utf-8

from flask import Flask,render_template,request,g,Blueprint,redirect,url_for
from apps.front.decorators import login_required
from .forms import CreateGroupForm,TopicForm,Updesc
from exct import db
from apps.front.models import FrontUserModel
from .models import GroupModel,TopicModel,TopicCommentModel,GroupManageModel
from utils import restful
from werkzeug.utils import secure_filename
from .charts import distribution_bar
from apps.front.tools import handle_time
from utils.upload import bucket,change_filename,base_groups_url
bp = Blueprint('group',__name__,url_prefix='/g')
REMOTE_HOST = "https://pyecharts.github.io/assets/js"

def get_error(form):
    message = form.errors.popitem()[1][0]
    return message

@bp.app_template_filter('caractors')
def c(count):
    count = str(count / 1000.0).split('.')
    qian = count[0]
    dian = count[1]
    end = qian + '.' + dian[0] + 'k'
    return end


@bp.route('/')
def index():
    groups = GroupModel.query.order_by(GroupModel.point.desc()).all()
    return  render_template('groups/index.html',groups=groups)

@bp.route('/search/',methods=['POST'])
def search():
    group_name = request.form.get('group_name')
    groups_obj = GroupModel.query.filter(GroupModel.name.contains(group_name)).all()
    groups = []
    if groups_obj:
        for group in groups_obj:
            groups.append({'name':group.name,'create_time':handle_time(group.create_time),'avatar':group.avatar,'users':len(group.users),
                           'desc':group.desc,'id':group.id})
        return restful.success(data=groups)
    else:
        return restful.params_error()


@bp.app_template_filter('create_time')
def create_time(time):
    ce = str(time).split(" ")[0]
    return ce


@bp.route('/crgroup/',methods=['GET','POST'])
@login_required
def crgroup():
    if request.method == 'GET':
        return render_template('groups/create_group.html')
    else:
        form = CreateGroupForm(request.form)
        if form.validate():
            user = g.front_user
            group_img = form.group_img.data
            group_name = form.group_name.data
            desc = form.desc.data
            group = GroupModel(name=group_name,create_user=user.id,desc=desc,avatar=group_img)
            group.point = 5
            user.groups.append(group)
            db.session.add(group)
            db.session.commit()
            return restful.success()
        else:
            return restful.params_error(get_error(form))

@bp.route('/joingroup/',methods=['POST'])
@login_required
def joingroup():
    group_id = request.form.get('group_id')
    user = g.front_user
    group = GroupModel.query.get(group_id)
    if group and user not in group.users:
        group.point +=3
        user.groups.append(group)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message='组不存在')

@bp.route('/group_detail/<group_id>')
def group_detail(group_id):
    topics = TopicModel.query.filter_by(group_id=group_id).all()
    group = GroupModel.query.get(group_id)
    managers_id = [user.author_id for user in group.managers]
    create_user = group.create_user
    user = FrontUserModel.query.get(create_user)
    users = group.users
    context = {
        'create_user':user,
        'managers_id':managers_id,
        'group':group,
        'users':users,
        'topics':topics
    }
    return render_template('groups/group_detail.html',**context)


@bp.route('/group_atopic/',methods=['GET','POST'])
@login_required
def group_atopic():
    if request.method == 'GET':
        group_id = request.args.get('group')
        group = GroupModel.query.get(group_id)
        return render_template('groups/atopic.html',group_id=group_id,group=group)
    else:
        form = TopicForm(request.form)
        if form.validate():
            title = form.title.data
            group_id = form.group_id.data
            content = form.content.data
            topic = TopicModel(title=title,content=content)
            group = GroupModel.query.get(group_id)
            group.point+=3
            topic.author = g.front_user
            topic.group = group
            db.session.add(topic)
            db.session.commit()
            return restful.success()
        else:
            return restful.params_error(message=get_error(form))

@bp.route('/topic_detail/<topic_id>')
def topic_detail(topic_id):
    topic = TopicModel.query.get(topic_id)
    group_id = topic.group.id
    group = GroupModel.query.get(group_id)
    managers_id = [user.author_id for user in group.managers]
    comments = TopicCommentModel.query.filter_by(topic_id=topic_id).order_by(TopicCommentModel.create_time.desc()).all()
    return render_template('groups/topic_detail.html',topic=topic,comments=comments,managers_id=managers_id)


@bp.route('/atopiccomemnt/',methods=['POST'])
@login_required
def atopiccomemnt():
    comment = request.form.get('comment')
    topic_id = request.form.get('topic_id')
    user = g.front_user
    topic = TopicModel.query.get(topic_id)
    if comment and topic_id:
        tco = TopicCommentModel(content=comment)
        tco.topic = topic
        tco.topic.group.point+=2
        tco.author = user
        db.session.add(tco)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message='话题不存在')

@bp.route('/add_atopiccomemnt/',methods=['POST'])
@login_required
def add_atopiccomemnt():
    comment = request.form.get('comment')
    topic_id = request.form.get('topic_id')
    comment_id = request.form.get('comment_id')
    comment_obj = TopicCommentModel(content=comment,topic_id=topic_id,origin_comment_id=comment_id)
    comment_obj.author = g.front_user
    db.session.add(comment_obj)
    db.session.commit()
    return restful.success()

@bp.route('/detopiccommet/',methods=["POST"])
@login_required
def detopiccommet():
    comment_id = request.form.get('comment_id')
    if comment_id:
        comment = TopicCommentModel.query.get(comment_id)
        db.session.delete(comment)
        db.session.commit()
        return restful.success()
    else:
        return restful.server_error()


@bp.route('/change_group_avatar/',methods=['POST'])
@login_required
def change_group_avatar():
    file = request.files['file']
    file_name = secure_filename(change_filename(file.filename[:2]))
    bucket.put_object('groups/' + file_name+'.jpg', file)
    return_href = base_groups_url + file_name+'.jpg'
    return restful.success(data=return_href)



@bp.route('/updesc/',methods=['POST'])
@login_required
def updesc():
    form = Updesc(request.form)
    if form.validate():
        group_id = form.group_id.data
        desc = form.desc.data
        group = GroupModel.query.get(group_id)
        group.desc = desc
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(get_error(form))
import re
#移除小组
@bp.route('/outgroup/',methods=['POST'])
@login_required
def outgroup():
    group_id = request.form.get('group_id')
    create_user_id = request.form.get('create_user_id')
    group = GroupModel.query.get(group_id)
    email = request.form.get('email')
    if email and create_user_id:
        user = FrontUserModel.query.filter_by(email=email).first()
        if user.id == create_user_id:
            return restful.params_error(message='群主禁止移除~')
        manager = GroupManageModel.query.filter_by(group_id=group_id,author_id=user.id).first()
        if user in group.users:
            if not manager:
                for topic in user.topics:
                    imgs = re.findall(r'<img src="https://donghaocms.oss-cn-beijing.aliyuncs.com/(.*?)"', topic.content,
                                      re.S)
                    if len(imgs) > 0:
                        [bucket.delete_object(img) for img in imgs]
                    db.session.delete(topic)
                user.groups.remove(group)
                db.session.commit()
            else:
                return restful.params_error(message='不能移除管理员')
        else:
            return restful.params_error(message='小组成员不存在~')
    else:
        user = g.front_user
        for topic in user.topics:
            imgs = re.findall(r'<img src="https://donghaocms.oss-cn-beijing.aliyuncs.com/(.*?)"', topic.content, re.S)
            if len(imgs) > 0:
                [bucket.delete_object(img) for img in imgs]
            db.session.delete(topic)
        user.groups.remove(group)
        db.session.commit()
    return restful.success()


@bp.route('/distribution/')
def distribution():
    group_id = request.args.get('gd')
    group = GroupModel.query.get(group_id)
    place =[user.address.split('-')[0] for user in group.users]
    adresses = {}
    for p in place:
        if p in adresses.keys():
            adresses[p] +=1
        else:
            adresses[p] = 1
    bar = distribution_bar(adresses)
    content = {
        'group':group,
        'host':REMOTE_HOST,
        'myechart': bar.render_embed(),
        'jsfile_name':bar.get_js_dependencies()[0],
    }
    return render_template('groups/distribution.html',**content)

@bp.route('/manage_group/')
@login_required
def manage_group():
    group_id = request.args.get('gep')
    group = GroupModel.query.get(group_id)
    managers =  group.managers
    print('1',managers)
    if group.create_user!=g.front_user.id:
        return redirect(url_for("front.index"))
    return render_template('groups/manage.html',group=group,managers=managers)

@bp.route('/amanager/',methods=['POST'])
@login_required
def amanager():
    user_id = request.form.get('user_id')
    group_id = request.form.get('group_id')
    user = FrontUserModel.query.get(user_id)
    group = GroupModel.query.get(group_id)

    managers_id =[user.author_id for user in group.managers]
    if user not in group.users:
        return restful.params_error(message='该成员没在小组中~')
    if user.id == group.create_user:
        return restful.params_error(message='群主不能添加~')
    if user.id in managers_id:
        return restful.params_error('管理员存在~')
    Gp = GroupManageModel(group_id=group_id,author_id=user.id)
    db.session.add(Gp)
    db.session.commit()
    return restful.success()

@bp.route('/demanager/',methods=['POST'])
@login_required
def demanager():
    group_id = request.form.get('group_id')
    user_id = request.form.get('user_id')
    user = FrontUserModel.query.get(user_id)
    if not user:
        return restful.params_error(message='管理员不存在')

    Gp = GroupManageModel.query.filter_by(group_id=group_id, author_id=user_id).first()
    db.session.delete(Gp)
    db.session.commit()
    return restful.success()


@bp.route('/detopic/',methods=['POST'])
@login_required
def detopic():
    topic_id = request.form.get('topic_id')
    topic = TopicModel.query.get(topic_id)
    managers_id = [user.author_id for user in topic.group.managers]
    user = g.front_user
    if topic.author.id != user.id and user.id not in managers_id and user.id!=topic.group.create_user:
        return restful.server_error()
    else:
        comments = TopicCommentModel.query.filter_by(topic_id=topic_id).all()
        for co in comments:
            db.session.delete(co)
        db.session.delete(topic)
        db.session.commit()
        return restful.success()