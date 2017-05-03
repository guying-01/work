//商城导航栏
(function($){
	
	$.dmRange_range0003 = function(datas){
		try{
			
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0003_tl = $("#range0003-tl").html();
			var range0003_template=Handlebars.compile(range0003_tl);
			var range0003_html=range0003_template(datas);
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			
			if(loacationBefor){
				$(loacationBefor).before(range0003_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0003_html);
			}
			var range_selector = "[dm-layout-grid='"+gridId+"'] [dm-layout-range='"+rangeId+"'][order='"+currentOrder+"']";
			var selector = range_selector+" [dm-container='mallNav']";
			var options = {container:range_selector,replace:true,range:datas};
			$.dm.loadWidget(selector, 'mallNav',options);//载入顶部商城搜索栏

		}catch(e){
			console.log(e);
		}
	}

})(jQuery);