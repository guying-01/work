/** 商品详情页面js */
var itemList = [];// 单品列表
var attrCount = 0;
var saleAttrValues = [];
// var CombinationInfo =null;
// var CombinationInfo_handlebars =null;
// var strHtml=null;
// 工具条
$(document).ready(function() {
	initItemList();// 初始化单品列表
	initAttrValues();// 初始化属性值
	initActor();
	initStore();
	updateGoodsFavCount();// 获取商品被收藏的数量
	// 实现删除同步
	memberApi.delFav.afterDelSuccess = function() {
		updateGoodsFavCount();
	};

	// 更新活动相关信息
	showActivityInfo();
	combination("", $("#data_goodsId").val());
});

/**
 * 初始化点击事件 by geshuo
 */
var initActor = function() {
	/** 销售属性 */
	$(document).on('click', '.item-price', function() {
		$(this).toggleClass("specifications-selected");// 设置所选项目样式
		$(this).siblings().removeClass("specifications-selected");// 设置其他未被选中的样式
		// 设置属性值的显示状态,无货置灰-------------
		var isFromTool = ($(this).attr("id").indexOf("toolSaleAttr") >= 0);
		setAttrState(isFromTool);

		// 显示单品价格--------------------------
		var selectItem = getSelectItem(isFromTool);
		// 活动组合变化begin
		if (selectItem != null) {
			combination(selectItem.id, selectItem.goodsId);
		} else {
			combination("", "");
		}
		// 活动组合end
		var $items = $('.item-price-text');// 销售价格显示控件（价格区间）
		var priceView = $('[dm-info="price"]');// 选中的单品销售价格

		var marketViews = $('[dm-container = "MarketPrice"]');// 市场价格区间
		var marketPriceView = $('#marketPrice');// 选中单品的市场价格

		var goodsPicView = $('#preview');
		var itemPicView = $('[data-name="itemPicture"]');

		// 判断是否选中单品
		if (selectItem) {
			// 显示单品销售价格
			$items.hide();
			priceView.show().text(fmoney(selectItem.salesPrice, 2));

			// 显示单品市场价格
			marketViews.hide();
			marketPriceView.show().text("￥ " + fmoney(selectItem.marketPrice, 2));

			// 显示单品库存
			$('[dm-info="local-stock"]').attr("dm-data", selectItem.localStock).html("(库存" + selectItem.localStock + "件 )");
			var goodsNum = $("#numbox").val();
			if (goodsNum >= selectItem.localStock) {
				$("#numbox").val(selectItem.localStock);
			}
			// 显示单品图片
			if (selectItem.itemPictureList) {
				var bigPicHtml = "";
				var middlePicHtml = "";
				for (var i = 0, len = selectItem.itemPictureList.length; i < len; i++) {
					if (i == 0) {
						bigPicHtml += '<img data-name="bigPicture" src="' + selectItem.itemPictureList[i].bigPicturePath + '" ' + 'jqimg="' + selectItem.itemPictureList[i].bigPicturePath + '" width=400 height=400>';
					}
					middlePicHtml += '<li><img src="' + selectItem.itemPictureList[i].middlePicturePath + '" style="cursor:pointer;"> </li>';
				}
				$('[data-name="itemBigPic"]').html(bigPicHtml);// 大图列表
				$('#itemMiddlePic').html(middlePicHtml);// 小图列表
				bindMouseOver();

				goodsPicView.hide();
				itemPicView.show();
				var firstPicView = $('[data-name="firstPicture"]')
				firstPicView.attr({
					src : firstPicView.attr('data-init'),
					jqimg : firstPicView.attr('data-init')
				});
				$('[data-name="goodsSmallPic"]').removeClass('specbor');
			}
		} else {
			// 显示商品销售价格（价格区间）
			$items.show();
			priceView.hide();

			// 显示商品市场价格
			marketViews.show();
			marketPriceView.hide();

			// 商品库存
			var gdStock = $(".count-note").attr("dm-stock");
			// 显示商品库存
			$('[dm-info="local-stock"]').attr("dm-data", gdStock).html("(库存" + gdStock + "件 )");

			// 显示全部商品图片
			goodsPicView.show();
			itemPicView.hide();
		}

	});

	/** 点击"立即购买""加入购物车" comment by geshuo */
	$(document).on('click', '[dm-actor="dm-buy"],[dm-actor="dm-add2shpcart"]', function() {
		var $actor = $(this);
		addToShopCart($(this));
	});

	$(document).on('click', '[dm-actor]', function() {
		var $actor = $(this);// $actor=<a href="javascript:void(0);" class="add_1"
		// dm-actor="gd-amt-add">加</a>
		var actor = $actor.attr('dm-actor');// actor=gd-amt-add
		var dm_data = $actor.attr('dm-data');// dm_data=null

		// 收藏商品功能
		if (actor == "fav-gd-add") {
			/* change by geshuo 20151217 测试缺陷 #13232:防重复点击 */
			var $area = $('[dm-actor="fav-gd-add"]');
			$.dm.block($area);
			/* change by geshuo 20151217 测试缺陷 #13232:防重复点击 */
			addGoodsFavorite($area, function(flg) {
				// 收藏商品
				updateGoodsFavCount();
			});
		} else if (actor == "gd-amt-add") {
			calcAmount(1);
		} else if (actor == "gd-amt-reduce") {
			calcAmount(-1);
		} else if (actor == "quick-gd-search") {
			// 简略搜索
			gdSearch($('[dm-info="quick-goods-search-word"]').val(), actor);
		}
	});

	$('[dm-info="gd-amt"]').change(function(e) {
		calcAmount(0, this);
	});
};

