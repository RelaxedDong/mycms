$(function () {
    $(".del-btn").click(function () {
        var comment_id = $(this).parent().parent().attr('data-id')
        zlajax.post({
            'url':'/cms/comments/',
            'data':{
                'comment_id':comment_id,
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('删除成功')
                    setTimeout(function () {
                      window.location.reload()
                    },500)
                }
            }
        })
    })
})