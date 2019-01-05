  //建立一個可存取到該file的url
  function getObjectURL(file)
  {
    var url = null ;
    if (window.createObjectURL!=undefined)
    { // basic
      url = window.createObjectURL(file) ;
    }
    else if (window.URL!=undefined)
    {
      // mozilla(firefox)
      url = window.URL.createObjectURL(file) ;
    }
    else if (window.webkitURL!=undefined) {
      // webkit or chrome
      url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
  }

$(function () {
    var start = 0
    $("#upload-my-img").click(function () {
        if(start ===0){
            $(".img-count-box").css('display','none')
            $(".progress").css('display','none')
            start+=1;
        }else{
            $(".img-count-box").css('display','block')
            $(".progress").css('display','block')
        }
    })

     var modifies = [];
     var count = 0;
     var fm = new FormData();
     $("#file0").change(function(){
      if((this.files).length>1){
          for(var i=0;i<this.files.length;i++){
              var objUrl = getObjectURL(this.files[i]) ;
              var file_modi = this.files[i].lastModified;
              if($.inArray(file_modi,modifies) === -1){
                  modifies.push(file_modi);
              }else{
                  swal('上传重复图片~','','error')
                  return;
              }
                if (objUrl)
                {
                  var d1=document.getElementById("d1");
                  var img=document.createElement("img");
                      img.src=objUrl;
                      d1.appendChild(img);
                      count++;
                      fm.append(i,this.files[i]);
                }
          }
      }
    $("#all-count").text(count);
    $(".img-count-box").css('display','block');
    $(".progress").css('display','block')
  });

    $("#upload-now").click(function () {
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        if(count ===0){
            swal('请添加图片','','error')
            return;
        }
        var rescount = 0
        $("#loading").css('display','inline');
        $(".ios").css('display','none');
        $("#upfile").css('display','none')
        var album_id = $('#select-album option:selected') .val();//选中的值
        fm.append('count',count);
        fm.append('album_id',album_id);
           var sitv = setInterval(function(){
           var prog_url = '/b/getrate/' ;                  // prog_url指请求进度的url
            $.ajax({
                url:prog_url,
                method:'GET',
                success:function (res) {
                    if(rescount>res['progress']){
                         var resss = $("#current-count").text();
                            resss = parseInt(resss)+1;
                            if(resss<count){
                                $("#current-count").text(resss);
                            }
                    }else{
                       rescount = res['progress'];
                    }
                    $("#prog_in").css("width",res['progress']+'%');
                    $("#pro").text(res['progress']+'%');
                }
            })
        }, 2000);
           zlajax.post({
            'url': '/b/upload_imges/',
            'data': fm,
            processData: false,
            contentType: false,
            'success': function (data) {
                if (data['code'] == 200) {
                    clearInterval(sitv);
                    swal('恭喜，图片上传成功~','','success')
                    $("#prog_in").css("width",'100%');
                    $("#pro").text('100%');
                    $("#current-count").text(count);
                    setTimeout(function () {
                        window.location.reload()
                    },1000)
                }else{
                    swal(data['message'],'','error')
                }
            }
        })

    });
    var is_open = 0;
    $("#setting").click(function () {
        if(is_open===0){
            $("#who-can-see").css('display','inline')
            is_open = 1;
        }else{
            $("#who-can-see").css('display','none')
            is_open = 0;
        }
    })
    var is_delete_btn = 0;
    $("#delete-btn").click(function(event){
    event.preventDefault();
          if(is_delete_btn===0){
            $(".del-im").css('display','inline')
            is_delete_btn = 1;
        }else{
            $(".del-im").css('display','none')
            is_delete_btn = 0;
        }
    })


  $("#save-power").click(function () {
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        var choose = $("#ch").val();
        var album_id = $(this).attr('data-album-id');
        var msg;
        if(choose === 'self'){
            msg = '仅自己可见'
        }else{
            msg = '全部人可见'
        }
        zlajax.post({
            'url':'/b/power/',
            'data':{
                'choose':choose,
                'album_id':album_id
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('相册权限改为：'+msg,'','success')
                    $(".au").text(msg)
                }else{
                    swal('网络错误','','error')
                }
            }
        })
    });

    var tags = [];
    var cur_count = $(".tag");

    $(".add_input").click(function (event) {
        event.preventDefault();
          if((cur_count.length) + ( tags.length)>3){
            var h = 3-cur_count.length;
            if(h<0){
                h=0
            }
            swal('还能添加'+h+'个标签');
           return;
        }
        var tagname = $("input[name='tagname']").val()
        if(tagname.length===0){
              swal('请输入标签名')
                return;
        }
        if($.inArray(tagname,tags)===-1){
                tags.push(tagname);
        }else{
           swal('标签存在','','error');
           return;
        }
        $(".modal-footer").append("<a class=\"ui red tag label\">"+tagname+"</a>")
    });
    $("#clear-btn").click(function(event){
        event.preventDefault();
        $("#myfot").find('a').remove();
        tags = []
    });
    $("#hottag-add").click(function (event) {
          event.preventDefault();
            if((cur_count.length) + ( tags.length)>3){
            var h = 3-cur_count.length;
             if(h<0){
                h=0
            }
            swal('还能添加'+h+'个标签')
            return;
        }
        var s = $("#hot-tag option:selected").val();
        if($.inArray(s,tags)===-1){
            tags.push(s);
        }else{
           swal('标签存在','','error');
           return;
        }
        $(".modal-footer").append("<a class=\"ui red tag label\">"+s+"</a>")
    })
    $("#add-tag-now").click(function (event) {
        event.preventDefault();
        if(tags.length ===0){
            swal('你还没有添加标签哦~')
            return;
        }
        if((cur_count.length) + ( tags.length)>3){
            var h = 3-cur_count.length;
            if(h<0){
                h=0
            }
            swal('还能添加'+h+'个标签')
            return;
        }

        tags = tags.toString();
        var album_id = $(this).attr('data-album-id');
        zlajax.post({
            'url':'/b/addtags/',
            'data':{
                'tags':tags,
                'album_id':album_id,
            },
            'success':function (data) {
                if(data['code']==200){
                    swal('添加成功','','success')
                    setTimeout(function () {
                        window.location.reload()
                    },1000)
                }else{
                    swal(data['message'],'','error')
                     tags = []
                }
            }
        })
    })
})

  $(function () {
        $(".del-im").click(function (event) {
            event.preventDefault();
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        var c = this
        var par = $(this).parent().parent();
        var img_id = $(this).attr('data-img-id');
        zlalert.alertConfirm({
            "cancelText": "取消",
            "confirmText": "确定",
            "msg": "确定要删除图片吗？",
            "confirmCallback": function () {
                zlajax.post({
                    'url':'/b/drop_img/',
                    'data':{
                        'img_id':img_id
                    },
                    'success':function (data) {
                        if(data['code']==200){
                            par.remove();
                            var count = $("#img-count").text()
                            count = parent(count)-1
                            $("#img-count").text(count)
                        }else{
                            swal('网络错误','','error')
                        }
                    }
                })
            }
        })
    })
  })