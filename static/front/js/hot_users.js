// #推荐作者
var users = []

function loadmoreusers() {
    var now_user = $("#now_user").attr('data-user-id');
     zlajax.post({
            'url':'/authors/',
            async: false,
            'data':{},
            'success':function (data) {
                if(data['code']=200){
                    var users_obj = data['data'];
                    for(var i =0;i<users_obj.length;i++){
                        var is_have = 0;
                        if(users_obj[i].is_focus_id.indexOf(now_user)!==-1){
                            is_have = 1;
                        }
                        users.push({'user_id':users_obj[i].user_id,'nickname':users_obj[i].nickname,
                        'charactors':users_obj[i].charactors,'avatar':users_obj[i].avatar,'is_focus_id':is_have})
                    }
                }
            }
        })
}

$(function () {
   loadmoreusers();
   new Vue({
       el:"#author",
       delimiters: ['[[', ']]'],
       data:{
           authors:users
       },
       methods:{
           changeauthors:function () {
               users.length = 0;
               loadmoreusers();
           }
       }
   })
})

$(function () {
    follow();
})