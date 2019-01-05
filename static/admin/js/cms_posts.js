$(function () {

    $("#vue").css('display', 'none');
    new Vue({
        el: '#demo',
        delimiters: ['[[', ']]'],
        data: {
            posts: [],
        },
        methods: {
            Search: function () {
                var post_name = $("input[name='post_name']").val();
                var vm = this;
                zlajax.post({
                    'url': '/search/',
                    async: false,
                    'data': {
                        'title': post_name,
                        'post_id': '',
                        'type': '',
                    },
                    'success': function (data) {
                        if (data['code'] == 200) {
                            $("#jinjia").hide();
                            $("#vue").show();
                            var posts = [];
                            var posts_return = data['data'];
                            for (var i = 0; i < posts_return.length; i++) {
                                var my_title = posts_return[i].title.replace(post_name, '<span style="color: red">' + post_name + '</span>');
                                var my_content = posts_return[i].content.replace(post_name, '<span style="color: red">' + post_name + '</span>');
                                my_title = my_title.substr(0, 50)
                                my_content = my_content.substr(0, 50)
                                posts.push(
                                    {
                                        'title': my_title,
                                        'content': my_content,
                                        'nickname': posts_return[i].nickname,
                                        'email': posts_return[i].email,
                                        'read_count': posts_return[i].read_count,
                                        'comment_count': posts_return[i].comment_count,
                                        'create_time': posts_return[i].create_time,
                                        'cover': posts_return[i].cover,
                                        'post_id': posts_return[i].id,
                                        'avatar': posts_return[i].avatar,
                                        'hight_light': posts_return[i].hight_light,
                                        'user_id': posts_return[i].user_id
                                    }
                                )
                            }
                            vm.posts = posts;
                        } else {
                            swal('帖子不存在');
                        }
                    }
                })
            },
            hightlight: function (a) {
                var post_id = a.target.attributes.post_id.nodeValue;
                var type = a.target.attributes.type.nodeValue;
                var that = this;
                var msg;
                zlajax.post({
                    'url': '/cms/hight_light/',
                    'data': {
                        'post_id': post_id,
                        'type': type,
                    },
                    'success': function (data) {
                        if (type == 'de_hilight') {
                            that.Search().click();
                        } else {
                            msg = '加精成功'
                        }
                        if (data['code'] == 200) {
                            that.Search().click();
                        } else {
                            swal(data['message'], 'error')
                        }
                    }
                })
            },
            delpost: function (e) {
                var post_id = e.target.attributes.post_id.nodeValue;
                var current = e.target
                var par = $(current).parent().parent();
                var that = this;
                zlalert.alertConfirm({
                    "cancelText": "取消",
                    "confirmText": "确定",
                    "msg": "确定要删除帖子？",
                    "confirmCallback": function () {
                        zlajax.post({
                            'url': '/cms/posts/',
                            'data': {
                                'post_id': post_id
                            },
                            'success': function (data) {
                                if (data['code'] == 200) {
                                    swal('删除成功');
                                    par.empty();
                                }
                            }
                        })
                    }
                })
            }
        }
    })
})


$(function () {
    var open = 0;
    $("#checkAll").click(function () {
        if (open === 0) {
            $("input[type='checkbox']").attr('checked', true);
            open = 1
        } else {
            $("input[type='checkbox']").attr("checked", false);
            open = 0
        }
        // $("input[type='checkbox']").prop("checked",$(this).prop("checked"));
    })
    $("#group-del").click(function () {
        var comment_ids = [];
        var comments_ches = $('input:checkbox:checked')
        if (comments_ches.length === 0) {
            swal('请勾选需要删除的帖子')
            return;
        }
        for (var i = 0; i < comments_ches.length; i++) {
            var cro = comments_ches[i].getAttribute('data-post-id');
            comment_ids.push(cro)
            var par = comments_ches[i].parentNode.parentNode
        }
        zlalert.alertConfirm({
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "确定要删除帖子吗？",
            "confirmCallback": function () {
                zlajax.post({
                    'url': '/cms/post_large_del/',
                    'data': {
                        'comment_ids': comment_ids.toString(),
                    },
                    'success': function (data) {
                        if (data['code'] == 200) {
                            swal('删除成功')
                            for (var i = 0; i < comments_ches.length; i++) {
                                var cro = comments_ches[i].getAttribute('data-post-id');
                                var par = comments_ches[i].parentNode.parentNode
                                par.remove();
                            }
                        } else {
                            swal('删除失败', '', 'error')
                        }
                    }
                })
            }
        })
    })
})

$(function () {
    $(".hight-light-btn").click(function (event) {
        event.preventDefault();
        var msg;
        var type = $(this).attr('data-type');
        var post_id = $(this).parent().parent().attr('data-post-id')
        zlajax.post({
            'url': '/cms/hight_light/',
            'data': {
                'post_id': post_id,
                'type': type,
            },
            'success': function (data) {
                if (type == 'de_hilight') {
                    msg = '取消加精成功'
                } else {
                    msg = '加精成功'
                }
                if (data['code'] == 200) {
                    swal('提示', msg);
                    setTimeout(function () {
                        window.location.reload()
                    }, 1000)
                } else {
                    swal(data['message'], 'error')
                }
            }
        })
    })
    $(".del-btn").click(function () {
        var post_id = $(this).attr('data-id');
        console.log(post_id);
        zlalert.alertConfirm({
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "确定要删除帖子？",
            "confirmCallback": function () {
                zlajax.post({
                    'url': '/cms/posts/',
                    'data': {
                        'post_id': post_id
                    },
                    'success': function (data) {
                        if (data['code'] == 200) {
                            swal('删除成功');
                            setTimeout(function () {
                                window.location.reload()
                            }, 500)
                        }
                    }
                })
            }
        })
    })
})