//var sc_it_disable_tl;
var flag = true;
$(document).ready(function() {
	$('.tab-item4 p').css('color', '#c91622').siblings().css('color', '#696969');
	$('.tab-item4 i').css({
		'background': 'url(/resources/basepage/store/default/common_img/tab-icon4R.png) no-repeat center center',
		'background-size': 'contain'
	});
	//备货时效
	Handlebars.registerHelper('preparePic', function(preparePicType){
		var html = '';

		if(preparePicType =="prepare_date_pic_type_2_am"){
			html = '<div style="width: 0.8rem;height: 0.4rem;background: url(\'/resources/basepage/store/default/common_img/deliver_time_01.png\') no-repeat center center;background-size: contain;float: left;margin: 0 auto;"></div>';
		}else if(preparePicType =="prepare_date_pic_type_2_pm"){
			html = '<div style="width: 0.8rem;height: 0.4rem;background: url(\'/resources/basepage/store/default/common_img/deliver_time_02.png\')no-repeat center center;background-size: contain;float: left;margin: 0 auto;"></div>';
		}else if(preparePicType =="prepare_date_pic_type_3"){
			html = '<div style="width: 0.8rem;height: 0.4rem;background: url(\'/resources/basepage/store/default/common_img/deliver_time_03.png\')no-repeat center center;background-size: contain;float: left;margin: 0 auto;"></div>';
		}
		return html;
	});

	//活动图片
	Handlebars.registerHelper('promotionPic', function(promotionItemForm){
		var html = '';

		if(promotionItemForm &&promotionItemForm.promotionItemForm ){
			// html ='<img src="/resources/img/active/miaosha.gif" class="cartmiaosha"/>';
		}
		// html ='<img src="/resources/img/active/miaosha.gif" class="cartmiaosha"/>';
		return html;
	});

	// 初始化模板
	//sc_st_tl = Handlebars.compile($('#sc-st-tl').html());
	//sc_its_tl = Handlebars.compile($('#sc-its-tl').html());
	/*sc_it_disable_tl = Handlebars.compile($('#sc-it-disable-tl').html());*/
    //

	initScList();
	initActors();
    var edit = $('#header_bar_tbt');
	$('#header_bar_tbt span').addClass('bt');
    edit.click(function () {
			var inner = $(this).find('span').html();
			if(inner == '完成') {
				$(this).find('span').html('编辑');
			}else {
				$(this).find('span').html('完成');
			}
        $('.bottom_left').toggle(500).css('bottom', '0.9rem');
				$('.payRight').toggle();
    });
	// 购物车底部操作栏，可浮动
	if (($(".tableheight").height() + 180) >= ($(window).height())) {
		$(".bottom-nav").addClass("bottom-navB");
	}
	// 滚动控制
	$(document).scroll(function() {
		if (($(document).scrollTop()) >= ($(".tableheight").height() + 180 - $(window).height())) {
			$(".bottom-nav").removeClass("bottom-navB");
		} else {
			$(".bottom-nav").addClass("bottom-navB");
		}
	});

	// 删除商品
	//$(".deletegoods").click(function() {
	//	$(".cx2").fadeIn();
	//	$(".pop_up_button a").click(function() {
	//		if ($(this).hasClass("queding")) {
	//			$(this).parents(".goods").remove();
	//		} else {
	//			$(".cx2").fadeOut();
	//		}
	//	});
	//});
});

