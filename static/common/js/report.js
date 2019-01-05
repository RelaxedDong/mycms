$(function () {
    $(".port_now").click(function () {
        var islogin = $("#login-span").attr('data-login-user');
        var user_id = $(this).attr('data-user-id');
        var url = window.location.href;
        var type = $(this).attr('data-type')
        var bereport_id = $(this).attr('data-bereport-id')
        if (!islogin) {
            swal('请先登录');
            return;
        }
        var desc = $("#port_desc").val();

        if(desc.length<10){
            swal('最少10个字符','','error');
            return;
        }
                zlajax.post({
                    'url':'/report/',
                    'data':{
                        'desc':desc,
                        'user_id':user_id,
                        'bereport_id':bereport_id,
                        'url':url,
                        'type':type
                    },
                    'success':function (data) {
                        if(data['code']==200){
                            swal('举报成功，请待管理员处理')
                            $('.clo').click()
                        }else{
                            swal(data['message'],'','error')
                        }
            }
        })
    })
})