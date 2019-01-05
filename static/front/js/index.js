var more_posts = [];
function loadmore(index) {
    var s = $("#language option:selected").text();
    $("#loadmore").css('display','none');
    $("#loading").css('display','block');
    zlajax.post({
        'url': '/',
         async: false,
        'data': {
            'count': index,
            'language':s
        },
        'success': function (data) {
            if (data['code'] == 200) {
                more_posts = data['data'];
            }
        }
    });
}

$(function () {
    var index = 0;
    var posts;
    var s = $("#language option:selected").text();
$("#language").change(function(){
     window.location.reload()
 });
var language = '';
if(s==='英文'){
    language = 'en'
}else{
    language = 'ch'
}
    var post_type = 'most_new';
    zlajax.post({
        'url': '/',
        'data': {
            'count': index,
            'language':s
        },
        'success': function (data) {
            if (data['code'] == 200) {
                posts = data['data'];
                new Vue({
                    el: '#demo',
                    delimiters: ['[[', ']]'],
                    data: {
                        posts: posts,
                        'language':language
                    },
                    computed: {
                        main: function () {
                            return this.posts
                        }
                    },
                    methods: {
                        loadMorebtn: function () {
                            index = index + 10;
                            loadmore(index);
                                $("#loadmore").css('display','block');
                                $("#loading").css('display','none');
                                for (var i = 0; i < more_posts.length; i++) {
                                    var b = {
                                        'title': more_posts[i].title,
                                        'content': more_posts[i].content,
                                        'username': more_posts[i].username,
                                        'create_time': more_posts[i].create_time,
                                        'cover': more_posts[i].cover,
                                        'id': more_posts[i].id,
                                        'avatar': more_posts[i].avatar,
                                        'hight_light': more_posts[i].hight_light,
                                        'user_id': more_posts[i].user_id
                                    };
                                    this.posts.push(b);
                                }
                        }
                    }
                });
            }
        }
    })
})
