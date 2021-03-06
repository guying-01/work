$(document).ready(function() {
	sumOrder();// 计算店铺合计、订单实付
	selectradiostyle();// 初始化确认收货信息样式及选中
	$('#setAdress').live('click', function() {// 点击"设为默认"
		updateDefault($('input:checked').val(), 2);
	});
	var count = '0';
	var obj = $("input[name='RadioGroup1']");
	var text = ('<div class="order-adress-selected"><h3>配送至：</h3><div class="left"></div><a href="javascript:void()" onclick="del()">删除</a><a href="javascript:void()" onclick="editAddress()" class="cx1">修改</a><a href="javascript:void(0);" id="setAdress">设为默认</a><div class=" clear"></div></div>');
	if (obj.length > 0) {
		obj.each(function() {
			// 已设置了默认地址
			if (this.checked) {
				$('#addressId').val(this.value);
				count = '1';
				$("#shdz").text($('#' + this.value+" .address_info").text());
				// $("#shdz").text($.trim($('#' + this.value+" .address_info").text().replace("配送至：", "")).substr(0, $.trim($('#' + this.value).text().replace("配送至：", "")).indexOf("(")));
				$("#shr").text($(".order-people-name").text());
				document.getElementById("addressId").value = this.value;
				// $('[checked="checked"]').click();
				return count;
			}
		});
		if (count == '0') {
			// 未设置默认地址自动选择第一个地址
			$('#addressId').val(obj[0].value);
			// $("#shdz").text($.trim($('#' + obj[0].value).text().replace("配送至：", "")).substr(0, $.trim($('#' + obj[0].value).text().replace("配送至：", "")).indexOf("(")));
			$("#shdz").text($('#' + this.value+" .address_info").text());
			$("#shr").text($(".order-people-name").text());
			// $('[value="'+obj[0].value+'"]').click();
			$('[value="' + obj[0].value + '"]').attr('checked', 'checked');

			if ($(obj[0]).parent().parent().parent().hasClass("order-adress-selected")) {

			} else {
				$(obj[0]).parent().parent().siblings().children(".order-adress-selected").remove();
				$(obj[0]).parent().parent().siblings().children(".order-adress-list").show();

				$(obj[0]).parent().parent("li").append(text);
				$(obj[0]).parent().parent().children(".order-adress-list").clone().appendTo(".order-adress-selected .left");
				$(obj[0]).parent().parent().children(".order-adress-list").hide();
			}
		}
	}

	// 客户化验证插件
	$.validator.setDefaults({
		errorClass : 'errorwrong',
		highlight : function(element, errorClass, validClass) {
			if (element.type === "radio") {
				this.findByName(element.name).addClass(errorClass).removeClass(validClass);
			}
		},
		unhighlight : function(element, errorClass, validClass) {
			if (element.type === "radio") {
				this.findByName(element.name).removeClass(errorClass).addClass(validClass);
			}
		}
	});

	$.validator.addMethod("checkPoint", function(value, element, params) {
		if ($("#pointcheck").attr("checked")) {
			if($('#sumOrderSalesPrice').html()){
			 var money= parseFloat($('#avaliblepoint').attr("money"))-value+""
			 $("#avaliblepoint").html(parseFloat(money)+"");
			}
			if (value == null || value == '') {
				value = 0;
			}
			return parseInt(value) <= parseInt($('#avaliblepoint').attr("money"));
		} else {
			return true;
		}
	}, "<u style='top:3px; z-index:100;'>&nbsp;</u>输入积分不能大于可用积分");

	$.validator.addMethod("checkNumber", function(value, element, params) {
		if ($("#pointcheck").attr("checked")) {
			return this.optional(element) || (/^[0-9]*$/).test(value);
		} else {
			return true;
		}
	}, "<u style='top:3px; z-index:100;'>&nbsp;</u>只能输入正整数");

	$("#pointsForm").validate({
		errorPlacement : function(errorwrong, element) {
			element.after(errorwrong);
		},
		rules : {
			inputpoint : {
				checkNumber : true,
				checkPoint : true
			},
			inputRedPacket : {
				money : true,
				checkRedPacket : true
			}
		},
		messages : {
			inputRedPacket : {
				money : "<u style='top:3px;'>&nbsp;</u>请输入正确的金额"
			}
		}
	});

	$("#inputpoint").live("keyup", function() {
		if ($("#pointsForm").valid()) {
			sumMoney();
		}
		hqpoints();
	});

	$("#pointcheck").click(function() {
		if ($("#pointsForm").valid()) {
			sumMoney();
		}
		hqpoints();
	});

	// bug1099 订单提交页面，显示错误-孙洁-2017-03-17-start
	// 得到订单信息的集合
	var shopInfo = $('.order-tab');
	// 订单信息为空的场合
	if(shopInfo.length < 1){
		// 提示信息
		var errMsg = '亲爱的用户，您的订单已提交完毕。';
		errMsg += '<br/>点击<label style = "color: #f88c0e;font-weight:bold;"> [确定] </label>按钮';
		errMsg += '带您去<label style = "color: #b5191a;font-weight:bold;"> 我的采购单 </label>查看已提交的订单。';
		jsErrAlert(errMsg,{callback:function(){
			window.location.href="/order/toOrderList.jhtml";
		}});
        return;
	}
	// bug1099 订单提交页面，显示错误-孙洁-2017-03-17-end
});