// 初始化购物车
var initScList = function() {
	var outOfDateArr=[];
	var inDateArr=[];
	var $shopcart_list = $('#shopcart_list');
	var dataArr=[];
	clearItems($shopcart_list);
	callService('/sc/findShopcarList.ajax', {
		'channelId' : '00'
	}, {
		callSuccess : function(data) {
			if (!data.success) {
				jsAlert(data.message);
			} else {
				result = data.result;

				if (result.length > 0) {
					for (var i = 0; i < result.length; i++) {
						// 构建店铺单品
						var storeData = result[i];
						// 显示店铺信息
						//var $store = show_store(storeData);
						// 显示购物车项目
						//var $items = show_items(storeData);
						for ( var item in storeData.list) {
							dataArr.push(storeData.list[item])
							if(storeData.list[item].smallPicturePath){
								storeData.list[item].smallPicturePath = storeData.list[item].smallPicturePath.split("#");
							}
							storeData.list[item].standard = storeData.list[item].standard.split("#");
							var goodsName = storeData.list[item].goodsName.split("#");
							var goodsId = storeData.list[item].goodsId.split("#");
							var goodsDate = [];
							for ( var j in goodsName) {
								goodsDate.push({
									"goodsName" : goodsName[j],
									"goodsId" : goodsId[j]
								});
							}
							storeData.list[item].goodsName = goodsDate;
							var salesPrice = storeData.list[item].salesPrice;
							//var $item = show_item_enable(storeData.list[item]);
							if (salesPrice == null) {
								$(item).find("label[id$='salesPrice']").remove();
								$(item).find("strong[id$='totalPrice']").remove();
							}
							//$items.append($item);
							if(storeData.list[item].isEnabled==0){
								//商品已过期
                                outOfDateArr=outOfDateArr.concat(storeData.list[item])
							}
							else{
								//商品未过期
								inDateArr=inDateArr.concat(storeData.list[item])
							}
						}
						//$shopcart_list.append($store);
						//$shopcart_list.append($items);
					}
					 inDateArr=format(inDateArr.reverse());
					 outOfDateArr=format(outOfDateArr);
					//Handlebars.registerHelper("debug",function (i) {
                     //     console.log(i)
					//});
					if(inDateArr[0]){
						var inDatePart = Handlebars.compile($('#sc-it-enable-tl').html());
						var goodsInDateHtml=inDatePart(inDateArr);
					}
					if (outOfDateArr[0]){
						var outDatePart = Handlebars.compile($('#sc-it-disable-tl').html());
						var goodsOutOfDateHtml=outDatePart(outOfDateArr);
					}
					$(".inDate").html(goodsInDateHtml);
					$(".outOfDate").html(goodsOutOfDateHtml);
					if($.isEmptyObject(outOfDateArr)){

					}
					else{
						var fenge="<div class='fenge' style='width: 100%;height: 0.6rem;line-height: 0.6rem;text-align: center;color: #999;font-size: 0.23rem;background: #eee'>下面是失效商品</div>";
						$(fenge).appendTo($('.inDate'))
					}
				} else {
					$(".tableheight").append('<div class="carNulla"><div class="nullC"><img src="/resources/img/common/carNulla.png" width="45"	height="43" class="left"><div class="null"><P>购物车里还没有宝贝哦～～～</P><P>去 <a href="../index.jhtml">随便逛逛</a>吧，看看有没有喜欢的~</P></div></div></div>');
				}
				$("input:checkbox").prop('checked','checked');
				reCalcAll();
				$(".outOfDate #checkBoxes").removeProp('checked')
				$(".outOfDate #checkBoxes").parent('label').removeClass('isChecked')
				// 失效商品
				if ($(".cartable-td div span").hasClass("failure")) {
					$(".failure").parent().parent(".cartable-td").addClass("gray");

				}
				if ($(".cartable-td div span").hasClass("promotionShowOnly")) {
					$(".promotionShowOnly").parent().parent(".cartable-td").addClass("gray");
				}
				var chks = $("input:checked");
				var i ;
				for(i = 0;i< chks.length; i++) {
					if (chks[i].checked) {
						$(chks[i]).parent('.checkBoxes').addClass('isChecked');
					}
			}
		}
			//组合居中
			for(var i=0;i<$("[name='forCombinacation']").parent().length;i++){
				if($($("[name='forCombinacation']").parent()[i]).height()>70){
					$($("[name='forCombinacation']").parent()[i]).children("[name='forCombinacation']").css("top",$($("[name='forCombinacation']").parent()[i]).height()/2-20);
				}
			}
		}
	});
};

// 清除购物车
var clearItems = function($list) {
	$list.find('[dm-container]').remove();
};

