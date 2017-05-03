//商品楼层
(function($) {
	$.dmRange_range0007 = function(datas) {
		try {
			var falg = true;// 设置刷新状态，如果true可以请求，如果false不可以请求
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];

			var floorNum = $('.floor').length + 1;
			datas.floorNum = floorNum;
			datas.cssIndex = floorNum % 5;

			var goodsObj = datas.rangeData;
			var goodsList = [];
			for (var i = 1; i < 11; i++)
				if (goodsObj.hasOwnProperty("title" + i)) {
					{
						var goods = {};
						goods.title = goodsObj["title" + i];
						goodsIds = '';
						for (var j = 1; j < 11; j++) {
							if (goodsObj.hasOwnProperty("rec_tab" + i + "_goods" + j)) {
								goodsIds += goodsObj["rec_tab" + i + "_goods" + j] + ',';
							}
						}
						goods.goodsIds = goodsIds;
						goods.tabIndex = i;
						goodsList.push(goods);
					}
				}
			datas.goodsList = goodsList;

			var range0007_tl = $("#range0007-tl").html();
			var range0007_template = Handlebars.compile(range0007_tl);
			var range0007_html = range0007_template(datas);

			var loacationBefor = $.dmFindRangLocationBefore(gridId, rangeId, currentOrder);

			if (loacationBefor) {
				$(loacationBefor).before(range0007_html);
			} else {
				var $_grid = $("[dm-layout-grid='" + gridId + "']");
				$_grid.append(range0007_html);
			}

			$('[dm-layout-range="range0007"][order="' + datas.orders + '"]').find('li').click(function() {
				if (falg) {
					falg = false;
					$('[dm-layout-range="range0007"][order="' + datas.orders + '"]').find('.dmFloor').empty();
					var tabIndex = $(this).attr("tabIndex");
					// 判断是第几个li，如果第一个，则判断栏位的类型
					if (tabIndex != 1) {
						//getGoodsDetail(this, tabIndex);
						var goodsids = $(this).attr("goodsids");
						var goodsList = goodsids.split(',');
						callService('/gd/findGoodsInfoByIds.ajax', {
							"ids" : goodsList
						}, {
							callSuccess : function(data) {
								for (var i = 0; i < data.length; i++) {
									if (data[i].sgItemPictureFormList.length != 0) {
										data[i].pic = data[i].sgItemPictureFormList[0].smallPicturePath;
									} else {
										data[i].pic = '';
									}
								}
								var templateName = ("#range0007-first-goods-tl");
								var recommend_tl = $(templateName).html();
								var recommend_template = Handlebars.compile(recommend_tl);
								datas.goodsDetailList = data;
								var recommend_html = recommend_template(datas);
								$('[dm-layout-range="range0007"][order="' + datas.orders + '"]').find('.dmFloor').append(recommend_html);
								falg = true;
							}
						});
					} else {
						// 如果栏位类型是0图片，则生成相应的图片及url信息；如果栏位是1商品，则正常获取商品详细信息
						if (datas.rangeData.title_type == "0") {
							var data = datas.rangeData;
							var picObj = {};
							var picList = [];
							for (var i = 1; i < 11; i++) {
								pic = data["rec_tab1_pic" + i];
								url = data["rec_tab1_url" + i];
								picObj = {
									"pic" : pic,
									"url" : url
								};
								picList.push(picObj);
							}
							var recommend_tl = $("#range0007-first-pic-tl").html();
							var recommend_template = Handlebars.compile(recommend_tl);
							datas.picList = picList;
							var recommend_html = recommend_template(datas);
							$('[dm-layout-range="range0007"][order="' + datas.orders + '"]').find('.dmFloor').append(recommend_html);
							falg = true;
							console.log(datas);
						} else if (datas.rangeData.title_type == "1") {
//							getGoodsDetail(this, tabIndex);
							
							var goodsids = $(this).attr("goodsids");
							var goodsList = goodsids.split(',');
							callService('/gd/findGoodsInfoByIds.ajax', {
								"ids" : goodsList
							}, {
								callSuccess : function(data) {
									for (var i = 0; i < data.length; i++) {
										if (data[i].sgItemPictureFormList.length != 0) {
											data[i].pic = data[i].sgItemPictureFormList[0].smallPicturePath;
										} else {
											data[i].pic = '';
										}
									}
									var templateName = ("#range0007-first-goods-tl");
									var recommend_tl = $(templateName).html();
									var recommend_template = Handlebars.compile(recommend_tl);
									datas.goodsDetailList = data;
									var recommend_html = recommend_template(datas);
									$('[dm-layout-range="range0007"][order="' + datas.orders + '"]').find('.dmFloor').append(recommend_html);
									falg = true;
								}
							});
						}
					}
				}
			});

			// 第一个tab初始化
			$('[dm-layout-range="range0007"][order="' + datas.orders + '"]').find('li').first().click();
			$('[dm-layout-range="range0007"][order="' + datas.orders + '"]').find('li').first().addClass('on');

			// 获取商品详细信息
//			function getGoodsDetail(v, tabIndex) {
//				var goodsids = $(v).attr("goodsids");
//				var goodsList = goodsids.split(',');
//				callService('/gd/findGoodsInfoByIds.ajax', {
//					"ids" : goodsList
//				}, {
//					callSuccess : function(data) {
//						for (var i = 0; i < data.length; i++) {
//							if (data[i].sgItemPictureFormList.length != 0) {
//								data[i].pic = data[i].sgItemPictureFormList[0].smallPicturePath;
//							} else {
//								data[i].pic = '';
//							}
//						}
//						var templateName = ("#range0007-first-goods-tl");
//						var recommend_tl = $(templateName).html();
//						var recommend_template = Handlebars.compile(recommend_tl);
//						datas.goodsDetailList = data;
//						var recommend_html = recommend_template(datas);
//						$('[dm-layout-range="range0007"][order="' + datas.orders + '"]').find('.dmFloor').append(recommend_html);
//						falg = true;
//					}
//				});
//			}
		} catch (ex) {
			console.log(ex);
		}
	};
})(jQuery);