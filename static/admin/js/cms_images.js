$(function () {
        $("#large_img_del").click(function () {
            var click_imgs = []
            var imgs_ches = $('input:checkbox:checked');
            if (imgs_ches.length === 0) {
            swal('请勾选需要删除的相册')
                return;
            }
            for (var i = 0; i < imgs_ches.length; i++) {
            var cro = imgs_ches[i].getAttribute('data-album-id');
            click_imgs.push(cro)
            var par = imgs_ches[i].parentNode.parentNode
            }
            zlalert.alertConfirm({
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "确定要删除图片吗？",
            "confirmCallback": function () {
                zlajax.post({
                    'url': '/cms/img_large_del/',
                    'data': {
                        'imgs_ids': click_imgs.toString(),
                    },
                    'success': function (data) {
                        if (data['code'] == 200) {
                            swal('删除成功，么么哒~','','success')
                            for (var i = 0; i < imgs_ches.length; i++) {
                                var cro = imgs_ches[i].getAttribute('data-post-id');
                                var par = imgs_ches[i].parentNode.parentNode.parentNode.parentNode
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