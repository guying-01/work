//店铺内搜索
(function($){
	$.dmRange_range0010 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0010_tl = $("#range0010-tl").html();
			var range0010_template=Handlebars.compile(range0010_tl);
			var range0010_html=range0010_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0010_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0010_html);
			}
			
			var rangeSelector = "[dm-layout-range='"+rangeId+"'][order='"+currentOrder+"'] [dm-container='store-search-container']";
			var rangeContainer = "[dm-layout-range='"+rangeId+"'][order='"+currentOrder+"']";
			
			$.dm.loadWidget(rangeSelector
					, 'storeGoodsSearch',{replace:true,range:datas,container:rangeContainer});//载入左侧商铺搜索框
			}catch(e){
			console.log(e);
		}
	}
})(jQuery);