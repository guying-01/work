(function($){
	if(!$.dm){
		$.dm={};
	}
	//查询足迹数据{callback}
	$.dm.findBrowseHistory=function(options){
		if(!options){
			return;
		}

		var splitDate=function(value){
			return value.substring(0,4)+value.substring(5,7)+value.substring(8,10);
		};
 

		if(options.callback){
			var url='/member/findBrowseHistory.ajax';
			var query={};
			// 调用后台，获取数据并加载模板
			callService(url,query,{callSuccess:function(result){
				if(options.callback){
					var items={result:result,classifyResult:{}};
					if(result && $.type(result)=='array'){
						var oneDay=[];
						var oneDayBefore=[];
						var oneWeekBefore=[];
						
						var now=new Date();
						var oneDayFlag=now.format('yyyyMMdd');
						var oneWeekFlag=(new Date(now.getFullYear(),now.getMonth(),now.getDate()-7)).format('yyyyMMdd');
						for(var i in result){
							var item=result[i];
							var createDate=splitDate(item.createDate);
							if(createDate>=oneDayFlag){
								oneDay.push(JSON.parse(JSON.stringify(item)));
							}else if(createDate<oneWeekFlag){
								oneWeekBefore.push(JSON.parse(JSON.stringify(item)));
							}else{
								oneDayBefore.push(JSON.parse(JSON.stringify(item)));
							}
						}
 
						if(oneDay.length>0){
							items.classifyResult['1day']=oneDay;
						}
						if(oneDayBefore.length>0){
							items.classifyResult['1day-before']=oneDayBefore;
						}
						if(oneWeekBefore.length>0){
							items.classifyResult['1week-before']=oneWeekBefore;
						}
					}else{
						items.result=null;
					}

					options.callback(items); 
				}
				
			},callError:function(){}
			});
		}
	};
	//添加用户足迹 {goodsId,callback}
	$.dm.addBrowseHistory=function(options){
		if(!options){
			return;
		}

		var url='/member/addBrowseHistory.ajax';
		var query=options;
		// 调用后台，获取数据并加载模板
		callService(url,query,{callSuccess:function(result){
			if(options.callback){
				options.callback(result); 
			}
		},callError:function(){}
		});
	};
	//删除用户足迹 {goodsId,callback}
	$.dm.delBrowseHistory=function(options){
		if(!options){
			return;
		}

		var url='/member/delBrowseHistory.ajax';
		var query=options;
		// 调用后台，获取数据并加载模板
		callService(url,query,{callSuccess:function(result){
			if(options.callback){
				options.callback(result); 
			}
		},callError:function(){}
		});
	};	
})(jQuery);