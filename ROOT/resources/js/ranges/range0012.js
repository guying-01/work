//店铺商品排行
(function($){
	$.dmRange_range0012 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0012_tl = $("#range0012-tl").html();
			var range0012_template=Handlebars.compile(range0012_tl);
			var range0012_html=range0012_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0012_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0012_html);
			}
			
			var rangeSelector = "[dm-layout-range='"+rangeId+"'][order='"+currentOrder+"'] [dm-actor='store-rank']";
			var rangeContainer = "[dm-layout-range='"+rangeId+"'][order='"+currentOrder+"']";
			
			
			$.dm.loadWidget(rangeSelector
					, 'storeGoodsRank',{replace:true,range:datas,container:rangeContainer});//载入左侧店内商品排行
		
		}catch(e){
			console.log(e);
		}
	};
	

})(jQuery);