/**
 * 二级分类页面动态数据绑定函数
 * Created by WW on 2016/8/25.
 */

/**
 * 二级页面分类菜单加载
 * Params：
 *  template:模板
 *  data:数据
 * Created by WW on 2016/8/25.
 */
$(function () {
    var lv1Id = $("#pageInfo_ww").attr("lv1_id");   //获取当前页面一级分类id;
    var currentPageId = $("#pageInfo_ww").attr("currentPageId");   //获取当前页面id;
    var currentPageName = $("#pageInfo_ww").attr("currentPageName");   //获取当前页面name;
    var currentPageRes = $("#pageInfo_ww").attr("currentPageRes");   //获取当前页面Resources路径

    Handlebars.registerHelper("lv2_eachCategory_lv3", function (item, options) {
        var result = "";
        var count = item.length % 4 == 0 ? item.length : item.length + (4 - item.length % 4);    //补齐标签
        for (var i = 0; i < count; i++) {
            result += options.fn(item[i]);
        }
        return result;
    });

    var success = function (data) {
        var dynamicDataNames = [];
        var dataLength = data.length;
        var dynamicA = $(".latest_product_wrap_t>.fn_right");
        //var dynamicALength = dataLength > dynamicA.length ? dynamicA.length : dataLength;
        var dynamicALength = Math.min(dynamicA.length, dataLength)
        while (dynamicDataNames.length < dynamicALength) {
            var randomNumber = Math.floor(Math.random() * dataLength);
            var dynamicDataName = data[randomNumber].name;
            //if (dynamicDataNames.indexOf(dynamicDataName)) {
            //    dynamicDataNames.push(dynamicDataName);
            //}
            if (meIndexOF(dynamicDataNames, dynamicDataName)) {
                dynamicDataNames.push(dynamicDataName);
            }
        }
        for (var i = 0; i < dynamicA.length; i++) {
            if (i < dynamicDataNames.length) {
                dynamicA.eq(i).text(dynamicDataNames[i]);
            } else {
                dynamicA.eq(i).remove();
            }
        }
        function meIndexOF(arr, val) {
            if (arr) {
                for (var i = 0; i < arr.length; i++) {
                    if (arr[i] == val) {
                        return false;
                    }
                }
                return true;
            }
            return true
        }
        
        var template = $("#lv2_categoryList_lv3").html();
        var html = loadHandlebarsTemplate(template, data);
        $(".live_fish_wrap_b_fish").append(html);
        var nodes = $(".live_fish_wrap_b_fish").children();
        //var nodes = document.getElementsByClassName("live_fish_wrap_b_fish")[0].childNodes;
        for (var i = 0; i < nodes.length; i++) {
            if (nodes[i].nodeType == 1) {
                if (nodes[i].firstChild.textContent == "") {
                    nodes[i].firstChild.setAttribute("href", "javascript:void(0)");  //多余标签禁止跳转
                }
            }
        }
        page_classify_color();  //修改标签颜色
    };
    requestDataWithAJAX("../fsajax/FSGoodsCategory.ajax?level2=" + currentPageId, "get", false, {"success": success});

    function page_classify_color() {
        var _lv1_id = $("#pageInfo_ww").attr("lv1_id");   //获取当前一级页面id;
        var colors = {
            "307_00000000000000237_gic": {deep_color: "#2b72c5", light_color: "#4d9dfc"},//deep_color对应的深色，预留一下
            "307_00000000000002491_gic": {deep_color: "#78a000", light_color: "#8ab700"},
            "307_00000000000003559_gic": {deep_color: "#b1181a", light_color: "#c91622"},
            "307_00000000000004244_gic": {deep_color: "#be831c", light_color: "#eda423"},
            "307_00000000000005153_gic": {deep_color: "#c21e54", light_color: "#f1286a"},
            "307_00000000000004784_gic": {deep_color: "#be831c", light_color: "#eda423"},
            "307_00000000000002298_gic": {deep_color: "#a26742", light_color: "#be794e"},
            "307_00000000000001644_gic": {deep_color: "#be831c", light_color: "#eda423"},
            "307_00000000000000997_gic": {deep_color: "#b1181a", light_color: "#c91622"},
            "307_00000000000000691_gic": {deep_color: "#a26742", light_color: "#be794e"},
            "307_00000000000000249_gic": {deep_color: "#006ac8", light_color: "#027bd6"},
            "307_00000000000002668_gic": {deep_color: "#8B4513", light_color: "#bd672a"},
            "307_00000000000003171_gic": {deep_color: "#ad6e2e", light_color: "#c1874c"},
            "307_00000000000003414_gic": {deep_color: "#be831c", light_color: "#eda423"},
            "307_00000000000003675_gic": {deep_color: "#006ac8", light_color: "#027bd6"},
            "307_00000000000004089_gic": {deep_color: "#b1181a", light_color: "#c91622"},
            "307_00000000000004203_gic": {deep_color: "#4890fe", light_color: "#69a5ff"},
            "307_00000000000004793_gic": {deep_color: "#f04044", light_color: "#ff5764"},
            "307_00000000000005535_gic": {deep_color: "#ec5510", light_color: "#fe611a"},
            "307_00000000000000374_gic": {deep_color: "#006ac8", light_color: "#027bd6"},
            "307_00000000000000379_gic": {deep_color: "#161f62", light_color: "#3456a0"},
            "307_00000000000000382_gic": {deep_color: "#7d9b16", light_color: "#98bc1b"},
            "307_00000000000000390_gic": {deep_color: "#b1181a", light_color: "#c91622"},
            "307_00000000000005479_gic": {deep_color: "#cc2954", light_color: "#e24a72"},
            "307_00000000000006104_gic": {deep_color: "#3c4d6a", light_color: "#667a9c"},
            "307_00000000000005895_gic": {deep_color: "#ec5510", light_color: "#fe611a"},
            "307_00000000000000241_gic": {deep_color: "#3981a6", light_color: "#62a8cc"},
            "307_00000000000002200_gic": {deep_color: "#006ac8", light_color: "#027bd6"},
            "307_00000000000002238_gic": {deep_color: "#009f96", light_color: "#00c3b8"},
            "307_00000000000002542_gic": {deep_color: "#b1181a", light_color: "#c91622"},
            "307_00000000000002606_gic": {deep_color: "#3c4d6a", light_color: "#667a9c"},
            "307_00000000000002618_gic": {deep_color: "#006ac8", light_color: "#027bd6"},
            "307_00000000000001166_gic": {deep_color: "#4890fe", light_color: "#69a5ff"},
            "307_00000000000000236_gic": {deep_color: "#3981a6", light_color: "#62a8cc"},
            "307_00000000000000297_gic": {deep_color: "#2b72c5", light_color: "#4d9dfc"},
            "307_00000000000000332_gic": {deep_color: "#8B4513", light_color: "#a96e44"},
            "307_00000000000000426_gic": {deep_color: "#4c4437", light_color: "#a9987b"},
            "307_00000000000004223_gic": {deep_color: "#69a5ff", light_color: "#69a5ff"},
            "307_00000000000000656_gic": {deep_color: "#4c4437", light_color: "#a9987b"}
        };
        var light_color = colors[_lv1_id].light_color;
        $(".live_fish_wrap_b .live_fish_wrap_b_fish li").css("background", light_color);
    };

    /**
     * 二级页面广告位数据请求并加载
     * Params：
     * Created by WW on 2016/9/29.
     */
    //品牌专区广告位
    (function () {
        var success     = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    try{
                        $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                        var jsonInfo = data[i].adsInfo.jsonInfo ? JSON.parse(data[i].adsInfo.jsonInfo) : {"goodsName": "", "goodsPrice": ""};
                        jsonInfo.goodsPrice = jsonInfo.goodsPrice != "" ? "￥" + jsonInfo.goodsPrice : "";
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_title").text(jsonInfo.goodsName);
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_title").attr("title", jsonInfo.goodsName);
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_description").text(data[i].adsInfo.remark);
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_description").attr("title", data[i].adsInfo.remark);
                        /*$("." + data[i].adsInfo.advertId + ">.brand_zone_price").text(jsonInfo.goodsPrice);
                         $("." + data[i].adsInfo.advertId + ">.brand_zone_price").attr("title", jsonInfo.goodsPrice);*/
                    } catch (ex) {
                        console.error(ex);
                        if (data[i]) {
                            console.error("广告位数据异常", data[i]);
                        }
                    }
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "pinpaizhuanqu"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //猜你喜欢广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    try{
                        $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_title").text(data[i].goods.name);
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_title").attr("title", data[i].goods.name);
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_description").text(data[i].goods.description);
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_description").attr("title", data[i].goods.description);
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_price").text($.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
                        $("." + data[i].adsInfo.advertId + ">.brand_zone_price").attr("title", $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
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

    Handlebars.registerHelper({
        showPrice: function (data) {
            if (data != undefined && !isNaN(data)) {
                return $.ww.formatDecimal(data, 2);
            } else {
                return "0.00";
            }
        }
    });
    //本日秒杀广告位
    //秒杀
    (function () {
        var dateStr = (new Date()).Format("yyyy-MM-dd hh:mm:ss");
        var request_params = {"activityType": "01", "date": dateStr, "pageIndex": 1, "pageSize": 5};
        var template_miaosha = function () {
            /*****
             {{#each this}}
             <li>
             <a href="/fsgd/{{goodsInfo.id}}.jhtml?fromPage=promotion" class="brand_zone_goods level_${level2}_benrimiaosha_01">
             <img src="{{itemInfoList.0.itemPictureList.0.bigPicturePath}}" />
             <p class="brand_zone_title">{{goodsInfo.name}}</p>
             <p class="brand_zone_price"><strong>¥</strong>{{#showPrice itemInfoList.0.promotionItemForm.itemPromotionPrice}}{{/showPrice}}</p>
             </a>
             </li>
             {{/each}}
             *****/
        };
        $.post("/fsActivity/activityList.ajax", request_params, function (data) {
            data = JSON.parse(data);
            var template = cutTemplateWrap(template_miaosha);
            var html = loadHandlebarsTemplate(template, data.dataList);
            $("#brand_zone").html(html);
        });
    })();
    //秒杀下侧广告位
    var success = function (data) {
        data = JSON.parse(data);
        if (data != undefined && data.length != 0 && data != "[]") {
            for (var i in data) {
                $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
            }
        }
    };
    var data = {"type": "level", "serialId": currentPageId, "rangeId": "miaosha_bottom"};
    requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});

    //一层广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "f1"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //二层广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "f2"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //三层广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "f3"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //四层广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "f4"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //五层广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "f5"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //六层广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "f6"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //七层广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "f7"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //八层广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + ">img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": currentPageId, "rangeId": "f8"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();

	//生鲜小报
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    //$("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + " img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "level", "serialId": lv1Id, "rangeId": "sxxb"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();

    ////生鲜风采广告位
    //var success = function (data) {
    //    data = JSON.parse(data);
    //    if (data != undefined && data.length != 0 && data != "[]") {
    //        $(".fresh_style02 a").attr("href", data[0].adsInfo.goodsLink);
    //        $(".fresh_style02 a img").attr("src", data[0].adsInfo.advertPic);
    //    }
    //};
    //var data = {"type": "level", "serialId": currentPageId, "rangeId": "shengxianfengcai"};
    //requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
});