// 初始化动作
var initActors = function() {
	$(document).on('click', '[dm-actor]', function() {
		var $this = $(this);
		var actor = $this.attr('dm-actor');
		var itemId = $this.attr('dm-data');
		var checkBox = $(':checkbox');
		var label = $this.parent('.checkBoxes');
		var typeNum = $this.attr('st');
		var goodsTeam = $('input[st="' + typeNum + '"]');
		if (actor == 'sc-select-all') {
			selectAllSc($this);
			reCalcAll();

		} else if (actor == 'sc-check') {
			reCalcAll();

		} else if (actor == 'sc-st-check') {
			selectAllSt($this);
			reCalcAll();

		} else if (actor == 'sc-del') {
			deleteItem($this);
			reCalcAll();

		} else if (actor == 'sc-del-list') {
			deleteItems();
			reCalcAll();

		} else if (actor == 'sc-amt-add') {
			var $amount = $('[dm-info="sc-amt"][dm-data="' + itemId + '"]');
			var original = $amount.attr("original");
			var amount = parseInt($amount.val()) + 1;
			var stock = parseInt($amount.attr('dm-stock'));
			if (amount >= stock) {
				amount = stock;
			}
			$amount.val(amount);
			if (amount != original) {
				$.dm.block();
				var request = {
					id : $amount.attr('dm-data'),
					amount : amount
				};
				callService('/sc/upScAmount.ajax', request, {
					callSuccess : function(data) {
						if (!data.success) {
							jsAlert(data.message);
						}
					},
					callError : function(state, text) {
						jsErrAlert('更新失败！');
					}
				});
				$.dm.unblock();
			}
			reCalcAll();

		} else if (actor == 'sc-amt-reduce') {
			var $amount = $('[dm-info="sc-amt"][dm-data="' + itemId + '"]');
			var original = $amount.attr("original");
			var amount = parseInt($amount.val()) - 1;
			if (amount <= 1) {
				amount = 1;
			}
			$amount.val(amount);
			if (amount != original) {
				$.dm.block();
				var request = {
					id : $amount.attr('dm-data'),
					amount : amount
				};
				callService('/sc/upScAmount.ajax', request, {
					callSuccess : function(data) {
						if (!data.success) {
							jsAlert(data.message);
						}
					},
					callError : function(state, text) {
						jsErrAlert('更新失败！');
					}
				});
				$.dm.unblock();
			}
			reCalcAll();
		} else if (actor == 'sc-del-disable') {
			deleteDisabledItems();
		} else if (actor == 'fav-add') {
			addFavourite($this);
		} else if (actor == 'fav-add-list') {
			addFavourites();
		} else if (actor == 'sc-buy') {
			reCalcAll();

			if (!flag) {
				return false;
			}
			buy();
		}
	});




	$(document).on('change', '[dm-info="sc-amt"]', function() {
		reCalcAll();

		var request = {
			id : $(this).attr('dm-data'),
			amount : $(this).val()
		};
		$.dm.block();
		callService('/sc/upScAmount.ajax', request, {
			callSuccess : function(data) {
				if (!data.success) {
					jsAlert(data.message);
				}
			},
			callError : function(state, text) {
				jsErrAlert('更新失败！');
			}
		});
		$.dm.unblock();
	});
};
// 显示店铺信息
//var show_store = function(data) {
//	var sc_st_tl_html = sc_st_tl(data);
//
//	return $(sc_st_tl_html);
//};
// 显示购物车项目
//var show_items = function(data) {
//	var sc_st_tl_html = sc_its_tl(data);
//	return $(sc_st_tl_html);
//};
//// 显示可用状态
//var show_item_enable = function(data) {
//	data.salesPrice = fmoney(data.salesPrice, 2);
//	var item_enable_html = sc_it_enable_tl(data);
//	return $(item_enable_html);
//};
//// 显示失效状态
//var show_item_disable = function(data) {
//	var item_disable_html = sc_it_disable_tl(data);
//	$('.specifications-list').append(item_disable_html);
//};
// 选择所有的购物车项目
var selectAllSc = function($actor) {
	$('[dm-actor="sc-check"]').prop('checked', $actor.prop('checked'));
	$('[dm-actor="sc-st-check"]').prop('checked', $actor.prop('checked'));
};
// 选择店铺下所有的购物车项目
var selectAllSt = function($actor) {
	var statu=$($actor).parent(".checkBoxes").hasClass("isChecked");
	if(statu){
		$($actor).prop('checked','');
		var num=$($actor).parent(".checkBoxes").parent(".car-message").next().children(".checkBtns").children(".checkBoxes").children("#checkBoxes").attr("st");
		$("input[st="+ num +"]").prop('checked', '')
	}
	else{
		$($actor).prop('checked','checked');
		var num=$($actor).parent(".checkBoxes").parent(".car-message").next().children(".checkBtns").children(".checkBoxes").children("#checkBoxes").attr("st");
		$("input[st="+ num +"]").prop('checked', 'checked')

	}

	//$('.data-st-' + $actor.val()).find('[dm-actor="sc-check"]').prop('checked', 'checked');
    //
    //
	//// wuyuran
	//if ($actor.prop('chcked') == 'checked') {
	//	$actor.parent('.checkBoxes').addClass('isChecked');
	//	$('.data-st-' + $actor.val()).find('[dm-actor="sc-check"]').parent('.checkBoxes').addClass('isChecked');
	//}else {
	//	$('.data-st-' + $actor.val()).find('[dm-actor="sc-check"]').parent('.checkBoxes').removeClass('isChecked');
	//}

	// wuyuranend
};