// 调用单纯关键字搜索（search 关键字，from 数据来源）
var gdSearch = function(search, from) {
	location.href = '/goodsSearch.jhtml?from=' + from + '&s=' + encodeURIComponent(search);
};

/** 修改数量时触发,计算库存和运费 by geshuo 20151125 */
var calcAmount = function(step, obj) {

	var $amt = $('[dm-info="gd-amt"]');
	var val = parseFloat($amt.val());
	if (isNaN(val)) {
		val = 1;
	}
	val += step;
	if (val <= 1) {
		val = 1;
	}
	var $localStock = $('[dm-info="local-stock"]');
	var stock = parseInt($localStock.attr('dm-data'));
	if (stock < val) {
		val = stock;
	}
	var flag = $(obj).attr("actor");
	if (flag == "hideTool") {
		var newTool = $('[dm-info="gd-amt"]')[1];
		$amt.val($(newTool).val());
	} else {
		$amt.val(val);
	}

	initStatus(val);

	// liuhuan 给点击加，减运送数量时计算运费
	if (0 < val && val <= stock) {
		calcCarriage();
	}

};

var initStatus = function(val) {
	var $stock = $('[dm-info="local-stock"]');
	var stock = parseInt($stock.attr('dm-data')) || 0;
	var $amtAdd = $('[dm-actor="gd-amt-add"]');
	if (val >= stock) {
		$amtAdd.addClass('add_0');
		$amtAdd.removeClass('add_1');
	} else {
		$amtAdd.addClass('add_1');
		$amtAdd.removeClass('add_0');
	}

	var $amtReduce = $('[dm-actor="gd-amt-reduce"]');
	if (val <= 1) {
		$amtReduce.addClass('reduce_0');
		$amtReduce.removeClass('reduce_1');
	} else {
		$amtReduce.addClass('reduce_1');
		$amtReduce.removeClass('reduce_0');
	}
};
var initStore = function() {
	var $storeId = $('#store_id');
	/*
	 * callService('/st/findStoreInfo.jhtml',
	 * {storeId:$storeId.val()},{callScuess:function(data){ }});
	 */
};

