$(function () {
    var charactor = '';
    new Vue({
        el:'#search',

        delimiters:['[[',']]'],
        data:{
            SearchInfo:'',
            showSearching:false,
            posts:[],
        },
        watch:{
            SearchInfo:function (query) {
                this.showSearching = true;
                charactor  = query;
                var vm = this;
                zlajax.post({
                    'url':'/search/',
                    async: false,
                    'data':{
                        'title':query,
                    },
                    'success':function (data) {
                        if(data['code']==200){
                            var posts = [];
                            var posts_return = data['data'];
                            for(var i=0;i<posts_return.length;i++){
                                var my_title = posts_return[i].title.replace(query,'<span style="color: red">' + query + '</span>');
                                var my_content = posts_return[i].content.replace(query,'<span style="color: red">' + query + '</span>');
                                posts.push(
                                    {
                                        'title':my_title ,
                                        'content': my_content,
                                        'username': posts_return[i].username,
                                        'create_time': posts_return[i].create_time,
                                        'cover': posts_return[i].cover,
                                        'post_id': posts_return[i].id,
                                        'avatar': posts_return[i].avatar,
                                        'hight_light': posts_return[i].hight_light,
                                        'user_id': posts_return[i].user_id
                                    }
                                )
                            }
                            $("#default").empty();
                             str = '';
                            vm.posts = posts;
                            vm.showSearching = false;
                        }
                    }
                });
            }
        },
    })
})