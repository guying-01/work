/**
 * 一级分类页面
 * Created by kuban on 2017/2/3.
 */
$("#pageInfo_ww").ready(function () {
    var currentPageId = $("#pageInfo_ww").attr("currentPageId");   //获取当前页面id;
    var currentPageName = $("#pageInfo_ww").attr("currentPageName");   //获取当前页面name;
    var currentPageRes = $("#pageInfo_ww").attr("currentpageres");   //获取当前页面Resources路径
    //获取二级分类
    (function () {
        var success = function (data) {
            if (data != undefined && data.length != 0 && data != "[]") {
                var template = $("#secound_category_list").html();
                var html=loadHandlebarsTemplate(template,data);
                $(".secound_category_list").html(html);
                complementEle()
            }
        };
        var excludeSequence = ["307_00000000000000390_gic", "307_00000000000000332_gic"];
        if (excludeSequence.indexOf(currentPageId) == -1) {
            requestDataWithAJAX("../fsajax/FSGoodsCategory.ajax?level2=" + currentPageId, "get", false, {"success": success});
        }
    })();
    /**
     *  一级页面分类类别补全,如果不是四的倍数，剩余部分用空标签补全
     * */
    function complementEle(){
        var allEle=$('.secound_category_list ul li');
        var num=4-allEle.length%4;
        console.log(num)
        if(num==4){
            return;
        }
        else{
            for (var i=0;i<num;i++){
                $('<li><a></a></li>').appendTo($('.secound_category_list ul'))
            }
        }
    }
    //猜你喜欢广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    try{
                        $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                        $("." + data[i].adsInfo.advertId).siblings("div").find("a").attr("src", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId).siblings("div").find("a").html("<div>" + data[i].goods.name + "</div>"+ "<p title='" +  $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2) + "'>" + '￥'+ $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2) + "</p>");
                        $("." + data[i].adsInfo.advertId).siblings("div").find("a").attr("title", data[i].goods.name);
                    } catch (ex) {
                        console.error(ex);
                        if (data[i]) {
                            console.error("广告位数据异常", data[i]);
                        }
                    }
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "cainixihuan"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //新品推荐广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    try {
                        $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                        $("." + data[i].adsInfo.advertId).siblings("div").find("a").attr("src", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId).siblings("div").find("a").html("<div>" + data[i].goods.name + "</div>" + "<p title='" +  $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2) + "'>" + '￥'+ $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2) + "</p>");
                        $("." + data[i].adsInfo.advertId).siblings("div").find("a").attr("title", data[i].goods.name);
                    } catch (ex) {
                        console.error(ex);
                        if (data[i]) {
                            console.error("广告位数据异常", data[i]);
                        }
                    }
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "xinpintuijian"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //一层广告位
    (function () {
        var request1 = {"type": "level", "serialId": currentPageId, "rangeId": "f1"};
        var request2 = {"type": "level", "serialId": currentPageId, "rangeId": "f1_banner"};
        var request3 = {"type": "level", "serialId": currentPageId, "rangeId": "f1_bottom"};
        var ads_mainAds = $.post("/fsajax/getAdsPic.ajax", request1);
        var ads_banner1 = $.post("/fsajax/getAdsPic.ajax", request2);
        var ads_bottom = $.post("/fsajax/getAdsPic.ajax", request3);
        $.when(ads_mainAds, ads_banner1, ads_bottom).done(function () {
            for (var i in arguments) {
                eval("var data" + (parseInt(i) + 1) + " = JSON.parse(arguments[" + i + "][0])");
            }
            for (var j = 0; j < Math.max(data1.length, data2.length, data3.length); j++) {
                if (data1[j]) {
                    $("." + data1[j].adsInfo.advertId).attr("href", data1[j].adsInfo.goodsLink);
                    $("." + data1[j].adsInfo.advertId + ">img").attr("src", data1[j].adsInfo.advertPic);
                }
                if (data2[j]) {
                    $("." + data2[j].adsInfo.advertId).attr("href", data2[j].adsInfo.goodsLink);
                    $("." + data2[j].adsInfo.advertId + ">img").attr("src", data2[j].adsInfo.advertPic);
                }
                if (data3[j]) {
                    $("." + data3[j].adsInfo.advertId).attr("href", data3[j].adsInfo.goodsLink);
                    $("." + data3[j].adsInfo.advertId + ">img").attr("src", data3[j].adsInfo.advertPic);
                }
            }
        });
    })();
    //二层广告位
    (function () {
        var request1 = {"type": "level", "serialId": currentPageId, "rangeId": "f2"};
        var request2 = {"type": "level", "serialId": currentPageId, "rangeId": "f2_banner1"};
        var request3 = {"type": "level", "serialId": currentPageId, "rangeId": "f2_banner2"};
        var request4 = {"type": "level", "serialId": currentPageId, "rangeId": "f2_bottom"};
        var ads_mainAds = $.post("/fsajax/getAdsPic.ajax", request1);
        var ads_banner1 = $.post("/fsajax/getAdsPic.ajax", request2);
        var ads_banner2 = $.post("/fsajax/getAdsPic.ajax", request3);
        var ads_bottom = $.post("/fsajax/getAdsPic.ajax", request4);
        $.when(ads_mainAds, ads_banner1, ads_banner2, ads_bottom).done(function () {
            for (var i in arguments) {
                eval("var data" + (parseInt(i) + 1) + " = JSON.parse(arguments[" + i + "][0])");
            }
            for (var j = 0; j < Math.max(data1.length, data2.length, data3.length, data4.length); j++) {
                if (data1[j]) {
                    $("." + data1[j].adsInfo.advertId).attr("href", data1[j].adsInfo.goodsLink);
                    $("." + data1[j].adsInfo.advertId + ">img").attr("src", data1[j].adsInfo.advertPic);
                }
                if (data2[j]) {
                    $("." + data2[j].adsInfo.advertId).attr("href", data2[j].adsInfo.goodsLink);
                    $("." + data2[j].adsInfo.advertId + ">img").attr("src", data2[j].adsInfo.advertPic);
                }
                if (data3[j]) {
                    $("." + data3[j].adsInfo.advertId).attr("href", data3[j].adsInfo.goodsLink);
                    $("." + data3[j].adsInfo.advertId + ">img").attr("src", data3[j].adsInfo.advertPic);
                }
                if (data4[j]) {
                    $("." + data4[j].adsInfo.advertId).attr("href", data4[j].adsInfo.goodsLink);
                    $("." + data4[j].adsInfo.advertId + ">img").attr("src", data4[j].adsInfo.advertPic);
                }
            }
        });
    })();
    //三层广告位
    (function () {
        var request1 = {"type": "level", "serialId": currentPageId, "rangeId": "f3"};
        var request2 = {"type": "level", "serialId": currentPageId, "rangeId": "f3_banner"};
        var request3 = {"type": "level", "serialId": currentPageId, "rangeId": "f3_bottom"};
        var ads_mainAds = $.post("/fsajax/getAdsPic.ajax", request1);
        var ads_banner1 = $.post("/fsajax/getAdsPic.ajax", request2);
        var ads_bottom = $.post("/fsajax/getAdsPic.ajax", request3);
        $.when(ads_mainAds, ads_banner1, ads_bottom).done(function () {
            for (var i in arguments) {
                eval("var data" + (parseInt(i) + 1) + " = JSON.parse(arguments[" + i + "][0])");
            }
            for (var j = 0; j < Math.max(data1.length, data2.length, data3.length); j++) {
                if (data1[j]) {
                    $("." + data1[j].adsInfo.advertId).attr("href", data1[j].adsInfo.goodsLink);
                    $("." + data1[j].adsInfo.advertId + ">img").attr("src", data1[j].adsInfo.advertPic);
                }
                if (data2[j]) {
                    $("." + data2[j].adsInfo.advertId).attr("href", data2[j].adsInfo.goodsLink);
                    $("." + data2[j].adsInfo.advertId + ">img").attr("src", data2[j].adsInfo.advertPic);
                }
                if (data3[j]) {
                    $("." + data3[j].adsInfo.advertId).attr("href", data3[j].adsInfo.goodsLink);
                    $("." + data3[j].adsInfo.advertId + ">img").attr("src", data3[j].adsInfo.advertPic);
                }
            }
        });
    })();
    //四层广告位
    (function () {
        var request1 = {"type": "level", "serialId": currentPageId, "rangeId": "f4"};
        var request2 = {"type": "level", "serialId": currentPageId, "rangeId": "f4_banner"};
        var request3 = {"type": "level", "serialId": currentPageId, "rangeId": "f4_bottom"};
        var ads_mainAds = $.post("/fsajax/getAdsPic.ajax", request1);
        var ads_banner1 = $.post("/fsajax/getAdsPic.ajax", request2);
        var ads_bottom = $.post("/fsajax/getAdsPic.ajax", request3);
        $.when(ads_mainAds, ads_banner1, ads_bottom).done(function () {
            for (var i in arguments) {
                eval("var data" + (parseInt(i) + 1) + " = JSON.parse(arguments[" + i + "][0])");
            }
            for (var j = 0; j < Math.max(data1.length, data2.length, data3.length); j++) {
                if (data1[j]) {
                    $("." + data1[j].adsInfo.advertId).attr("href", data1[j].adsInfo.goodsLink);
                    $("." + data1[j].adsInfo.advertId + ">img").attr("src", data1[j].adsInfo.advertPic);
                }
                if (data2[j]) {
                    $("." + data2[j].adsInfo.advertId).attr("href", data2[j].adsInfo.goodsLink);
                    $("." + data2[j].adsInfo.advertId + ">img").attr("src", data2[j].adsInfo.advertPic);
                }
                if (data3[j]) {
                    $("." + data3[j].adsInfo.advertId).attr("href", data3[j].adsInfo.goodsLink);
                    $("." + data3[j].adsInfo.advertId + ">img").attr("src", data3[j].adsInfo.advertPic);
                }
            }
        });
    })();
    //五层广告位
    (function () {
        var request1 = {"type": "level", "serialId": currentPageId, "rangeId": "f5"};
        var request2 = {"type": "level", "serialId": currentPageId, "rangeId": "f5_banner"};
        var request3 = {"type": "level", "serialId": currentPageId, "rangeId": "f5_bottom"};
        var ads_mainAds = $.post("/fsajax/getAdsPic.ajax", request1);
        var ads_banner1 = $.post("/fsajax/getAdsPic.ajax", request2);
        var ads_bottom = $.post("/fsajax/getAdsPic.ajax", request3);
        $.when(ads_mainAds, ads_banner1, ads_bottom).done(function () {
            for (var i in arguments) {
                eval("var data" + (parseInt(i) + 1) + " = JSON.parse(arguments[" + i + "][0])");
            }
            for (var j = 0; j < Math.max(data1.length, data2.length, data3.length); j++) {
                if (data1[j]) {
                    $("." + data1[j].adsInfo.advertId).attr("href", data1[j].adsInfo.goodsLink);
                    $("." + data1[j].adsInfo.advertId + ">img").attr("src", data1[j].adsInfo.advertPic);
                }
                if (data2[j]) {
                    $("." + data2[j].adsInfo.advertId).attr("href", data2[j].adsInfo.goodsLink);
                    $("." + data2[j].adsInfo.advertId + ">img").attr("src", data2[j].adsInfo.advertPic);
                }
                if (data3[j]) {
                    $("." + data3[j].adsInfo.advertId).attr("href", data3[j].adsInfo.goodsLink);
                    $("." + data3[j].adsInfo.advertId + ">img").attr("src", data3[j].adsInfo.advertPic);
                }
            }
        });
    })();
    //六层广告位
    (function () {
        var request1 = {"type": "level", "serialId": currentPageId, "rangeId": "f6"};
        var request2 = {"type": "level", "serialId": currentPageId, "rangeId": "f6_banner1"};
        var request3 = {"type": "level", "serialId": currentPageId, "rangeId": "f6_banner2"};
        var request4 = {"type": "level", "serialId": currentPageId, "rangeId": "f6_bottom"};
        var ads_mainAds = $.post("/fsajax/getAdsPic.ajax", request1);
        var ads_banner1 = $.post("/fsajax/getAdsPic.ajax", request2);
        var ads_banner2 = $.post("/fsajax/getAdsPic.ajax", request3);
        var ads_bottom = $.post("/fsajax/getAdsPic.ajax", request4);
        $.when(ads_mainAds, ads_banner1, ads_banner2, ads_bottom).done(function () {
            for (var i in arguments) {
                eval("var data" + (parseInt(i) + 1) + " = JSON.parse(arguments[" + i + "][0])");
            }
            for (var j = 0; j < Math.max(data1.length, data2.length, data3.length, data4.length); j++) {
                if (data1[j]) {
                    $("." + data1[j].adsInfo.advertId).attr("href", data1[j].adsInfo.goodsLink);
                    $("." + data1[j].adsInfo.advertId + ">img").attr("src", data1[j].adsInfo.advertPic);
                }
                if (data2[j]) {
                    $("." + data2[j].adsInfo.advertId).attr("href", data2[j].adsInfo.goodsLink);
                    $("." + data2[j].adsInfo.advertId + ">img").attr("src", data2[j].adsInfo.advertPic);
                }
                if (data3[j]) {
                    $("." + data3[j].adsInfo.advertId).attr("href", data3[j].adsInfo.goodsLink);
                    $("." + data3[j].adsInfo.advertId + ">img").attr("src", data3[j].adsInfo.advertPic);
                }
                if (data4[j]) {
                    $("." + data4[j].adsInfo.advertId).attr("href", data4[j].adsInfo.goodsLink);
                    $("." + data4[j].adsInfo.advertId + ">img").attr("src", data4[j].adsInfo.advertPic);
                }
            }
        });
    })();
    //七层广告位
    (function () {
        var request1 = {"type": "level", "serialId": currentPageId, "rangeId": "f7"};
        var request2 = {"type": "level", "serialId": currentPageId, "rangeId": "f7_banner1"};
        var request3 = {"type": "level", "serialId": currentPageId, "rangeId": "f7_banner2"};
        var request4 = {"type": "level", "serialId": currentPageId, "rangeId": "f7_bottom"};
        var ads_mainAds = $.post("/fsajax/getAdsPic.ajax", request1);
        var ads_banner1 = $.post("/fsajax/getAdsPic.ajax", request2);
        var ads_banner2 = $.post("/fsajax/getAdsPic.ajax", request3);
        var ads_bottom = $.post("/fsajax/getAdsPic.ajax", request4);
        $.when(ads_mainAds, ads_banner1, ads_banner2, ads_bottom).done(function () {
            for (var i in arguments) {
                eval("var data" + (parseInt(i) + 1) + " = JSON.parse(arguments[" + i + "][0])");
            }
            for (var j = 0; j < Math.max(data1.length, data2.length, data3.length, data4.length); j++) {
                if (data1[j]) {
                    $("." + data1[j].adsInfo.advertId).attr("href", data1[j].adsInfo.goodsLink);
                    $("." + data1[j].adsInfo.advertId + ">img").attr("src", data1[j].adsInfo.advertPic);
                }
                if (data2[j]) {
                    $("." + data2[j].adsInfo.advertId).attr("href", data2[j].adsInfo.goodsLink);
                    $("." + data2[j].adsInfo.advertId + ">img").attr("src", data2[j].adsInfo.advertPic);
                }
                if (data3[j]) {
                    $("." + data3[j].adsInfo.advertId).attr("href", data3[j].adsInfo.goodsLink);
                    $("." + data3[j].adsInfo.advertId + ">img").attr("src", data3[j].adsInfo.advertPic);
                }
                if (data4[j]) {
                    $("." + data4[j].adsInfo.advertId).attr("href", data4[j].adsInfo.goodsLink);
                    $("." + data4[j].adsInfo.advertId + ">img").attr("src", data4[j].adsInfo.advertPic);
                }
            }
        });
    })();
    //八层广告位
    (function () {
        var request1 = {"type": "level", "serialId": currentPageId, "rangeId": "f8"};
        var request2 = {"type": "level", "serialId": currentPageId, "rangeId": "f8_banner1"};
        var request3 = {"type": "level", "serialId": currentPageId, "rangeId": "f8_banner2"};
        var request4 = {"type": "level", "serialId": currentPageId, "rangeId": "f8_bottom"};
        var ads_mainAds = $.post("/fsajax/getAdsPic.ajax", request1);
        var ads_banner1 = $.post("/fsajax/getAdsPic.ajax", request2);
        var ads_banner2 = $.post("/fsajax/getAdsPic.ajax", request3);
        var ads_bottom = $.post("/fsajax/getAdsPic.ajax", request4);
        $.when(ads_mainAds, ads_banner1, ads_banner2, ads_bottom).done(function () {
            for (var i in arguments) {
                eval("var data" + (parseInt(i) + 1) + " = JSON.parse(arguments[" + i + "][0])");
            }
            for (var j = 0; j < Math.max(data1.length, data2.length, data3.length, data4.length); j++) {
                if (data1[j]) {
                    $("." + data1[j].adsInfo.advertId).attr("href", data1[j].adsInfo.goodsLink);
                    $("." + data1[j].adsInfo.advertId + ">img").attr("src", data1[j].adsInfo.advertPic);
                }
                if (data2[j]) {
                    $("." + data2[j].adsInfo.advertId).attr("href", data2[j].adsInfo.goodsLink);
                    $("." + data2[j].adsInfo.advertId + ">img").attr("src", data2[j].adsInfo.advertPic);
                }
                if (data3[j]) {
                    $("." + data3[j].adsInfo.advertId).attr("href", data3[j].adsInfo.goodsLink);
                    $("." + data3[j].adsInfo.advertId + ">img").attr("src", data3[j].adsInfo.advertPic);
                }
                if (data4[j]) {
                    $("." + data4[j].adsInfo.advertId).attr("href", data4[j].adsInfo.goodsLink);
                    $("." + data4[j].adsInfo.advertId + ">img").attr("src", data4[j].adsInfo.advertPic);
                }
            }
        });
    })();
    //分享有礼广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                $(".share a").eq(0).attr("href", data[0].adsInfo.goodsLink);
                $(".share a img").eq(0).attr("src", data[0].adsInfo.advertPic);
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "fenxiangyouli"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //饭饭淘广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                $(".fftao a").eq(0).attr("href", data[0].adsInfo.goodsLink);
                $(".fftao a img").eq(0).attr("src", data[0].adsInfo.advertPic);
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "fanfantao"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
});
