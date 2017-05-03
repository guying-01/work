$(function () {
    var goodsId = $("#pageInfo").attr("goodsId");   //获取商品id;
    var goodsName = $("#pageInfo").attr("goodsName");   //获取商品name;
    var lv3_id = $("#pageInfo").attr("lv3_id");   //获取三级分类id;
    var storeId = $("#pageInfo").attr("store_id");   //获取店铺id;
    var storeName = $("#pageInfo").attr("store_name");   //获取店铺name;
    var storeTemplateCode = $("#pageInfo").attr("store_template_code");   //获取店铺模板编码;
    var fromPage = $("#pageInfo").attr("from_page");   //获取前一个页面的标志;
    $("#fix_search").remove();    //隐藏顶部跟屏滚动搜索栏
    var promotionFlag = $("#pageInfo").attr("promotion_flag");
    var interval = {};  //活动倒计时定时器
    var begin = $("#pageInfo").attr("begin_time");  //活动开始时间
    var end = $("#pageInfo").attr("end_time");  //活动结束时间
    var now = $("#pageInfo").attr("now_time");  //服务器当前时间
    var strings = '';//存储已选规格，用于显示
    var pageNum = 1;                                //全部评论加载更多标记
    //初始化页面事件绑定
    !function () {
        //头部3个选项卡点击事件
        $('.tabs .j_pInR_table').click(function () {
            $(this).addClass('on').siblings().removeClass('on');
            if ($(this).hasClass('j_pInR_table2')) {
                $('#tabla_02').show();
                $('#tabla_01').hide();
                $('#tabla_03').hide();
                $("html,body").scrollTop(0);
                /*请求部分开始*/
                if($("#introduction_box img").length===0){
                    var url = "/fsgd/findGoodsDetailByMobileId.ajax";
                    var params = {id:goodsId,lv3Id:lv3_id};
                    var success = function (data) {
                        if(data != undefined && data.length != 0 && data != "[]"){
                            $("#introduction_box").html(data.data.sgGoodsInfoChannelForm.introduction);
                        }
                    };
                    requestDataWithAJAX(url, "post", true, {data: params, success: success});
                }
                /*请求部分结束*/
            } else if ($(this).hasClass('j_pInR_table3')) {
                totalDataArr = [];
                pageNum = 1;
                $('#tabla_03').show();
                $('#tabla_01').hide();
                $('#tabla_02').hide();
                $('.flag').html(0);
                getAllGoodsScore(1);

            } else {
                $('#tabla_01').show();
                $('#tabla_02').hide();
                $('#tabla_03').hide();
            }
            ;
        });
        //跳转评论选项卡点击事件
        $('.evaluate').on('click', '.lookAll', function () {
            $('.j_pInR_table3').addClass('on').siblings().removeClass('on');
            $('#tabla_03').show();
            $('#tabla_01').hide();
            $('#tabla_02').hide();
            $("html,body").scrollTop(0);
            $('.flag').html(0);
            getAllGoodsScore(1);
        });
        //跳转详情选项卡点击事件
        $('.look_detail').click(function () {
            $('.j_pInR_table2').addClass('on').siblings().removeClass('on');
            $('#tabla_02').show();
            $('#tabla_01').hide();
            $('#tabla_03').hide();
            $("html,body").scrollTop(0);
            /*请求部分开始*/
            if($("#introduction_box img").length===0){
                var url = "/fsgd/findGoodsDetailByMobileId.ajax";
                var params = {id:goodsId,lv3Id:lv3_id};
                var success = function (data) {
                    if(data != undefined && data.length != 0 && data != "[]"){
                        $("#introduction_box").html(data.data.sgGoodsInfoChannelForm.introduction);
                    }
                };
                requestDataWithAJAX(url, "post", true, {data: params, success: success});
            }
            /*请求部分结束*/
        });
        //登录弹出框关闭事件
        $('.loginShut').click(function () {
            $('.bgBlack').hide();
            $('#login_popUp').hide();
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
                    location.reload();
                }
            };
            requestDataWithAJAX("/doLogin.ajax", "post", true, {
                "data": $("#loginForm").serialize(),
                "success": successResponse
            });
        });
        // 评论点击查看大图
        !function () {
            $('.all_evaluate').on('click', '.goods_evaluate_pic img', function () {
                var id = $(this).attr('class');
                $('#' + id).show();
                if ($('.pop_up').length == 0) {
                    $('html').append('<div class="pop_up"></div>');
                }

            });
            $('html').on('click', '.pop_up', function () {
                //$('.jcm_4').remove();
                changetool('toolbar');
                $('.show_big_pic').fadeOut();
            });
        }();
        //评论的查看更多功能

        //如果登录则增加浏览历史
        $.ww.getLoginStatus(function () {
            addHistory();
        });
        //跳转购物车页面
        $(document).on('click', '.goCart', function () {
            $.ww.getLoginStatus(function () {
                window.location.href = '/sc/toList.jhtml';
            }, function () {
                $('.pop_up').remove();
                $('.bgBlack').show();
                $("#login_popUp").fadeIn();
            });
        });
    }();

    //自定义helper
    Handlebars.registerHelper({
        hasPrefix: function (data, options) {
            if (data.prefix == '') {
                //满足添加继续执行
                return options.fn(this);
            } else {
                //不满足条件执行{{else}}部分
                return options.inverse(this);
            }
        },
        evaluateTime: function (time) {
            var result = new Date(time).Format('yyyy-MM-dd hh:mm:ss')
            return new Handlebars.SafeString(result);
        },
        content: function (arr, opt) {
            var htmlStr = '<div class="score-gy">'
            var scoreL = arr.length;
            var endEle = '</p>';
            var anotherEle = '</span>'
            arr.forEach(function (v, i) {
                switch (v.scoreState) {
                    case '00':
                        htmlStr += '<p><b>[采购商评价]：</b><span class="everyScore-gy">';
                        break;
                    case '10':
                        htmlStr += '<p><b>[商家回复]：</b><span class="everyScore-gy">';
                        break;
                    case '20':
                        htmlStr += '<p><b>[采购商追评]：</b><span class="everyScore-gy">';
                        break;
                    case '30':
                        htmlStr += '<p><b>[追加回复]：</b><span class="everyScore-gy">';
                        break;
                }

                htmlStr += arr[i].memo
                for (var x = 0; x < scoreL; x++) {
                    htmlStr += anotherEle
                }
                for (var x = 0; x < scoreL; x++) {
                    htmlStr += endEle
                }
                if (arr[i].pictureList != 0) {
                    arr[i].pictureList.forEach(function (v, j) {
                        htmlStr += '<img src=' + arr[i].pictureList[j].picUrl + arr[i].pictureList[j].picName + ' onclick="showBigImg(this,event)">'
                    })
                }
                htmlStr += '<div>' + new Date(arr[i].createDate).Format('yyyy-MM-dd hh:mm:ss') + '</div>'

            })
            htmlStr += '</div>'

            return new Handlebars.SafeString(htmlStr)

        },
        showScoreNum: function (num) {
            return num ? num : 0;
        },
        showMenPic: function (src) {
            return src ? src : "/resources/basepage/store/default/common_img/default_mempic.jpg"
        },
        debug: function (data) {
            console.log(data);
        },

        listStar: function (item) {
            var result = "";
            item = item * 2;
            for (var i = 0; i < item; i++) {
                result += "<li></li>";
            }
            return result;
        },
        storeLevel: function (supplierTypeCode) {
            var result = "";
            switch (supplierTypeCode) {
                case "10":
                    result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_01.png'/>"; //"大"
                    break;
                case "20":
                    result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_02.png'/>"; //"股"
                    break;
                case "30":
                    result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_03.png'/>"; //"共"
                    break;
                case "40":
                    result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_04.png'/>"; //"强"
                    break;
                case "50":
                    result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_05.png'/>"; //"亲"
                    break;
            }
            return result;
        },
        eachAttrKey: function (item, options) {
            var result = "";
            var count = 1;
            for (var i in item) {
                result += options.fn({"id": i, "name": item[i], "index": count});
                count++;
            }
            return result;
        },
        eachAttrValue: function (item, index, options) {
            var result = "";
            var tempObj = item["attrValueList" + index];
            for (var i in tempObj) {
                result += options.fn(tempObj[i]);
            }
            return result;
        },
        showPrice: function (min, max) {
            var result = "";
            if (!isNaN(min) && min != null && !isNaN(max) && max != null) {
                if (min == max) {
                    result += "￥" + $.ww.formatDecimal(min, 2);
                } else {
                    result += "￥" + $.ww.formatDecimal(min, 2) + " ~ ￥" + $.ww.formatDecimal(max, 2);
                }
            } else {
                result = "￥0.00"
            }
            return result;
        },
        deliverTime: function (day, time) {
            var result = "";
            if (time) {
                time = time.split(":")[0]
            }
            else {
                result = "/resources/basepage/store/default/common_img/deliver_time_01.png";
            }
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


    /**
     * 数据组合
     */
    function formatData(info_data/*, transaction_data, score_data*/) {
        var result = {};
        if (info_data.success) {
            if ("true" == promotionFlag) {
                var specialFlag = false;
                var specialFirst;
                for (var i = 0; i < info_data.result.length; i++) {
                    if (!specialFirst && info_data.result[i].promotionItemForm) {
                        specialFirst = info_data.result[i].promotionItemForm.promotionOn;
                    } else if (info_data.result[i].promotionItemForm) {
                        if (specialFirst != info_data.result[i].promotionItemForm.promotionOn) {
                            specialFlag = true;
                            break;
                        }
                    }
                }
                if (specialFlag) {
                    for (var i = 0; i < info_data.result.length;) {
                        if (info_data.result[i] && info_data.result[i].promotionItemForm && (false == info_data.result[i].promotionItemForm.promotionOn)) {
                            info_data.result.splice(i, i + 1);
                        } else {
                            i++;
                        }
                    }
                }
                for (var i = 0; i < info_data.result.length;) {
                    if (info_data.result[i] && !info_data.result[i].promotionItemForm) {
                        info_data.result.splice(i, i + 1);
                    } else {
                        i++;
                    }
                }
            }
            var goodsList = info_data.result;
            var attrKeyList = {};
            var attrValueList = {};
            var goodsHolder = {};
            var marketPriceList = [];
            var salesPriceList = [];
            var unitePriceList = [];
            var promotionPriceList = [];
            var promotionUnitPriceList = [];
            var localStock = [];
            var promotionItemForms = [];
            var preparePicType = "";
            //取出属性名称的集合
            for (var i = 0; i < goodsList.length; i++) {
                var goodsKey = "";
                for (var j = 1; j <= 8; j++) {
                    if (i == 0 && goodsList[i]["attrDicName" + j] != null) {
                        attrKeyList["attrDicName" + j] = (goodsList[i]["attrDicName" + j]);
                    }
                    if (goodsList[i]["attrValue" + j] != null) {
                        goodsKey += goodsList[i]["attrValue" + j];
                    }
                }
                marketPriceList.push(goodsList[i].marketPrice);
                salesPriceList.push(goodsList[i].salesPrice);
                unitePriceList.push(goodsList[i].unitePrice);
                if (goodsList[i].promotionItemForm) {
                    promotionItemForms.push(goodsList[i].promotionItemForm);
                    promotionPriceList.push(goodsList[i].promotionItemForm.itemPromotionPrice);  //活动时，饭饭价变为活动价
                    promotionUnitPriceList.push(goodsList[i].promotionItemForm.itemPromotionUnitPrice);  //活动时，饭饭价变为活动价
                }
                localStock.push(parseInt(goodsList[i].localStock));
                goodsHolder[goodsKey] = goodsList[i].id;
                preparePicType = goodsList[i].preparePicType;
            }
            for (var i = 0; i < goodsList.length; i++) {
                for (var j = 1; j <= 8; j++) {
                    if (goodsList[i]["attrValue" + j] != null) {
                        if (!attrValueList["attrValueList" + j]) {
                            attrValueList["attrValueList" + j] = [];
                        }
                        if (attrValueList["attrValueList" + j].indexOf(goodsList[i]["attrValue" + j]) == -1) {
                            attrValueList["attrValueList" + j].push(goodsList[i]["attrValue" + j]);
                        }
                    }
                }
            }
        }
        //var tempData = {"attrKeyList": ["属性名1", "属性名2", "属性名3"], "attrValueList": {"属性名1": ["属性名1值1", "属性名1值2", "属性名1值3"], "属性名2": ["属性名2值1", "属性名2值2", "属性名2值3", "属性名2值4"], "属性名3": ["属性名3值1", "属性名3值2"]}};
        //result = tempData;
        result["goodsList"] = goodsList;
        result["attrKeyList"] = attrKeyList;
        result["attrValueList"] = attrValueList;
        result["goodsHolder"] = goodsHolder;
        //result["goodsTransactionCount"] = transaction_data.success ? transaction_data.result : 0;
        //result["goodsScoreNum"] = score_data.success ? score_data.result : 0;
        result["marketPriceList"] = marketPriceList != undefined ? marketPriceList : [];
        for (var i in marketPriceList) {
            if (marketPriceList[i] != null) {
                result["marketPriceList_min"] = Math.min.apply(Math, marketPriceList);
                result["marketPriceList_max"] = Math.max.apply(Math, marketPriceList);
                break;
            }
            result["marketPriceList_min"] = null;
            result["marketPriceList_max"] = null;
        }
        result["salesPriceList"] = salesPriceList != undefined ? salesPriceList : [];
        for (var i in salesPriceList) {
            if (salesPriceList[i] != null) {
                result["salesPriceList_min"] = Math.min.apply(Math, salesPriceList);
                result["salesPriceList_max"] = Math.max.apply(Math, salesPriceList);
                break;
            }
            result["salesPriceList_min"] = null;
            result["salesPriceList_max"] = null;
        }
        result["unitePriceList"] = unitePriceList != undefined ? unitePriceList : [];
        for (var i in unitePriceList) {
            if (unitePriceList[i] != null) {
                result["unitePriceList_min"] = Math.min.apply(Math, unitePriceList);
                result["unitePriceList_max"] = Math.max.apply(Math, unitePriceList);
                break;
            }
            result["unitePriceList_min"] = null;
            result["unitePriceList_max"] = null;
        }
        result["promotionPriceList"] = promotionPriceList != undefined ? promotionPriceList : [];
        for (var i in promotionPriceList) {
            if (promotionPriceList[i] != null) {
                result["promotionPriceList_min"] = Math.min.apply(Math, promotionPriceList);
                result["promotionPriceList_max"] = Math.max.apply(Math, promotionPriceList);
                break;
            }
            result["promotionPriceList_min"] = null;
            result["promotionPriceList_max"] = null;
        }
        result["promotionUnitPriceList"] = promotionUnitPriceList != undefined ? promotionUnitPriceList : [];
        for (var i in promotionUnitPriceList) {
            if (promotionUnitPriceList[i] != null) {
                result["promotionUnitPriceList_min"] = Math.min.apply(Math, promotionUnitPriceList);
                result["promotionUnitPriceList_max"] = Math.max.apply(Math, promotionUnitPriceList);
                break;
            }
            result["promotionUnitPriceList_min"] = null;
            result["promotionUnitPriceList_max"] = null;
        }
        result["localStockList"] = localStock;
        result["localStock"] = localStock != [] ? eval(localStock.join("+")) : 0;
        result["currentGoodsAttr"] = {};
        result["storeName"] = storeName;
        result["promotionItemForms"] = promotionItemForms;
        result["preparePicType"] = preparePicType;
        if (goodsList.length == 1) {
            result["eatFreeFlag"] = goodsList[0].eatFreeFlag ? goodsList[0].eatFreeFlag : "true";
            if (goodsList[0].promotionItemForm) {
                result["promotionType"] = goodsList[0].promotionItemForm.promotionType ? goodsList[0].promotionItemForm.promotionType : null;
            }
        } else {
            result["eatFreeFlag"] = "true";
            result["promotionType"] = null;
        }
        return result;
    }

    /**
     * 商品评价数据处理函数
     * Created by WW on 2016/09/24.
     */
    //function formatGoodsScoreData(data) {
    //    var result = {};
    //    result["recordsTotal"] = data.data.recordsTotal;
    //    data = data.data.data;
    //    var PREFIX = {"00": "", "10": "[掌柜回复]:", "20": "[追加评论]:", "30": "[追加回复]:"};
    //    var STATE = {"00": "0", "10": "1", "20": "2", "30": "3"};
    //    var CLASSNAME = {"00": "buyers_cm", "10": "seller_rp", "20": "buyers_cm", "30": "seller_rp"};
    //    var list = [];
    //    for (var i = 0; i < data.length; i++) {
    //        var item = {};
    //        item["memberPic"] = data[i].memberPic;
    //        item["memberName"] = data[i].memberName;
    //        item["memberGradeRank"] = data[i].memberGradeRank;
    //        item["score"] = data[i].score;
    //        item["list"] = [];
    //        for (var j = 0; j < data[i].historyList.length; j++) {
    //            var item_ = {};
    //            item_["index"] = STATE[data[i].historyList[j].scoreState];
    //            item_["className"] = CLASSNAME[data[i].historyList[j].scoreState];
    //            item_["prefix"] = PREFIX[data[i].historyList[j].scoreState];
    //            item_["content"] = data[i].historyList[j].memo;
    //            item_["picList"] = data[i].historyList[j].pictureList;
    //            item_["createDate"] = new Date(data[i].historyList[j].createDate).Format("yyyy-MM-dd hh:mm:ss");
    //            item.list.push(item_);
    //        }
    //        list.push(item);
    //        //add zjy 20170301
    //        result["score_num"] = data[0].score_num;
    //        result["score_good"] = data[0].score_good;
    //        result["score_middle"] = data[0].score_middle;
    //        result["score_bad"] = data[0].score_bad;
    //    }
    //    result["list"] = list;
    //
    //    return result;
    //}

    //初始化页面
    !function () {
        var requestData = {"goodsId": goodsId};
        var goodsInfo = $.post("/gd/findItemListByGoodsId.ajax", requestData);
        //var sellCount = $.post("/gd/findGoodsTransactionCount.ajax", requestData);
        //var scoreNum = $.post("/gd/findGoodsScoreNum.ajax", requestData);
        $.when(goodsInfo/*, sellCount, scoreNum*/).done(function (data1/*, data2, data3*/) {
            var templateData = formatData(data1/*[0], data2[0], data3[0]*/);
            startLoadInfo(templateData);//装载数据
        });
    }();

    /***
     *页面初始化数据加载
     * kuban 20170407
     */
    function startLoadInfo(data) {
        /*页面数据加载开始*/
        var template = Handlebars.compile($('#details_goodsInfo').html());
        var fixedBottom = Handlebars.compile($('#fixedBottom').html());
        var fixedBottomCotent = fixedBottom(data);
        var content = template(data);
        $('.goodsInfo').html(content);
        $('.fixedBottom').html(fixedBottomCotent);
        /*页面数据加载结束*/
        /*弹出框规格数据加载开始*/
        var template_choose = Handlebars.compile($('#choosed').html());
        var content_choose = template_choose(data);
        $('.choosed').html(content_choose);
        quantityButton(data.localStock);    //数量事件绑定
        cantChoose(data);   //去除无效商品属性组合
        readySelect(data);
        if ("true" == promotionFlag) {
            show_time(data);    //商品活动加载
        }
        if (!data.localStock) {
            $(".jcm_6 .jbtn3,.fixed_btn_buy,.jcm_6 .jbtn4,.fixed_btn_shoppingcar").removeAttr("permission");
        }
        if (promotionFlag=='true' && !data.localStock) {
            $(".jcm_6 .jbtn3,.fixed_btn_buy").text("已抢光");
            $(".noCount").text("已抢光");
            $(".buyNow").text("已抢光").removeAttr("permission").attr('buyflag', false);
        }
        //活动类型为秒杀时限制购买数量为1个
        if (data.promotionType && ("01" == data.promotionType || "03" == data.promotionType)) {
            $(".jcm_5 button,.jcm_5 input").attr("disabled", "disabled");
        }
        //免费试吃资格判定
        if (("03" == data.promotionType) && ("false" == data.eatFreeFlag)) {

            $(".j_content_m .jcm_6 .jbtn3").removeAttr("permission");
        }
        if (data.goodsList.length == 1 && $.isEmptyObject(data.attrKeyList)) {
            bindBuyButton(data.goodsList[0].id, data, {});
        } else if ($.ww.getObjKeys(data.currentGoodsAttr).length == 0) {
            bindBuyButton("", data, "attrDicName1");
        }
        /*弹出框规格数据加载结束*/
        var mySwiper = new Swiper('.goodsPic .swiper-container', {
            touchRatio: 0.5,
            pagination: '.swiper-pagination',
            paginationType: 'fraction'
        })
    }

    /**
     * 商品信息部分模板加载
     */
    function loadGoodsInfoTemplate(data) {
        var template = Handlebars.compile($('#details_goodsInfo').html());
        var fixedBottom = Handlebars.compile($('#fixedBottom').html());
        var fixedBottomCotent = fixedBottom(data);
        var content = template(data);
        $('.goodsInfo').html(content);
        $('.fixedBottom').html(fixedBottomCotent);
        // swiper
        var mySwiper = new Swiper('.goodsPic .swiper-container', {
            touchRatio: 0.5,
            pagination: '.swiper-pagination',
            paginationType: 'fraction'
        });
        guigeLoading(data);
    };
    /**
     * 选择商品规格数量弹出框功能
     * */
    !function () {
        //商品选择弹出框开
        $(document).on('click', '#toChoose', function () {
            changetool('choose');
        });
        //商品选择弹出框关
        $('.choosed').on('click', '.guigeShut', function () {
            changetool('toolbar')
        });
    }();
    /*改变工具栏功能项*/
    function changetool(toolname) {
        switch (toolname) {
            case 'choose':
                if ($('.buyNow').attr('proflag')) {
                    $('.addCart').addClass('so_big_bt');
                    $('.buyNow').addClass('so_big_bt');
                }
                else {
                    $('.addCart').addClass('big_bt');
                    $('.buyNow').addClass('big_bt');
                }
                $('.dt_toolbar ul').hide();
                $('.pop_up').remove();
                $('html').append('<div class="pop_up"></div>');
                $('.choosed').show();
                break;
            case 'toolbar':
                $('.pop_up').remove();
                $('.makeTure').hide();
                if ($('.buyNow').attr('proflag')) {
                    $('.addCart').removeClass('so_big_bt').show();
                    $('.buyNow').removeClass('so_big_bt').show();
                }
                else {
                    $('.addCart').removeClass('big_bt').show();
                    $('.buyNow').removeClass('big_bt').show();
                }
                $('.dt_toolbar ul').show();
                $('.choosed').hide();
                break;
            case 'addcar':
                if ($('.buyNow').attr('proflag')) {
                    $('.addCart').removeClass('so_big_bt').hide();
                    $('.buyNow').removeClass('so_big_bt').hide();
                }
                else {
                    $('.addCart').removeClass('big_bt').hide();
                    $('.buyNow').removeClass('big_bt').hide();
                }
                $(".makeTure").show();
                $('.dt_toolbar ul').hide();
                $('html').append('<div class="pop_up"></div>');
                $('.choosed').show();
                break;
            default:
                break;
        }
    }


    // 商品规格加载
    function guigeLoading(templateData) {
        var template = Handlebars.compile($('#choosed').html());
        var content = template(templateData);
        $('.choosed').html(content);
        changePic(templateData);
        if ($(".choosed").css('display') != "none") {
            $('.pop_up').remove();
            changetool('choose');
        }
        reselectAttr(templateData["currentGoodsAttr"]);
        quantityButton(templateData.localStock);
        cantChoose(templateData);
        readySelect(templateData);
        if (strings == '') {
            /*模板加载了*/
        } else {
            $('.aRchooseN').html('已选择：' + strings + '');
        }
        strings = '';
        if ("true" == promotionFlag) {
            show_time(templateData);    //商品活动加载
        }
        if (!templateData.localStock) {
            $(".jcm_6 .jbtn3,.fixed_btn_buy,.jcm_6 .jbtn4,.fixed_btn_shoppingcar").removeAttr("permission");
        }
        if (promotionFlag && !templateData.localStock) {
            $(".jcm_6 .jbtn3,.fixed_btn_buy").text("已抢光");
        }
        //活动类型为秒杀时限制购买数量为1个
        if (templateData.promotionType && ("01" == templateData.promotionType || "03" == templateData.promotionType)) {
            $(".jcm_5 button,.jcm_5 input").attr("disabled", "disabled");
        }
        //免费试吃资格判定
        if (("03" == templateData.promotionType) && ("false" == templateData.eatFreeFlag)) {

            $(".j_content_m .jcm_6 .jbtn3").removeAttr("permission");
        }
        if (templateData.goodsList.length == 1 && $.isEmptyObject(templateData.attrKeyList)) {
            bindBuyButton(templateData.goodsList[0].id, templateData, {});
        } else if ($.ww.getObjKeys(templateData.currentGoodsAttr).length == 0) {
            bindBuyButton("", templateData, "attrDicName1");
        }
    }

    /***
     * 商品规格变化时，图片跟随变化
     * */
    function changePic(data) {
        var picurl = "";
        for (var key in data.currentGoodsAttr) {
            for (var i = 0; i < data.goodsList.length; i++) {
                var keystr = "";
                keystr = key.split('attrDicName');
                keystr = "attrValue" + keystr[1];
                if (data.currentGoodsAttr[key] == data.goodsList[i][keystr]) {
                    picurl = data.goodsList[i].itemPictureList[0].bigPicturePath;
                    $(".choosePic img").attr('src', picurl);
                    /*$(".swiper-slide").each(function () {
                     if($(this).find("img").attr("src")==picurl) {
                     $(this).addClass("swiper-slide-active");
                     return false
                     }
                     });*/
                    return;
                }
            }
        }
    }

    /**
     * 商品属性重选中
     * Created by WW on 2016/09/18.
     */
    function reselectAttr(currentGoodsAttr) {
        if (currentGoodsAttr != undefined && currentGoodsAttr != {}) {
            $(".jcm_4 ul>li").each(function () {
                for (var attrValue in currentGoodsAttr) {
                    if ($(this).parent().attr("name") == attrValue && $(this).text() == currentGoodsAttr[attrValue]) {
                        $(this).children("a").addClass("beSelected");
                    }
                }
            });
        }
    };

    /**
     * 商品属性点击事件
     * Created by WW on 2016/09/18.
     */
    function clickGoodsAttr(goods, templateData) {
        //点击效果
        $(this).siblings().children("a").removeClass("beSelected");
        $(this).children("a").toggleClass("beSelected");
        /**/
        var guigeNum = $('.ggli ul');
        for (var i = 0; i < guigeNum.length; i++) {
            if (guigeNum.eq(i).children().children('.beSelected').length != 0) {
                strings += '"' + guigeNum.eq(i).children().children('.beSelected').html() + '"';
                $('.aRchooseN').html('');
            }
        }
        if ($(this).children("a").is(".beSelected")) {
            goods[$(this).parent().attr("name")] = $(this).text();
        } else {
            delete goods[($(this).parent().attr("name"))];
        }
        //属性是否指向完成
        var flag = true;
        var lackIndex = "";
        for (var i in templateData.attrKeyList) {
            if (goods[i] == undefined || goods[i] == "") {
                flag = false;
                lackIndex = i;
                break;
            }
        }
        //通过属性指定商品id
        if (flag) {
            var name = "";
            var id;

            for (var obj in templateData.attrKeyList) {
                name += goods[obj];
                templateData["currentGoodsAttr"][obj] = goods[obj];
            }
            id = templateData.goodsHolder[name] != undefined ? templateData.goodsHolder[name] : "";
            //通过商品id重载商品集参数
            for (var i = 0; i < templateData.goodsList.length; i++) {
                if (templateData.goodsList[i].id == id) {
                    templateData["marketPriceList_max"] = templateData.goodsList[i].marketPrice;
                    templateData["marketPriceList_min"] = templateData.goodsList[i].marketPrice;
                    templateData["salesPriceList_max"] = templateData.goodsList[i].salesPrice;
                    templateData["salesPriceList_min"] = templateData.goodsList[i].salesPrice;
                    templateData["unitePriceList_max"] = templateData.goodsList[i].unitePrice;
                    templateData["unitePriceList_min"] = templateData.goodsList[i].unitePrice;
                    if (templateData.goodsList[i].promotionItemForm) {
                        templateData["promotionPriceList_max"] = templateData.goodsList[i].promotionItemForm.itemPromotionPrice;
                        templateData["promotionPriceList_min"] = templateData.goodsList[i].promotionItemForm.itemPromotionPrice;
                    }
                    templateData["localStock"] = templateData.goodsList[i].localStock;
                    if (templateData.goodsList[i].promotionItemForm) {
                        templateData["promotionType"] = templateData.goodsList[i].promotionItemForm.promotionType;
                    }
                    templateData["eatFreeFlag"] = templateData.goodsList[i].eatFreeFlag ? templateData.goodsList[i].eatFreeFlag : "true";
                    loadGoodsInfoTemplate(templateData);
                    bindBuyButton(id, templateData, {});
                    break;
                }
            }
        } else {
            if (templateData["marketPriceList"].indexOf(null) == -1) {
                templateData["marketPriceList_max"] = Math.max.apply(Math, templateData["marketPriceList"]);
                templateData["marketPriceList_min"] = Math.min.apply(Math, templateData["marketPriceList"]);
            } else {
                templateData["marketPriceList_max"] = null;
                templateData["marketPriceList_min"] = null;
            }
            if (templateData["marketPriceList"].indexOf(null) == -1) {
                templateData["salesPriceList_max"] = Math.max.apply(Math, templateData["salesPriceList"]);
                templateData["salesPriceList_min"] = Math.min.apply(Math, templateData["salesPriceList"]);
            } else {
                templateData["salesPriceList_max"] = null;
                templateData["salesPriceList_min"] = null;
            }
            if (templateData["unitePriceList"].indexOf(null) == -1) {
                templateData["unitePriceList_max"] = Math.max.apply(Math, templateData["unitePriceList"]);
                templateData["unitePriceList_min"] = Math.min.apply(Math, templateData["unitePriceList"]);
            } else {
                templateData["unitePriceList_max"] = null;
                templateData["unitePriceList_min"] = null;
            }
            if (templateData["promotionPriceList"].indexOf(null) == -1) {
                templateData["promotionPriceList_max"] = Math.max.apply(Math, templateData["promotionPriceList"]);
                templateData["promotionPriceList_min"] = Math.min.apply(Math, templateData["promotionPriceList"]);
            } else {
                templateData["promotionPriceList_max"] = null;
                templateData["promotionPriceList_min"] = null;
            }
            templateData["localStock"] = templateData["localStockList"] != [] ? eval(templateData["localStockList"].join("+")) : 0;
            templateData["promotionType"] = null;
            templateData["eatFreeFlag"] = "false";
            loadGoodsInfoTemplate(templateData);
            if ($.ww.getObjKeys(templateData.currentGoodsAttr).length != 0) {
                bindBuyButton("", templateData, lackIndex);
            }
        }
    }

    /**
     * 数量按钮事件绑定
     * Created by WW on 2016/10/12.
     */
    function quantityButton(limit) {
        $(".jbtn5").on("click", function () {
            if ($("#j_ipt1").val() > 1) {
                $("#j_ipt1").val($("#j_ipt1").val() - 1);
                if ($(".aRchooseN").eq(0).html().split("请选择").length > 1) {
                }/*当有商品属性需要选择时不显示已选的数量信息*/
                else {
                    $('.aRchooseNum').html('商品数量：' + parseInt($('#j_ipt1').val()));
                }
            }
            getInputValue(limit)
        });
        $(".jbtn6").on("click", function () {
            if ($("#j_ipt1").val() < limit) {
                $("#j_ipt1").val(parseInt($("#j_ipt1").val()) + 1);
                if ($(".aRchooseN").eq(0).html().split("请选择").length > 1) {
                }/*当有商品属性需要选择时不显示已选的数量信息*/
                else {
                    $('.aRchooseNum').html('商品数量：' + parseInt($('#j_ipt1').val()));
                }
            }
            getInputValue(limit)
        });
        $("#j_ipt1").on("keyup", function () {
            $(this).val($(this).val().replace(/\D/g, ''));
            $(this).val(($(this).val() < 1 || $(this).val().length == 0) ? 1 : $(this).val());
            $(this).val($(this).val() > limit ? limit : $(this).val());
            $('.aRchooseNum').html('"商品数量"：' + parseInt($('#j_ipt1').val()));
            getInputValue(limit)

        });
        $("#j_ipt1").on("afterpaste", function () {
            $(this).val($(this).val().replace(/\D/g, ''));
            $(this).val(($(this).val() < 1 || $(this).val().length == 0) ? 1 : $(this).val());
            $(this).val($(this).val() > limit ? limit : $(this).val());
            $('.aRchooseNum').html('"商品数量"：' + parseInt($('#j_ipt1').val()));
            getInputValue(limit)

        });
        $("#j_ipt1").on("focus", function () {
            $(this).select();
            getInputValue(limit)
        });
    }

    function getInputValue(limit) {
        $("#getGoodsNum").val($("#j_ipt1").val())
    }


    function cantChoose(templateData) {
        var requestData = {"goodsId": goodsId};
        for (var i in templateData.currentGoodsAttr) {
            var tempStr = i.replace("attrDicName", "attrDicValue");
            requestData[tempStr] = templateData.currentGoodsAttr[i]
        }
        $.ajax({
            url: "/gd/findAttrValuesBySelectValues.ajax",
            type: "post",
            data: requestData,
            async: false,
            success: function (data) {
                var result = {};
                for (var i in data) {
                    //if (!requestData["attrDicValue" + (parseInt(i) + 1)]) {
                    result["attrDicName" + (parseInt(i) + 1)] = data[i].attrValues;
                    //}
                }
                for (var i in result) {
                    $(".jcm_4 ul[name=" + i + "] li").each(function () {
                        $(this).addClass("cantChoose");

                        for (var j in result[i]) {
                            if ($(this).find("a").text() == result[i][j]) {
                                $(this).removeClass("cantChoose");
                            }
                        }
                    });
                }

            }
        });
    }

    /**
     * 商品属性选中监听
     * Created by WW on 2016/09/18.
     */
    function readySelect(templateData) {
        var goods = templateData["currentGoodsAttr"];   //商品属性初始化
        //绑定属性选择事件
        $(".jcm_4 ul>li").not($(".cantChoose")).on("click", function () {
            clickGoodsAttr.call(this, goods, templateData);
        });
    }

    //倒计时动态获取
    function show_time(data) {
        var template = $("#details_activityTime").html();
        try {
            if (isNaN(interval)) {
                begin = data.promotionItemForms[0].promotionBeginDate;
                end = data.promotionItemForms[0].promotionEndDate;
                now = data.promotionItemForms[0].promotionNowDate;
                setInterval(function () {
                    now = parseInt(now) + 1000;
                }, 1000);
            }
            //setInterval(function () {
            //    now = parseInt(now) + 1000;
            //}, 1000);
        }
        catch (ex) {
            console.error("活动信息获取错误" + ex);
        }
        if (now < begin) {
            var left = begin - now;
            count_down(left, false);
        } else if (now >= begin && now <= end) {
            var left = end - now;
            count_down(left, true);
        } else {
            $(".activity_time").html("活动已结束");
        }

        function formatTime($time) {
            var time = {};
            time.day = parseInt($time / (1000 * 60 * 60 * 24));
            $time = $time % (1000 * 60 * 60 * 24);
            time.hour = parseInt($time / (1000 * 60 * 60));
            $time = $time % (1000 * 60 * 60);
            time.minute = parseInt($time / (1000 * 60));
            $time = $time % (1000 * 60);
            time.second = parseInt($time / (1000));
            return time;
        }

        function count_down(time_ms, flag) {
            clearInterval(interval);
            function doReflush() {
                if (time_ms > 0) {
                    var html = loadHandlebarsTemplate(template, formatTime(time_ms));
                    var appendStr = flag ? "后结束，请尽快抢购" : "后开始，请注意抢购";
                    html += appendStr;
                    $(".activity_time").html(html);
                } else {
                    clearInterval(interval);
                    location.reload();
                    //if (flag) {
                    //    $(".activity_time").html("活动已结束");
                    //} else {
                    //    location.reload();
                    //}
                }
                time_ms = time_ms - 1000;
            }

            interval = setInterval(doReflush, 1000);
        }

    }


    /**
     * 立即购买及加入购物车事件绑定
     *
     */
    function bindBuyButton(id, templateData, unSelectedAttr) {
        $(".fixed_btn_buy,.fixed_btn_shoppingcar").off();
        $(".jbtn3[permission='canBuy'], .fixed_btn_buy[permission='canBuy']").on("click", function () {
            var that = $(this);
            $.ww.getLoginStatus(function (data) {
                if ($(".choosed").css('display') == "none") {
                    changetool('choose');
                }
                else {
                    if (unSelectedAttr == undefined || unSelectedAttr.length == 0 || unSelectedAttr.length == undefined) {
                        var url = "/order/toOrderConfirmByImmediately.jhtml";
                        var params = {};
                        for (var index in templateData.goodsList) {
                            if (id == templateData.goodsList[index].id) {
                                var item = templateData.goodsList[index];
                                params["amount"] = $("#j_ipt1").val();
                                params["goodsId"] = item.goodsId;
                                params["goodsName"] = goodsName;
                                params["itemId"] = item.id;
                                params["itemName"] = item.name;
                                params["pic"] = item.itemPictureList[0].middlePicturePath;
                                params["storeId"] = storeId;
                                params["storeName"] = storeName;
                                changetool('toolbar');
                                $.ww.jumpTo(url, params, {});
                            }
                        }
                    } else {
                        $(".jcm_4 div[name=" + unSelectedAttr + "]").addClass("lacked");
                        $(".jcm_4 .errorwrong").remove();
                        $(".jcm_4 div[name=" + unSelectedAttr + "]").before('<label class="errorwrong"><u></u><i></i>请先选择商品属性</label>');
                        changetool('choose');
                    }
                }

            }, function () {
                changetool('toolbar');
                $('.bgBlack').show();
                $("#login_popUp").fadeIn();
            });

        });
        $(".addCart[buyflag='true'],.makeTure").on("click", function () {
            var ifadd = $(this).hasClass('big_bt');
            if ($(this).hasClass('makeTure')) {
                ifadd = true;
            }
            /* if (BtnCancelFlag) {
             return;
             }
             BtnCancelFlag = true;*/
            $.ww.getLoginStatus(function (data) {
                if (ifadd) {
                    if (unSelectedAttr == undefined || unSelectedAttr.length == 0 || unSelectedAttr.length == undefined) {
                        var url = "/sc/addSc.ajax";
                        var params = {};
                        for (var index in templateData.goodsList) {
                            if (id == templateData.goodsList[index].id) {
                                var item = templateData.goodsList[index];
                                params["amount"] = $("#j_ipt1").val();
                                params["goodsId"] = item.goodsId;
                                params["goodsName"] = goodsName;
                                params["itemId"] = item.id;
                                params["itemName"] = item.name;
                                params["pic"] = item.itemPictureList[0].middlePicturePath;
                                params["storeId"] = storeId;
                                params["storeName"] = storeName;
                                var success = function (data) {
                                    if (data.success) {
                                        $(".jcm_4 .errorwrong").remove();
                                        changetool('toolbar');
                                        jsAlert("加入购物车成功", {
                                            callback: function () {
                                                //BtnCancelFlag = false;
                                            }
                                        });
                                        already_login();    //重新加载顶部购物车
                                    } else {
                                        changetool('toolbar');
                                        jsAlert("加入购物车失败", {
                                            callback: function () {
                                                //BtnCancelFlag = false;
                                            }
                                        });
                                    }
                                };
                                requestDataWithAJAX(url, "post", true, {data: params, success: success});
                            }
                        }
                    } else {
                        $(".jcm_4 div[name=" + unSelectedAttr + "]").addClass("lacked");
                        $(".jcm_4 .errorwrong").remove();
                        $(".jcm_4 div[name=" + unSelectedAttr + "]").before('<label class="errorwrong"><u></u><i></i>请先选择商品属性</label>');
                        if ($(this).hasClass('makeTure')) {
                        }
                        else {
                            changetool('choose');
                        }
                    }
                }
                else {
                    changetool('addcar');
                }
            }, function () {
                changetool('toolbar');
                //BtnCancelFlag = false;
                $('.bgBlack').show();
                $("#login_popUp").fadeIn();
            });
        });
    }

// 评论
    function getGoodsScore() {
        $.ajax({
            type: 'post',
            data: {
                "storeId": storeId,
                "goodsId": goodsId,
                "length": 2,
                "start": 0,
                "typeScore": 1
            },
            url: '/gd/findGoodsScore.ajax',
            success: function (data) {
                var resultData = data.data.data;
                resultData.forEach(function (v, i) {
                    if (!resultData[i].memberPic) {
                        resultData[i].memberPic = '/resources/img/common/default_mempic.jpg'
                    }
                })
                var template = Handlebars.compile($('#evaluate').html());
                var content = template(resultData);
                $('.evaluate').html(content);
                $('.evaluate').append('<a href="javascript:;" class="lookAll">查看全部评价</a>');
                var i;
                for (i = 0; i < $('.evaluate_num b').length; i++) {
                    if ($('.evaluate_num b').eq(i).html() == '()') {
                        $('.evaluate_num b').eq(i).html('(0)');
                    }
                }
            }

        })
    };
    getGoodsScore();

// 全部评论
    var totalDataArr = [];

    function getAllGoodsScore(pageNum, type) {
        type = type || 0;
        $('.evaluate_num div').removeClass('checked').eq(type).addClass('checked')
        var start = (pageNum - 1) * 10;
        $.ajax({
            url: '/gd/findGoodsScore.ajax',
            type: 'post',
            data: {
                "storeId": storeId,
                "goodsId": goodsId,
                "start": start,
                'length': 10,
                'typeScore': type
            },
            success: function (data) {
                var resultData = data.data.data;
                var maxNum = Math.ceil(data.data.recordsTotal / 10);
                resultData.forEach(function (v, i) {
                    if (!resultData[i].memberPic) {
                        resultData[i].memberPic = '/resources/img/common/default_mempic.jpg'
                    }
                })
                totalDataArr = totalDataArr.concat(resultData)

                var template = Handlebars.compile($('#all_evaluate').html());
                var content = template(totalDataArr);
                $('.all_evaluate').html(content);
                $('.evaluate_num div').removeClass('checked').eq(type).addClass('checked')
                $(document).off('click', '.evaluate_num div', filterEvaluate)
                $(document).on('click', '.evaluate_num div', filterEvaluate)
                if (pageNum >= maxNum) {
                    $('.loadMore').html('没有更多了')
                }
                else {
                    $('#evaluate_0').on('click', loadMore)
                }
                getAllScoreNum(type)
            }
        })
    }

    function getAllScoreNum(type) {
        if (type == 0) {
            $.ajax({
                url: '/gd/findGoodsScore.ajax',
                type: 'post',
                data: {
                    "storeId": storeId,
                    "goodsId": goodsId,
                    "start": 0,
                    'length': 10,
                    'typeScore': 0
                },
                success: function (data) {
                    var resultData = data.data.data;
                    var template = Handlebars.compile($('#evaluateNum').html());
                    var content = template(resultData);
                    $('.evaluateNum').html(content);
                }

            })
        }
    }

// 店家
    !function () {
        function getStore() {
            $.ajax({
                type: 'get',
                url: "/fsajax/getStoreInfo.ajax?storeId=" + storeId,
                success: function (data) {
                    data = JSON.parse(data)
                    var template = Handlebars.compile($('#details_storeInfo').html());
                    var content = template(data);
                    $('.store .main').html(content);
                }
            })
        };
        getStore();
        $(".store").on("click", ".collection", favStore);
    }();


// 收藏商品
    !function () {
        $(document).on("click", '.addFav', function () {
            $('.pop_up').remove();
            if ("true" == promotionFlag) {
                jsErrAlert("活动商品不可收藏")
            }
            else {
                $.ww.getLoginStatus(function () {
                    var success = function (data) {
                        if (data.success) {
                            jsAlert("收藏成功");
                            // 收藏成功的红色图片
                        } else {
                            jsErrAlert(data.message);
                        }
                    };
                    var request = {"goodsId": goodsId, "storeId": storeId};
                    //API:"/fav/addToGdFav.ajax"
                    requestDataWithAJAX("/fav/addToGdFav.ajax", "post", true, {"success": success, data: request});

                }, function () {
                    $('.bgBlack').show();
                    $("#login_popUp").fadeIn();
                });
            }
        });
    }();


    // 收藏店铺
    function favStore() {
        $.ww.getLoginStatus(function () {
            var success = function (data) {
                if (data.success) {
                    jsAlert("收藏成功");

                } else {
                    jsErrAlert(data.message);
                }
            };
            var request = {"storeId": storeId};
            //API:"/mf/addSgMemberStoreFavorite.ajax"
            requestDataWithAJAX("/mf/addSgMemberStoreFavorite.ajax", "post", true, {"success": success, data: request});
        }, function () {
            $('.bgBlack').show();
            $("#login_popUp").fadeIn();
        });
    };


// 推荐搭配
    /*function recommond() {
     $.ajax({
     type: 'post',
     data: {"type": "detail", "serialId": lv3_id, "rangeId": "tuijiandapei"},
     url: '/fsajax/getAdsPic.ajax',
     success: function (data) {
     data = JSON.parse(data);
     if (data != undefined && data.length != 0 && data != "[]") {
     for (var i in data) {
     try{
     $("." + data[i].adsInfo.advertId + " a").attr("href", data[i].adsInfo.goodsLink);
     $("." + data[i].adsInfo.advertId + " a img").attr("src", data[i].adsInfo.advertPic);
     //$("." + data[i].adsInfo.advertId).find(".fanfan-hotsales-img img").attr("src", data[i].adsInfo.advertPic);
     var rootObj = $("." + data[i].adsInfo.advertId);
     rootObj.find(".name").text(data[i].goods.name);
     rootObj.find(".name").attr("title", data[i].goods.name);
     rootObj.find(".price").text("￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
     rootObj.find(".price").attr("title", "￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
     rootObj.find(".detail").text(data[i].goods.description);
     rootObj.find(".detail").attr("title",data[i].goods.description);
     } catch (ex) {
     console.error(ex);
     if (data[i]) {
     console.error("广告位数据异常", data[i]);
     }
     }
     }
     }
     }
     })
     };
     recommond();*/


    // 同类商品
    /*function same_goods() {
     $.ajax({
     type: 'post',
     data: {"type": "detail", "serialId": lv3_id, "rangeId": "tongleishangpin"},
     url: '/fsajax/getAdsPic.ajax',
     success: function (data) {
     data = JSON.parse(data);
     if (data != undefined && data.length != 0 && data != "[]") {
     for (var i in data) {
     try{
     $("." + data[i].adsInfo.advertId + " a").attr("href", data[i].adsInfo.goodsLink);
     $("." + data[i].adsInfo.advertId + " a img").attr("src", data[i].adsInfo.advertPic);
     //$("." + data[i].adsInfo.advertId).find(".fanfan-hotsales-img img").attr("src", data[i].adsInfo.advertPic);
     var rootObj = $("." + data[i].adsInfo.advertId);
     rootObj.find(".j_pInL_buttomP").text(data[i].goods.name);
     rootObj.find(".j_pInL_buttomP").attr("title", data[i].goods.name);
     rootObj.find(".j_pInL_buttomS").text("￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
     rootObj.find(".j_pInL_buttomS").attr("title", "￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
     } catch (ex) {
     console.error(ex);
     if (data[i]) {
     console.error("广告位数据异常", data[i]);
     }
     }
     }
     }
     }
     })
     };
     same_goods();*/

// 店长推荐
    /*function leader_like() {
     $.ajax({
     type: 'post',
     data: {"type": "detail", "serialId": lv3_id, "rangeId": "dianzhangtuijian"},
     url: '/fsajax/getAdsPic.ajax',
     success: function (data) {
     data = JSON.parse(data);
     if (data != undefined && data.length != 0 && data != "[]") {
     for (var i in data) {
     $("." + data[i].adsInfo.advertId + " a").attr("href", data[i].adsInfo.goodsLink);
     $("." + data[i].adsInfo.advertId + " a img").attr("src", data[i].adsInfo.advertPic);
     //$("." + data[i].adsInfo.advertId).find(".fanfan-hotsales-img img").attr("src", data[i].adsInfo.advertPic);
     var rootObj = $("." + data[i].adsInfo.advertId);
     rootObj.find(".j_pInL_topP").text(data[i].goods.name);
     rootObj.find(".j_pInL_topP").attr("title", data[i].goods.name);
     rootObj.find(".j_pInL_topS").text("￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
     rootObj.find(".j_pInL_topS").attr("title", "￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
     }
     }
     }
     })
     };
     leader_like();
     */

    // 猜你喜欢
    /*function guess_like() {
     $.ajax({
     type: 'post',
     data: {"type": "detail", "serialId": lv3_id, "rangeId": "cainixihuan"},
     url: '/fsajax/getAdsPic.ajax',
     success: function (data) {
     data = JSON.parse(data);
     if (data != undefined && data.length != 0 && data != "[]") {
     for (var i in data) {
     try{
     $("." + data[i].adsInfo.advertId + " a").attr("href", data[i].adsInfo.goodsLink);
     $("." + data[i].adsInfo.advertId + " a img").attr("src", data[i].adsInfo.advertPic);
     //$("." + data[i].adsInfo.advertId).find(".fanfan-hotsales-img img").attr("src", data[i].adsInfo.advertPic);
     var rootObj = $("." + data[i].adsInfo.advertId);
     rootObj.find(".j_youlikeP").text(data[i].goods.name);
     rootObj.find(".j_youlikeP").attr("title", data[i].goods.name);
     rootObj.find(".j_youlikeS").text("￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
     rootObj.find(".j_youlikeS").attr("title", "￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
     } catch (ex) {
     console.error(ex);
     if (data[i]) {
     console.error("广告位数据异常", data[i]);
     }
     }
     }
     }
     }
     })
     }
     guess_like();*/
//浏览历史功能调用
    function addHistory() {
        $.dm.addBrowseHistory({
            goodsId: goodsId,
            storeId: storeId,
            goodsName: goodsName,
            storeName: storeName
        });
    }

    var index;

    function filterEvaluate() {         //评论筛选
        index = $(this).index()
        pageNum = 1
        totalDataArr = []
        switch (index) {
            case 0:
                getAllGoodsScore(1);
                break;
            case 1:
                getAllGoodsScore(1, 1);
                break;
            case 2:
                getAllGoodsScore(1, 2);
                break;
            case 3:
                getAllGoodsScore(1, 3);
                break;
        }

    }

    function loadMore() {
        pageNum++
        getAllGoodsScore(pageNum, index)
    }
});

function showBigImg(t, e) {           //点击评价中的图片将图片放大
    e.stopPropagation()
    var picSrc = $(t).attr('src');
    $('.zhao').show()
    $('<img src="' + picSrc + '" create="1">').css({
        'position': 'fixed',
        'top': '2rem',
        'width': '90%',
        'display': 'block',
        'left': '5%',
        'z-index': '1000'
    }).appendTo('body');
    $(document).on('click', function () {
        if ($('.zhao').css('display') == 'block') {
            $('.zhao').hide()
            $('[create="1"]').remove()
        }
    })
}



