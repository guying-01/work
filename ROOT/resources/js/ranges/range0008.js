//店铺招牌
(function($) {
	$.dmRange_range0008 = function(datas) {
		try {
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];

			var range0008_tl = $("#range0008-tl").html();
			var range0008_template = Handlebars.compile(range0008_tl);
			var range0008_html = range0008_template(datas);

			var loacationBefor = $.dmFindRangLocationBefore(gridId, rangeId, currentOrder);
			if (loacationBefor) {
				$(loacationBefor).before(range0008_html);
			} else {
				var $_grid = $("[dm-layout-grid='" + gridId + "']");
				$_grid.append(range0008_html);
			}

			var rangeSelector = "[dm-layout-range='" + rangeId + "'][order='" + currentOrder + "'] .shopbanner";
			var rangeContainer = "[dm-layout-range='" + rangeId + "'][order='" + currentOrder + "']";
			$.dm.loadWidget(rangeSelector, 'storeBanner', {
				replace : true,
				range : datas,
				container : rangeContainer
			});// 载入头部店招

		} catch (e) {
			console.log(e);
		}

	};

})(jQuery);