/****************************************************************
 *                                                                *
 *                              素材火                            *
 *                        www.sucaihuo.com                            *
 *              努力创建完善、持续更新插件以及模板            *
 *                                                                *
 ****************************************************************/


$(function () {
    $("#login_btn-1").click(function (event) {
        event.preventDefault();
        var email = $("input[name='email']").val();
        var password = $("input[name='password']").val();
        if(!email){
            swal('请输入邮箱','','error')
            return;
        }
        if(!password){
            swal('请输入密码','','error')
            return;
        }
        zlajax.post({
            'url':'/login/',
            'data':{
                'email':email,
                'password':password
            },
            'success':function (data) {
                if(data['code']==200){
                    var return_to = $("#return_to_span").text();
                    console.log(return_to);
                    if(return_to){
                        window.location = return_to;
                    }else{
                        window.location = '/';
                    }
                }else{
                    swal(data['message'],'','error')
                }
            }
        })
    })
})