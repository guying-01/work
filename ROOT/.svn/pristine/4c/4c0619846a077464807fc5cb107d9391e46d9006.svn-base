$(document).ready(function () {
	$('.menu').remove();
	$('.nav').remove();
	$('.headapp').remove();
	$('.footernav').remove();
	$('.hot-search').remove();
	$('.tool').remove()
})

function doGetcoupon(couponId,denomination){
	//遮罩锁定开始
	var target = $(".card");
	$.dm.block(target);
	var url= "/activity/toGetAdminCouponConfirm.jhtml";
	var opt={method:'post'};
	$.dm.jumpTo(url, {"coupon_id":couponId,"denomination":denomination}, opt);
}

function doGetcouponConfirm(couponId){
	//遮罩锁定开始
	var target = $(".card");
	$.dm.block(target);
	var url= "/activity/toGetAdminCouponSuccess.jhtml";
	var opt={method:'post'};
	$.dm.jumpTo(url, {"couponId":couponId}, opt);
}
function doSearchCoupon(){
	var url='/activity/toFindAdminActivityList.jhtml';
	var opt={method:'post'};
		$.dm.jumpTo(url, {}, opt);
}
function blockObj(){
	//登录校验
	$.dm.getLogStatus(function(data){
		if(data==null){
//			$("#login_popUp").fadeIn();
			location.href='/toLogin.jhtml';
		}else{
			$.dm.block($(".card"));
		}
	})
	
}