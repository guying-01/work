//热门商品
var isRange0006_memberLoged = false;
(function($) {
	$.dmRange_range0006 = function(datas) {
		try {

			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];

			var goodsObj = datas.rangeData;
			var goodsList = [];
			for (var i = 1; i < 7; i++)
				if (goodsObj.hasOwnProperty("title" + i)) {
					{
						var goods = {};
						goods.title = goodsObj["title" + i];
						goodsIds = '';
						for (var j = 1; j < 13; j++) {
							if (goodsObj.hasOwnProperty("rec_tab" + i + "_goods" + j)) {
								goodsIds += goodsObj["rec_tab" + i + "_goods" + j] + ',';
							}
						}
						goods.goodsIds = goodsIds;
						goodsList.push(goods);
					}
				}
			datas.goodsList = goodsList;

			var range0006_tl = $("#range0006-tl").html();
			var range0006_template = Handlebars.compile(range0006_tl);
			var range0006_html = range0006_template(datas);

			var loacationBefor = $.dmFindRangLocationBefore(gridId, rangeId, currentOrder);

			if (loacationBefor) {
				$(loacationBefor).before(range0006_html);
			} else {
				var $_grid = $("[dm-layout-grid='" + gridId + "']");
				$_grid.append(range0006_html);
			}

			$('[dm-layout-range="range0006"][order="' + datas.orders + '"]').find('li').click(function() {
				$('[dm-layout-range="range0006"][order="' + datas.orders + '"]').find('.recommend-produce-div').html('');
				var goodsids = $(this).attr("goodsids");
				var goodsList = goodsids.split(',');
				callService('/gd/findGoodsInfoByIds.ajax', {
					"ids" : goodsList
				}, {
					callSuccess : function(data) {
						data = findActivityByGoods(data);
						for (var i = 0; i < data.length; i++) {
							if (data[i].sgItemPictureFormList.length != 0) {
								data[i].pic = data[i].sgItemPictureFormList[0].smallPicturePath;
							} else {
								data[i].pic = '';
							}
						}
						var recommend_tl = $("#recommend-tl").html();
						var recommend_template = Handlebars.compile(recommend_tl);
						var recommend_html = recommend_template(data);
						$('[dm-layout-range="range0006"][order="' + datas.orders + '"]').find('.recommend-produce-div').append(recommend_html);
					}
				});
			});
			$('[dm-layout-range="range0006"][order="' + datas.orders + '"]').find('li').first().click();
			$('[dm-layout-range="range0006"][order="' + datas.orders + '"]').find('li').first().addClass('on');
		} catch (ex) {
			console.log(ex);
		}
	};

	/**
	 * 查询指定商品适用的【活动】列表
	 */
	var findActivityByGoods = function(goodsList) {
		for (var i = 0; i < goodsList.length; i++) {
			var goods = goodsList[i];
			var search = {};
			// search.channelType='00';
			// search.storeId=goods.storeId;
			// search.brandId=goods.brandId;
			// search.goodsCategoryId=goods.goodsCategoryId;
			// search.productId=goods.productId;
			// var itemId = goods.id;
			search.goodsId = goods.id;
			var url = "/activity/findActivityByGoodsId.ajax";
			callService(url, search, {
				data : search,
				async : false,
				callSuccess : function(result) {
					if (!result || result.length <= 0) {
						return;
					}
					var activity = result;
					switch (activity.feeType) {
					case '1':
						activity.htmlStr = '<p class="hotA"><i>折</i><u>扣</u></p>';
						goodsList[i].minSalesPrice=activity.fee;
						break;
					case '2':
						activity.htmlStr = '<p class="hotA"><i>满</i><u>减</u></p>';
						break;
					case '3':
						activity.htmlStr = '<p class="hotA"><i>组合</i><u>特价</u></p>';
						break;
					case '4':
						activity.htmlStr = '<p class="hotA"><i>秒</i><u>杀</u></p>';
						goodsList[i].minSalesPrice=activity.fee;
						break;
					case '5':
						activity.htmlStr = '<p class="hotA"><i>包</i><u>邮</u></p>';
						break;
					}
					goodsList[i].activity = activity;
				}
			});
		}
		return goodsList;
	};

})(jQuery);