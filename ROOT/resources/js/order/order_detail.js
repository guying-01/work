// JavaScript Document
$(document).ready(function() {
	// var orderDetailFormGoodsName = $("#orderDetailFormGoodsName").attr('title');
	// if(orderDetailFormGoodsName.length > 18){
	// 	$("#orderDetailFormGoodsName").html(orderDetailFormGoodsName.substring(0,18) + '...');
	// }
	// var orderDetailFormItemName = $.trim($("#orderDetailFormGoodsName").parent().next().find("a").html());
	// if(orderDetailFormItemName.length > 18){
	// 	$("#orderDetailFormGoodsName").parent().next().find("a").text(orderDetailFormItemName.substring(0,18) + '...');
	// }
	try {
		var orderId = $("#orderId").val();
		var memberType = $("#memberType").val();
		var orderDetailId = null;
		var sellerName = $("#sellerName").attr("value");
		var orderState = $("[dm-container='orderState']").attr("dm-value");
		var serviceStatus = $("#service_status").val();
		var tradeAttr1 = $("#tradeAttr1").val();
		// 请求字典数据url
		var url = "/order/dictionaryByTypeAndCode.ajax";
		// 请求字典数据参数
		var query = {
			"dicType" : "ORDER_STATUS",
			"code" : orderState
		};
		callService(url, query, {
			callSuccess : function(result) {
				result = result || {};
				var state_data = {};
				// 设置订单id
				state_data["id"] = orderId;
				// 设置订单详细id
				state_data["detailId"] = orderDetailId;
				// 设置买家名称
				state_data["sellerName"] = sellerName;
				state_data["serviceStatus"] = serviceStatus;
				state_data["tradeAttr1"]=tradeAttr1;
				// 设置倒计时时间
				if (orderState == "00" || orderState == "20"|| orderState == "80") {
					showRestTime();
				}
				// 将数据继承数据库数据
				$.extend(state_data, result);
				// 获取数据库中模板所需的数据
				var attr = result["attr1"] || "";
				var endtime='';
				try {
					// 将模板所需的数据变成json对象
					attr = eval("(" + attr + ")");
				} catch (ex) {
					console.log(ex);
				}

				// // 请求字典数据url
				// var url = "/order/dictionaryByTypeAndCode.ajax";
				// // 请求字典数据参数
				// var query = {
				// 	"dicType" : "AUTO_TIME_TYPE",
				// 	"code" : '20'
				// };
				// callService(url, query, {
				// 	async : false,
				// 	callSuccess : function(result) {
				// 		attr.time = result.attr1;
				// 	}
				// });

				// 请求字典数据url
				var url = "/order/sysConfigByType.ajax";
				// 请求字典数据参数
				var query = {
					"dicType" : "business_time",
				};
				callService(url, query, {
					async : false,
					callSuccess : function(sysvo) {
						endtime = sysvo.value2;
					}
				});
				if(!attr){
					attr = {};
					attr.time = endtime;
				}else{
					attr.time = endtime;
				}

				// 将数据集成模板所需数据
				$.extend(state_data, attr);
				// 状态对应模板
				var order_state_tl = $("#ORDER_STATE_" + orderState + "-tl").html();
				// 获取模板
				// 生产handlebars方法
				Handlebars.registerHelper("equals", function(v1, v2, options) {
					if (v1 == v2) {
						return options.fn(this);
					} else {
						return options.inverse(this);
					}
				});
				Handlebars.registerHelper("closeOrder", function(tradeAttr1, orderId) {
					if(tradeAttr1=="pay_doing"){
						return "";
					}else{                                          
						if(memberType && (memberType=="member_servant" || memberType=="member_separate")){
							return "";
						}else{
							return '<span><i></i>如果您不想购买了，您可以</span><a href="javascript:toCancelOrder('+orderId+')">取消订单</a>';
						}
					}
				});
				var orderState_template = Handlebars.compile(order_state_tl);
				// 编译成html
				state_data.orderId = orderId;
				var orderState_html = orderState_template(state_data);
				// 将生产的html插入页面中
				$('[dm-actor="order-statae"]').replaceWith(orderState_html);
				// 设置倒计时时间
				if (orderState == "00" || orderState == "20"||orderState == "80") {
					window.setInterval(showRestTime, 1000);
				}
			}
		});
	} catch (ex) {
		console.log(ex);
	}

});

