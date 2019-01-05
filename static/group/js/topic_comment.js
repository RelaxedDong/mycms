$(function () {
    $("#topic-del").click(function (event) {
       event.preventDefault();
       var topic_id = $(this).attr('data-id');
       var group_id = $(this).attr('data-group-id');
       zlajax.post({
           'url':'/g/detopic/',
           'data':{
               'topic_id':topic_id
           },
           'success':function (data) {
               if(data['code']==200){
                   swal('删除成功');
                   setTimeout(function () {
                   window.location.href = '/g/group_detail/'+group_id;
                   },1000)
               }else{
                   swal('网络错误')
               }
           }
       })
    })


    var is_open = 0;
    $(".topic-huifu").click(function (event) {
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


    $("#topic-comment-btn").click(function (event) {
        event.preventDefault();
        var comment = $("#topic-comment").val();
        var islogin = $("#login-span").attr('data-login-user');
        var topic_id = $(this).attr('data-topic-id');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        if(comment.length ==0){
            swal('请输入评论~');
            return;
        }
        zlajax.post({
            'url':'/g/atopiccomemnt/',
            'data':{
                'comment':comment,
                'topic_id':topic_id
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('恭喜,评论成功','','success')
                    setTimeout(function () {
                        window.location.reload()
                    },500)
                }else{
                    swal(data['message'],'','error')
                }
            }
        })
    })

    $(".topic-acomment").click(function (event) {
        event.preventDefault();
        var comment_id = $(this).attr('data-comment-id');
        var topic_id = $(this).attr('data-topic-id');
        var comment = $(this).prev().val();
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        if(comment.length==0){
            swal('请输入评论~');
            return;
        }
        zlajax.post({
            'url':'/g/add_atopiccomemnt/',
            'data':{
                'comment_id':comment_id,
                'topic_id':topic_id,
                'comment':comment,
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('恭喜,评论成功','','success')
                    setTimeout(function () {
                        window.location.reload()
                    },500)
                }else{
                    swal('网络错误，请稍后再试~','','error')
                }
            }
        })
    })
    $(".topic-comment-delete").click(function (event) {
        event.preventDefault();
        var comment_id = $(this).attr('data-comment-id')
        zlajax.post({
            'url':'/g/detopiccommet/',
            'data':{
                'comment_id':comment_id
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('删除成功','','success')
                     setTimeout(function () {
                        window.location.reload()
                    },500)
                }else{
                    swal('网络错误，请稍后再试~','','error')
                }

            }
        })
    })
})