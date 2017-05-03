/**
 *  共通方法
 *  商铺子页(商家资质&商家档案)轮播图加载
 *  Created by ldy on 2016/12/8.
 */
$(function(){
    var storeId = $("#pageInfo").attr("store_id");   //获取唯一商铺ID storeId;
    var storeTemplateCode = $('#pageInfo').attr('store_template_code'); //获取唯一模板编号 storeTemplateCode;
    /*动态数据获取方法*/
    function ajaxData(str) {
        var thar = this;
        this.serData = {
            type: 'store',
            storeId: storeId,
            templatesCode: storeTemplateCode,
            channel: 'about',
            rangeId: str
        }
        /*动态数据获取*/
        this.ajax = function() {
            $.ajax({
                url: '/fsajax/getSellerTemplateElementInfo.ajax',
                type: 'GET',
                dataType: 'json',
                data: this.serData
            })
            .done(function(data){
                thar.docData(data);
            })
            .fail(function(){
                console.log("error");
            })
        }
        /*数据获取成功追加至页面*/
        this.docData = function(data){
            var imgSrc = [];
            for(var i in data) {
                imgSrc.push(data[i].adsInfo.advertPic);
            }
            if (imgSrc.length > 0) {
                $[str].getSliderImg({src: imgSrc});
            } else {
                var swhtml = '<h1 style="text-align:left;padding-top:0.2rem;font-size:0.28rem;color:#000;text-indent: 1em;text-shadow: -5px 4px 7px rgba(68,68,68,0.8);">商家暂无资料!</h1>';
                $('.only_book_content_' + str + ' .ff-tab-con-detail').html(swhtml);
            }

        }

    };

    /** 商家资质图片加载 **/
    var getSliderImg1 = new ajaxData("zizhi").ajax();
    /** 商家档案图片加载 **/
//  var getSliderImg2 = new ajaxData("dangan").ajax();

});