// 取消订单
function toCancelOrder(orderId) {
	jsConfirm("确定要取消订单吗?", {
		callback : function(result) {
			if (result) {
				callService(dm_ctx + "/order/doCancelOrder.ajax", {
					"id" : orderId
				}, {
					callSuccess : function(data) {
						if (data == true) {
							var url = dm_ctx + '/order/toOrderDetail.jhtml';
							var params = {
								orderId : orderId
							};
							$.dm.jumpTo(url, params);
						}
					}
				});
			}
		}
	});
}

// 跳转到确认发货页面
function toConfirmReceive(orderId) {
	var url = '/order/toConfirmReceive.ajax';
	var params = {
		orderId : orderId
	};
	$.dm.jumpTo(url, params);
}
// 通过订单订单详情id查询此商品是否已申请退款，已申请过则修改，未申请则新增
function applyRefund(orderId, orderDetailId) {
	var url = dm_ctx + "/return/findApplyRefund.ajax";
	callService(url, {
		"orderDetailId" : orderDetailId
	}, {
		callSuccess : function(data) {
			if (data != '' && data != null) {
				toUrl = dm_ctx + "/return/returnEditApplyRefundFromOrder.jhtml"
				var params = {
					returnOrderId : data.id
				};
				$.dm.jumpTo(toUrl, params);

			} else {
				toUrl = dm_ctx + "/return/applyRefund.jhtml"
				var params = {
					orderId : orderId,
					orderDetailId : orderDetailId
				};
				$.dm.jumpTo(toUrl, params);

			}
		}
	});
}
// 初始化确认延长收货时间
function extendReceive() {
	var orderId = $("#orderId").val();
	var requestUrl = dm_ctx + "/order/checkExtendReceive.ajax";
	callService(requestUrl, {
		orderId : orderId
	}, {
		callSuccess : function(data) {
			if (data) {
				$(".cx4").fadeIn();
				$("#strid").val(str);
			}
		}
	});
}
// 关闭延长收货提示
function clo() {
	$(".cx4").fadeOut();
}
// 确认延长收货时间
function saveExtendReceive() {
	$.dm.block($(".pop_up_button"));
	var str = $("#strid").val();
	var orderId = $("#orderId" + str).val();
	var code = $('#sel').val();
	var requestUrl = dm_ctx + "/order/saveExtendReceive.ajax";
	callService(requestUrl, {
		orderId : orderId,
		code : code
	}, {
		callSuccess : function(data) {
			if (data) {
				jsAlert("延长收货时间成功！");
				$.dm.unblock($(".pop_up_button"));
				clo();
				searchOrder($("#pageNumber").val());
			} else {
				jsErrAlert("延长收货时间失败！");
				$.dm.unblock($(".pop_up_button"));
			}
		}
	});
}
var timeInfo = {};
// 更新倒计时
var showRestTime = function() {
	var now = new Date();
	var restTime = $("#restTime").val();
	if (restTime == null) {
		return false;
	} else {
		restTime = formatDateDiff(restTime - now.getTime());
		timeInfo.restDay = restTime.days;
		timeInfo.restHour = restTime.hours;
		timeInfo.restMinute = restTime.minutes;
		timeInfo.restSecond = restTime.seconds;
	}
	var timeTl = Handlebars.compile($('#show-rest-time-tl').html());
	var $time = $(timeTl(timeInfo));
	$("#showRestTime").html($time);
};