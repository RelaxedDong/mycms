
$(function () {
    new Vue({
        el: '#demo',
        delimiters: ['[[', ']]'],
        data: {
            groups: [],
        },
        methods:{
            Search:function () {
                $(".md").hide();
                var group_name = $("input[name='group_name']").val();
                var vm = this;
                zlajax.post({
                    'url': '/g/search/',
                     async: false,
                    'data': {
                        'group_name': group_name
                    },
                    'success': function (data) {
                        if (data['code'] == 200) {
                            $(".jsn").hide();
                            var groupss = [];
                            var groups_return = data['data'];
                            for(var i=0;i<groups_return.length;i++){
                              b = {
                                   'name':groups_return[i].name,
                                   'create_time':groups_return[i].create_time,
                                   'desc':groups_return[i].desc,
                                   'users':groups_return[i].users,
                                   'avatar':groups_return[i].avatar,
                                   'id':groups_return[i].id,
                               };
                               vm.groups.push(b);
                            }
                        }else {
                            swal('小组不存在');
                        }
                    }
                })
            }
        }
    })
})

$(function () {
    $("#refresh").click(function (event) {
        event.preventDefault();
        $(".jsn").css('display','block');
        $(".md").css('display','none')
    })
})