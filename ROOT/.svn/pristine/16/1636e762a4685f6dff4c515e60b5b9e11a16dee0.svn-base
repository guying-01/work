//店铺导航
(function($){
	$.dmRange_range0009 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0009_tl = $("#range0009-tl").html();
			var range0009_template=Handlebars.compile(range0009_tl);
			var range0009_html=range0009_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0009_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0009_html);
			}
			
			var rangeSelector = "[dm-layout-range='"+rangeId+"'][order='"+currentOrder+"'] .shopNav";
			var rangeContainer = "[dm-layout-range='"+rangeId+"'][order='"+currentOrder+"']";
			
			$.dm.loadWidget(rangeSelector,'storeNav',{replace:true,range:datas,container:rangeContainer});//载入头部导航条	
		}catch(e){
			console.log(e);
		}
	
	}
})(jQuery);