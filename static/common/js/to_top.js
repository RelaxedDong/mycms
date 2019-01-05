$(function(){
        var go_top = $('.go-top');

        function site(){
            var wh = $(window).height()*0.4;
            var st = $(document).scrollTop();

            if(st > wh)
                go_top.fadeIn("slow");
            else
                go_top.fadeOut("slow");
        }

        $(window).scroll(function(){
            site();
        })
        //点击go＿top　按钮时，　滚动到顶部
        go_top.click(function(prem) {
            prem.preventDefault();
            //绑定返回顶部
            var top = $(document).scrollTop();
            var ini_h = 1;
            timer = setInterval(function() {
                if (top -  ini_h <= 0) {
                    $(window).scrollTop(0);
                    timer && clearInterval(timer);
                } else {
                    top = top - ini_h;
                    $(window).scrollTop(top);
                }
                ini_h += 5;     //数字越大走越快
            }, 15);
        });
    })
