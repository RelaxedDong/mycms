$(document).on("click", '.error-eit', function () {
    var type = $(this).attr('data-type');
    var error_id = $(this).attr('data-error-id');
    var par = $(this).parent();
    if (type === 'waite_handle') {
        par.html('<a class="ui green label error-eit" data-type="have_handle" data-error-id="' + error_id + '">已处理</a>')
    } else {
        par.html('<a class="ui red label error-eit" data-type="waite_handle" data-error-id="' + error_id + '">待处理</a>')
    }

    zlajax.post({
        'url': '/cms/error_type/',
        'data': {
            'error_id': error_id
        },
        'success': function (data) {
            if (data['code'] == 200) {
                swal('操作成功')
            } else {
                swal(data['message'], '', 'error');
            }
        }
    })
})

$(function () {
    $(".del-error").click(function () {
        var error_id = $(this).attr('data-error-id');
        var par = $(this).parent().parent();
        zlalert.alertConfirm({
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "确定要删除？",
            "confirmCallback": function () {
                zlajax.post({
                    'url': '/cms/handle/',
                    'data': {
                        'error_id': error_id
                    },
                    'success': function (data) {
                        if (data['code'] == 200) {
                            swal('删除成功')
                            par.empty()
                        } else {
                            swal(data['message'], '', 'error')
                        }
                    }
                })
            }
        })
    })
})