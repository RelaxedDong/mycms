$(function () {
    $("#save-pro-btn").click(function () {
    var gender = $("input[type='radio']:checked").val();
    var qq = $("input[name='qq']").val();
    var real_name = $("input[name='real-name']").val();
    var my_web = $("input[name='my-web']").val();
    var desc = $("#desc").val();
    zlajax.post({
        'url':'/setting_profile/',
        'data':{
            'gender':gender,
            'qq':qq,
            'real_name':real_name,
            'my_web':my_web,
            'desc':desc,
        },
        'success':function (data) {
            if(data['code']==200){
                swal('修改成功');
                setTimeout(function () {
                    window.location.reload();
                },500)
            }else{swal(data['message'],'','error')}
        }
    })
})
})