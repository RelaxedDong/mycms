$(function () {
    $("#star-btn").click(function (event) {
        event.preventDefault();
        var album_id = $(this).attr('data-album-id');
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            window.location = '/login/'
        }
        zlajax.post({
            'url':'/b/album_star/',
            'data':{
                'album_id':album_id
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('点赞成功');
                    var count = $("#stars-count").text();
                    count = parseInt(count)+1;
                    $("#stars-count").text(count)
                }else{
                    swal(data['message'],'','error')
                }
            }
        })
    });

    $("#comment-btn").click(function (event) {
        event.preventDefault();
        var content = $("#comment-content").val();
        var album_id = $(this).attr('data-album-id');
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            window.location = '/login/'
        }
        zlajax.post({
            'url':'/b/comment/',
            'data':{
                'content':content,
                'album_id':album_id
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('评论成功');
                    $("#comment-content").val("");
                    setTimeout(function () {
                        window.location.reload()
                    },1000)
                }else{
                    swal(data['message'],'','error')
                }
            }
        })
    });
        var is_open = 0;
    $(".huifu").click(function (event) {
         event.preventDefault();
        var chil = $(this).parent().parent()[0].lastElementChild;
        if(is_open==0){
            chil.style.display = 'block';
            is_open = 1;
        }else{
            chil.style.display = 'none';
            is_open = 0;
        }
    })

      $(function () {
        $(".acomment").click(function (event) {
            event.preventDefault();
            var comment_id = $(this).attr('data-comment-id');
            var album_id = $(this).attr('data-album-id');
            var comment_content = $(this).prev().val();
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录哦~','');
            return;
        }
            zlajax.post({
                'url':'/b/acomment/',
                'data':{
                    'comment_id':comment_id,
                    'album_id':album_id,
                    'content':comment_content,
                },
                'success':function (data) {
                    if(data['code']==200){
                        swal('恭喜，评论成功~')
                        setTimeout(function () {
                            window.location.reload();
                        },500)
                    }else{
                        swal(data['message'],'','error')
                    }
                }
            })
        })
        $(".delete-btn").click(function () {
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录哦~','');
            return;
        }
            var comment_id = $(this).attr('data-comment-id');
            var par = $(this).parent().parent().parent()
            var comment_count = $(".co-count").text();
             zlalert.alertConfirm({
                 "cancelText": "取消",
                 "confirmText": "确定",
                 "msg": "确定要删除这条评论？",
                 "confirmCallback": function () {
                 zlajax.post({
                                'url':'/b/delcomment/',
                                'data':{
                                    'comment_id':comment_id,
                                },
                                'success':function (data) {
                                    if(data['code']==200){
                                        swal('删除成功','','success')
                                        par.empty()
                                         comment_count = parseInt(comment_count-1);
                                         $(".co-count").text(comment_count);
                                    }else{
                                        swal('网络错误,请稍后再试~');
                                    }
                                }
                            })
                 }
             })

        })
    })
})