function sumMoney() {
	var shopamount = '0.00';
	// 所有商品合计
	var goodsSale = '0.00';
	$("strong[id^='shopgoods_']").each(function() {
		var mkey = this.id.substr(this.id.indexOf('_') + 1);
		shopamount = (parseFloat(shopamount) + parseFloat($('#shopamount_' + mkey).text())).toFixed(2);
		goodsSale = (parseFloat(goodsSale) + parseFloat(this.innerHTML)).toFixed(2);
	});
	shopamount = parseFloat(shopamount).toFixed(2);
	if ($("#pointcheck").attr("checked")) {
		var inputpoint = parseInt($('#inputpoint').val());
		if (isNaN(inputpoint)) {
			inputpoint = 0;
		}
		var pointsSales = $('#pointsSales').val();
		var pointvalue = (Math.floor(inputpoint) / parseInt(pointsSales)).toFixed(2);
		$("#point").html(pointvalue);
		shopamount = shopamount - pointvalue;
	}
	if (shopamount < 0) {
		shopamount = 0.00;
	}
	// 订单实付
	$('#sumOrderSalesPrice').html(parseFloat(shopamount).toFixed(2));
}

// 选择收货地址
function addressCheck(id, provinceName, cityName, areaName, address, consignee, telephone, mobile, isDefault) {

	// $("strong[id^='shopgoods_']").each(function() {
	// 	var mkey = this.id.substr(this.id.indexOf('_') + 1);
	// 	var obj = [];
	// 	obj.id	= "adminCoupon_"+mkey;
	// 	$('#'+obj.id).val('');
	// 	obj.value = "";
	// 	changAdminCoupon(obj);
	// 	obj.id	= "coupon_"+mkey;
	// 	$('#'+obj.id).val('');
	// 	changCoupon(obj);
	// });
	
	document.getElementById("shdz").innerText = provinceName + " " + cityName + " " + areaName + " " + address;
	if (mobile != '') {
	} else {
		mobile = telephone;
	}
	document.getElementById("shr").innerText = consignee + " " + mobile;
	document.getElementById("addressId").value = id;
	// calcGoodsCarriage(id, isDefault);

}
// 点击"修改"
function editAddress() {
	var id = $('input:checked').val();
	cliclEditAddress(id);
}
// 点击"删除"
function del() {
	jsConfirm("确定要删除收货地址吗?", {
		callback : function(result) {
			if (result) {
				var id = $('input:checked').val();
				var obj = $("input[name='RadioGroup1']");
				callService('/member/delAddress.ajax', {
					"id" : id,
					"modifyDate" : $('#modifyDate_' + id).val()
				}, {
					async : false,
					callSuccess : function(data) {
						if (data) {
							$('[id="' + "li_" + id + '"]').remove();
							$('shr').html('');
							$('shdz').html('');
							$('#addressId').val('');
							obj = $("input[name='RadioGroup1']");
							if (obj != null && obj.length > 0) {
								$('[value="' + obj[0].value + '"]').click();
								$('[value="' + obj[0].value + '"]').attr('checked', 'checked');
							}
						}
					}
				});
			}
		}
	});
}
// 保存后刷新
function saveAfter() {
	location.reload();
}
function toAddress() {
	window.open("/member/toList.jhtml");
}
function up(obj) {
	if (obj.checked) {
		$('#isGoodsNameHide_' + obj.name).val('1');
	} else {
		$('#isGoodsNameHide_' + obj.name).val('0');
	}
}
// 计算店铺合计、订单实付
function sumOrder() {
	var shopamount = '0.00';
	$("strong[id^='shopgoods_']").each(function() {
		var samllSale = '0.00';// 商品合计,不是合计(合计包含配送运费)
		$("[numprice=" + $(this).attr("shopindex") + "]").each(function() {
			// 因为浮点型假发会出现各种精度不统一的问题，所以这里先把浮点型乘100变成整数，然后操作，结果在除以100，最后再转成浮点型
			// 其实还有一个解决办法，就是把浮点型按照小数点分割，整数+整数，小数加小数，最后整合到一起
			samllSale = parseFloat((parseFloat($(this).html()).toFixed(2) * 100 + samllSale * 100) / 100).toFixed(2);
		});
		var mkey = this.id.substr(this.id.indexOf('_') + 1);// 商家名称
		var activitySale02 = $('#activitySale02_' + mkey).text();
		if (activitySale02 != "") {
			samllSale = parseFloat(samllSale) + parseFloat(activitySale02);
		}
		if (samllSale < 0) {
			samllSale = parseFloat(1);
		}
		// 商品合计-满减金额，注释掉，不需要再减去满减金额，by di.l 2016-01-07
		/*
		 * var activitySale02 = $('#activitySale02_'+mkey).text();
		 * if(activitySale02!=""){ samllSale = parseFloat(samllSale); }
		 */
		this.innerHTML = parseFloat(samllSale).toFixed(2);// 商品合计-满减，不是合计(合计包含配送运费)
		if ($('#freight_' + mkey).text() == '') {
			$('#shopamount_' + mkey).html(parseFloat(samllSale).toFixed(2));// 合计
			shopamount = (parseFloat(shopamount) + (parseFloat(this.innerHTML))).toFixed(2);
		} else {
			$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat(samllSale)).toFixed(2));// 合计
			shopamount = (parseFloat(shopamount) + (parseFloat($('#freight_' + mkey).text()) + parseFloat(this.innerHTML))).toFixed(2);
		}

	});
	// 订单实付
	$('#sumOrderSalesPrice').html(shopamount);
	$('#sumOrderSalesPrice').attr("money",shopamount);
	hqpoints();
}