/** 数量和属性校验 by geshuo 20151125 */
var checkItemSelected = function() {
	var result = true;
	var amount = parseFloat($('#numbox').val());

	// 数量校验
	if (isNaN(amount) || amount <= 0) {
		$('[dm-actor="amount-container"]').addClass("specifications-error");
		$('[dm-actor="amount-container"]').children(".errorwrong").show();

		return false;
	} else {
		$('[dm-actor="amount-container"]').removeClass("specifications-error");
		$('[dm-actor="amount-container"]').children(".errorwrong").hide();

	}

	var normalAttrErrorList = $("[id^=specifications-error0]");// 正常销售属性
	var toolAttrErrorList = $("[id^=specifications-error1]");// 快捷栏销售属性
	for (var i = 0, len = normalAttrErrorList.length; i < len; i++) {
		var attrDomList = $(normalAttrErrorList[i]).children().children(".specifications-list em");// 所有销售属性控件
		if (attrDomList.length == 0) {// 没有此销售属性
			break;
		}
		var hasSelected = false;
		for (var j = 0, len2 = attrDomList.length; j < len2; j++) {
			if ($(attrDomList[j]).hasClass("specifications-selected")) {
				hasSelected = true;
				break;
			}
		}
		if (!hasSelected && $(attrDomList[0])) {
			$(normalAttrErrorList[i]).addClass("specifications-error");
			$(normalAttrErrorList[i]).children(".errorwrong").show();
			$(toolAttrErrorList[i]).addClass("specifications-error");
			$(toolAttrErrorList[i]).children(".errorwrong").show();
			return false;
		} else {
			$(normalAttrErrorList[i]).removeClass("specifications-error");
			$(normalAttrErrorList[i]).children(".errorwrong").hide();
			$(toolAttrErrorList[i]).removeClass("specifications-error");
			$(toolAttrErrorList[i]).children(".errorwrong").hide();
		}
	}
	return result;
};

var showTradeInfoInterval = null;
var showTradeInfo = function() {
	var basePrice = $('[dm-container="MinPrice"]').attr('dm-data');
	var activityPrice = $('[dm-container="MinPrice"]').attr('dm-data-activity-price');
	var price = basePrice;

	if (activityPrice) {
		price = activityPrice;
	}
	var point = Math.floor(parseFloat(price));
	$('[dm-info="goods-point-count"]').html(point);

	var scoreCount = $('[dm-info="goods-score-count-base"]').eq(0).text()
	$('[dm-info="goods-score-count"]').text(scoreCount);

	if (scoreCount != '' && showTradeInfoInterval != null) {
		window.clearInterval(showTradeInfoInterval);
	}
};

// 关闭登录pupup
var loginshut = function() {
	$("#login_popUp").fadeOut(1000);
};

/**
 * 获取销售属性数量 by geshuo
 */
function getAttrCount(itemList) {
	var count = 0;
	if (itemList.length > 0) {
		// 根据第一条记录获取属性个数，所有单品的属性个数都相同
		var item = itemList[0];
		if (item.attrDicId1) {
			count++;
		}
		if (item.attrDicId2) {
			count++;
		}
		if (item.attrDicId3) {
			count++;
		}
		if (item.attrDicId4) {
			count++;
		}
		if (item.attrDicId5) {
			count++;
		}
		if (item.attrDicId6) {
			count++;
		}
		if (item.attrDicId7) {
			count++;
		}
		if (item.attrDicId8) {
			count++;
		}
	}
	return count;
}

/** 获取选中的销售属性值 by geshuo 20151120 */
function getAttrDicValue(attrValueViews) {
	for (var i = 0, len = attrValueViews.length; i < len; i++) {
		if ($(attrValueViews[i]).hasClass("specifications-selected")) {
			return $(attrValueViews[i]).attr("data-value");
		}
	}
}

/** 初始化属性值 by geshuo 20151120 */
function initAttrValues() {
	var getValuesParams = {
		isInit : 1
	// 设置参数为获取销售属性初始值
	};
	getValuesParams.goodsId = $("#data_goodsId").val();
	var getValuesUrl = "/gd/findAttrValuesBySelectValues.ajax";
	/** 查询属性值列表 */
	callService(getValuesUrl, getValuesParams, {
		callSuccess : function(data) {
			saleAttrValues = data;
			setAttrState();
		}
	});
}

