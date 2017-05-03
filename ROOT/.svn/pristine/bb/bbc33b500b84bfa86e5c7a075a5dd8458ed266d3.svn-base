//获取数据
'use strict';

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

$(function () {
    var gy = new getGoodsData();
    gy.getData();
});

var getGoodsData = (function () {
    function getGoodsData() {
        _classCallCheck(this, getGoodsData);
    }

    _createClass(getGoodsData, [{
        key: 'getData',
        value: function getData() {
            $.post("/fsajax/getAdsPic.ajax", { type: 'level', serialId: '307_00000000000008857_gic' }, function (data) {
                getGoodsData.tem();
                var dataG = JSON.parse(data);
                var dataGy = getGoodsData.formatData(dataG);
                getGoodsData.rangeTemplate(dataGy);
                var time = new Date().Format('yyyy年MM月dd日');
                $('.time').html(time);
                $('.boxContent .every-goods-pic img').on('click', function (e) {
                    e.stopPropagation();
                    var adsInfo = $(this).attr('adsInfo');
                    var returnData = undefined;
                    dataG.forEach(function (v, i) {
                        if (dataG[i].adsInfo.advertId == adsInfo) {
                            returnData = v;
                        }
                    });
                    var template = Handlebars.compile($('#table').html());
                    var templateHtml = template(returnData);
                    $('.table').html(templateHtml);
                    $('.zhao').show();
                    $('.table').fadeIn();

                    $('.collect').on('click', function (e) {
                        e.stopPropagation();
                        $.ww.getLoginStatus(function () {
                            var param = {};
                            param.amount = 1;
                            param.goodsId = returnData.goods.id;
                            param.goodsName = returnData.goods.name;
                            param.itemId = returnData.searchInfo.data.dataList[0].item_id;
                            param.itemName = returnData.searchInfo.data.dataList[0].item_name;
                            param.pic = returnData.itemInfoList[0].itemPictureList[0].bigPicturePath;
                            param.storeId = returnData.goods.storeId;
                            param.storeName = returnData.goods.storeName;
                            $.post('/sc/addSc.ajax', param, function (result) {
                                if (result) {
                                    jsAlert('加入购物车成功');
                                    $('.zhao').hide();
                                    $('.table').hide();
                                } else {
                                    jsAlert('加入购物车失败');
                                }
                            });
                        }, function () {
                            $('.zhao').show();
                            $('.table').hide();
                            $("#login_popUp").fadeIn();
                            //登录弹出框关闭事件
                            $('.loginShut').click(function () {
                                $('.zhao').hide();
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
                                    $(".form #userName").siblings(".loginError").hide();
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
                                var successResponse = function successResponse(data) {
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
                        });
                    });
                    $('.table').on('click', function () {

                        if ($('.zhao').css('display', 'block')) {
                            $('.zhao').hide();
                            $(this).fadeOut();
                        }
                        $('.table').off();
                    });
                });
            });
            $.post('/fsajax/FSGoodsCategory.ajax?level2=307_00000000000008857_gic', {}, function (data) {
                var template = Handlebars.compile($('#navigation-content').html());
                var templateHtml = template(data);
                $('.navigation-content').html(templateHtml);
                getGoodsData.complementEle();
            });
        }
    }], [{
        key: 'tem',
        value: function tem() {
            var num = 0;
            Handlebars.registerHelper({
                'debug': function debug(i) {
                    console.log(i);
                },
                'index': function index() {
                    num++;
                    return num;
                },
                deliverTime: function deliverTime(day, time) {
                    var result = "";
                    if (time) {
                        time = time.split(":")[0];
                    } else {
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
        }
    }, {
        key: 'complementEle',
        value: function complementEle() {
            var length = $('.navigation-content .everySelect').length;
            if (length % 4 != 0) {
                var remain = 4 - length % 4;
                for (var i = 0; i < remain; i++) {
                    $('<div class="everySelect"><div class="title"> </div></div>').appendTo($('.navigation-content'));
                }
            }
        }
    }, {
        key: 'rangeTemplate',
        value: function rangeTemplate(data) {
            var template = Handlebars.compile($('#boxContent').html());
            $.each(data, function (i, v) {
                if (i) {
                    try {
                        var templateHtml = template(data[i].xianpin);
                        $(".boxContent-" + i + "-xianpin").html(templateHtml);
                        templateHtml = template(data[i].zhenpin);
                        $(".boxContent-" + i + "-zhenpin").html(templateHtml);
                        var title = data[i].chuanxun[1].adsInfo.remark;
                        $(".guangbo-" + i + "-gy").html(title);
                    } catch (e) {}
                } else {}
            });
        }
    }, {
        key: 'formatData',
        value: function formatData(data) {
            var dataObj = {};
            $.each(data, function (i, v) {
                try {
                    var floor = v.adsInfo.advertId.split('_')[4];
                    if (!dataObj[floor]) {
                        dataObj[floor] = new Object();
                        dataObj[floor][i] = v;
                    } else {
                        dataObj[floor][i] = v;
                    }
                    var kind = v.adsInfo.advertId.split('_')[5];
                    var num = v.adsInfo.advertId.split('_')[6];
                    if (!dataObj[floor][kind]) {
                        dataObj[floor][kind] = new Object();
                        dataObj[floor][kind][num] = v;
                        delete dataObj[floor][i];
                    } else {
                        dataObj[floor][kind][num] = v;
                        delete dataObj[floor][i];
                    }
                } catch (e) {
                    console.log(e);
                }
            });
            return dataObj;
        }
    }]);

    return getGoodsData;
})();