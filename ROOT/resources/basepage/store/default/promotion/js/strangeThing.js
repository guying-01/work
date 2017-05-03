/**
 * @新奇特怪页
 * Created by zyc on 2017/2/21.
 */

$(function (){
    /**
     * 广告位加载
     * Created by WW on 2017/2/21.
     */
    Handlebars.registerHelper({
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
        },
        debug: function (i) {
            console.log(i)

        }
    })
    var ajaxRetrieval = {
        serData: {
            type: 'index',
            serialId: 'strangeThing',
            // rangeId: 'activity'
        },
        /*动态数据获取*/
        ajax: function() {
            var that = this;
            $.ajax({
                    url: '/fsajax/getAdsPic.ajax',
                    type: 'POST',
                    dataType: 'json',
                    data: this.serData
                })
                .done(function(data) {
                    that.docData(data);
                })
                .fail(function() {
                    console.log("error");
                })
        },
        /*数据获取成功追加至页面*/
        docData: function(data) {
            var dataObject = new Object();
            for(var i in data) {
                var obj = data[i];
                var key = obj.adsInfo.rangeId;
                if (Object.prototype.toString.call(dataObject[key]) == '[object Array]') {
                    dataObject[key].push(obj);
                } else {
                    dataObject[key] = new Array();
                    dataObject[key].push(obj);
                }
            }
            dataObject=dataObject.activity01
            var template=Handlebars.compile($('#template_goods').html())
            var templateHtml=template(dataObject)
            $(".activity01").html(templateHtml)
            favStore();
        },
        // 获取商品销量
        result: function(sales) {
            $.post("/gd/findGoodsTransactionCount.ajax", {
                "goodsId": sales.adsInfo.goodsId
            }, function(data2) {
                $('.' + sales.adsInfo.elementId + ' .rq_gb_sales').text(data2.result + '件');
            });
        }
    }
    ajaxRetrieval.ajax();


    /**
     * 收藏商品事件绑定
     * Created by WW on 2016/10/12.
     */
    function favStore() {
        $(".goodsCollect").click(function(){
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
                location.href = "/toLogin.jhtml";
            });
        })
    };

});