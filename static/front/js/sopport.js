       $(function () {
            var submitBtn = $("#submit-btn");
            submitBtn.click(function (event) {
                event.preventDefault();
                var goodsname = $("input[name='goodsname']").val();
                var istype = $("input[name='istype']:checked").val();
                var notify_url = $("input[name='notify_url']").val();
                var orderid = $("input[name='orderid']").val();
                var orderuid = $("input[name='orderuid']").val();
                var price = $("input[name='price']").val();
                var return_url = $("input[name='return_url']").val();
                console.log(goodsname,istype,notify_url,orderid,price,return_url)
                zlajax.post({
                    'url': '/sopprt/',
                    'data': {
                        'goodsname': goodsname,
                        'istype': istype,
                        'notify_url': notify_url,
                        'orderid': orderid,
                        'orderuid':orderuid,
                        'price': price,
                        'return_url': return_url
                    },
                    'success': function (result) {
                        if(result['code'] === 200){
                            var key = result['data'];
                            var keyInput = $("input[name='key']");
                            keyInput.val(key);
                            $("#myform").submit();
                        }
                    }
                });
            });
        });