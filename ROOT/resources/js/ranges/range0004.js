//商城类目
(function($){
	$.dmRange_range0004 = function(datas){
		try{
			
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0004_tl = $("#range0004-tl").html();
			var range0004_template=Handlebars.compile(range0004_tl);
			var range0004_html=range0004_template(datas);
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			
			if(loacationBefor){
				$(loacationBefor).before(range0004_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0004_html);
			}
			
			var rangeData = datas["rangeData"];
			if(!rangeData){
				rangeData = {};
			}
			// 选择栏位节点
			var rangeId = datas["rangeId"];
			var gridId = datas["gridId"];
			var range_selector = "[dm-layout-grid='" + gridId+ "'] [dm-layout-range='" + rangeId+ "'][order='"+currentOrder+"']";
			// 查找要插入html的节点
			$_range = $(range_selector);
			
			var selector = range_selector+" [dm-container='menu']";
			var options = {container:range_selector,replace:true,range:datas};
			$.dm.loadWidget(selector, 'mallItemMenu',options);//载入顶部商城搜索栏
		}catch(ex){
			console.log(ex);
		}
	}


})(jQuery);