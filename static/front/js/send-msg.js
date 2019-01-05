$(function () {
    var reciver_id = $("#reciver_id").text();
    zlajax.get({
        'url': '/messagelist/',
        async: false,
        'data': {
            'reciver_id': reciver_id
        },
        'success': function (data) {
            if (data['code'] == 200) {
                var messages = data['data'];
                new Vue({
                    el: '#demo-l',
                    delimiters: ['[[', ']]'],
                    data: {
                        messages: messages,
                        reciver_id_1: reciver_id,
                    }
                })
            } else {
                swal('失败')
            }
        }
    })


    $("#send-msg").click(function (event) {
        event.preventDefault();
        var content = $("#user-msg").val();
        var reciver_id = $(this).attr('data-reciver-id');
        var islogin = $("#login-span").attr('data-login-user');
        if (!islogin) {
            swal('请先登录~');
            return;
        }
        zlajax.post({
            'url': '/chat_send/',
            'data': {
                'reciver_id': reciver_id,
                'content': content,
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    swal('发送成功')
                    $("#user-msg").val('');
                    setTimeout(function () {
                        window.location.reload()
                    }, 500)
                } else {
                    swal(data['message'], '', 'error')
                }
            }
        })
    })
    $("#clear-msg").click(function (event) {
        event.preventDefault();
        var reciver_id = $(this).attr('data-reciver-id')
        zlalert.alertConfirm({
            'title':'警告',
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "销毁消息,对方与你消息也将销毁，确认销毁？",
            "confirmCallback": function () {
                zlajax.post({
                    'url': '/clear_msg/',
                    'data': {
                        'reciver_id': reciver_id
                    },
                    'success': function (data) {
                        if (data['code'] == 200) {
                            swal('销毁成功', '', 'success')
                            setTimeout(function () {
                                window.location.reload()
                            },500)
                        } else {
                            swal('网络错误', '', 'error')
                        }
                    }
                })

            }
        })


    })
})