/** 设置销售属性值的状态 by geshuo 20151120 */
function setAttrState(isFromTool) {
	var goodsId = $("#data_goodsId").val();// 商品id
	// 获取当前选中状态对应的各属性的values
	var selectValues = getSelectAttrValues(isFromTool);
	var getValuesParams = {};
	if (selectValues[0]) {
		getValuesParams.attrDicValue1 = selectValues[0];
	}
	if (selectValues[1]) {
		getValuesParams.attrDicValue2 = selectValues[1];
	}
	if (selectValues[2]) {
		getValuesParams.attrDicValue3 = selectValues[2];
	}
	if (selectValues[3]) {
		getValuesParams.attrDicValue4 = selectValues[3];
	}
	if (selectValues[4]) {
		getValuesParams.attrDicValue5 = selectValues[4];
	}
	if (selectValues[5]) {
		getValuesParams.attrDicValue6 = selectValues[5];
	}
	if (selectValues[6]) {
		getValuesParams.attrDicValue7 = selectValues[6];
	}
	if (selectValues[7]) {
		getValuesParams.attrDicValue8 = selectValues[7];
	}
	getValuesParams.goodsId = goodsId;
	var getValuesUrl = "/gd/findAttrValuesBySelectValues.ajax";
	/** 查询属性值列表 */
	callService(getValuesUrl, getValuesParams, {
		callSuccess : function(data) {
			if (data) {
				for (var i = 0, len = data.length; i < len; i++) {
					if (data[i].attrValues && data[i].attrValues.length > 0) {
						var attrValues = data[i].attrValues;
						var attrId = "#saleAttr" + (i + 1);
						var toolAttrId = "#toolSaleAttr" + (i + 1);
						$(attrId).html(getAttrHtml(saleAttrValues[i].attrValues, attrValues, selectValues, i + 1));
						$(toolAttrId).html(getAttrHtml(saleAttrValues[i].attrValues, attrValues, selectValues, i + 1, true));
					}
				}
			} else {
				// 错误处理
				jsAlert("获取属性值失败");
			}
		}
	});
}

/** 获取属性值html by geshuo 20151120 */
function getAttrHtml(initValues, newValues, selectValues, attrIndex, isFromTool) {
	var attrHtml = "";
	var idPrefix = "saleAttr_";
	if (isFromTool) {
		idPrefix = "toolSaleAttr_";
	}
	for (var i = 0, len = initValues.length; i < len; i++) {
		var attrCommon = "";
		var attrDisable = "";
		var isInNew = false;
		for (var j = 0, size = newValues.length; j < size; j++) {
			if (newValues[j] == initValues[i]) {
				if (selectValues[(attrIndex - 1)] && selectValues[(attrIndex - 1)] == initValues[i]) {
					// 被选中的属性值
					attrCommon = '<em class="item-price specifications-selected" ' + 'id="' + idPrefix + attrIndex + '_' + i + ' "' + 'data-index="' + attrIndex + '" ' + 'data-value="' + initValues[i] + '">' + initValues[i] + '</em>'
				} else {
					attrCommon = '<em class="item-price" ' + 'id="' + idPrefix + attrIndex + '_' + i + ' "' + 'data-index="' + attrIndex + '" ' + 'data-value="' + initValues[i] + '">' + initValues[i] + '</em>'
				}
				// 有货
				attrHtml += attrCommon;
				isInNew = true;
				break;
			}
		}
		if (!isInNew) {
			// 不可选择
			attrDisable = '<p class="item-soldout" style="height: 30px; line-height: 30px; padding: 0 10px; border: solid 1px #ddd; display: inline-block;  margin-right: 10px; margin-bottom: 10px; color: #ddd; overflow: hidden;"> ' + initValues[i] + '</p>';
			attrHtml += attrDisable;
		}
	}
	return attrHtml;
}

