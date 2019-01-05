$(function () {
    $("#delete_all").click(function (event) {
        event.preventDefault();
        zlalert.alertConfirm({
            'title': '提示',
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "你确实要删除最新消息列表？",
            "confirmCallback": function () {
                zlajax.post({
                    'url': '/drop_all_new/',
                    'data': {},
                    'success': function (data) {
                        if (data['code'] == 200) {
                            window.location.reload()
                        } else {
                            swal('网络错误', '', 'error')
                        }
                    }
                })
            }
        })
    })
    $(".del-new-1").click(function (event) {
        var sender_id = $(this).attr('data-sender-id');
        zlalert.alertConfirm({
            'title': '提示',
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "确定要删除此条对话？",
            "confirmCallback": function () {
                zlajax.post({
                    'url': '/del_one_new/',
                    'data': {
                        'sender_id': sender_id
                    },
                 'success': function (data) {
                        if (data['code'] == 200) {
                            window.location.reload()
                        } else {
                            swal('网络错误', '', 'error')
                        }
                    }
                })

            }
        })
    })
})