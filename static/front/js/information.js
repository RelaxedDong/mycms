$(function () {
    $(".drop-btn").click(function () {
        var type = $(this).attr('data-type');
        var sender = $(this).attr('data-sender');
        var create_time = $(this).attr('data-create_time');
        var title = $(this).attr('data-title');
        var content = $(this).attr('data-content');
        var post_id = $(this).attr('data-post-id');
        var username = $(this).attr('data-username');
        var par = $(this).parent().parent()

        zlajax.post({
            'url':'/drop_msg/',
            'data':{
                'type':type,
                'sender':sender,
                'create_time':create_time,
                'post_id':post_id,
                'title':title,
                'content':content,
                'username':username,
            },
            'success':function (data) {
                if(data['code']==200){
                       par.empty();
                }
            }
        })
    })
})