/** 获取各个属性选中的值 by geshuo 20151120 */
function getSelectAttrValues(isFromTool) {
	var selectValues = [];
	if (isFromTool) {
		for (var i = 0; i < 8; i++) {
			var toolIdPrefix = "toolSaleAttr_" + (i + 1) + "_";// 快捷栏销售属性值id前缀
			selectValues[i] = getAttrDicValue($("[id^=" + toolIdPrefix + "]"));
		}
	} else {
		for (var i = 0; i < 8; i++) {
			var idPrefix = "saleAttr_" + (i + 1) + "_";// 正常页面销售属性值id前缀
			selectValues[i] = getAttrDicValue($("[id^=" + idPrefix + "]"));
		}
	}
	return selectValues;
}

/** 初始化单品列表 by geshuo 20151120 */
function initItemList() {
	var goodsId = $("#data_goodsId").val();// 商品id
	var url = "/gd/findItemListByGoodsId.ajax";
	var params = {
		goodsId : goodsId
	};
	/** 查询单品列表 */
	callService(url, params, {
		callSuccess : function(data) {
			if (!data.success) {
				// 错误处理
				jsAlert("获取单品列表失败");
			} else {
				// 解析单品数据，根据第一条单品判断一共有几个属性
				itemList = data.result;
				attrCount = getAttrCount(itemList);
			}
		}
	});
}

/** 加入购物车 by geshuo 20151120 */
function addToShopCart($actor) {
	if (checkItemSelected()) {
		var selectItem = getSelectItem();// 获取选中的单品
		if (!selectItem) {
			jsAlert("请选择商品属性!");
			return;
		}
		// 设置购物车参数
		var requestParams = {
			storeId : storeId,// 店铺id
			storeName : storeName,
			goodsId : $("#data_goodsId").val(),// 商品id
			itemId : selectItem.id,// 单品id
			amount : $('#numbox').val(),// 数量
			goodsName : $('[dm-info="goods-detail-name"]').attr('title'),
			itemName : selectItem.name,
			pic : $('#spec-list').find('img').attr('src')
		};
		// 登录校验
		$.dm.getLogStatus(function(data) {
			if (data == null) {
				if ($(".login").find(".loginStyleA-ico3").length > 0) {
					refreshCaptcha("");
				}
				$("#login_popUp").fadeIn();
			} else {
				if ($actor.attr('dm-actor') == 'dm-buy') {
					// 立即购买
					var url = dm_ctx + '/order/toOrderConfirmByImmediately.jhtml';
					$.dm.jumpTo(url, requestParams);

				} else {
					// 加入购物车
					var url = dm_ctx + '/sc/addSc.ajax';
					callService(url, requestParams, {
						callSuccess : function(data) {
							if (!data.success) {
								jsAlert(data.message);
							} else {
								jsAlert("添加购物车成功!");
							}

							var $area = $(".detail_button");
							$.dm.block($area);
							if ($actor.attr('dm-actor') == 'dm-add2shpcart') {
								// 动画
								// playScAni(selectItem);
								refreshTool();
								$("#shopCarSucc").fadeIn();
								$("#shopCarSucc").fadeOut(1000);
								$.dm.unblock($area);
							}
						}
					});
				}
			}
		});
	} else {
		var actor = $(this).attr("dm-actor");
		if (actor == 'dm-buy') {
			$(".tool-scroll").click();
			// $(".good-tool-filter").toggle();
		}
	}
}

/** 查询选中单品 by geshuo 20151120 */
function getSelectItem(isFromTool) {
	var selectValues = getSelectAttrValues(isFromTool);// 获取选中的属性值
	var valuesCount = 0;// 选中属性值的数量
	for (var i = 0, len = selectValues.length; i < len; i++) {
		if (selectValues[i]) {
			valuesCount++;
		}
	}

	if (attrCount == valuesCount) {
		for (var j = 0, length = itemList.length; j < length; j++) {
			if (itemList[j].attrValue1 == selectValues[0] && itemList[j].attrValue2 == selectValues[1] && itemList[j].attrValue3 == selectValues[2] && itemList[j].attrValue4 == selectValues[3] && itemList[j].attrValue5 == selectValues[4] && itemList[j].attrValue6 == selectValues[5] && itemList[j].attrValue7 == selectValues[6] && itemList[j].attrValue8 == selectValues[7]) {
				// 所有属性值均相等，返回匹配的单品
				return itemList[j];
			}
		}
	}

	return null;
}