// 是否显示bottom
// var showBtm = function () {
// 	var select = $('input[type="checkBox"]');
// 	var showDom = $('.bottom_left');
// 	var i;
// 	for (i = 0; i<select.length; i++) {
// 		if(select[i].checked) {
// 			showDom.show();
//             break;
// 		}else {
//             showDom.hide()
//         }
// 	}
// };



// 重新计算所有项目
var reCalcAll = function() {
	var totalPrice = 0;
	var $checkedItems = $('[dm-actor="sc-check"]:checked');
	var totalCount = $checkedItems.length;
	var checkInput = $(':checkbox');
	var i;
	var j;
	$('[dm-info="price"]').each(function() {
		var $rowPrice = $(this);                                            /*每一个价格标签*/
		var item = $rowPrice.attr('dm-data');                               /*id*/
		var $amount = $('[dm-info="sc-amt"][dm-data="' + item + '"]');
		var amount = parseInt($amount.val());                               /*数量*/
		var stock = parseInt($amount.attr('dm-stock')) || 0;                /*库存*/
		if (isNaN(amount) || !($amount.val() > 0)) {
			amount = 1;
			$amount.val(amount);
		}
		$amount.val(amount);
		if (amount > stock) {
			$amount.val(stock);
			amount = stock;
			$amount.attr("value", stock);
		}
		var $amtAdd = $('[dm-actor="sc-amt-add"][dm-data="' + item + '"]');
		if (amount >= stock) {
			$amtAdd.addClass('add_0');
			$amtAdd.removeClass('add_1');
		} else {
			$amtAdd.addClass('add_1');
			$amtAdd.removeClass('add_0');
		}
		var $amtReduce = $('[dm-actor="sc-amt-reduce"][dm-data="' + item + '"]');
		if (amount <= 1) {
			$amtReduce.addClass('reduce_0');
			$amtReduce.removeClass('reduce_1');
		} else {
			$amtReduce.addClass('reduce_1');
			$amtReduce.removeClass('reduce_0');
		}
		var rowPrice = parseFloat($amount.attr('dm-price')) * parseInt(amount);
//		if($rowPrice.attr("field0")){
//			if(rowPrice>=parseFloat($rowPrice.attr("field0"))){
//				 rowPrice = rowPrice-parseFloat($rowPrice.attr("field1"));
//			}
//		}
		$('[dm-info="sc-selectedtotal-price"]').html(fmoney(rowPrice, 2))
		$rowPrice.html(fmoney(parseFloat($amount.attr('dm-price')), 2));
		var $checkedItem = $('[dm-actor="sc-check"][dm-data="' + item + '"]:checked');
		if ($checkedItem.prop('checked')) {
			totalPrice += rowPrice;
		}
	});
	$('[dm-info="sc-selected-count"]').html(totalCount);
	$('[dm-info="sc-selectedtotal-price"]').attr('dm-data-price', totalPrice);
	$('[dm-info="sc-selectedtotal-price"]').html(fmoney(totalPrice));
	// 联动
	changeCheckbox();
	// 计算活动优惠
	calcActivityInfo(totalPrice);

	for (j = 0;j<checkInput.length; j++) {
		$(checkInput[j]).parent('.checkBoxes').removeClass('isChecked');
	}
	for(i = 0;i<$('input:checked').length; i++) {
		$($('input:checked')[i]).parent('.checkBoxes').addClass('isChecked');
	}
};

