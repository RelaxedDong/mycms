$(function () {
    $("#submit-btn").click(function (event) {
        event.preventDefault();
        var email = $("input[name='email']").val();
        var password = $("input[name='password']").val();
        console.log(email,password);
        zlajax.post({
            'url':'/cms/login/',
            'data':{
                'email':email,
                'password':password
            },
            'success':function (data) {
                if(data['code']==200){
                   window.location.href = '/cms/index/';
                    console.log('登录成功！')
                }else{
                    zlalert.alertInfoToast(data['message'])
                }
            }
        })
    })

})