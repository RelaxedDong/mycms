function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
// 触发 id="defaultOpen" click 事件
document.getElementById("defaultOpen").click();



$(function () {
    var isopen = 0;
    $("#main-del-btn").click(function () {
            if(isopen==0){
            $(".del-btn-group").css('display','block');
            isopen = 1;
            }else{
              $(".del-btn-group").css('display','none');
              isopen = 0;
            }
    });
    $(".del-btn-group").click(function () {
        var post_id = $(this).attr('data-id');
        var par = $(this).parent().parent().parent();
      zlalert.alertConfirm({
            	"cancelText":"取消",
       			"confirmText":"确定",
				"msg": "确定要删除吗？",
				"confirmCallback": function(){
                 zlajax.post({
                    'url':'/dpost/',
                    'data':{
                        'post_id':post_id,
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
})