// 添加到商品收藏夹
var addFavourite = function($actor) {
	$.dm.block();
	var request = {
		storeId : $actor.attr('dm-data'),
		goodsId : $actor.attr('dm-value')
	};
	// var request = {id : itemId};
	// 实现移入收藏夹（收藏商品）功能
	callService('/fav/addToGdFav.ajax', request, {
		callSuccess : function(data) {
			if (!data.success) {
				jsAlert(data.message);
				if (data.code) {

				}
			} else {
				jsAlert("收藏成功");
			}
			$.dm.unblock();
		},
		callError : function(state, text) {
			$.dm.unblock();
			jsErrAlert('收藏失败！');
		}
	});
};

// 批量添加到商品收藏夹
var addFavourites = function() {
	$.dm.block();
	var $checkedItems = $('[dm-actor="sc-check"]:checked');
	if ($checkedItems.length == 0) {
		jsErrAlert("请至少选择1件商品");
		$.dm.unblock();
		return;
	}
	var request = {
		goodsIds : [],
		storeIds : []
	};
	$checkedItems.each(function() {
		request.goodsIds.push($(this).attr('dm-value'));
		request.storeIds.push($(this).attr('st'));
	});
	callService('/fav/addToGdFavLst.ajax', request, {
		callSuccess : function(data) {
			if (!data.success) {
				jsAlert(data.message);
			} else {
				jsAlert("收藏成功");
			}
			$.dm.unblock();
		},
		callError : function(state, text) {
			$.dm.unblock();
			jsErrAlert('收藏失败！');
		}
	});
};

// 购买动作
var buy = function() {
	// 遮罩锁定开始
	$.dm.block();
	if (!haveRightItem()) {
		if (!haveRightItem()) {
			jsErrAlert("购物车没有商品，请先加入商品");
			$.dm.unblock();
			return;
		}
		return;
	}
	if ($('[dm-actor="sc-check"]:checked').length == 0) {
		jsErrAlert("请最少选择一项");
		// 遮罩锁定结束
		$.dm.unblock();
		return;
	}
	var request = {
		ids : [],
		goodsIds : [],
		goodsNames : [],
		itemIds : [],
		amts : [],
		chks : [],
		enableIds : []
	};
	$('[dm-actor="sc-check"]').each(function() {
		var id = $(this).val();
		var goodsId = $(this).attr("dm-value");
		var goodsName = $(this).attr("dm-name");
		var item = $(this).attr("dm-data-item");
		var amt = $('[dm-info="sc-amt"][dm-data="' + id + '"]').val();
		request.ids[request.ids.length] = id;
		request.goodsIds[request.goodsIds.length] = goodsId;
		request.goodsNames[request.goodsNames.length] = goodsName;
		request.itemIds[request.itemIds.length] = item;
		request.amts[request.amts.length] = amt;
		request.chks[request.chks.length] = $(this).prop('checked');
	});
	// 处理购物车中失效的商品
	var failure = $('.failure');
	if (failure.length > 0) {
		failure.each(function() {
			var dmData = $(this).parent().parent().attr('dm-data');
			request.enableIds[request.enableIds.length] = dmData;
		});
	}
	// 更新购物车,跳转至确认订单页面
	callService('/sc/upScLst.ajax', request, {
		callSuccess : function(data) {
			if($(".order-adress li input[type='radio']:checked").size()>0){
				var selectedMemberId = $(".order-adress li input[type='radio']:checked").eq(0).closest("div").find(".memberId").val();
			}
			if (!data.success) {
				$.dm.unblock();
				jsAlert(data.message);
			} else {
				$('.blockUI').remove();
				var params = {
					immediately : false,
					selectedMemberId:selectedMemberId
				};
				var gourl = '/order/toOrderConfirm.jhtml';
				$.dm.jumpTo(gourl, params);
			}
		},
		callError : function(state, text) {
			$.dm.unblock();
			if(state==510||text=='error Not Extended'||text=='Not Extended'){    //首先判断是否超时，超时后不弹出购物车更新失败，防止不跳回首页
			}
			else{
				jsErrAlert('购物车更新失败！');
			}
		}
	});
};

