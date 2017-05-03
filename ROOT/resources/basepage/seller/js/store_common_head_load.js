/**
 * Created by WW on 2016/10/31.
 */
(function ($) {
    if (!$.ww) {
        $.ww = {};
    }
        //商铺头加载
    $.ww.getHead = function (storeId, storeTemplateCode) {
        var head = {};
        $.when($.ajax({
            "url": "/fsst/" + storeId + "/header_top.jhtml",
            "type": "post",
            "async": false,
            "data": {"storeId": storeId}
        }), $.ajax({
            "url": "/fsst/" + storeId + "/header_nav.jhtml",
            "type": "post",
            "async": false,
            "data": {"storeId": storeId}
        })).done(function (data1, data2) {
            data1 = data1[0];
            data2 = data2[0];
            data1 = data1.replace(/#storeId#/g, storeId);
            data1 = data1.replace(/#storeTemplateCode#/g, storeTemplateCode);
            data2 = data2.replace(/#storeId#/g, storeId);
            data2 = data2.replace(/#storeTemplateCode#/g, storeTemplateCode);
            head.top = data1;
            head.nav = data2;
        });
        return head;
    };
        $.ww.getHeadTopInfo = function (storeId, storeTemplateCode) {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("img." + data[i].adsInfo.elementId).attr("src", data[i].adsInfo.advertPic);
                    if (data[i].adsInfo.advertLink) {
                        $("a." + data[i].adsInfo.elementId).attr("href", data[i].adsInfo.advertLink);
                    } else {
                        $("a." + data[i].adsInfo.elementId).attr("href", "/fsgd/" + data[i].adsInfo.goodsId + ".jhtml");
                    }
                }
            }
            $(".store_" + storeId + "_" + storeTemplateCode + "_common_header_top_00").not("img").attr("href", "/fsst/" + storeId + "/top.jhtml");
        };
        var data = {
            "type": "store",
            "storeId": storeId,
            "templatesCode": storeTemplateCode,
            "channel": "common",
            "rangeId": "header_top"
        };
        $.ajax({
            "url": "/fsajax/getSellerTemplateElementInfo.ajax",
            "type": "post",
            "async": true,
            "data": data,
            "success": success
        });
    };
    $.ww.getHeadNavInfo = function (storeId, storeTemplateCode) {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.elementId).parent().css("background", "url(" + data[i].adsInfo.advertPic + ") no-repeat center");
                }
            }
        };
        var data = {
            "type": "store",
            "storeId": storeId,
            "templatesCode": storeTemplateCode,
            "channel": "common",
            "rangeId": "header_nav"
        };
        $.ajax({
            "url": "/fsajax/getSellerTemplateElementInfo.ajax",
            "type": "post",
            "async": true,
            "data": data,
            "success": success
        });
    };
    //range加载 Created by WW on 2016/11/03.
    $.ww.getRange = function (storeId, rangeCount, ItemCountList, successFunc) {
        var success = function (data) {
            data = JSON.parse(data.replace(/\t/g, ""));
            var rangeList = {};
            var categoryList = [];
            for (var i in data) {
                if (data[i].grade == 1) {
                    categoryList.push(data[i]);
                }
            }
            for (var i = 0; i < categoryList.length - 1; i++) {
                for (var j = 0; j < categoryList.length - i - 1; j++) {
                    if (categoryList[j].orders > categoryList[j + 1].orders) {
                        var temp = categoryList[j];
                        categoryList[j] = categoryList[j + 1];
                        categoryList[j + 1] = temp;
                    }
                }
            }
            var requestList = [];
            for (var i = 0; i < Math.min(rangeCount, categoryList.length); i++) {
                rangeList["range" + (i + 1)] = categoryList[i];
                var list_params = {"pageRows": ItemCountList[i], "pageStart": 1, "filterQueryMap": {"store_id": [storeId], "store_category_id_2": [categoryList[i].id]}, "searchText": "", "sorts": {}, "minPrice": "", "maxPrice": "", "queryOption": {"catCondItems": true, "condItems": false, "sort": true, "price": true}, "queryData": {}};
                var requestData = {"condition": JSON.stringify(list_params)};
                requestList.push($.ajax({
                    "url": "/fsajax/goodsSearch.ajax",
                    "type": "post",
                    "async": true,
                    "data": requestData
                }));
            }
            //替代写法
            $.when.apply(this, requestList).done(function () {
                dataFormat(arguments);
            });

            function dataFormat(data) {
                Handlebars.registerHelper({
                    showPrice: function (item) {
                        if (item) {
                            return $.ww.formatDecimal(item, 2);
                        } else {
                            return "0.00";
                        }
                    }
                });
                var result = {};
                if (requestList.length) {
                    if (requestList.length == 1) {
                        result["range1"] = JSON.parse(data[0]).data.dataList;
                    } else {
                        for (var i in data) {
                            result["range" + (parseInt(i) + 1)] = JSON.parse(data[i][0]).data.dataList;
                        }
                    }
                }
                result["rangeList"] = rangeList;
                successFunc(result);
            }
        };
        $.ajax({
            "url": "/fsajax/sellerStoreCategory.ajax",
            "type": "post",
            "async": true,
            "data": {"storeId": storeId},
            "success": success
        });
    };
    //categoryList加载 Created by WW on 2016/11/12.
    $.ww.getCategoryList = function (storeId, successFunc) {
        var success = function (data) {
            data = JSON.parse(data);
            var categoryList = [];
            for (var i in data) {
                if (data[i].grade == 1) {
                    categoryList.push(data[i]);
                }
            }
            for (var i = 0; i < categoryList.length - 1; i++) {
                for (var j = 0; j < categoryList.length - i - 1; j++) {
                    if (categoryList[j].orders > categoryList[j + 1].orders) {
                        var temp = categoryList[j];
                        categoryList[j] = categoryList[j + 1];
                        categoryList[j + 1] = temp;
                    }
                }
            }
            successFunc(categoryList);
        };
        $.ajax({
            "url": "/fsajax/sellerStoreCategory.ajax",
            "type": "post",
            "async": true,
            "data": {"storeId": storeId},
            "success": success
        });
    };
})(jQuery);

$(function () {
    var storeId = $("#pageInfo").attr("store_id");   //获取当前页面storeId;
    var storeTemplateCode = $("#pageInfo").attr("store_template_code");
    var head = $.ww.getHead(storeId,storeTemplateCode);
    $("#sp_hd_1").html(head.top);
    $("#sp_hd_2").html(head.nav);
    $.ajaxSetup({
        cache: true
    });
    $.getScript("/resources/basepage/store/default/common_js/top_banner.js", function () {
    });
});
