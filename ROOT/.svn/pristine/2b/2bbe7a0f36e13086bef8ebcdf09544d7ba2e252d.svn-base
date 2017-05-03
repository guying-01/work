$(function() {
	//			设置订阅商机弹出层位置
	var $orderbox = $('.order_business_hb');
	$orderbox.css({
		left: ($("body").width() - $orderbox.width()) / 2 + "px",
		top: ($(window).height() - $orderbox.height() - 50) / 2 + "px"
	});
	$(".order_business").on("click", function() {
			$(".order_business_hb_box").fadeIn();
			$(".btn_close").on("click", function() {
				$(".order_business_hb_box").fadeOut();
			})
		})
		//			设置饭饭口碑库弹出层位置
	var $ffkoubeibox = $('.ff_koubei_hb');
	$ffkoubeibox.css({
		left: ($("body").width() - $ffkoubeibox.width()) / 2 + "px",
		top: ($(window).height() - $ffkoubeibox.height() - 50) / 2 + "px"
	});
	$(".ff_koubei").on("click", function() {
		$(".ff_koubei_hb_box").fadeIn();
		$(".btn_close").on("click", function() {
			$(".ff_koubei_hb_box").fadeOut();
		})
	})
})