// 删除项目
var deleteItem = function($actor) {
	if (!haveRightItem()) {
		return;
	}
	jsConfirm("确认要删除吗?", {
		callback : function(result) {
			if (result) {
				var itemId = $actor.attr('dm-data');
				var $row = $('[dm-container="sc-row"][dm-data="' + itemId + '"]');
				var className = $row.prop('className');
				var classNames = className.split(' ');
				var newName = classNames[1].split('-');
				var shopClass = 'data-st-' + newName[2];
				var $goodsShop = $('[dm-container="st-name"][dm-data="' + newName[2] + '"]');
				var request = {
					id : itemId
				};
				callService('/sc/delSc.ajax', request, {
					callSuccess : function(data) {
						// jsAlert("删除购物车商品成功");
						$row.remove();
						reCalcAll();
						if ($goodsShop.siblings('.'+shopClass).length == 0) {
							$goodsShop.remove();
						}
						already_login();
						// initScList();
						// 购物车界面中删除商品时，同步顶部工具栏中购物车
						// $.dmTopShopCar();
						// $(".topnav").dmHeaderBar({
						// 	"type" : "replaceWith"
						// });
						// initScList();
						// // initActors();
						// var recentType = $('#recentType').val();
						// recentGoods(recentType);
					}
				});
			}
		}
	});
};
// 批量删除项目
var deleteItems = function() {
	if (!haveRightItem()) {
		jsErrAlert("购物车没有商品，请先加入商品");
		return;
	}
	var $checkedItems = $('[dm-actor="sc-check"]:checked');
	if ($checkedItems.length == 0) {
		jsErrAlert("请至少选择1件商品");
		// 确定按钮获取焦点
		$(' .small-button').focus();
		return;
	}
	jsConfirm("确认要删除吗?", {
		callback : function(result) {
			if (result) {
				var request = {
					ids : []
				};
				$checkedItems.each(function() {
					request.ids.push($(this).attr('dm-data'));
				});
				callService('/sc/delScLst.ajax', request, {
					callSuccess : function(data) {
						$('[dm-actor="sc-check"]:checked').each(function() {
							var itemId = $(this).attr('dm-data');
							var $row = $('[dm-container="sc-row"][dm-data="' + itemId + '"]');
							$row.remove();
							if ($("#tool").dmLoadToolBar) {
								$("#tool").dmLoadToolBar({
									"type" : "html"
								});
							}
							if ($(".topnav").dmHeaderBar) {
								$(".topnav").dmHeaderBar({
									"type" : "replaceWith"
								});
							}
						});
						already_login();
						initScList();
						var recentType = $('#recentType').val();
						recentGoods(recentType);
						$("[dm-actor='sc-select-all']").attr("checked", false);
						$(".fenge").remove()
					}
				});
			}
		}
	});
};
// 删除失效项目
var deleteDisabledItems = function() {
	var request = {
		ids : []
	};
	if ($('.failure').length == 0) {
		jsErrAlert("当前没有失效的商品");
		// 确定按钮获取焦点
		$(' .small-button').focus();
		return;
	} else {
		$('.failure').each(function() {
			request.ids.push($(this).attr('dm-data'));
		});
	}
	callService('/sc/delScLstByDisable.ajax', request, {
		callSuccess : function(data) {
			if (data.success) {
				jsAlert("清除失效商品成功");
				$("li input[dm-actor='sc-select-all']").removeAttr("checked");
			}
			initScList();
		}
	});
};
// 判断是否存在有效项目
var haveRightItem = function() {
	return $('[dm-actor="sc-check"]').length > 0;
};

