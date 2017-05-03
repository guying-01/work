//商城承诺栏位
(function($){
	$.dmRange_range0020 = function(datas){
		console.info('>>>>>>>>>>>>',datas);
		try{
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0020_tl = $("#range0020-tl").html();
			var range0020_template=Handlebars.compile(range0020_tl);
			
			var dataSrc = datas.rangeData;
			var dataArr = [];
			for(var i = 1; i < 6; i++){
				var obj = {};
				if(dataSrc['ad_pic'+i]){
					obj.pic = dataSrc['ad_pic'+i]
				}
				if(dataSrc['subhead'+i]){
					obj.subhead = dataSrc['subhead'+i]
				}
				if(dataSrc['title'+i]){
					obj.title = dataSrc['title'+i]
				}
				if(dataSrc['url'+i]){
					obj.url = dataSrc['url'+i]
				}
				dataArr.push(obj);
			}
			
			var range0020_html=range0020_template(dataArr);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0020_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']");
				$_grid.append(range0020_html);
			}
		}catch(e){
			console.log(e);
		}
		//计算底部li个数，加载不同的样式
		if($('.footernav_I li').length>4){
			$('.footernav_I').addClass('footernav_IB')
		}
	}
	
})(jQuery);