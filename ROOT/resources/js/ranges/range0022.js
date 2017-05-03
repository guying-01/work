//楼层广告位
(function($){
	$.dmRange_range0022 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0022_tl = $("#range0022-tl").html();
			var range0022_template=Handlebars.compile(range0022_tl);
			
			var range0022_html=range0022_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0022_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0022_html);
			}
		}catch(e){
			console.log(e);
		}
	}
	
})(jQuery);