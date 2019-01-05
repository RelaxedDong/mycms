$(function () {
    var file = $('#file');
    var imgage_url = $("input[name='image_url']");
    file.on('change', function (e) {
    $("#add-bbb").css('display','none');
    $("#loder").css('display','block')
        //e.currentTarget.files 是一个数组，如果支持多个文件，则需要遍历
        var img_url = e.currentTarget.files[0].name;
        var file = document.getElementById("file").files[0];
        var fm = new FormData();
        fm.append('file', file);
        zlajax.post({
            'url': '/cms/upload/',
            processData: false,
            contentType: false,
            'data': fm,
            'success': function (data) {
                if (data['code'] == 200) {
                    swal('上传成功！');
                    imgage_url.val(data['data']);
                        $("#add-bbb").css('display','block');
                        $("#loder").css('display','none')
                }
            }
        })
    });

    $('add-banner-btn').click(function () {
           $("#save-banner-btn").attr('data-type','abanner-save');
          $("input[name='image_url']").val('');
           $("#banner-content").val('');
           $("input[name='link_url']").val('');
           $("input[name='priority']").val('');
    })

    $("#save-banner-btn").click(function (event) {
        event.preventDefault();

        var type = $(this).attr('data-type');
        var banner_id = $(this).attr('data-banner_id');
        var filename = $("input[name='image_url']").val();
        var banner_content = $("#banner-content").val();
        var link_url = $("input[name='link_url']").val();
        var priority = $("input[name='priority']").val();
        zlajax.post({
            'url': '/cms/abanner/',
            'data': {
                'type':type,
                'banner_id':banner_id,
                'filename': filename,
                'banner_content': banner_content,
                'link_url': link_url,
                'priority': priority,
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    swal('添加成功', '', 'success');
                    $("input[name='image_url']").val('')
                    $("#banner-content").val('');
                    $("input[name='link_url']").val('');
                    $("input[name='priority']").val('');
                    setTimeout(function () {
                        window.location.reload()
                    }, 1000)
                } else {
                    swal('添加失败', data['message'], 'error')
                }
            }
        })
    })
    $(".edit-btn").click(function () {
        var banner_id = $(this).attr('data-edit-id');
        $("#banner-dialog").modal('show');
        var img_url = $(this).attr('data-img_url');
        var content = $(this).attr('data-content');
        var url = $(this).attr('data-url');
        var weight = $(this).attr('data-weight');

        $("input[name='image_url']").val(img_url)
        $("#banner-content").val(content);
        $("input[name='link_url']").val(url);
        $("input[name='priority']").val(weight);
        $("#save-banner-btn").attr('data-type','ubanner-save')
        $("#save-banner-btn").attr('data-banner_id',banner_id)
    })

})

$(function () {
     $(".del-btn").click(function (event) {
        event.preventDefault();
        var banner_id = $(this).attr('data-del-id');
        zlajax.post({
            'url': '/cms/banners/',
            'data': {
                'banner_id': banner_id
            },
            'success': function (data) {
                if (data['code'] == 200) {
                    swal("恭喜，删除成功！");
                    setTimeout(function () {
                        window.location.reload()
                    }, 1000)
                } else {
                    swal("警告", data['message'], 'error');
                }
            }
        })
    });
})