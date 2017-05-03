//品牌推荐
var isrange0024_memberLoged = false;
(function($) {
	$.dmRange_range0024 = function(datas) {
		try {
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			var brandObj = datas.rangeData;
			
			var brandTitleList = [];
			var brandTitle = {};
			var brand = {};
			for(var titleIndex = 1;titleIndex<7;titleIndex++){
				if(brandObj.hasOwnProperty('title'+titleIndex)){
					brandTitle = {};
					brandTitle.title = brandObj['title'+titleIndex];
					var brandList = [];
					for(var brandIndex=1;brandIndex<13;brandIndex++){
						if(brandObj.hasOwnProperty('rec_tab'+titleIndex+'_brandpic'+brandIndex)&&brandObj.hasOwnProperty('rec_tab'+titleIndex+'_brandurl'+brandIndex)){
							if(brandObj['rec_tab'+titleIndex+'_brandpic'+brandIndex]){
								brand = {};
								brand.pic = brandObj['rec_tab'+titleIndex+'_brandpic'+brandIndex];
								brand.url = brandObj['rec_tab'+titleIndex+'_brandurl'+brandIndex];
								brandList.push(brand);
							}
						}
					}
					brandTitle.brandList = JSON.stringify(brandList);
					brandTitleList.push(brandTitle);
				}
			}
			
			datas.brandTitleList = brandTitleList;
			var range0024_tl = $("#range0024-tl").html();
			var range0024_template = Handlebars.compile(range0024_tl);
			var range0024_html = range0024_template(datas);
			var loacationBefor = $.dmFindRangLocationBefore(gridId, rangeId, currentOrder);
			if (loacationBefor) {
				$(loacationBefor).before(range0024_html);
			} else {
				var $_grid = $("[dm-layout-grid='" + gridId + "']");
				$_grid.append(range0024_html);
			}
			
			$('[dm-layout-range="range0024"][order="' + datas.orders + '"]').find('li').click(function(){
				$('[dm-layout-range="range0024"][order="' + datas.orders + '"]').find('.recommend-produce-div').html();
				var brandList = eval($(this).attr('brandList'));
				var range0024_brand_tl = $("#range0024-brand-tl").html();
				var range0024__brand_template = Handlebars.compile(range0024_brand_tl);
				var range0024_brand_html = range0024__brand_template(brandList);
				$('[dm-layout-range="range0024"][order="' + datas.orders + '"]').find('.recommend-produce-div').html(range0024_brand_html);
			});
			
			$('[dm-layout-range="range0024"][order="' + datas.orders + '"]').find('li').first().click();
			$('[dm-layout-range="range0024"][order="' + datas.orders + '"]').find('li').first().addClass('on');
		} catch (ex) {
			console.log(ex);
		}
	};
})(jQuery);