// 根据选择的收货地址获取运费
function calcGoodsCarriage(id, isDefault) {
	var shop = $('.order-tab');
	var str = "{";
	shop.each(function(i) {
		var obj = shop.eq(i).children("div[id^='div_']");
		obj.each(function(index) {
			var goodsId = obj.eq(index).children("input[id='goodsId']");
			var itemId = obj.eq(index).children("input[id='itemId']");
			str += "\"shopcartListFormList[" + i + "].list[" + index + "].sgShopcartForm.amount\":\"" + obj.eq(index).children('input[id="amount"]').val() + "\",\"shopcartListFormList[" + i + "].list[" + index + "].sgShopcartForm.goodsId\":\"" + goodsId.val() + "\",\"shopcartListFormList[" + i + "].list[" + index + "].sgShopcartForm.itemId\":\"" + itemId.val() + "\",";
		});
		var cc = shop.eq(i).find('input');
		var val;
		cc.each(function(k) {
			if (($(this).attr('id')) == ('shopcar_' + i)) {
				val = $(this).val();
				return false;
			}
		});
		str += "\"shopcartListFormList[" + i + "].storeName\":\"" + val + "\",";
	});
	str += "\"addressId\":\"" + id + "\"";
	str += "}";
	json_data = eval("(" + str + ")");
	callService('/order/calcGoodsCarriageByList.ajax', json_data, {
		callSuccess : function(data) {
			if (isDefault == "1") {
				$("#setAdress").css("display", "none");
			}
			if (data != null) {

				for ( var key in data) {
					$('#freight_' + key).html((data[key]).toFixed(2));
				}
				shop.each(function(i) {

				});
				var shopamount = '0.00';
				$("strong[id^='shopgoods_']").each(function() {// why?
					var ekey = this.id.substr(this.id.indexOf('_') + 1);
					var couponSale = $('#couponSale_' + ekey).text();
					if (couponSale == '' || couponSale == null) {
						couponSale = '0.00';
					}
					$('#shopamount_' + ekey).html((parseFloat($('#freight_' + ekey).text()) + parseFloat($('#shopgoods_' + ekey).text()) + parseFloat(couponSale)).toFixed(2));
					shopamount = (parseFloat(shopamount) + (parseFloat($('#shopamount_' + ekey).text()))).toFixed(2);
				});
				// 订单实付
				$('#sumOrderSalesPrice').html(shopamount);
				
				hqpoints();

			}
		}
	});
}
function hqpoints() {
	var freightPrice = '0.00';
	var preferentialAmount ='0.00';
	$("strong[id^='shopgoods_']").each(function() {
		var mkey = this.id.substr(this.id.indexOf('_') + 1);
		if ($('#freight_' + mkey).text() == '') {
			freightPrice = parseFloat(freightPrice).toFixed(2);
		} else {
			freightPrice = (parseFloat(freightPrice) + parseFloat($('#freight_' + mkey).text())).toFixed(2);
		}
		if($('#coupon_' + mkey+' option:selected').attr("dm-coupontype")=="10"){
			preferentialAmount=(parseFloat(preferentialAmount) + parseFloat($('#couponSale_' + mkey).text())).toFixed(2);
		}
		if($('#adminCoupon_' + mkey+' option:selected').attr("dm-coupontype")=="10"){
			preferentialAmount=(parseFloat(preferentialAmount) + parseFloat($('#adminCouponSale_' + mkey).text())).toFixed(2);
		}
	});
	var pt = (parseFloat($('#sumOrderSalesPrice').html()) - parseFloat(freightPrice)-parseFloat(preferentialAmount)) + "";
	
	var points = '';
	if (pt.indexOf('.') > 0) {
		points = pt.substr(0, pt.indexOf('.'));
	} else {
		points = pt;
	}
	var pointsRatio = $('#pointsRatio').val();
	if (!isNaN(pointsRatio)) {
		points = pointsRatio * points;
	}
	points = points < 0 ? 0 : points;
	$('#hqpoints').html(points + '分');
	var shipMoney = parseFloat($("[name='shipMoney']").text());
	var money = parseFloat($('#sumOrderSalesPrice').html())*100;
	//使用积分
	var usedPoint =parseFloat( $("#inputpoint").val());
	if(!usedPoint){
	var allPoint = parseFloat($('#avaliblepoint').attr("allPoints"));
	if(allPoint-money>=0){
		$("#avaliblepoint").html(money+"");
		$("#avaliblepoint").attr("money",money+"");
	}else{
		$("#avaliblepoint").html(allPoint+"");
		$("#avaliblepoint").attr("money",allPoint+"");
	}
	}
}
// 初始化确认收货信息样式及选中
function selectradiostyle() {
// <a href="javascript:void(0);" onclick="del()">删除</a><a href="javascript:void(0);" class="cx1" onclick="editAddress()">修改</a><a href="javascript:void(0);" id="setAdress">设为默认</a><div class=" clear"></div></div>
	var text = ('<div class="order-adress-selected"><h3>配送至：</h3><div class="left"></div>');
	$(".order-adress li  input").click(function() {
		if ($(this).parents().parent().hasClass("order-adress-selected")) {

		} else {
			$(this).parents().siblings().children(".order-adress-selected").remove();
			$(this).parents().siblings().children(".order-adress-list").show();
			$(this).parents("li").append(text);

			$(this).parents().children(".order-adress-list").clone().appendTo(".order-adress-selected .left");
			$(this).parents().children(".order-adress-list").hide();
		}

	});
	$(".useintegral").click(function() {
		if ($(this).is(':checked')) {
			$(this).siblings("div").show();
		} else {
			$(this).siblings("div").hide();
		}
	});
}

