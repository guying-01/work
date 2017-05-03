/**
 * Created by Administrator on 2016/11/2.
 */
/*共通选项卡开始*/
/*初始化开始*/
$(function(){
    var it_url=window.location.href;
    var ind=it_url.split("#tab")[1];
    if(ind){
        tab_click(ind);
    }
$("#ff_tab_box").on("click",".ff_tab_nav li",tab_click);
});
/*初始化结束*/
function tab_click(ind){
    if(ind>=0){
        var index=ind;
    }
    else{
        var index=$(this).index();
    }
    $(".ff_tab_nav li").removeClass("tab_nav_on").eq(index).addClass("tab_nav_on");
    $("#ff_tab_box .ff_tab_content").removeClass("ff_tab_ct_show").eq(index).addClass("ff_tab_ct_show");
}

/*共通选项卡结束*/
