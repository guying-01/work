//宝贝分类
(function($){
	$.dmRange_range0014 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0014_tl = $("#range0014-tl").html();
			var range0014_template=Handlebars.compile(range0014_tl);
			var range0014_html=range0014_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0014_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0014_html);
			}
			
			var rangeSelector = "[dm-layout-range='"+rangeId+"'][order='"+currentOrder+"'] [dm-container='store-item-categroy-container']";
			var rangeContainer = "[dm-layout-range='"+rangeId+"'][order='"+currentOrder+"']";
			
			$.dm.loadWidget(rangeSelector
					, 'storeItemCategroy',{replace:true,range:datas,container:rangeContainer});//载入左侧店内商品分类栏
		}catch(e){
			console.log(e);
		}
	}
	

})(jQuery);