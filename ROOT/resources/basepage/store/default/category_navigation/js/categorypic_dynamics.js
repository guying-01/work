
function lv1_click(lv1) {
    lv1_id = $(lv1).attr("lv1_id");
    lv1_name = $(lv1).text();
    /*做浏览记录，用于从其他页面返回依然能回到对应分类*/
    localStorage.lv1_id = lv1_id;
    localStorage.lv1_name = lv1_name;
    localStorage.lv1_index = $(lv1).parent('li').index();
    /*浏览记录结束*/

    $(".page_fenlei_daohang ul li").eq(localStorage.lv1_index).addClass('active').siblings().removeClass('active');
    var success = function (data) {
        if($(lv1).attr('loadflag')==='1'){
            $("#scroll_bar").scrollTop(localStorage.lv1_scroll);//页面加载初始化时读取位置
        }
        else {
            localStorage.lv1_scroll=$("#scroll_bar").scrollTop();//真正用户操作行为才记录scroll位置
        }
//  	品牌厂家
        if (lv1_id == '307_00000000000000379_gic') {
            categoryBrand();
            return;
        }
//  	产地直供
        if (lv1_id == '307_00000000000000374_gic') {
            directSupply();
            return;
        }
//  	餐饮名店特色菜
        if (lv1_id == '307_00000000000000382_gic') {
            nongJia();
            return;
        }
        //燃料类
        if (lv1_id == '307_00000000000002542_gic') {
            fuel();
            return;
        }
        //维修保养
        if (lv1_id == '307_00000000000002606_gic') {
            service();
            return;
        }
        //酒店专业装修
        if (lv1_id == '307_00000000000000236_gic') {
            h_service();
            return;
        }
//  	进口免税
        /*if(lv1_id=='307_00000000000009135_gic'){
         taxExemption();
         return;
         }*/
        var formatedData = formatData_category(data);
        formatedData.lv1.id = lv1_id;
        formatedData.lv1.name = lv1_name;
        var template_category_categoryList = $("#category_categoryList").html();
        var html = loadHandlebarsTemplate(template_category_categoryList, formatedData);
        $(".page_yiji_wrap ul").html(html);  //加载到html中
        comingSoon(lv1_id);
        /*由于某些不能第一批次上线所以这么写,等到能上线后再注释掉相应的代码即可恢复*/
        $(".cg_307_00000000000008857_gic a").attr('href', "/page2/307_00000000000008857_gic.jhtml?name2=本地小船海鲜&level1=307_00000000000000237_gic&name1=海鲜类&type=special_page");
        /*本地小船海鲜特殊链接*/
        $(".cg_307_00000000000009430_gic a").attr('href', "/fsst/101_00000000000000376_str/top.jhtml");
        /*蛋糕定制特殊链接*/
    };
    requestDataWithAJAX("/fsajax/FSGoodsCategory.ajax?level2=" + lv1_id, "get", true, {"success": success});
}
$(function () {
    var url=window.location.href;
    var num=url.split("#");
    if(num.length>1){
        $(".page_fenlei_daohang ul li").each(function () {
           if(num[1]===$(this).find('a').attr('lv1_id')){
               $(".page_fenlei_daohang ul li").eq($(this).index()).find('a').attr('loadflag','1');//默认加载标记
               $(".page_fenlei_daohang ul li").eq($(this).index()).find('a').click();
           }
        });
    }
    else {
        if (typeof(localStorage.lv1_id)!="undefined") {
            $(".page_fenlei_daohang ul li").eq(localStorage.lv1_index).find('a').attr('loadflag','1');//默认加载标记
            $(".page_fenlei_daohang ul li").eq(localStorage.lv1_index).find('a').click();

        }
        else {
            $(".page_fenlei_daohang ul li .firstClick").attr('loadflag','1');//默认加载标记
            $(".page_fenlei_daohang ul li .firstClick").click();
        }
    }
});