/**
 * 获取商品收藏数量 by geshuo 20151207
 */
var updateGoodsFavCount = function() {
	// 规避异常comment out by geshuo
	try {
		var goodsId = $('[dm-actor="fav-gd-add"]').attr("dm-data");
		memberApi.findGoodsFavoriteCountByGoodsId(goodsId, function(count) {
			// 登录前请求被拦截，count查询不到值，获取到数字时才进行赋值
			if (!isNaN(count)) {
				$('[dm-actor="fav-gd-add"] span').html("收藏商品(" + count + ")");
			}
		}, function() {

		});
	} catch (ex) {
		console.log(ex);
	}
}

/**
 * 显示活动相关信息
 */
var showActivityInfo = function() {
	var search = {
		needUser : true
	};
	$.extend(search, activitySearch);

	// 获取活动相关api (comment by geshuo)
	var activity = $.dm.activity();
	activity.findActivityByGoodsId({
		data : search,
		callSuccess : function(result) {
			// 成功取得数据
			var iconTl = Handlebars.compile($('#activity-icon-tl').html());
			var priceTl = Handlebars.compile($('#activity-price-tl').html());
			var maketPriceTl = Handlebars.compile($('#activity-market-price-tl').html());
			if (!result || result.length <= 0) {
				return;
			}

			activityInfo = result;
			activityInfo.goodsId = activityInfo.id;

			activityInfo.promotionTimeStart = parseInt(activityInfo.promotionTimeStart);
			activityInfo.promotionTimeEnd = parseInt(activityInfo.promotionTimeEnd);
			if (activityInfo.now != null) {
				var serverDate = new Date(parseDate(activityInfo.now));
				var now = new Date();

				var diffTimeValue = (now.getTime() - serverDate.getTime());
				activityInfo.diffTimeValue = diffTimeValue;

				// 设置活动图标
				var $icon = $(iconTl(activityInfo));
				$('[dm-contianer="activity-icon"]').replaceWith($icon);

				var $maketPrice = $(maketPriceTl(activityInfo));
				$('[dm-container="activity-market-price-container"]').replaceWith($maketPrice);
				// 促销更多优惠
				$(document).on('click', '.details-sale-btn', function() {
					$(".sale-pop").toggle();
					$(this).children("i").toggleClass("details-sale-btn-i");
					if(result.isFreeShip){
					$(".sale-pop").text(result.isFreeShip);
					}
				});
				nowTime = result.now;
				showActivityRestTime(true);
				
				showActivePrice();

				window.setInterval(showActivityRestTime, 1000);

				showTradeInfoInterval = window.setInterval(showTradeInfo, 300);
			}
		}
	});
}

// 更新活动相关信息
var activityInfo = {};

// 更新活动相关信息
var nowTime ;
var showActivityRestTime = function(isShowAll) {
//	var now = new Date(nowStr);
//	var now = new Date((new Date(nowTime)).getTime()-1000);
	var __data__= new Date(nowTime);

	if(!__data__.getDate()){
		__data__= new Date();
		var __str__= nowTime.split(/-|:| /);
		__data__.setFullYear(+__str__.shift());
		__data__.setMonth(+__str__.shift()-1);
		__data__.setDate(+__str__.shift());
		__data__.setHours(+__str__.shift());
		__data__.setMinutes(+__str__.shift());
		__data__.setSeconds(+__str__.shift());
	}

	var now = new Date(__data__.getTime()+1000);

	if(!now.getDate()){
		return;
	}

	nowTime = now;
	if (activityInfo.beginDatetime == null || activityInfo.endDatetime == null) {
		return false;
	}
	var beginDatetime = parseDate(activityInfo.beginDatetime);
	var endDatetime = parseDate(activityInfo.endDatetime);

	var restBegin = formatDateDiff(beginDatetime.getTime() - now.getTime());
	var restEnd = formatDateDiff(endDatetime.getTime() - now.getTime());

	if (endDatetime.getTime() < now.getTime()) {
		activityInfo.isEnd = true;
	} else if (beginDatetime.getTime() < now.getTime() && endDatetime.getTime() >= now.getTime()) {
		activityInfo.restDay = restEnd.days;
		activityInfo.restHour = restEnd.hours;
		activityInfo.restMinute = restEnd.minutes;
		activityInfo.restSecond = restEnd.seconds;
		activityInfo.noBegin = false;
	} else {
		activityInfo.restDay = restBegin.days;
		activityInfo.restHour = restBegin.hours;
		activityInfo.restMinute = restBegin.minutes;
		activityInfo.restSecond = restBegin.seconds;
		activityInfo.noBegin = true;
	}
	if (isShowAll) {
		var descriptionTl = Handlebars.compile($('#activity-description-tl').html());
		// 设置活动介绍
		var $description = $(descriptionTl(activityInfo));
		$('[dm-container="activity-description-container"]').replaceWith($description);
	}
	var timeTl = Handlebars.compile($('#activity-description-time-tl').html());
	var $time = $(timeTl(activityInfo));
	$('[dm-container="activity-description-time-container"]').replaceWith($time);
};

