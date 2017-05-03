//商城搜索栏
(function($){
	$.dmRange_range0002 = function(datas){
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0002_tl = $("#range0002-tl").html();
			var range0002_template=Handlebars.compile(range0002_tl);
			var range0002_html=range0002_template(datas);
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			
			if(loacationBefor){
				$(loacationBefor).before(range0002_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0002_html);
			}
			
			var range_selector = "[dm-layout-grid='"+gridId+"'] [dm-layout-range='"+rangeId+"'][order='"+currentOrder+"']";
			var selector = range_selector+" [dm-container='header-search-container']";
			var options = {container:range_selector,replace:true,range:datas};
			
			$.dm.loadWidget('[dm-container="header-search-container"]', 'goodsSearch',options);//载入顶部商城搜索栏
			
		}catch(ex){
			console.log(ex);
		}
	};
})(jQuery);

function changeShowInfo(){
	var checkValue=$("#selectType").val();
	if(checkValue == 'byGoods'){
		$("#showInfo").empty().append("商品名称");
	} else {
		$("#showInfo").empty().append("店铺名称");
	}
}
