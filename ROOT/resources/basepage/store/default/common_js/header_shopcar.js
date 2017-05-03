function already_login(){
    $(document).ready(function(){
        //load_data_shopcar();
    });
    function load_data_shopcar(){
        var success = function (data) {
            var data = data.data;
            var goodsLength = $(data).length;
            var template_header_shopcar = $("#header_shopcar").html();
            var html = loadHandlebarsTemplate(template_header_shopcar, data);
            $(".shopping_cart_goods_sub").html(html);  //加载到html中
            var allsub = $(".blankSpaceShopping_car").siblings();

            if (goodsLength == 0) {
                $(allsub).css("display", "none");
                $(".blankSpaceShopping_car").css("display", "block");
            }
            else {
                $(".blankSpaceShopping_car").css("display", "none");
                $(allsub).css("display", "block");
            }
            $(".shopping_cart").hover(function () {
                $(this).addClass("boxShaw");
                $(".shopping_cart_goods").css("display", "block");
            }, function () {
                $(".shopping_cart_goods").css("display", "none");
                $(".shopping_cart").removeClass("boxShaw");
            });
            full_data(data,goodsLength);
            $(".delete_a").on("click",function(){
                var itemId = $(this).attr("itemId");
                delete_shopcar_goods(itemId);
            });
        }
        requestDataWithAJAX("/sc/findScLst.ajax", "post", true, {"success": success});
    }
    function delete_shopcar_goods(itemId){
        var success = function (data) {
            load_data_shopcar();
        };
        var url = "/sc/delSc.ajax";
        var data = {"id":itemId}
        requestDataWithAJAX(url, "post", true, {"success": success,"data":data});
    };
    function full_data(data,goodsLength){
        var numbSpan = $(".numbSpan");
        var all_goods_price = 0;
        for (var i = 0; i < goodsLength; i++) {
            all_goods_price += parseFloat(data[i].amount * data[i].salesPrice);
        }
        all_goods_price = parseFloat(all_goods_price.toFixed(2));
        $(numbSpan).text(goodsLength);
        $(".footerP>.span2").text(all_goods_price);
    }
}

function not_login(){

}