// 更新活动价格信息
var showActivePrice = function() {
//	var basePrice = parseFloat($('[dm-container="MinPrice"]').attr('dm-data'));
	var basePrice = $('#MinPrice').text();
	var activityPrice = basePrice;

	if (!activityInfo.isEnd) {
		if (activityInfo.feeType == '00') {
			// 价格优惠
			activityPrice = activityPrice - parseFloat(activityInfo.fee);
		} else if (activityInfo.feeType == '10') {
			// 折扣优惠
			activityPrice = Math.round(activityPrice * parseFloat(activityInfo.fee) / 100 * 100) / 100;
		} else if (activityInfo.feeType == '20') {
			// 定额优惠
			activityPrice = parseFloat(activityInfo.fee);
		} else {
			return;
		}
	}

	if (activityPrice < 0) {
		// 小于0的场合，设置为0
		activityPrice = 0;
	}
	if (activityPrice > basePrice) {
		// 活动金额大于原价则活动金额为原价
		activityPrice = basePrice;
	}
	if (!activityInfo.noBegin) {
		$('[dm-container="MinPrice"]').attr('dm-data-activity-price', fmoney(activityPrice, 2));
		$('#MinPrice').text(fmoney(activityPrice, 2));
		$('[dm-info="activity-market-price"]').text(fmoney(basePrice, 2));
	} else {

	}
};

combination = function(itemid, goodsId) {
	var selectItem = {};
	selectItem.id = itemid;
	selectItem.goodsId = goodsId;
	var getCombinationUrl = "/gd/findCombinationValuesByItemId.ajax";
	var CombinationInfo = $("#combination").html();
	var CombinationInfo_handlebars = Handlebars.compile(CombinationInfo);
	// 注册一个比较大小的Helper,判断v1是否等于v2
	Handlebars.registerHelper("compare", function(v1, v2, options) {
		if (v1 == v2) {
			// 满足添加继续执行
			return options.fn(this);
		} else {
			// 不满足条件执行{{else}}部分
			return options.inverse(this);
		}
	});
	callService(getCombinationUrl, selectItem, {
		callSuccess : function(data) {
			if (data.data == null || data.data.length == 0) {
				$("#combinationDiv > div.detailRecommend").replaceWith(strHtml);
			} else {
				// 获得handlebars对象

				var strHtml = CombinationInfo_handlebars(data);

				var detail = $("#combinationDiv > div.detailRecommend");
				if (detail.size()) {
					detail.replaceWith(strHtml);
				} else {
					$("#combinationDiv").append(strHtml);
				}
			}
			checkMoney();
			// 商品组加入购物车
			// addCombination();
		}
	});
}
function checkMoney() {
	if ($("input[name='combinationMoneyCheck']").length != 0) {
		$("input[name='combinationMoneyCheck']").click(function() {
			var checked = $("input[name='combinationMoneyCheck']:checked");
			var allMoney = $("#baseMoney").val();
			for (var i = 0; i < checked.length; i++) {
				allMoney = allMoney * 1 + ($(checked[i]).val()) * 1;
			}
			$("#allMoney").text("￥" + parseFloat(allMoney).toFixed(2));
			$("#num").text(checked.length);
		})
	} else {
		var moneyInput = $("input[name='combinationMoney']");
		var allMoney = $("#baseMoney").val();
		for (var i = 0; i < moneyInput.length; i++) {
			allMoney = allMoney * 1 + ($(moneyInput[i]).val()) * 1;
		}
		$("#allMoney").text("￥" + parseFloat(allMoney).toFixed(2));
		$("#num").text(moneyInput.length)
	}
}

