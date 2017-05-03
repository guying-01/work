//优惠券
(function($) {
	$.dmRange_range0017 = function(datas) {
		try {

			if (datas.rangeData.ad_url1 instanceof Array) {
				datas.rangeData.ad_url1 = datas.rangeData.ad_url1[0];
			}
			if (datas.rangeData.ad_url2 instanceof Array) {
				datas.rangeData.ad_url2 = datas.rangeData.ad_url2[0];
			}
			if (datas.rangeData.ad_url3 instanceof Array) {
				datas.rangeData.ad_url3 = datas.rangeData.ad_url3[0];
			}

			var couponIds = [];
			if (datas.rangeData.ad_url1 != '') {
				couponIds.push(datas.rangeData.ad_url1);
			}
			if (datas.rangeData.ad_url2 != '') {
				couponIds.push(datas.rangeData.ad_url2);
			}
			if (datas.rangeData.ad_url3 != '') {
				couponIds.push(datas.rangeData.ad_url3);
			}

			initActivity(couponIds,datas);

			$("#range0017").find("a").click(function() {
				couponCategoryId = $(this).find("strong").attr("id");
				var url = '/member/receiveCoupon.ajax';
				callService(url, {
					couponCategoryId : couponCategoryId
				}, {
					async : false,
					callSuccess : function(result) {
						if (!result.success) {
							jsAlert(result.message);
						} else {
							jsAlert("领取成功!");
						}
					}
				});
			});

		} catch (e) {
			console.log(e);
		}
	};

	function initActivity(couponIds,datas) {
		var couponIdArr = '';
		if (couponIds.length != 0) {
			for (var i = 0; i < couponIds.length; i++) {
				if (couponIdArr != '') {
					couponIdArr += ',' + couponIds[i];
				} else {
					couponIdArr = couponIds[i];
				}
			}
			var url = '/tpl/findCouponCategoryByIds.ajax';
			callService(url, {
				couponIds : couponIdArr
			}, {
				async : false,
				callSuccess : function(result) {
					if (result.length != 0) {
						var gridId = datas["gridId"];
						var rangeId = datas["rangeId"];
						var currentOrder = datas["orders"];
						var range0017_tl = $("#range0017-tl").html();
						var range0017_template = Handlebars.compile(range0017_tl);

						var range0017_html = range0017_template(datas);

						var loacationBefor = $.dmFindRangLocationBefore(gridId, rangeId, currentOrder);
						if (loacationBefor) {
							$(loacationBefor).before(range0017_html);
						} else {
							var $_grid = $("[dm-layout-grid='" + gridId + "']");
							$_grid.append(range0017_html);
						}
						for(var i=1;i<4;i++){
							var flag=false;
							id=datas.rangeData['ad_url'+(i)];
							$.each(result, function(inx, val) {
								if( val.couponCategoryId==id){
									flag=true;
									$('#' + val.couponCategoryId).text(val.couponFee);
								}
							});
							if(!flag){
								$("#range0017").find($("[ad_url="+id+"]")).remove();
							}
						}
					}
				}
			});
		}
	}

})(jQuery);