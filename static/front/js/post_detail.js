$(function () {

    $("#language").css('display','none')
    $(".star-btn").click(function (event) {
        event.preventDefault();
        var post_id = $(this).parent().attr('data-post-id');
        var islogin = $("#login-span").attr('data-login-user');
        if (!islogin) {
            window.location = '/login/'
        }
        zlajax.post({
            'url': '/post_star/',
            'data': {
                'post_id': post_id
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    var myreturn = data['data'];
                    var count = $("#stars-count").text();
                    if (myreturn === 'cancel') {
                        count = parseInt(count) - 1;
                    } else {
                        count = parseInt(count) + 1;
                    }
                    $("#stars-count").text(count)
                } else {
                    swal(data['message'], '', 'error')
                }
            }
        })
    });
    $("#collect-btn").click(function (event) {
        event.preventDefault();
        var post_id = $(this).parent().attr('data-post-id');
        var islogin = $("#login-span").attr('data-login-user');
        if (!islogin) {
            window.location = '/login/'
        }
        zlajax.post({
            'url': '/post_collect/',
            'data': {
                'post_id': post_id
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    var myreturn = data['data'];
                    var count = $("#collect-count").text();
                    if (myreturn === 'delete') {
                        count = parseInt(count) - 1;
                        swal('取消收藏成功');
                    } else {
                        count = parseInt(count) + 1;
                        swal('收藏成功');
                    }
                    $("#collect-count").text(count)
                } else {
                    swal(data['message'], '', 'error')
                }
            }
        })
    });
    $("#comment-btn").click(function (event) {
        event.preventDefault();
        var content = $("#comment-content").val();
        var post_id = $(this).parent().attr('data-post-id');
        var islogin = $("#login-span").attr('data-login-user');
        if (!islogin) {
            window.location = '/login/'
        }
        zlajax.post({
            'url': '/comment/',
            'data': {
                'content': content,
                'post_id': post_id
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    swal('评论成功');
                    $("#comment-content").val("");
                    setTimeout(function () {
                        window.location.reload()
                    }, 1000)
                } else {
                    swal(data['message'], '', 'error')
                }
            }
        })
    });


    var is_open = 0;
    $(".huifu").click(function (event) {
        event.preventDefault();
        var chil = $(this).parent().parent()[0].lastElementChild;
        if (is_open == 0) {
            chil.style.display = 'block';
            is_open = 1;
        } else {
            chil.style.display = 'none';
            is_open = 0;
        }
    })

        $(".acomment").click(function (event) {
            event.preventDefault();
            var comment_id = $(this).attr('data-comment-id');
            var post_id = $(this).attr('data-post-id');
            var comment_content = $(this).prev().val();
            var islogin = $("#login-span").attr('data-login-user');
            if (!islogin) {
                swal('请先登录哦~', '');
                return;
            }
            zlajax.post({
                'url': '/acomment/',
                'data': {
                    'comment_id': comment_id,
                    'post_id': post_id,
                    'content': comment_content,
                },
                'success': function (data) {
                    if (data['code'] == 200) {
                        swal('恭喜，评论成功~')
                        setTimeout(function () {
                            window.location.reload();
                        }, 500)
                    } else {
                        swal(data['message'], '', 'error')
                    }
                }
            })
        })
        $(".delete-btn").click(function () {
            var comment_id = $(this).attr('data-comment-id');
            var par = $(this).parent().parent().parent();
            zlalert.alertConfirm({
                "cancelText": "取消",
                "confirmText": "确定",
                "msg": "确定要删除这条评论？",
                "confirmCallback": function () {
                    zlajax.post({
                        'url': '/delcomment/',
                        'data': {
                            'comment_id': comment_id,
                        },
                        'success': function (data) {
                            if (data['code'] == 200) {
                                swal('删除成功', '', 'success')
                                par.empty();
                            } else {
                                swal('网络错误,请稍后再试~');
                            }
                        }
                    })
                }
            })
        })
})

