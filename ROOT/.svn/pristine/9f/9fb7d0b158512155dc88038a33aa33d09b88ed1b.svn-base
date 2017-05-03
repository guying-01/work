//广告图片轮播
(function($) {
	$.dmRange_range0005 = function(datas) {
		try {
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];

			var range0005_tl = $("#range0005-tl").html();
			var range0005_template = Handlebars.compile(range0005_tl);
			var range0005_html = range0005_template(datas);

			var loacationBefor = $.dmFindRangLocationBefore(gridId, rangeId, currentOrder);
			if (loacationBefor) {
				$(loacationBefor).before(range0005_html);
			} else {
				var $_grid = $("[dm-layout-grid='" + gridId + "']");
				$_grid.append(range0005_html);
			}

			var rangeData = datas["rangeData"];
			if (!rangeData) {
				rangeData = {};
			}
			// 轮播图片总数
			var imgCount = 0;
			for ( var key in rangeData) {
				// 如果轮播图片路径存在,则总轮播图片数加1
				if (rangeData[key] && key.indexOf('ad_pic') >= 0 && key.indexOf('ad_picurl') < 0) {
					imgCount++;
					rangeData["imgCount" + imgCount] = true;
				}
			}

			// 选择栏位节点
			var rangeId = datas["rangeId"];
			var gridId = datas["gridId"];
			var range_selector = "[dm-layout-grid='" + gridId + "'] [dm-layout-range='" + rangeId + "'][order='" + currentOrder + "']";
			// 查找要插入html的节点
			$_range = $(range_selector);

			// 获取模板
			var htmlText = $("#bannerjs-tl").html();
			// 如果模板不存在,则用""代替
			if (!htmlText) {
				htmlText = "";
			}
			// 编译文本成handerbars对象
			var range_template = Handlebars.compile(htmlText);
			// 将模板编译成html
			var range_html = range_template(rangeData);

			// 将编译好的html加载到当前页面上
			$_range.append(range_html);

			/*
			 * CHANGE START BY geshuo
			 * 20151209:【个人中心模块】【商城页面】【商城首页-已登录】图片轮播已经设置了Url，但是点击图片，画面不迁移。
			 */
			$('.min-banner li').click(function() {
				var url = $(this).attr('dm-data');
				if (url && url != '') {
					/* CHANGE START BY geshuo 20160513: ***.jhtml?id=18,问号后的参数丢失修正 */
//					var opt = {
//						method : 'GET',
//						target : '_blank'
//					};
//					$.dm.JumpTo(url, {}, opt);
					window.open(url);
					/* CHANGE END BY geshuo 20160513: ***.jhtml?id=18,问号后的参数丢失修正 */
				}
			});

			imgSelectBind();

		} catch (e) {
			console.log(e);
		}
	};
})(jQuery);