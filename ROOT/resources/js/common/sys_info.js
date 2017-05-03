(function($){
	if(!$.dm){
		$.dm={};
	}

	//获取登录状态
	$.dm.getLogStatus=function(callback){
		var data=null;
		var currentUrl = window.location.pathname;
		callService('/loginStatus/getLoginStatus.ajax', {currentUrl:currentUrl}, {callSuccess:function(result){
			try{
				data=result.data;
				callback(data);
			}catch(ex){			
			}
		},callError:function(textStatus, errorThrown){
			//错误或未登录时
			if(callback){
				callback(data);
			}
		}});
	};
	
	var dm_basic_urls=null;//缓存的基础urls
	//获取基本url
	$.dm.getBasicUrls=function(callback){
		if(!callback){
			return;
		}
		if(dm_basic_urls){
			callback(dm_basic_urls);
			return;
		}
		callService('/basicUrl/getBasicUrls.ajax', {}, {callSuccess:function(result){
			try{
				dm_basic_urls=result.data;
				callback(dm_basic_urls);
			}catch(ex){			
			}
		},callError:function(textStatus, errorThrown){
			//错误或未登录时
			callback(dm_basic_urls);
		}});
	};
	
	//获取店铺信息
	$.dm.getStoreInfo=function(storeId, callback){
		var data="店铺首页";
		callService('/st/storeInfo.ajax',{storeId:storeId},{callSuccess:function(result){
			try{
				data=result;
				callback(data);
			}catch(ex){			
			}
		},callError:function(textStatus, errorThrown){
			//错误或未登录时
			if(callback){
				callback(data);
			}
		}})
	};
})(jQuery);
