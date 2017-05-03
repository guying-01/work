//底部广告位
(function($){
	$.dmRange_range0019 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0019_tl = $("#range0019-tl").html();
			var range0019_template=Handlebars.compile(range0019_tl);
			
			var range0019_html=range0019_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0019_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0019_html);
			}
		}catch(e){
			console.log(e);
		}
	}
	
})(jQuery);