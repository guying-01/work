// JavaScript Document
$(function() {
	$('.tab-item5 p').css('color', '#c91622').siblings().css('color', '#696969');
	$('.tab-item5 i').css({
		'background': 'url(/resources/basepage/store/default/common_img/tab-icon5R.png) no-repeat center center',
		'background-size': 'contain'
	});
	$.dm.getLogStatus(function(data) {
		if (data == null) {
			// $("#login_popUp").fadeIn();
			location.href = '/toLogin.jhtml';
		} else {
			//findMemberHeader();
			//findMemberGrade();
			searchOrder(orderStatesInpay, 0);
			//findCouponIssuesCount();
			initActors();
		}
	});
});
jQuery.divselect = function(divselectid) {
	// 获得显示宽度
	var webwidth = $(divselectid).width();
	// 获得li的宽度
	var liwidth = $(divselectid).children(".member-goods-ul").children("ul").children("li").width();
	// 翻屏的宽度
	var liwidth_n = (liwidth + 2) * 3
	// 获得li的个数
	var limus = $(divselectid).children(".member-goods-ul").children("ul").children("li").length;
	// 获得显示的li的个数
	var liblock = webwidth / liwidth
	// 获得隐藏的li的个数
	var linone = limus - liblock
	// 获得一共能翻屏的次数（小数取整进位）
	var changeli = Math.ceil(limus / liblock);
	var i = 0;
	if (limus <= liblock) {
		$(divselectid).children(".next").hide();
		$(divselectid).children(".pre").hide();
	}

	$(divselectid).children(".next").click(function() {
		// 获得显示宽度
		webwidth = $(divselectid).width();
		// 获得li的宽度
		liwidth = $(divselectid).children(".member-goods-ul").children("ul").children("li").width();
		// 翻屏的宽度
		liwidth_n = (liwidth + 2) * 3;
		// 获得li的个数
		limus = $(divselectid).children(".member-goods-ul").children("ul").children("li").length;
		// 获得显示的li的个数
		liblock = webwidth / liwidth;
		// 获得隐藏的li的个数
		linone = Math.round(limus - liblock);
		// 获得一共能翻屏的次数（小数取整进位）
		changeli = Math.ceil(limus / liblock);
		// var i = 0;
		i = i + 1
		if (linone >= i) {
			$(divselectid + " .member-goods-ul ul").animate({
				'margin-left' : -(liwidth_n * i)
			}, 300);
			$(this).siblings(".pre").show();

			if (i == (changeli - 1)) {
				$(this).hide();
				$(divselectid + " .next-grey").show();
			}

		}
	});
	$(divselectid).children(".pre").click(function() {
		// 获得显示宽度
		webwidth = $(divselectid).width();
		// 获得li的宽度
		liwidth = $(divselectid).children(".member-goods-ul").children("ul").children("li").width();
		// 翻屏的宽度
		liwidth_n = (liwidth + 2) * 3;
		// 获得li的个数
		limus = $(divselectid).children(".member-goods-ul").children("ul").children("li").length;
		// 获得显示的li的个数
		liblock = webwidth / liwidth;
		// 获得隐藏的li的个数
		linone = Math.round(limus - liblock);
		// 获得一共能翻屏的次数（小数取整进位）
		changeli = Math.ceil(limus / liblock);
		// var i = 0;
		i = i - 1
		if (i >= 0) {
			$(divselectid + " .member-goods-ul ul").animate({
				'margin-left' : -(liwidth_n * i)
			}, 300);
			$(this).siblings(".next").show();

			if (i == 0) {
				$(this).hide();

			}
		}
	})

};

/**
 * 取得用户头像
 */
function findMemberHeader() {
	callService("/member/findMemberHeader.ajax", {
		"id" : userId
	}, {
		async : false,
		callSuccess : function(data) {
			if (!!data.headerImg) {
				$('#userHeaderImg').attr("src", data.headerImg);
			} else {
				$('#userHeaderImg').attr("src", ctx + '/img/common/user.jpg');
			}
		}
	});
}

