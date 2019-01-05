var src = '';

function mysplit() {
    var src = '/c/captcha/?xx=' + Math.random();
    return src;
}
var i = 60;

function countDown() {
    i = i - 1;
    $(".send-now").html(i + "秒后重新发送");
    if (i == 0) {
        $(".send-now").html("发送邮箱验证码");
        $(".send-now").css('pointer-events','visible')
        $(".send-now").css('background-color','#90EE90');
        i = 60;
        return;
    }
    setTimeout('countDown()',1000);
}

$(function () {
    $(".send-now").click(function () {
        var email = $("input[name='email']").val();
        if(!email){
            swal('请输入邮箱','','error');
            return;
        }
        countDown();
        $(this).css('pointer-events','none');
        $(this).css('background-color','#FFB6C1');
      swal('发送邮箱验证码中。。。');
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
        $("#captcha_img").click(function (event) {
        src = '';
        event.preventDefault();
        var self = $(this);
        var src = self.attr('src');
        var newsrc = mysplit();
        self.attr('src', newsrc)
    });

    $(".getnow").click(function () {
        var email = $("input[name='email']").val();
        var email_captcha = $("input[name='pca']").val();
        var captcha = $("input[name='captcha']").val();
        var password = $("input[name='pwd']").val();
        if(!email||!email_captcha||!captcha||!password){
        swal('请输入完整信息');
        return;
        }
        if(password.length<6||password.length>15){
           swal('设置为6~15位的密码');
           return;
    }
        zlajax.post({
            'url':'/forgetpwd/',
            'data':{
                'email':email,
                'email_captcha':email_captcha,
                'captcha':captcha,
                'newpwd':password,
            },
              'success':function (data) {
                    if(data['code'] == 200){
                      swal('恭喜','密码找回成功,即将返回登录页面','','success');
                      setTimeout(function () {
                          window.location = '/login/'
                      },2000)
                    }else{
                       swal('注册失败',data['message'],'error');
                       $("#captcha_img").click()
                    }
                }
        })
    })
})