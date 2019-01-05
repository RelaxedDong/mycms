$(function () {
    $("#create_now").click(function(event){
        event.preventDefault();
        var album_title = $("input[name='album_name']").val();
        var desc = $("#desc").val();
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        zlajax.post({
            'url':'/b/create_album/',
            'data':{
                'album_title':album_title,
                'desc':desc,
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('恭喜,'+album_title+'相册创建成功','','success')
                    setTimeout(function () {
                        window.location.reload()
                    },500)
                }else{
                    swal(data['message'],'','error')
                }
            }
        })
    })
})