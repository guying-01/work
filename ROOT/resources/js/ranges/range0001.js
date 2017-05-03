//商城头部链接栏
(function($){
	$.dmRange_range0001 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			var range0001_tl = $("#range0001-tl").html() || "";
			var range0001_template=Handlebars.compile(range0001_tl);
			var range0001_html=range0001_template(datas);
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0001_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0001_html);
			}
			// 选择栏位节点
			var range_selector = "[dm-layout-grid='"+gridId+ "'] [dm-layout-range='"+rangeId+"'][order='"+currentOrder+"']";
			// 查找要插入html的节点
			$_range = $(range_selector);
			// 加载头部状态栏
			$_range.dmHeaderBar();
		}catch(ex){
			console.log(ex);
		}
	}
	
})(jQuery);