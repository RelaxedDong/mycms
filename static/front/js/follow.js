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
document.getElementById("dead").click();


function follow() {
        $(".fow").click(function (event) {
        event.preventDefault();
        var own_user_id = $(this).attr('data-user-id');
        var islogin = $("#login-span").attr('data-login-user');
        if(!islogin){
            swal('请先登录~');
            return;
        }
        zlajax.post({
            'url':'/focus/',
            'data':{
                'own_user_id':own_user_id,
            },
            'success':function (data) {
                if(data['code']==200){
                    swal(data['message'],'');
                    setTimeout(function () {
                    window.location.reload();
                    },500)
                }else{
                    swal(data['message'],'','error')
                }
            }
        })
    })
}