/**
 * 取得用户等级
 */
function findMemberGrade() {
	callService("/member/findMemberGrade.ajax", {
		"id" : userId
	}, {
		async : false,
		callSuccess : function(data) {
			var result = {};
			if (!!data.memberForm) {
				result.expendMoney = data.memberForm.expendMoney;// 用户消费金额
				result.userGrade = data.memberForm.userGrade;// 用户等级
				if (result.userGrade != 5) {
					result.showGrade = "Lv" + result.userGrade;
					result.lastMoney = data.memberForm.lastUserGradeRule.money;// 下一级所需金额
					result.lastUserGrade = "Lv" + data.memberForm.lastUserGrade;// 下一级
				} else {
					result.lastMoney = 30000;// 下一级所需金额
					result.showGrade = "Max"// 最高级了
					result.lastUserGrade = "";// 下一级
				}
				// 当前级别所需金额
				result.beforeMoney = data.memberForm.userGradeRule.money;
				result.numval = !!data.memberForm.upgradeMoney ? (+data.memberForm.expendMoney) / (data.memberForm.upgradeMoney + data.memberForm.expendMoney) * 100 : 100;
				handlesbars("hbGrade", "grade", result);
				reloadGradeCSS();
			}
		}
	});
}

/**
 * 加载会员等级样式
 */
function reloadGradeCSS() {
	$.divselect("#divselect");
	$.divselect("#divselect2");
	var loadOfc = $('.load-ofc').width();
	var loadWidth = $('.loading p').width();
	$('.load-ofc').css({
		'left' : loadWidth - (loadOfc / 2) - 5
	});
}

/**
 * 查询订单
 * 
 * @param orderState
 * @param divId
 */
function searchOrder(orderState, divId) {
	$("#noData").hide();
	$("#orderState").val(orderState);
	$("#orderData").html("<tr class='loading'><td colspan='3' style='color: #333333; font-size: 1.2em;'>处理中...</td></tr>");
	callService("/order/toOrderListForIndex.ajax", {
		"orderState" : orderState
	}, {
		callSuccess : function(datas) {
			// 如果session过期，此处获取不到数据
			// 根据datas判断是否过期
			if (datas.error == null) {
				$('#u1').html(datas[0].orderStateCount[orderStatesInpay]);
				$('#u2').html(datas[0].orderStateCount["1020"]);
				// $('#u3').html(datas[0].orderStateCount[orderStatesPayed]);
				$('#u4').html(datas[0].orderStateCount[orderStatesScoreNo]);
			} else {
				if (datas.error.businessErrCode = '-1') {
					$.dm.jumpTo("/toLogin.jhtml", {});
				}
			}
		}
	});
}

/**
 * 跳转到查看物流动态
 * 
 * @param orderId
 */
//function toShippingMessage(orderId) {
//	var url = '/shipping/toShipping.jhtml';
//	var params = {
//		orderId : orderId
//	};
//	$.dm.jumpTo(url, params, {
//		target : "_blank"
//	});
//}

/**
 * 跳转到订单详情页面
 * 
 * @param orderId
 * @returns {Boolean}
 */
function toOrderDetail(orderId) {
	var url = "/order/toOrderDetail.jhtml";
	$.dm.jumpTo(url, {
		orderId : orderId
	}, {
		target : "_blank"
	});
	return false;
}

/**
 * 订单支付
 * 
 * @param str
 */
function megerPayment(str) {
	var orderId = $("#orderId" + str).val();
	$("#orderId").val(orderId);
	$("#toPayForm").submit();
}

/**
 * 提醒卖家发货
 * 
 * @param str
 */
/*function remindShipping(str) {
	var orderId = $("#orderId" + str).val();
	$("#orderId").val(orderId);
	var url = "/order/remindShipping.ajax";
	callService(url, {
		"orderId" : orderId
	}, {
		callSuccess : function(result) {
			if(result == true){
				jsAlert("消息发送成功！");
			}else {
				jsAlert("消息一天只能发送一次！");
			}
			
		}
	})
}*/

