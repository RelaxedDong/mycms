$(function () {
        var myeditor = fun();
        myeditor.create();
       $("#sub-topic").click(function (event) {
           event.preventDefault();
           var content = myeditor.txt.html();
           var title = $("input[name='title-topic']").val();
           var group_id = $(this).attr('data-group-id');
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
           if(content.length==11){
               swal('请输入内容','','error')
               return;
           }
           if(content.length<21){
                swal('内容至少10个字','','error')
               return;
           }
           zlajax.post({
               'url':'/g/group_atopic/',
               'data':{
                   'title':title,
                   'content':content,
                   'group_id':group_id
               },
               'success':function (data) {
                   if(data['code']==200){
                       swal('恭喜，发表成功！','','success')
                       setTimeout(function () {
                      window.location.href = '/g/group_detail/'+group_id;
                       },1000)
                   }else{
                       swal(data['message'],'','error')
                   }
               }
           })
       })
})