$(function () {
    $(".freeze-btn").click(function () {
        var user_id = $(this).parent().parent().attr('data-id');
        var type = $(this).attr('data-type');
        zlajax.post({
            'url':'/cms/freeze/',
            'data':{
                'user_id':user_id,
                'type':type,
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('操作成功');
                    setTimeout(function () {
                        window.location.reload()
                    },200)
                }
            }
        })
    })
})