// 是否需要发票
function selectinvoice(type, storeId) {
	if (type == '1') {
		document.getElementById('invoice_message_' + storeId).style.display = 'block';
	} else if (type == '0') {
		document.getElementById('invoice_message_' + storeId).style.display = 'none';
		// 选择无需发票时将发票类型赋值为0
		$('#invoice_' + storeId).val('0');
		// 选择无需发票时将发票抬头设置为空
		$('#tittle_invoice_' + storeId).val('');
	}
}
// 选择店铺优惠券
function changCoupon(obj) {
	// 变更优惠券时重置积分
	$("#inputpoint").attr('value', '');
	$(".useintegral").attr('checked', false);
	$('.none1').hide();
	var mkey = obj.id.substr(obj.id.indexOf('_') + 1);
	var adminCouponSale = 0;// 平台优惠券金额
	var adminCouponType = "";// 平台优惠券类型（订单抵值00,邮费抵值10）
	var str = document.getElementById("adminCoupon_" + mkey); // 定位id
	var index = str.selectedIndex; // 选中索引
	var adminCouponId = str.options[index].value; // 获取平台优惠券id
	if (adminCouponId != '' && adminCouponId != null) {
		// 获取已选择的平台优惠券信息
		callService('/order/findSpCouponCategoryByCouponId.ajax', {
			"couponId" : adminCouponId
		}, // 根据优惠券id查询优惠券信息
		{
			async : false,
			callSuccess : function(data) {
				if (data != null) {
					adminCouponType = data.couponType;
					adminCouponSale = data.couponFee + "";
				}
			}
		});
	}
	if (obj.value != '') {// 使用店铺优惠券
		callService('/order/findSpCouponCategoryByCouponId.ajax', {
			"couponId" : obj.value
		}, // 根据优惠券id查询优惠券信息
		{
			callSuccess : function(data) {
				if (data != null) {
					// 判断优惠券类型，优惠券类型(订单抵值00,邮费抵值10)
					if (data.couponType == '00') {
						if (adminCouponType == '00') {
							// 平台优惠券是低值商品的
							if(parseFloat(adminCouponSale)>=parseFloat($('#shopgoods_' + mkey).text())){
								$('#couponSale_' + mkey).html('-0.00');
								$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()).toFixed(2));
							}else{
								if ((parseFloat(data.couponFee) + parseFloat(adminCouponSale)) > parseFloat($('#shopgoods_' + mkey).text())) {
									$('#couponSale_' + mkey).html('-' + parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
									$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()).toFixed(2));
								} else {
									$('#couponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee) - parseFloat(adminCouponSale)).toFixed(2));
								}
							}
							
						} else if (adminCouponType == '10') {
							// 平台优惠券是低值运费的
							if (parseFloat(data.couponFee) > parseFloat($('#shopgoods_' + mkey).text())) {
								$('#couponSale_' + mkey).html('-' + parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
								if (parseFloat(adminCouponSale) > parseFloat($('#freight_' + mkey).text())) {
									$('#shopamount_' + mkey).html("0.00");
								} else {
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) - parseFloat(adminCouponSale)).toFixed(2));
								}
							} else {
								$('#couponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								// 判断平台邮费优惠券面额是否大于运费
								if (parseFloat(adminCouponSale) > parseFloat($('#freight_' + mkey).text())) {
									$('#shopamount_' + mkey).html((parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee)).toFixed(2));
								} else {
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee) - parseFloat(adminCouponSale)).toFixed(2));
								}
							}
						} else {
							if (parseFloat(data.couponFee) > parseFloat($('#shopgoods_' + mkey).text())) {
								$('#couponSale_' + mkey).html('-' + parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
								$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()).toFixed(2));
							} else {
								$('#couponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee)).toFixed(2));
							}
						}
					} else if (data.couponType == '10') {
						if (adminCouponType == '00') {
							// 平台优惠券是低值商品的
							if ((parseFloat(data.couponFee)) > parseFloat($('#freight_' + mkey).text())) {
								$('#couponSale_' + mkey).html('-' + parseFloat($('#freight_' + mkey).text()).toFixed(2));
								// 判断平台商品优惠券面额是否大于商品金额
								if (parseFloat(adminCouponSale) > parseFloat($('#shopgoods_' + mkey).text())) {
									$('#shopamount_' + mkey).html("0.00");
								} else {
									$('#shopamount_' + mkey).html(parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(adminCouponSale).toFixed(2));
								}
							} else {
								$('#couponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								// 判断平台商品优惠券面额是否大于商品金额
								if (parseFloat(adminCouponSale) > parseFloat($('#shopgoods_' + mkey).text())) {
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) - parseFloat(data.couponFee)).toFixed(2));
								} else {
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee) - parseFloat(adminCouponSale)).toFixed(2));
								}
							}
						} else if (adminCouponType == '10') {
							// 平台优惠券是低值运费的
							if ((parseFloat(data.couponFee) + parseFloat(adminCouponSale)) > parseFloat($('#freight_' + mkey).text())) {
								$('#couponSale_' + mkey).html('-' + parseFloat($('#freight_' + mkey).text()).toFixed(2));
								$('#shopamount_' + mkey).html(parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
							} else {
								$('#couponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee) - parseFloat(adminCouponSale)).toFixed(2));
							}
						} else {
							if ((parseFloat(data.couponFee)) > parseFloat($('#freight_' + mkey).text())) {
								$('#couponSale_' + mkey).html('-' + parseFloat($('#freight_' + mkey).text()).toFixed(2));
								$('#shopamount_' + mkey).html(parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
							} else {
								$('#couponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee)).toFixed(2));
							}
						}
					}
					// 所有商品合计
					var shopamount = '0.00';
					$("strong[id^='shopgoods_']").each(function() {
						var mkey = this.id.substr(this.id.indexOf('_') + 1);
						shopamount = (parseFloat(shopamount) + (parseFloat($('#shopamount_' + mkey).text()))).toFixed(2);
					});

					shopamount = parseFloat(shopamount).toFixed(2);
					// 订单实付
					$('#sumOrderSalesPrice').html(shopamount);

					if ($("#pointsForm").valid()) {
						sumMoney();
					}
					hqpoints();
				}
			}
		});
	} else {
		// 不使用店铺优惠券
		$('#couponSale_' + mkey).html('');
		if (adminCouponType == '00') {
			if ((parseFloat(adminCouponSale)) > parseFloat($('#shopgoods_' + mkey).text())) {
				$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()).toFixed(2));
			} else {
				$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(adminCouponSale)).toFixed(2));
			}
		} else if (adminCouponType == '10') {
			if ((parseFloat(adminCouponSale)) > parseFloat($('#freight_' + mkey).text())) {
				$('#shopamount_' + mkey).html(parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
			} else {
				$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(adminCouponSale)).toFixed(2));
			}
		} else {
			$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text())).toFixed(2));
		}

		var shopamount = '0.00';
		$("strong[id^='shopgoods_']").each(function() {
			var ekey = this.id.substr(this.id.indexOf('_') + 1);
			shopamount = (parseFloat(shopamount) + (parseFloat($('#shopamount_' + ekey).text()))).toFixed(2);
		});
		// 订单实付
		$('#sumOrderSalesPrice').html(shopamount);

		if ($("#pointsForm").valid()) {
			sumMoney();
		}
		hqpoints();
	}
}

