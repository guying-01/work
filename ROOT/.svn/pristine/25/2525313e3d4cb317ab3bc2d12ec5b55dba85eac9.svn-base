function addGoodsFavorite($block,callback) {
	$.dm.getLogStatus(function(data) {
		if (data == null) {
			location.href = '/toLogin.jhtml';
		} else {
			var goodsId = $("#data_goodsId").val();
			callService('/fav/addToGdFav.ajax', {
				storeId : storeId,
				goodsId : goodsId
			}, {async:false,
				callSuccess : function(data) {
					if (!data.success) {
						jsErrAlert(data.message);
						if (callback) {
							callback(false);
						}
					} else {
						jsAlert("收藏成功");
						if (callback) {
							callback(true);
						}
					}
					$.dm.unblock($block);
				}
			});
		}
	});
}
