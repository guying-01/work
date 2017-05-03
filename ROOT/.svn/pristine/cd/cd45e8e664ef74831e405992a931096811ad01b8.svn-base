
//首页大厅广告位
$(document).ready(function () {
    var success = function (data) {
        data = JSON.parse(data);
        if (data != undefined && data.length != 0 && data != "[]" && $.isEmptyObject()) {
            var len = data.length;
            for (var i = 0; i < len; i++) {
                try{
                    var li_id = "#" + data[i].adsInfo.advertId;
                    var a_href = data[i].adsInfo.goodsLink;
                    var img_src = data[i].adsInfo.advertPic;
                    var price = JSON.parse(data[i].adsInfo.jsonInfo).goodsPrice;
                    var li_dom = $(li_id);
                    li_dom.attr("href", a_href);
                    li_dom.find("img").attr("src", img_src);
                    li_dom.find("p").text("￥"+price).attr("title", "￥" + $.ww.formatDecimal(data[i].searchInfo.data.dataList[0].item_saleprice, 2));
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
    var data = {"type": "index", "serialId": "0"};
    requestDataWithAJAX("/fsajax/getAdsPic.ajax", "post", true, {"success": success, "data": data});




    




});
