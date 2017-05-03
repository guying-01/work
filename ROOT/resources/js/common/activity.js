/**
 * 活动相关
 */
(function($) {
	if(!$.dm){
		$.dm={};
	}
	
	$.dm.activity=function(){
		/**
		 * 查询指定商品列表适用的【活动】列表
		 */
		var findActivityListByItemIdList=function(options){
			var opt=options||{};
			$.extend(opt,{dataType: "json",contentType:"application/json"});
			var url="/activity/findActivityListByItemIdList.ajax";
			callService(url,opt.data,opt);
		};
		/**
		 * 查询指定商品适用的【活动】列表
		 */
		var findActivityByGoodsId=function(options){
			var opt=options||{};
			var url="/activity/findActivityByGoodsId.ajax";
			callService(url,opt.data,opt);
		};
		var api={
				findActivityListByItemIdList:findActivityListByItemIdList,
				findActivityByGoodsId:findActivityByGoodsId
		}
		
		return api;
	};
})(jQuery);