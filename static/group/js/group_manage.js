$(function () {
       var isopen = 0;
       var addopen = 0
    $("#del-manager").click(function () {
            if(isopen==0){
            $(".manag").css('display','block');
            isopen = 1;
            }else{
              $(".manag").css('display','none');
              isopen = 0;
            }
    });

       $("#add-manager").click(function () {
            if(addopen==0){
            $(".addmanager").css('display','block');
            addopen = 1;
            }else{
              $(".addmanager").css('display','none');
              addopen = 0;
            }
    });


    $(".manag").click(function () {
        var user_id = $(this).attr('data-user-id');
        var group_id = $(this).attr('data-id');
        var par = $(this).parent()
        zlalert.alertConfirm({
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "确定要移除管理员吗？",
            "confirmCallback": function () {
                zlajax.post({
                    'url':'/g/demanager/',
                    'data':{
                        'user_id':user_id,
                        'group_id':group_id
                    },
                    'success':function (data) {
                        if(data['code']==200){
                            par.remove();
                        }else{
                            swal(data['message'],'','error')
                        }
                    }
                })
            }
        })
    })

    $(".addmanager").click(function (event) {
        event.preventDefault();
        var group_id = $(this).attr('data-id');
        var user_id = $(this).attr('data-user-id');
        var avatar = $(this).attr('data-user-avatar');
        var nickname = $(this).attr('data-user-nickname');
                zlajax.post({
                    'url':'/g/amanager/',
                    'data':{
                        'user_id':user_id,
                        'group_id':group_id
                    },
                    'success':function (data) {
                        if(data['code']==200){
                            swal('恭喜，管理员添加成功');
                                   $("#mmm").append('<li>\n' +
            '                        <a class="ui label manag" style="display: none;" data-user-id="'+user_id+'" data-id="'+group_id+'">刷新</a>\n' +
            '                        <img src="'+avatar+'" alt=""><br>\n' +
            '                            <a href="/u/'+user_id+'">'+nickname+'</a>\n' +
            '                        </li>')
                        }else{
                            swal(data['message'],'','error')
                        }
                    }
                })

        })

    $("#de-user").click(function (event) {
        event.preventDefault();
        var group_id = $(this).attr('data-id');
        var create_user_id = $(this).attr('data-createuser_id');
        zlalert.alertOneInput({
            'title':'请输入',
            'text':'踢除成员',
            'placeholder':'请输入邮箱',
            'confirmText': '确认',
			'cancelText': '取消',
            "cancelCallback": function(){
					alert("点击了取消按钮");
				},
			"confirmCallback": function(inputValue){
                zlajax.post({
                    'url':'/g/outgroup/',
                    'data':{
                        'email':inputValue,
                        'group_id':group_id,
                        'create_user_id':create_user_id
                    },
                    'success':function (data) {
                        if(data['code']==200){
                            swal('成员移除成功');
                            setTimeout(function () {
                                window.location.reload()
                            },500)
                        }else{
                            swal(data['message'],'','error')
                        }
                    }
                })
			}
        })
    })
})