/**
 * 评价
 * 
 * @param orderId
 * @returns {Boolean}
 */
function toScore(orderId) {
	var url = "/score/toScore.jhtml";
	$.dm.jumpTo(url, {
		orderId : orderId
	}, {
		target : "_blank"
	});
	return false;
}

/**
 * 根据商品销量 查询排在前面商品 取得相应数量（goodsCount）的商品
 * 
 * @param goodsCount
 * @returns
 */


// function findHotGoods() {
// 	callService('/gd/findHotGoods.ajax', {}, {
// 		callSuccess : function(result) {
// 			var goodsIds = [];
// 			var resultList = new Array();
// 			var ids = new Array();
// 			for ( var item in result) {
// 				ids.push(result[item].goodsId);
// 			}
// 			var requestData = {
// 				"ids" : ids
// 			};
// 			var url = "/gd/findGoodsInfoByIds.ajax";
// 			// 想后台服务获取数据
// 			callService(url, requestData, {
// 				callSuccess : function(goodsList) {
// 					//console.log("goodsList == " + JSON.stringify(goodsList));
// 					var goodsInfo = {};
// 					for (var i = 0; i < goodsList.length; i++) {
// 						goodsInfo.name = goodsList[i].name;
// 						goodsInfo.salesMaxPrice = goodsList[i].maxSalesPrice;
// 						goodsInfo.salesMinPrice = goodsList[i].minSalesPrice;
// 						goodsInfo.bigPicturePath = goodsList[i].sgItemPictureFormList[0].bigPicturePath;
// 						goodsInfo.id = goodsList[i].id;
// 						resultList.push(goodsInfo);
// 					}
// 					var html = $("#hotGoods").html();
// 					var template = Handlebars.compile(html);
// 					var strHtml = template(resultList);
// 					$('#hotGoodsArea').html(strHtml);
// 					$("#divselect2").children(".next").show();
// 					$.divselect("#divselect2");
// 				}
// 			})
// 		}
// 	})
// }

/**
 * 获取用户未使用的优惠券数量
 */
/*function findCouponIssuesCount() {
	callService("/member/findCouponIssuesCountByMemberId.ajax", {}, {
		async : false,
		callSuccess : function(data) {
			if (data.success) {
				$("#memberCoupon").html(data.result);
			} else {
				jsAlert(data.message);
			}
		}
	});
}*/

/**
 * Handlebars通用方法
 * 
 * @param scriptId
 * @param areaId
 * @param data
 */
function handlesbars(scriptId, areaId, data) {
	var html = $("#" + scriptId + "").html();
	var template = Handlebars.compile(html);
	var strHtml = template(data);
	$('#' + areaId + '').html(strHtml);
}

Handlebars.registerHelper("isContinue", function(param, options) {
	if (param < 3) {
		return options.fn(this);
	}
});
Handlebars.registerHelper("checkCount", function(param, options) {
	if (param > 1) {
		return "<u></u>"
	}
});
Handlebars.registerHelper("btName", function(param, options) {
	var btName = "";
	var methodStr = "";
	if (param.orderState == "00") {
		methodStr = "megerPayment('" + param.index + "')";
		btName = "立即付款";
	} /*else if (param.orderState == "10") {
		methodStr = "remindShipping('" + param.index + "')";
		btName = "提醒发货";
	}*/ /*else if (param.orderState == "20") {
		methodStr = "toShippingMessage('" + param.id + "')";
		btName = "查看物流";
	}*/ else if (param.orderState == "40" || param.orderState == "60") {
		methodStr = "toScore('" + param.id + "')";
		btName = "去评价";
	}
	if(param.orderState == "20"){
		return "";
	}
	if(param.orderState == "10"){
		return "";
	}
	return '<a href="javascript:void(0);" onclick="' + methodStr + '" class="pay-btn">' + btName + '</a>';
});

//页面跳转开始
function jumping(i,id){
	localStorage.browsePage='';
	location.href='/order/toOrderList.jhtml?orderState='+id+'&i='+i+'';
}

//页面跳转结束



