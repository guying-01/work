//商城售后栏位
(function($){
	$.dmRange_range0021 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0021_tl = $("#range0021-tl").html();
			var range0021_template=Handlebars.compile(range0021_tl);
			
			var range0021_html=range0021_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0021_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0021_html);
			}
		}catch(e){
			console.log(e);
		}
	}
	
})(jQuery);