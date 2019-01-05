var myarray = [{text:'',weight:0}];

function loadhottags() {
    var tags = [];
    zlajax.post({
        'url':'/tags/tagname',
        'data':{},
        async: false,
        'success':function (data) {
            if(data['code']=200){
                $("#example").empty()
               var tags_obj = data['data'];
               for(var i=0;i<tags_obj.length;i++){
                   var link_url = '/tags/'+tags_obj[i].tag_name;
                   tags.push({text:tags_obj[i].tag_name,weight:Math.floor(Math.random()*10+1),link:link_url})
               }
                $("#example").jQCloud(tags);
            }
        }
    })
}
$(function () {
    loadhottags();
})

$(function () {
    $("#other-hot").click(function () {
        loadhottags();
    })
})
    // var word_array = [
    //       {text: "美食", weight: 10},
    //       {text: "摄影", weight: 9, link: "http://jquery.com/"},
    //       {text: "宠物", weight: 6, html: {title: "I can haz any html attribute"}},



