/**
 * Created by Administrator on 2016/8/8.
 */
$(function () {
    $("body").attr("top_height", 374);
    /*top_banner关闭效果*/
    (function () {
        $(".top_banner_close").click(function () {
            $(".top_banner").slideUp();
            $(".bg_img_box").animate({"top": 169});
            $(".bg_img_box_1").animate({"top": 169});
            $("body").attr("top_height", 169);
        })
    })();
    /*购物车效果*/
    var liLength = $(".shopping_cart_goods_sub>li").length;
    var allsub = $(".blankSpaceShopping_car").siblings();
    var numbSpan = $(".shoping_cart_header>span");
    if (liLength == 0) {
        $(allsub).css("display", "none");
    }
    else {
        $(".blankSpaceShopping_car").css("display", "none");
    }
    $(numbSpan).text(liLength);
    $(".shopping_cart").hover(function () {
        $(this).addClass("boxShaw");
        $(".shopping_cart_goods").css("display", "block");
    }, function () {
        $(".shopping_cart_goods").css("display", "none");
        $(".shopping_cart").removeClass("boxShaw");
    });
    /*返回顶部*/
    $(".f_returnTop").click(function () {
        /*$("html,body").animate({scrollTop: '0px'}, 800);*/
        $("html,body").scrollTop(0);
    });
    /*滚动条监听输入框*/
    $(window).scroll(function () {
        if (($(document).scrollTop()) > 0) {
            $(".f_returnTop").show(100);
            if (($(document).scrollTop()) > 375) {
                if (document.getElementById('fix_search')) {
                    if(document.getElementById('fix_search').style.display == 'block') return;
                }
                $("#fix_search").show();
                $(".search_input_2").focus();
            }
            else {
                if ($(".search_input_1").get(0) == document.activeElement) return;
                $("#fix_search").hide();
                $(".search_input_1").focus();
            }
        }
        else {
            $(".f_returnTop").hide(100);
            $("#fix_search").hide();
        }
    });


    /*top_banner不压缩*/
    if ($(window).width() < 1920 && $(window).width() > 1200) {
        $(".top_banner img").css("margin-left", -(1920 - $(window).width()) / 2);
        $(".bg_img_box_1 img").css("margin-left", -(1920 - $(window).width()) / 2);
        $(".bg_img_box img").css("margin-left", -(1920 - $(window).width()) / 2);
        $(".top_banner_com img").css("margin-left", -(1920 - $(window).width()) / 2);
        /*做共通不压缩不变形的顶图*/
    }
    else if ($(window).width() < 1200) {
        $(".top_banner img").css("margin-left", -(1920 - 1200) / 2);
        $(".bg_img_box_1 img").css("margin-left", -(1920 - 1200) / 2);
        $(".bg_img_box img").css("margin-left", -(1920 - 1200) / 2);
        $(".top_banner_com img").css("margin-left", -(1920 - 1200) / 2);
        /*做共通不压缩不变形的顶图*/
    }
    $(window).resize(function () {
        if ($(window).width() < 1920 && $(window).width() > 1200) {
            $(".top_banner img").css("margin-left", -(1920 - $(window).width()) / 2);
            $(".bg_img_box_1 img").css("margin-left", -(1920 - $(window).width()) / 2);
            $(".bg_img_box img").css("margin-left", -(1920 - $(window).width()) / 2);
            $(".top_banner_com img").css("margin-left", -(1920 - $(window).width()) / 2);
            /*做共通不压缩不变形的顶图*/
        }
        else if (
            $(window).width() < 1200) {
            $(".top_banner img").css("margin-left", -(1920 - 1200) / 2);
            $(".bg_img_box_1 img").css("margin-left", -(1920 - 1200) / 2);
            $(".bg_img_box img").css("margin-left", -(1920 - 1200) / 2);
            $(".top_banner_com img").css("margin-left", -(1920 - 1200) / 2);
            /*做共通不压缩不变形的顶图*/
        }
    });

    /*螃蟹侧边栏效果*/
    $(".ff_px_box").hover(function () {
        $(".ff_px_hide").hide();
        $(".ff_px_show").show().stop().animate({"left": "-102px"}, 500);
        $(".ff_px_box").attr("ifshow", "show")
    }, function () {
        $(".ff_px_show").stop().animate({"left": "-12px"}, 1000);
        $(".ff_px_box").attr("ifshow", "hide");
        setTimeout(function () {
            if ($(".ff_px_box").attr("ifshow") == "hide") {
                $(".ff_px_show").hide();
                $(".ff_px_hide").show();
            }
        }, 1000);
    });
    /*处理一二级页背景图小屏幕缩放高度变化导致空白问题*/
    /*$(".bg_img_box_1 img").load(function(){
     (function () {
     var bg_height=$(".bg_img_box_1 img").css("height").split("px");
     if(bg_height[0]>3000){
     $(".bg_img_box_1 img").css("min-height",7500);
     }
     })();
     });*/

    /*顶部导航栏JS提出来*/
    $(".li_ac").hover(function () {
        $(this).addClass("nav_li_ac");

    }, function () {
        $(this).removeClass("nav_li_ac");
    });

    $(".ffphone").on("mouseover", function () {
        $(".phone_left").css("background", "url(/resources/basepage/store/default/common_img/ffphoneimg.png) no-repeat 0 -25px");
        $(".mobile_ff").on("mouseover", function () {
            $(".phone_left").css("background", "url(/resources/basepage/store/default/common_img/ffphoneimg.png) no-repeat 0 -25px");
            $(".mobile_ff").on("mouseout", function () {
                $(".phone_left").css("background", "url(/resources/basepage/store/default/common_img/ffphoneimg.png) no-repeat 0 0");
            })
        });
        $(".ffphone").on("mouseout", function () {
            $(".phone_left").css("background", "url(/resources/basepage/store/default/common_img/ffphoneimg.png) no-repeat 0 0");
        })
    })
});
