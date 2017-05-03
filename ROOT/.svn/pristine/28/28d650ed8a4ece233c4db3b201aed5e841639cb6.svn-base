// JavaScript Document
$(document).ready(function() {
    // 商品分类
    $(".category-produce h4").click(function() {
        $(this).siblings("p").fadeToggle();
        $(this).toggleClass("category-produceico");
    });
    // 商品排行
    $("#produce-ranking-li-A").mousemove(function() {
        $("#produce-rankingA").show();
        $("#produce-rankingB").hide();
        $(this).addClass("produce-ranking-on");
		$("#produce-ranking-li-B").removeClass("produce-ranking-on")
    });
	$("#produce-ranking-li-B").mousemove(function() {
        $("#produce-rankingB").show();
        $("#produce-rankingA").hide();
        $(this).addClass("produce-ranking-on");
		$("#produce-ranking-li-A").removeClass("produce-ranking-on")
    });

    //规格选择
    $(".specifications-list em").click(function() {
        $(this).toggleClass("specifications-selected");
        $(this).siblings().removeClass("specifications-selected");
    })

    // 未选择规格时提示
//    $(".detail-button-bg2").click(function() {
//    	
//        if ($(".specifications-list em").hasClass("specifications-selected")) {
//            $("#specifications-error").removeClass("specifications-error");
//			$("#specifications-error").children(".errorwrong").hide();
//            $('.cx2').fadeIn()
//        } else {
//            $("#specifications-error").addClass("specifications-error");
//			$("#specifications-error").children(".errorwrong").show()
//        }
//        $(".specifications-list em").click(function() {
//            if ($(".specifications-list em").hasClass("specifications-selected")) {
//                $("#specifications-error").removeClass("specifications-error");
//				$("#specifications-error").children(".errorwrong").hide()
//            }
//        })
//
//    })
    //关闭未选择销售属性的错误提示
    $(".specifications-error-shut").click(function() {
        $(this).parent().removeClass("specifications-error");
        $(this).parent().children(".errorwrong").hide()
    })

    //商品浮动工具
    $(window).scroll(function() {
        if (($(window).scrollTop()) >= 770) {
            $(".good-tool").fadeIn();
            $('.tabT').addClass('tabTP');
        } else {
            $(".good-tool").fadeOut();
            $('.tabT').removeClass('tabTP');
        }
    });
	
    $('.tabT li').click(function() {
        if (($(window).scrollTop()) >= 770) {
            $(window).scrollTop(770)

        }
    });
	$(".good-tool .detail-button .detail-button-bg2").click(function() {
        $(".good-tool-filter").toggle();
        $("#confirmAdd").attr("dm-actor","dm-add2shpcart");
    });
	//点击立即购买弹出浮层
	$("[dm-actor='dm-buy-tool']").click(function(){
		$(".good-tool-filter").toggle();
        $("#confirmAdd").attr("dm-actor","dm-buy");
	});

})
//促销更多优惠
$(document).ready(function() {
    $(".details-sale-btn").click(function() {

        $(".sale-pop").toggle();
        $(this).children("i").toggleClass("details-sale-btn-i")
    })
});
function clsNewTool(){
	$(".good-tool-filter").toggle();
} 