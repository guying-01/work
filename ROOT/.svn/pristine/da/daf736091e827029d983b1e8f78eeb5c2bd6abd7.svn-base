$(document).ready(function () {
//    nav-li hover e
    $('.ff_koubei').hover(function () {
        /*下拉框出现*/
        /*	$(this).css("background","#c91622");*/
        $(".ff_koubei_hd").stop().slideDown(300);
    }, function () {
        /*下拉框消失*/
        $(".ff_koubei_hd").stop().hide();
        /* $(this).css("background","#fff");*/
    });

    $(".order_business").hover(function () {
        /*$(this).css("background","#c91622");*/
        $(".order_business_hd").stop().slideDown(300);
    }, function () {
        $(".order_business_hd").stop().hide();
        /*$(this).css("background","#fff")*/
        ;
    });

    $('.ff_koubei_hd').hover(function () {
        $(this).show();
        /*$('.ff_koubei').css("background","#B1181A");*/
    }, function () {
        $(this).slideUp(200);
        /*$('.ff_koubei').css("background","#c91622");*/
    });

    $('.order_business_hd').hover(function () {
        $(this).show();
        /* $('.order_business').css("background","#B1181A");*/
    }, function () {
        $(this).slideUp(200);
        /* $('.order_business').css("background","#c91622");*/
    });

    //展示页左侧饭饭热卖(放大功能)
    var detail_recom_l_img_wid = $(".fanfan-hotsales-img img").css("width");
    var detail_recom_l_img_hei = $(".fanfan-hotsales-img img").css("height");
    //原本图片大小数值
    detail_recom_l_img_wid = detail_recom_l_img_wid.replace("px", "");
    detail_recom_l_img_hei = detail_recom_l_img_hei.replace("px", "");

    //放大1.05倍后图片大小数值
    var detail_recom_l_img_wid_sca = 1.3 * detail_recom_l_img_wid;
    var detail_recom_l_img_hei_sca = 1.3 * detail_recom_l_img_hei;
    //为保持放大时居中需要调的top left值
    var detail_recom_l_img_top = -(detail_recom_l_img_wid_sca - detail_recom_l_img_wid) / 2;
    var detail_recom_l_img_left = -(detail_recom_l_img_hei_sca - detail_recom_l_img_hei) / 2;

    $(".fanfan-hotsales-img img").hover(function () {
        $(this).stop().animate({width: detail_recom_l_img_wid_sca, height: detail_recom_l_img_hei_sca, left: detail_recom_l_img_top, top: detail_recom_l_img_left}, 300);
    }, function () {
        $(this).stop().animate({width: detail_recom_l_img_wid, height: detail_recom_l_img_hei, top: 0, left: 0}, 300);
    })
//推荐商品右侧部分结束(放大功能)

//下方商品精选 加入购物车出现功能开始
    $(".choicenessContentList").hover(function () {
        $(this).find(".addshopCar").stop().animate({bottom: 0}, 300)
    }, function () {
        $(this).find(".addshopCar").stop().animate({bottom: "-30px"}, 300)
    })
//下方商品精选 加入购物车出现功能结束

//收藏和旁边小车动画效果开始
//    $(".goodsCollect").hover(function () {
//        $(this).find(".collectHeart").stop().animate({top: 0}, 300)
//    }, function () {
//        $(this).find(".collectHeart").stop().animate({top: "30px"}, 0)
//    })
//
//    $(".addShoppingCar").hover(function () {
//        $(this).find(".shoppingCarIcon").stop().animate({top: 0}, 300)
//    }, function () {
//        $(this).find(".shoppingCarIcon").stop().animate({top: "30px"}, 0)
//    })
//收藏和旁边小车动画效果结束
});

