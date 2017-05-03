// JavaScript Document
function toScore(){
			var orderId = $("#orderId").val();
			var url=dm_ctx +'/score/toScore.jhtml';
			var params={
				orderId:orderId
			};
			$.dm.jumpTo(url, params);
}

//跳转到订单详情页面
function toOrderDetail(){
	var orderId = $("#orderId").val();
	var url = "/order/toOrderDetail.jhtml";
	var params={
		orderId:orderId
	};
	$.dm.jumpTo(url, params);
}

//确认收货成功
function toConfirmReceiveSuccess() {
	jsConfirm("确认收货吗?",{callback:function(result){
		if(result){
			var target = $(".bottom-button");
			//$.dm.block(target);//开始区域锁定
			var orderId = $('#orderId').val();
			var sellerName=document.getElementById("sellerName").innerHTML;
			var requestUrl = dm_ctx +"/order/doConfirmReceive.ajax";
			callService(
							requestUrl,
							{"id": orderId},
							{
								callSuccess:function(data){
									if(data) {
										var url=dm_ctx +'/order/toConfirmReceiveSuccess.jhtml';
										var params={
											sellerName:sellerName,
											orderId:orderId
										};
										$.dm.jumpTo(url, params);
									}else {
										jsErrAlert("确认收货失败！");
										$.dm.unblock(target);//区域解锁
									}
								},callError:function(){
									jsErrAlert("确认收货失败！");
									$.dm.unblock(target);//区域解锁
								}
							}
						);
}
	}});
	
}