/**
 * 帮助中心相关
 */
$(document).ready(function (){

    callService("/tpl/fingStorePromiseInfo.ajax",{},
        {callSuccess:function(data){
            if(data.success){
                var result = data.result;
                if(result.length > 0){
                    var re = "";
                    for(var i = 0; i < result.length; i++){
                        re += "<ul class='footernav_I'>";
                        var list = result[i];
                        for(var j = 0; j < list.length; j++){
                            re += "<li><i style='background: url(" + list[j].adPic + ") no-repeat 0 0;'></i> <h2>" + list[j].title + "<p>" + list[j].subhead + "</p></h2></li>";
                        }
                        re += "<p class='clear'></p>"
                        re += "</ul>";
                    }
                    $(".footernav").find(".footernav_I").remove();
                    $(".footernav").find(".footernav_W").before(re);
                }
            }else{
                jsAlert(data.message);
            }
        }
    });


//    callService("/help/findHelpCenterCategoryAndContent.ajax",{},
//        {callSuccess:function(data){
//            if(data.success){
//                var result = data.result;
//                if(result.length > 0){
//                    var re = "";
//                    for(var i=0; i<result.length; i++){
//                        if(i == 0){
//                            re += "<ul class='borNo'>";
//                        }else{
//                        re += "<ul class=''>";
//                        }
//
//                        re += "<h2>"+ result[i].name +"</h2>";
//                        var content = result[i].contentList;
//                        for(var j=0; j<content.length; j++){
//                            re += "<li><a href='/help/toHelpCenter.jhtml?id="+ content[j].id +"'> "+ content[j].name +"</a></li>";
//                        }
//                        re += "</ul>";
//                    }
//                    $(".footernav_W").find("ul").remove();
//                    $(".footTel").before(re);
//                }
//            }else{
//                jsAlert(data.message);
//            }
//        }
//    });
});