// 组合商品加入购物车
function addCombination() {

	// $("#addCombination").click(function(){
	var _list = {};
	var baseParam = {};
	_list.combinationItemId0 = $("input[name='baseCombinationItemId']").val();
	_list.combId0 = $("input[name='baseCombId']").val();
	_list.combinationId0 = $("input[name='baseCombinationId']").val();
	_list.promotionId0 = $("input[name='promotionId']").val();
	_list.combinationPrice0 = $("#baseMoney").val();
	// param.combinationId=$(checked[i]).attr("combinationId");
	// 非固定组合
	if ($("input[name='combinationMoneyCheck']").length != 0) {
		var checked = $("input[name='combinationMoneyCheck']:checked");
		if (checked.length == 0) {
			jsErrAlert("请选择组合商品");
			return;
		}
		for (var i = 0; i < checked.length; i++) {
			var param = {};
			var combinationItemId = "combinationItemId" + (i + 1);
			var combId = "combId" + (i + 1);
			var combinationId = "combinationId" + (i + 1);
			var promotionId = "promotionId" + (i + 1);
			var combinationPrice = "combinationPrice" + (i + 1);
			_list[combinationItemId] = $(checked[i]).attr("combinationItemId");
			_list[combId] = $(checked[i]).attr("combId");
			_list[combinationId] = $(checked[i]).attr("combinationId");
			_list[promotionId] = $(checked[i]).attr("promotionId");
			_list[combinationPrice] = $(checked[i]).val();
		}

		_list.count = checked.length + 1;
		// 固定组合
	} else {
		var checked = $("input[name='combinationMoney']");
		for (var i = 0; i < checked.length; i++) {
			var param = {};
			var combinationItemId = "combinationItemId" + (i + 1);
			var combId = "combId" + (i + 1);
			var combinationId = "combinationId" + (i + 1);
			var promotionId = "promotionId" + (i + 1);
			var combinationPrice = "combinationPrice" + (i + 1);
			_list[combinationItemId] = $(checked[i]).attr("combinationItemId");
			_list[combId] = $(checked[i]).attr("combId");
			_list[combinationId] = $(checked[i]).attr("combinationId");
			_list[promotionId] = $(checked[i]).attr("promotionId");
			_list[combinationPrice] = $(checked[i]).val();
		}
		_list.count = checked.length + 1;
	}
	// var requestParams={};
	// requestParams.List = _list;
	// 登录校验
	$.dm.getLogStatus(function(data) {
		if (data == null) {
			if ($(".login").find(".loginStyleA-ico3").length > 0) {
				refreshCaptcha("");
			}
			$("#login_popUp").fadeIn();
		} else {
			var addCombinationUrl = dm_ctx + "/sc/addCombinationShopcart.ajax";
			callService(addCombinationUrl, _list, {
				callSuccess : function(data) {
					if (data.data == "success") {
						jsAlert("添加购物车成功");
					} else {
						alert("添加失败");
					}
					var $area = $(".detail_button");
					$.dm.block($area);
					// 动画
					// playScAni(selectItem);
					refreshTool();
					$("#shopCarSucc").fadeIn();
					$("#shopCarSucc").fadeOut(1000);
					$.dm.unblock($area);
				}
			});
		}
	})
	// })
}

function cantbuy() {
	jsAlert("本场秒杀已结束，敬请期待下一场秒杀");
}
