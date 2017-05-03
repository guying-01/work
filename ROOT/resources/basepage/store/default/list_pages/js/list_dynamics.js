/**
 * 商品展示页面动态数据绑定函数
 * Created by WW on 2016/9/1.
 */


var params = getURLParameters();
var lv1_id = params.level1 != undefined ? params.level1 : "";   //获取一级id;
var lv1_name = params.name1 != undefined ? params.name1 : "";   //获取一级name;
var lv2_id = params.level2 != undefined ? params.level2 : "";   //获取二级id;
var lv2_name = params.name2 != undefined ? params.name2 : "";   //获取二级name;
var lv3_id = params.level3 != undefined ? params.level3 : "";   //获取三级id;
var lv3_name = params.name3 != undefined ? params.name3 : "";   //获取三级name;
//getGoodsList();

Handlebars.registerHelper({
 deliverTime: function (day,time) {

     if (time) {
         time = time.split(":")[0]
     }
     else {
         //备货时间不存在
     }
     var result = "";
     if ("2" == day) {
         if (time < 12) {
             result = "/resources/basepage/store/default/common_img/deliver_time_01.png";
         } else {
             result = "/resources/basepage/store/default/common_img/deliver_time_02.png";
         }
     } else if ("3" == day) {
         result = "/resources/basepage/store/default/common_img/deliver_time_03.png";
     }
     return result;
 }
});
$(function () {

    var isOrderByContractNo = $("#pageInfo").attr("isOrderByContractNo");   //获取当前页面默认排序方式的标识;


    $('.loginShut').click(function () {
        $('.bgBlack').hide();
        $('#login_popUp').hide();
        $('.loginError').hide();
    });
    // 登录
    $("#btnSubmit").click(function () {
        var flag = true;
        var userName = $("#userName").val();
        var password = $("#password").val();
        if (userName.length == 0) {
            $("#usere_1").show().css("display", "block");
            $("#usere_1").siblings(".loginError").hide();
            flag = false;
        } else {
            $(".form #userName").siblings(".loginError").hide()
        }
        if (password.length == 0) {
            $("#pwde").show().css("display", "block");
            $(".form #password").addClass("redborder");
            flag = false;
        } else {
            $(".form #password").siblings(".loginError").hide();
        }
        if (!flag) {
            return flag;
        }
        $("#password").val($.md5($("#password").val()));
        var successResponse = function (data) {
            if (!data.success) {
                if (data.code == "userName_passWord_isNull") {
                    if (data.data.username == null || data.data.username == "") {
                        $("#usere_1").show().css("display", "block");
                    }
                    if (data.data.password == null || data.data.password == "") {
                        $("#pwde").show().css("display", "block");
                    }
                }
                //else if (data.code == "infoCaptcha_isError") {
                //    $("#captchaWrong").show();
                //    refreshCaptcha("");
                //}
                else if (data.code == "userName_passWord_isError") {
                    $("#usere_2").show().css("display", "block");
                } else if (data.code == "userLock_isError") {
                    $("#usere_3").show().css("display", "block");
                }
            } else {
                // location.reload();
                jsAlert('登录成功');
                $('.bgBlack').hide();
                $('#login_popUp').hide();
                $('.loginError').hide();
            }

        };
        requestDataWithAJAX("/doLogin.ajax", "post", true, {"data": $("#loginForm").serialize(), "success": successResponse});
    });


    /**
     * 商品展示页面内容加载
     * Created by WW on 2016/09/06.
     */
    function getGoodsList() {
        //默认请求参数
        var list_params = {"pageRows": 10, "pageStart": 1, "shiftCount": 0, "filterQueryMap": {"item_category_id_1":[lv1_id],"item_category_id_2":[lv2_id]}, "searchText": "", "sorts": {}, "minPrice": "", "maxPrice": "", "queryOption": {"catCondItems": true, "condItems": true, "sort": true, "price": false}, "queryData": {}};
        var success = function (result) {
            result = result.replace(/\t/g, "");
            var data = JSON.parse(result).data;
            if (data != undefined && data.pagerMap != undefined) {
                getGoodsListMain(data);
                getGoodsListPage(data.pagerMap);
            }
        };
        list_params.filterQueryMap.item_category_id_1 = [lv1_id != undefined ? lv1_id : ""];  //一级类目id
        list_params.filterQueryMap.item_category_id_2 = [lv2_id != undefined ? lv2_id : ""];  //二级类目id
        if(lv3_id!=""){
            list_params.filterQueryMap.item_category_id_3 = [lv3_id != undefined ? lv3_id : ""];  //三级类目id
            var titHtml='<div><div><a href="/index.jhtml#'+lv1_id+'">'
                       +$("#pageInfo").attr("lv1_name")
                       +'</a>/<a href="/FSgoodsSearch.jhtml?level1='+lv1_id+'&name1='+lv1_name+'&level2='+lv2_id+'&name2='+lv2_name+'">'+$("#pageInfo").attr("lv2_name")
                       +'</a>/'+$("#pageInfo").attr("lv3_name")
                       +'</div></div>';
            $(".header_title").html(titHtml);
            $(".header_title").scrollLeft(1000);//优先显示三级分类
            $("#header_bar_tbt span").addClass('bt');
        }
        else {
            var titHtml='<div><div><a href="/index.jhtml#'+lv1_id+'">'+$("#pageInfo").attr("lv1_name")+'</a>/'+$("#pageInfo").attr("lv2_name")+'</div></div>';
            $(".header_title").html(titHtml);
            $("#header_bar_tbt span").addClass('bt');
        }
        //获得url中排序方式
        if (params.sorts == undefined || params.sorts == "" || params.sorts == "default") {
            /*if(isOrderByContractNo == "true"){
                list_params.sorts.contract_code = "asc" ;
            }else{
                list_params.sorts = {};
            }*/
            list_params.sorts["sales_amount"] = "desc";
        } else {
            list_params.sorts[params.sorts] = params[params.sorts];
        }
        list_params.pageStart = (params.page = (params.page != undefined & params.page > 0) ? params.page : 1); //当前页码
        if (list_params.pageStart == 1) {
            //top3ListAds();
        }
        var data = {"condition": JSON.stringify(list_params)};
        requestDataWithAJAX("/fsajax/goodsSearch.ajax", "post", true, {"success": success, "data": data});
        
//   	var len = $("#contentRight-ListWrap-main .contentRight-List").length;
//      console.log(len);
    }
    /**
     * 商品展示列表前三广告位加载
     * Created by WW on 2016/10/08.
     */
    function top3ListAds() {
        Handlebars.registerHelper({
            goodsAds: function (data, options) {
                var result = "";
                for (var i = 0; i < 3; i++) {
                    if (data[i] != undefined && !$.isEmptyObject(data[i])) {
                        result += options.fn(data[i].serachInfo);
                    } else {
                        result += "<div class='contentRight-List'>"
                        result += "<img class='list_defaultAdsImg' src='/resources/basepage/store/default/list_pages/img/list_guanggao_default.jpg'>"
                        result += "</div>"
                    }
                }
                return result;
            }
        });
        var success = function (data) {
            data = JSON.parse(data);
            var tempData = [];
            for (var i = 0; i < 3; i++) {
                var obj = {};
                for (var j in data) {
                    if (("list_" + lv3_id + "top3_0" + (j + 1)) == data[j].adsInfo.advertId) {
                        obj = data[j].searchInfo.data.dataList;
                        break;
                    }
                }
                tempData.push(obj);
            }
            var list_goodsList_ads = $("#list_goodsList_ads").html();
            var html = loadHandlebarsTemplate(list_goodsList_ads, data);
            $("#contentRight-ListWrap-ads").html(html);
        };
        var data = {"type": "list", "serialId": lv3_id, "rangeId": "top3"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    };

    getGoodsList();
    /**
     * 商品展示列表加载
     * Created by WW on 1016/09/08.
     */
    function getGoodsListMain(data) {
        Handlebars.registerHelper({
            showPrice: function (data) {
                if (data != undefined && !isNaN(data)) {
                    return $.ww.formatDecimal(data, 2);
                } else {
                    return "￥0.00";
                }
            }
        });
        var list_goodsList_main = $("#list_goodsList_main").html();
        var html = loadHandlebarsTemplate(list_goodsList_main, data);
        $("#contentRight-ListWrap-main").append(html);  //加载到html中
        var len = $("#contentRight-ListWrap-main .contentRight-List").length;
        if(len==data.pagerMap.rows_total || data.dataList==""){
        	$("#loadmore").text("没有更多商品了").css('background', '#bbb');
        }
        else{
            $("#loadmore").text("点击加载更多").css('background', '#bf1b24');
        }
        $(".goodsCollect").on("click", favStore);
        $(".addShoppingCar").on("click", addShoppingCar);
        $("img.lazy").lazyload({effect: "fadeIn", threshold: 180});
    }

    /**
     * 收藏商品事件绑定
     * Created by WW on 2016/10/12.
     */
    function favStore() {
        var goodsId = $(this).attr("goods_id");
        var storeId = $(this).attr("store_id");
        $.ww.getLoginStatus(function () {
            var success = function (data) {
                if (data.success) {
                    jsAlert("收藏成功");
                } else {
                    jsAlert(data.message);
                }
            };
            var request = {"goodsId": goodsId, "storeId": storeId};
            //API:"/fav/addToGdFav.ajax"
            requestDataWithAJAX("/fav/addToGdFav.ajax", "post", true, {"success": success, data: request});
        }, function () {
            // location.href = "/toLogin.jhtml";
            $('.bgBlack').show();
            $("#login_popUp").fadeIn();
        });
    };

    /**
     * 加入购物车事件绑定
     * Created by WW on 1016/10/12.
     */
    function addShoppingCar() {
        var amount = $(this).attr("amount");
        var goodsId = $(this).attr("goodsId");
        var goodsName = $(this).attr("goodsName");
        var itemId = $(this).attr("itemId");
        var itemName = $(this).attr("itemName");
        var pic = $(this).attr("pic");
        var storeId = $(this).attr("storeId");
        var storeName = $(this).attr("storeName");
        $.ww.getLoginStatus(function () {
            var url = "/sc/addSc.ajax";
            var params = {};
            params["amount"] = amount;
            params["goodsId"] = goodsId;
            params["goodsName"] = goodsName;
            params["itemId"] = itemId;
            params["itemName"] = itemName;
            params["pic"] = pic;
            params["storeId"] = storeId;
            params["storeName"] = storeName;
            var success = function (data) {
            	console.log("data")
                if (data.success) {
                	console.log("加入成功")
                    jsAlert("加入购物车成功");
                } else {
                    jsAlert(data.message);
                }
            };
            requestDataWithAJAX(url, "post", true, {data: params, success: success});
        }, function () {
            // location.href = "/toLogin.jhtml";
            $('.bgBlack').show();
            $("#login_popUp").fadeIn();
        });
    };


//排序功能事件绑定
    $("#contentRight-nav .left .btn_sort").on("click", function () {
        $(this).siblings().find("u").removeClass("sorting_bot");
        //初始化参数
        params.page=1;
         $("#contentRight-ListWrap-main").html("");
        delete params.sorts;
        delete params.sales_amount;
        delete params.item_sales_min_price_mall;
        delete params.sales_score;
        delete params.goods_create_date;
        //初始化排序
        $(this).siblings().attr("order", "desc");
        $(this).siblings("[name='search_sort_default']").removeAttr("order");
        //按键绑定
        switch ($(this).attr("name")) {
            case "search_sort_default":
                params["sorts"] = "default";
                break;
            case "search_sort_sales":
                params["sorts"] = "sales_amount";
                if ($(this).attr("order") == "asc") {
                    $(this).attr("order", "desc");
                    $(this)[0].lastChild.className = "";
                } else {
                    $(this).attr("order", "asc");
                    $(this)[0].lastChild.className = "sorting_bot";
                }
                params["sales_amount"] = $(this).attr("order");
                break;
            case "search_sort_price":
                params["sorts"] = "item_sales_min_price_mall";
                if ($(this).attr("order") == "asc") {
                    $(this).attr("order", "desc");
                    $(this)[0].lastChild.className = "";
                } else {
                    $(this).attr("order", "asc");
                    $(this)[0].lastChild.className = "sorting_bot";
                }
                params["item_sales_min_price_mall"] = $(this).attr("order");
                break;
            case "search_sort_popularity":
                params["sorts"] = "sales_score";
                if ($(this).attr("order") == "asc") {
                    $(this).attr("order", "desc");
                    $(this)[0].lastChild.className = "";
                } else {
                    $(this).attr("order", "asc");
                    $(this)[0].lastChild.className = "sorting_bot";
                }
                params["sales_score"] = $(this).attr("order");
                break;
            case "search_sort_new":
                params["sorts"] = "goods_create_date";
                if ($(this).attr("order") == "asc") {
                    $(this).attr("order", "desc");
                    $(this)[0].lastChild.className = "";
                } else {
                    $(this).attr("order", "asc");
                    $(this)[0].lastChild.className = "sorting_bot";
                }
                params["goods_create_date"] = $(this).attr("order");
                break;
        }
        $(this).siblings().removeClass("sorting_foc");
        $(this).addClass("sorting_foc");
        getGoodsList();
    });


    /**
     * 商品页码加载
     * Created by WW on 2016/09/08.
     */
    function getGoodsListPage() {
        //点击加载更多函数
        $("#loadmore").off("click");
        $("#loadmore").on("click", function () {
        	if($(this).text()=="没有更多商品了"){
        		return;
        	}
            params.page++;
            getGoodsList();           
        });
    }

    /***
     * 新增分类功能
     * created by kuban 20170421
     * **/
    if($("#header_bar_tbt").html()!=""){
        $("#header_bar_tbt").click(catgClick);
    }
    function catgClick(){
        $("#category_list_box").toggle();
        if($("#category_list_box>ul li").length<=0){
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
                $("#category_list_box>ul").html(html);
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
            requestDataWithAJAX("../fsajax/FSGoodsCategory.ajax?level2=" + lv2_id, "get", false, {"success": success});
        }
        function page_classify_color() {
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
            var light_color = colors[lv1_id].light_color;
            $("#category_list_box li").css("background", light_color);
        };
    }
});
/*
$(function () {
    //热卖推荐广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    try{
                        $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId).find("img").attr("src", data[i].adsInfo.advertPic);
                        $("." + data[i].adsInfo.advertId).find(".item-name").text(data[i].goods.name);
                        $("." + data[i].adsInfo.advertId).find(".item-name").attr("title", data[i].goods.name);
                        $("." + data[i].adsInfo.advertId).find(".item-price").text('￥'+$.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
                        $("." + data[i].adsInfo.advertId).find(".item-price").attr("title", $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
                    }
                    catch (ex) {
                        console.error(ex);
                        if (data[i]) {
                            console.error("广告位数据异常", data[i]);
                        }
                    }
                }
            }
        };
        var data = {"type": "list", "serialId": lv3_id, "rangeId": "remaituijian"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //促销活动广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId).text(data[i].adsInfo.remark);
                }
            }
        };
        var data = {"type": "list", "serialId": lv3_id, "rangeId": "cuxiaohuodong"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //品牌广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    $("." + data[i].adsInfo.advertId + " a").attr("href", data[i].adsInfo.goodsLink);
                    $("." + data[i].adsInfo.advertId + " img").attr("src", data[i].adsInfo.advertPic);
                }
            }
        };
        var data = {"type": "list", "serialId": lv3_id, "rangeId": "pinpai"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //饭饭热卖广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    try{
                        $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId).find("img").attr("src", data[i].adsInfo.advertPic);
                        $("." + data[i].adsInfo.advertId).find(".item-name").text(data[i].goods.name);
                        $("." + data[i].adsInfo.advertId).find(".item-name").attr("title", data[i].goods.name);
                        $("." + data[i].adsInfo.advertId).find(".item-price").text('￥'+$.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
                        $("." + data[i].adsInfo.advertId).find(".item-price").attr("title", $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
                    } catch (ex) {
                        console.error(ex);
                        if (data[i]) {
                            console.error("广告位数据异常", data[i]);
                        }
                    }
                }
            }
        };
        var data = {"type": "list", "serialId": lv3_id, "rangeId": "fanfanremai"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
    //商品精选广告位
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            if (data != undefined && data.length != 0 && data != "[]") {
                for (var i in data) {
                    try{
                        $("." + data[i].adsInfo.advertId).attr("href", data[i].adsInfo.goodsLink);
                        $("." + data[i].adsInfo.advertId).find("img").attr("src", data[i].adsInfo.advertPic);
                        $("." + data[i].adsInfo.advertId).find(".item-name").text(data[i].goods.name);
                        $("." + data[i].adsInfo.advertId).find(".item-name").attr("title", data[i].goods.name);
                        $("." + data[i].adsInfo.advertId).find(".item-price").text('￥'+$.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
                        $("." + data[i].adsInfo.advertId).find(".item-price").attr("title", $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
                    } catch (ex) {
                        console.error(ex);
                        if (data[i]) {
                            console.error("广告位数据异常", data[i]);
                        }
                    }
                }
            }
        };
        var data = {"type": "list", "serialId": lv3_id, "rangeId": "shangpinjingxuan"};
        requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});
    })();
});*/