// 计算优惠金额
var calcActivityInfo = function(totalPrice) {
	var promotionIds = [];
	var itemIds = [];
	var amounts = [];
	var combIds = [];
	if ($('[dm-actor="sc-check"]:checked').length != 0) {
		$('[dm-actor="sc-check"]:checked').each(function(i, item) {
			var promotionId = $(item).attr("dm-data-promotionId");
			var promotiontype= $(item).attr("dm-data-promotiontype");
			if (promotionId != null && promotionId != "" && promotiontype!="4" && promotiontype!="5") {
				var id = $(item).val();
				var itemId = $(item).attr("dm-data-item");
				var combId = $(item).attr("dm-data-combId");
				var amount = $('[dm-info="sc-amt"][dm-data="' + id + '"]').val();
				promotionIds.push(promotionId);
				itemIds.push(itemId);
				amounts.push(amount);
				combIds.push(combId);
			}
		});
		if (promotionIds.length != 0) {
			callService('/activity/findPreferentialAmount.ajax', {
				promotionIds : promotionIds,
				itemIds : itemIds,
				amounts : amounts,
				combIds : combIds
			}, {
				callSuccess : function(data) {
					if (data.success) {
						var feeTotalTl = Handlebars.compile($('#activity-fee-total-tl').html());
						var $feeTotal = $(feeTotalTl({
							feeTotal : fmoney(data.result)
						}));
						$('[dm-contianer="activity-fee-total-contianer"]').replaceWith($feeTotal);
//						totalPrice = totalPrice - fmoney(data.result);
						if (totalPrice < 0) {
							totalPrice = 1;
						}
						$('[dm-info="sc-selectedtotal-price"]').attr('dm-data-price', totalPrice);
						$('[dm-info="sc-selectedtotal-price"]').html(fmoney(totalPrice));
						flag = true;
					} else {
						flag = false;
						jsAlert(data.message);
					}
				}
			});
		} else {
			$('[dm-info="activity-fee-total-price"]').text(fmoney(0.00));
			flag = true;
		}
	} else {
		$('[dm-info="activity-fee-total-price"]').text(fmoney(0.00));
	}
};

// 根据页面上的数量进行校验，这时还没在后台校验

// 2015-06-17 09:17 购物车复选框联动效果
function changeCheckbox() {
	var ckd = $("[dm-actor='sc-check']:checked").length; // 选中的个数
	var ck = $("[dm-actor='sc-check']").length;// 所有商品的个数
	// 判断是否全选 选择店铺和全选按钮 return
	if (ckd == ck && ck !== 0) {
		$("[dm-actor='sc-st-check']").attr("checked", true);// 选中所有店铺
		$("[dm-actor='sc-select-all']").attr("checked", true);// 全选按钮
	}
	// 不是全选则 取消所有按钮 和相应的店铺按钮
	if (ckd < ck) {
		// 选中 全选有商品的店铺
		$("[dm-actor='sc-st-check']").each(function() {
			var val = $(this).attr("value");// 获取店铺ID
			// 判断店铺所有商品是否全选，如果全选则执行全选
			var all = $("[dm-actor='sc-check'][st='" + val + "']").length;
			var ckd = $("[dm-actor='sc-check'][st='" + val + "']:checked").length;
			// 如果全选则选中如果没全选则取消
			if (all == ckd) {
				$(this).attr("checked", true);
			} else {
				$(this).attr("checked", false);
			}
		});
		// 取消没全选的店铺
		// 取消全选按钮
		$("[dm-actor='sc-select-all']").attr("checked", false);// 全选按钮
	}
	// 判断一个店铺下是否所有的商品全部失效，如果全部失效那么该店铺下的所有商品全部取消勾选、并且店铺前面的checkbox也取消勾选
	$("[dm-actor='sc-st-check']").each(function() {
		var val = $(this).attr("value");// 获取店铺ID

		// 判断店铺所有商品是否全选，如果全选则执行全选
		var all = $("[dm-actor='sc-check'][st='" + val + "']").length;
		var failureLength = $('.' + val + ' .failure').length;
		if (all == failureLength) {
			$(this).attr("checked", false);
			$(this).attr("disabled", 'disabled');
		}
	});
}
//商品组合开始
function format(data) {
	var ar=[]
	var nameArr=[]
	var dataGroup={}
	for(var i=0;i<data.length;i++){
		nameArr[i]=data[i].storeName
	}
    for(var i=0;i<data.length;i++){
	    if($.inArray(nameArr[i],ar)==-1){
			ar.push(nameArr[i])
		}
	}
	for(var k=0;k<ar.length;k++){
		var num=0
		var dataGroupOut={};
		  dataGroupOut.g={};
		for(var j=0;j<data.length;j++){
			if(ar[k]==data[j].storeName){
				var numm=j;
				var numadd=num;
				var bo={};
				bo[numadd]=data[numm]
				dataGroupOut.g= $.extend(dataGroupOut.g,bo)
				num++
			}

		}
		var numg=k;
		var fd={};
		fd[numg]=dataGroupOut.g;
		dataGroup= $.extend(dataGroup,fd)

	}
	return dataGroup

}
//商品组合结束
