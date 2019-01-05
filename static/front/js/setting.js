$(function () {
    var url = window.location.href;
    if (url.indexOf('setting_base') >= 0) {
        $(".set-base").addClass('active').siblings().removeClass('active')
    } else if (url.indexOf('setting_profile') >= 0) {
        $(".set-pro").addClass('active').siblings().removeClass('active')
    } else if (url.indexOf('setting_count') >= 0) {
        $(".set-cou").addClass('active').siblings().removeClass('active')
    }
});
$(function () {
    $("#avater").change(function () {
        var fm = new FormData();
        var avater_file = document.getElementById('avater').files[0];
        var filename = avater_file.name;
        var img_type = avater_file.type;
        if (img_type != "image/jpeg" && img_type && "image/jpg" && img_type != "image/png") {
            swal('上传图片格式错误', '', 'error');
            return;
        }
        var objUrl = getObjectURL(this.files[0]);
        $("#my_avatar").attr('src', objUrl);
        var url = ''
        var type = $(this).attr('data-type');
        if (type == 'change_user') {
            url = '/change_avater/'
        } else {
            url = '/g/change_group_avatar/';
        }
        fm.append('file', avater_file);
        zlajax.post({
            'url': url,
            'data': fm,
            processData: false,
            contentType: false,
            'success': function (data) {
                if (data['code'] == 200) {
                    if (type == 'change_user') {
                        swal('恭喜', '头像修改成功', 'success')
                    } else {
                        var img_u = data['data'];
                        $("input[name='group-img']").val(img_u);
                    }
                }
            }
        })
    })

    $("#save-btn").click(function () {
        var nickname = $("input[name='nickname']").val();
        var province = $("#cmbProvince").find("option:selected").text();
        var area = $("#cmbArea").find("option:selected").text();
        var city = $("#cmbCity").find("option:selected").text();
        zlajax.post({
            'url': '/setting_base/',
            'data': {
                'nickname': nickname,
                'province': province,
                'area': area,
                'city': city
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    swal('资料修改成功！');
                    window.location.reload();
                } else {
                    swal(data['message'])
                }
            }
        })
    })
});

//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    }
    else if (window.URL != undefined) {// mozilla(firefox)
        url = window.URL.createObjectURL(file);
    }
    else if (window.webkitURL != undefined) {
        // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}

var src = '';

function mysplit() {
    var src = '/c/captcha/?xx=' + Math.random();
    return src;
}

$(function () {
    $("#capcha-img").click(function (event) {
        src = '';
        event.preventDefault();
        var self = $(this);
        var src = self.attr('src');
        var newsrc = mysplit();
        self.attr('src', newsrc)
    })

    $("#change_pwd").click(function () {
        var oldpwd_input = $("input[name='old_pwd']");
        var newpwd_input = $("input[name='new_pwd']");
        var captcha_input = $("input[name='captcha']");
        var oldpwd = oldpwd_input.val();
        var newpwd = newpwd_input.val();
        var captcha = captcha_input.val();
        if (!oldpwd || !newpwd || !captcha) {
            swal('请输入完整数据', '', 'error');
            $("#capcha-img").click();
            return;
        }
        if (captcha.length !== 4) {
            swal('验证码长度错误', '', 'error');
            return
        }
        zlajax.post({
            'url': '/setting_count/',
            'data': {
                'oldpwd': oldpwd,
                'newpwd': newpwd,
                'captcha': captcha,
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    swal('恭喜', '修改密码成功,即将跳转到登录页面,请重新登录...', 'success');
                    oldpwd_input.val('');
                    newpwd_input.val('');
                    captcha_input.val('');
                    setTimeout(function () {
                        window.location.href = '/logout/'
                    }, 2000)
                } else {
                    swal(data['message'], '', 'error');
                    $("#capcha-img").click();
                }
            }
        })
    })
})

