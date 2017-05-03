 /**
 * 共通头部功能
 * Created by WW on 2016/08/25.
 */

//显示登陆注册
function showLoginAndRegister() {
    $(".beforeLogin").show();
    $(".afterLogin").hide();
    if (location.pathname != "/index.jhtml" && location.pathname != "/") {
        not_login();    //购物车显示未登录
    }
}
//显示我的饭饭
function showMyFanfan(data) {
    $(".beforeLogin").hide();
    $(".afterLogin").show();
    $(".userName").html(data.userCode);
    if (location.pathname != "/index.jhtml" && location.pathname != "/") {
        already_login();    //购物车显示商品
    }

}

$(function () {
    $.ww.getLoginStatus(showMyFanfan, showLoginAndRegister);
});

/**
 * 全部分类效果
 * Created by SY on 2016/9/30
 */
function sy_headerCategory() {
    $(".all-fenlei-wrap").hover(function () {
        $(".all-fenlei-dd").css("display", "block");
    }, function () {
        $(".all-fenlei-dd").css("display", "none");
    })
}

/**
 * 全部分类加载
 * Created by WW on 2016/9/30
 */
/*$(function () {
    (function () {
        if (location.pathname != "/index.jhtml" && location.pathname != "/") {
            var template_lv1 = $("#category_list_lv1").html();
            var html = loadHandlebarsTemplate(template_lv1, {});
            $(".all-fenlei-wrap").html(html);  //加载到html中
            sy_headerCategory();
        }
    })()
});*/

/**
 * 网站导航hover效果
 * Created by SY on 2016/10/14
 */
$(function () {
    $(".li_daohang").hover(function () {
        $(".hd_daohang").css("display", "block");
    }, function () {
        $(".hd_daohang").css("display", "none");
    });
});
