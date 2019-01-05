$(function () {
    $("#bind_now").click(function (event) {
        event.preventDefault();
        var email = $("input[name='email']").val();
        if (email.length === 0) {
            swal('请输入邮箱');
            return;
        }

        var gender = $("#gender").text();
        var nickname = $("#nickname").text();
        var weibo_desc = $(".weibo_desc").text();
        var avatar = $("#avatar").attr('src');
        var uid = $("#avatar").attr('data-uid');
        zlajax.post({
            'url': '/bindemail/',
            'data': {
                'email': email,
                'gender': gender,
                'nickname': nickname,
                'uid': uid,
                'weibo_desc': weibo_desc,
                'avatar': avatar,
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    var user_id = data['data'];
                    setTimeout(function () {
                        swal('绑定成功');
                    }, 1000)
                    setTimeout(function () {
                        window.location.href = '/u/' + user_id
                    }, 1000)
                } else {
                    setTimeout(function () {
                        swal(data['message'], '', 'error')
                    }, 1000)
                }
            }
        })
    })
})