// 选择平台优惠券
function changAdminCoupon(obj) {
	// 变更优惠券时重置积分
	$("#inputpoint").attr('value', '');
	$(".useintegral").attr('checked', false);
	$('.none1').hide();
	var mkey = obj.id.substr(obj.id.indexOf('_') + 1);
	var adcoupon = $('[dm-index^="' + obj.value + '"]');
	adcoupon.each(function(i) {
		if ($(adcoupon[i]).attr("dm-index") != (obj.value + "_" + mkey)) {
			// 将此优惠券在其他地方屏蔽
			this.disabled = true;
		}
	});
	var adOldcoupon = $('[dm-index^="' + $("#adminCouponOldSale_" + mkey).val() + '"]');
	adOldcoupon.each(function(i) {
		// 解锁之前被屏蔽的优惠券
		this.disabled = false;
	});
	var storeCouponSale = 0;// 店铺优惠券金额
	var couponType = "";// 店铺优惠券类型（订单抵值00,邮费抵值10）
	var str = document.getElementById("coupon_" + mkey); // 定位id
	var index = str.selectedIndex; // 选中索引
	var storeCouponId = str.options[index].value; // 店铺平台优惠券id
	if (storeCouponId != '' && storeCouponId != null) {
		// 获取已选择的平台优惠券信息
		callService('/order/findSpCouponCategoryByCouponId.ajax', {
			"couponId" : storeCouponId
		}, // 根据优惠券id查询优惠券信息
		{
			async : false,
			callSuccess : function(data1) {
				if (data1 != null) {
					couponType = data1.couponType;
					storeCouponSale = data1.couponFee + "";
				}
			}
		});
	}
	if (obj.value != '') {// 使用平台优惠券

		$("#adminCouponOldSale_" + mkey).val(obj.value);
		callService('/order/findSpCouponCategoryByCouponId.ajax', {
			"couponId" : obj.value
		}, // 根据优惠券id查询优惠券信息
		{
			callSuccess : function(data) {
				if (data != null) {
					// 判断优惠券类型，优惠券类型(订单抵值00,邮费抵值10)
					if (data.couponType == '00') {
						if (couponType == '00') {
							if(parseFloat(storeCouponSale)>=parseFloat($('#shopgoods_' + mkey).text())){
								('#adminCouponSale_' + mkey).html('-0.00');
								$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()).toFixed(2));
							}else{
								if ((parseFloat(data.couponFee) + parseFloat(storeCouponSale)) > parseFloat($('#shopgoods_' + mkey).text())) {
									
									$('#adminCouponSale_' + mkey).html('-' + (parseFloat($('#shopgoods_' + mkey).text())+parseFloat($('#couponSale_' + mkey).text())).toFixed(2));
									$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()).toFixed(2));
								} else {
									$('#adminCouponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee) - parseFloat(storeCouponSale)).toFixed(2));
								}
							}
						} else if (couponType == '10') {
							if (parseFloat(data.couponFee) > parseFloat($('#shopgoods_' + mkey).text())) {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
								if (parseFloat(storeCouponSale) > parseFloat($('#freight_' + mkey).text())) {
									$('#shopamount_' + mkey).html("0.00");
								} else {
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) - parseFloat(storeCouponSale)).toFixed(2));
								}
							} else {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								if (parseFloat(storeCouponSale) > parseFloat($('#freight_' + mkey).text())) {
									$('#shopamount_' + mkey).html(parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee));
								} else {
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee) - parseFloat(storeCouponSale)).toFixed(2));
								}
							}
						} else {
							if (parseFloat(data.couponFee) > parseFloat($('#shopgoods_' + mkey).text())) {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
								$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()).toFixed(2));
							} else {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee)).toFixed(2));
							}
						}
					} else if (data.couponType == '10') {
						if (couponType == '00') {
							if ((parseFloat(data.couponFee)) > parseFloat($('#freight_' + mkey).text())) {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat($('#freight_' + mkey).text()).toFixed(2));
								if (parseFloat(storeCouponSale) > parseFloat($('#shopgoods_' + mkey).text())) {
									$('#shopamount_' + mkey).html("0.00");
								} else {
									$('#shopamount_' + mkey).html((parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(storeCouponSale)).toFixed(2));
								}
							} else {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								if (parseFloat(storeCouponSale) > parseFloat($('#shopgoods_' + mkey).text())) {
									$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()) - parseFloat(data.couponFee));
								} else {
									$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee) - parseFloat(storeCouponSale)).toFixed(2));
								}
							}
						} else if (couponType == '10') {
							if ((parseFloat(data.couponFee) + parseFloat(storeCouponSale)) > parseFloat($('#freight_' + mkey).text())) {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat($('#freight_' + mkey).text()).toFixed(2));
								$('#shopamount_' + mkey).html(parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
							} else {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee) - parseFloat(storeCouponSale)).toFixed(2));
							}
						} else {
							if ((parseFloat(data.couponFee)) > parseFloat($('#freight_' + mkey).text())) {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat($('#freight_' + mkey).text()).toFixed(2));
								$('#shopamount_' + mkey).html(parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
							} else {
								$('#adminCouponSale_' + mkey).html('-' + parseFloat((data.couponFee)).toFixed(2));
								$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(data.couponFee)).toFixed(2));
							}
						}
					}
					// 所有商品合计
					$("strong[id^='shopgoods_']").each(function() {
						var mkey = this.id.substr(this.id.indexOf('_') + 1);
						shopamount = (parseFloat(shopamount) + (parseFloat($('#shopamount_' + mkey).text()))).toFixed(2);
					});

					shopamount = parseFloat(shopamount).toFixed(2);
					// 订单实付
					$('#sumOrderSalesPrice').html(shopamount);

					if ($("#pointsForm").valid()) {
						sumMoney();
					}
					hqpoints();
				}
			}
		});
	} else {
		// 不使用平台优惠券
		$("#adminCouponOldSale_" + mkey).val("");
		$('#adminCouponSale_' + mkey).html('');
		if (couponType == '00') {
			if ((parseFloat(storeCouponSale)) > parseFloat($('#shopgoods_' + mkey).text())) {
				$('#shopamount_' + mkey).html(parseFloat($('#freight_' + mkey).text()).toFixed(2));
			} else {
				$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(storeCouponSale)).toFixed(2));
			}
		} else if (couponType == '10') {
			if ((parseFloat(storeCouponSale)) > parseFloat($('#freight_' + mkey).text())) {
				$('#shopamount_' + mkey).html(parseFloat($('#shopgoods_' + mkey).text()).toFixed(2));
			} else {
				$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text()) - parseFloat(storeCouponSale)).toFixed(2));
			}
		} else {
			$('#shopamount_' + mkey).html((parseFloat($('#freight_' + mkey).text()) + parseFloat($('#shopgoods_' + mkey).text())).toFixed(2));
		}

		var shopamount = '0.00';
		$("strong[id^='shopgoods_']").each(function() {
			var ekey = this.id.substr(this.id.indexOf('_') + 1);
			shopamount = (parseFloat(shopamount) + (parseFloat($('#shopamount_' + ekey).text()))).toFixed(2);
		});
		shopamount = (parseFloat(shopamount) + parseFloat(storeCouponSale)).toFixed(2);
		// 订单实付
		$('#sumOrderSalesPrice').html(shopamount);

		if ($("#pointsForm").valid()) {
			sumMoney();
		}
		hqpoints();
	}
}
