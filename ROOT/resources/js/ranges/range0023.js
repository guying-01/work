//店铺客服
(function($) {
	$.dmRange_range0023 = function(datas) {
		try {
			initCustomService(datas);
			$("#range0023").find("a").click(function() {
				QQtalk('1739073619');
			});
		} catch (e) {
			console.log(e);
		}
	};

	function initCustomService(datas) {
		var url = '/customService/findSellerStoreCustomServiceList.ajax';
		callService(url, {
			storeId : datas.attr1
		}, {
			async : false,
			callSuccess : function(result) {
				if (result.success) {
					if (result.result.length != 0) {
						var customServiceList = [];
						var data = result.result;
						for (var i = 0; i < data.length; i++) {
							var customService = {};
							customService.qq = data[i].qq;
							customService.nickName = data[i].nickName;
							// $.get("http://webpresence.qq.com/getonline?Type=1&"+data[i].qq+":");
							// customService.statu=online[0];
							customServiceList.push(customService);
						}
						datas.customServiceList = customServiceList;
						var gridId = datas["gridId"];
						var rangeId = datas["rangeId"];
						var currentOrder = datas["orders"];
						var range0023_tl = $("#range0023-tl").html();
						var range0023_template = Handlebars.compile(range0023_tl);
						var range0023_html = range0023_template(datas);
						var loacationBefor = $.dmFindRangLocationBefore(gridId, rangeId, currentOrder);
						if (loacationBefor) {
							$(loacationBefor).before(range0023_html);
						} else {
							var $_grid = $("[dm-layout-grid='" + gridId + "']");
							$_grid.append(range0023_html);
						}
					}
				} else {
					jsAlert(result.message);
				}
			}
		});
	}
})(jQuery);