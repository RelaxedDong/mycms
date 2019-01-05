$(function () {

    $("#group-create").click(function (event) {
        event.preventDefault();
        var group_img = $("input[name='group-img']").val();
        var group_name = $("input[name='group-name']").val();
        var desc = $("#group-desc").val();
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        zlajax.post({
            'url':'/g/crgroup/',
            'data':{
                'group_img':group_img,
                'group_name':group_name,
                'desc':desc,
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('创建成功')
                }else{
                    swal(data['message'],'','error')
                }
            }
        })
    });
    $(".join_now").click(function () {
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        var group_id = $(this).attr('data-group-id');
        zlajax.post({
            'url':'/g/joingroup/',
            'data':{
                'group_id':group_id
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('恭喜，加入成功','','success')
                    setTimeout(function () {
                        window.location.reload()
                    },500)
                }else{
                    swal(data['message'],'','error')
                }
            }
        })
    })

    var isopen = 0;
    $("#dge-desc").click(function () {
        if(isopen==0){
            $(".cge-desc").css('display','block');
            isopen = 1;
        }else{
            $(".cge-desc").css('display','none');
            isopen = 0;
        }
    })
    $("#update-now").click(function (event) {
        event.preventDefault();
        var group_id = $(this).attr('data-group-id');
        var desc = $("#up-desc").val();
        if(desc.length==0){
            swal('请输入简介','','error')
            return;
        }
        zlajax.post({
            'url':'/g/updesc/',
            'data':{
                'group_id':group_id,
                'desc':desc
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('修改成功','','success');
                    $(".group-jies").text(desc);
                }
            }
        })

    })
})

$(function () {
    $("#out-group").click(function () {
        var group_id = $(this).attr('data-group-id');
        zlalert.alertConfirm({
            	"cancelText":"取消",
       			"confirmText":"确定",
				"msg": "确定要退出小组吗？",
				"confirmCallback": function(){
					zlajax.post({
                        'url':'/g/outgroup/',
                        'data':{
                            'group_id':group_id
                        },
                        'success':function (data) {
                            if(data['code']==200){
                                swal('退出成功！','','success');
                                setTimeout(function () {
                                    window.location.reload()
                                },500)
                            }else{
                                swal('网络错误','','error')
                            }
                        }
                    })
				},
				"cancelCallback": function(){
                    console.log('123')
				}
        })
    })
})