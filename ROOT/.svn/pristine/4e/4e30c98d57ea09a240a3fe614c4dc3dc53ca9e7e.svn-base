//自定义内容
(function($){
	$.dmRange_range0013 = function(datas){
		try{
			// 选择栏位节点
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			var range0013_tl = $("#range0013-tl").html();
			var range0013_template=Handlebars.compile(range0013_tl);
			var range0013_html=range0013_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0013_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']>.clear");
				$_grid.before(range0013_html);
			}
			
			var data = datas["rangeData"];
			var range_tl = $("#define-self-tl").html();
			// 将模板编译成handlerbars对象
			var range_template = Handlebars.compile(range_tl);
			// 将模板与数据结合
			if(data.range_title_show == "off"){
				data.range_title = null;
			}
			var range_html = range_template(data);
			
			// 查找要插入html的节点
			var selector = "[dm-layout-grid='" +gridId+"'] [dm-layout-range='"+rangeId+ "'][order='"+currentOrder+"']";
			$_range = $(selector);
			$_range.append(range_html)
		}catch(ex){
			console.log(ex);
		}
	}
})(jQuery);