$(function () {
    $("#send-capcha").click(function (event) {
        event.preventDefault();
        swal('发送邮箱验证码中。。。');
        var email = $("input[name='email']").val();
        if(!email){
            swal('请输入邮箱','','error');
            return;
        }
        zlajax.get({
            'url':'/c/send_captcha/',
            'data':{
                'email':email
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('邮箱短信发送完成，请注意接收！','','success')
                }else{
                    swal(data['message'])
                }
            }
        })
    })

    $("#signup-now").click(function (event) {
        event.preventDefault();
        var email = $("input[name='email']").val();
        var email_captcha = $("input[name='email-captcha']").val();
        var password1 = $("input[name='password1']").val();
        var password2 = $("input[name='password2']").val();
          if(!email||!email_captcha||!password1||!password2){
        swal('请输入完整信息');
        return;
        }
        if(password1.length<6||password1.length>15){
           swal('设置为6~15位的密码');
           return;
    }
        zlajax.post({
            'url':'/signup/',
            'data':{
                'email':email,
                'captcha':email_captcha,
                'password1':password1,
                'password2':password2,
            },
              'success':function (data) {
                    if(data['code'] == 200){
                      swal('恭喜','账号注册成功','','success');
                      setTimeout(function () {
                          window.location.href = '/'
                      },1500)
                    }else{
                       swal('注册失败',data['message'],'error');
                    }
                }
        })

    })
})