//顶部通栏
(function($){
	$.dmRange_range0018 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0018_tl = $("#range0018-tl").html();
			var range0018_template=Handlebars.compile(range0018_tl);
			
			var range0018_html=range0018_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0018_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0018_html);
			}
		}catch(e){
			console.log(e);
		}
	}
	
})(jQuery);