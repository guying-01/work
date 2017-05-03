/** 加载模板用Js**/
(function($) {
	var baseQuery={'pageId':'','subSystemId':'','storeId':''};
	$.dmLoadTemplate=function(options) {
		loadLayoutDataList(options["pageId"],options["subSystemId"],options["storeId"]);
		var api={};
		return api;
	}
	
	/**
	 * 判断栏目所在的网格
	 */
	function objIndexOfArr(arr,name,value){
		var i = 0;
		while(i<arr.length){
			var obj = arr[i];
			if(obj[name] == value){
				return i;
			}
			i++;
		}
		// 如果数组里不包含该gridId对象，直接返回
		return arr.length;
	}
	
	/**
	 * 加载布局数据
	 */
	function loadLayoutDataList(pageId,subSystemId,storeId){
		// 查询布局数据url
		var url = "/tpl/findPageLayoutDataList.ajax";
		// 参数
		baseQuery = {"pageId":pageId,"subSystemId":subSystemId,"storeId":storeId}; 
		// 调用后台，获取数据并加载模板
		callService(url,baseQuery,{type:"POST",callSuccess:function(data){
			if(data && data.length){
				var pageTemplateId = data[0]["pageTemplateId"];
				var page = {"pageId":baseQuery.pageId,"pageTemplateId":pageTemplateId,"subSystemId":baseQuery.subSystemId};
				var grids = new Array();
				for(var key in data){
					var item = data[key];
					var gridId = item["gridId"];
					var gridTemplateId = item["gridTemplateId"];
					var orders = item["orders"];
					
					var gridIndex = objIndexOfArr(grids,"gridId",gridId);
					var grid = grids[gridIndex];
					if(!grid){
						grid = {"ranges":new Array()};
					}
					
					grid["gridId"] = gridId;
					grid["gridTemplateId"] = gridTemplateId;
					grid["orders"] = orders;
					
					if(item["rangeId"]){
						var range = {};
						$.extend(range,item);
						//网格中存在栏目的场合
						var rangeId = item["rangeId"];
						var rangeTemplateId = item["rangeTemplateId"];
						var rangeExtendData = item["rangeExtendData"];
						
						var gridId = item["gridId"];
						var gridTemplateId = item["gridTemplateId"];
						
						var pageId = item["pageId"];
						var pageTemplateId = item["pageTemplateId"];
						
						range["rangeId"] = rangeId;
						range["rangeTemplateId"] = rangeTemplateId;
						range["rangeExtendData"] = rangeExtendData;
						
						range["gridId"] = gridId;
						range["gridTemplateId"] = gridTemplateId;
						
						range["pageId"] = pageId;
						range["pageTemplateId"] = pageTemplateId;
						
						
						grid["ranges"].push(range);
					}
					
					grids[gridIndex] = grid;
				}
				// 加载页面
				loadPageTemplate(page,grids);
			}else{
				//没有装修数据
				$('[dm-info="not-pg-data"]').show();
			}
			}
		,callError:function(status,error,data){
			
		}
		});
	}
	
	/**
	 * 加载页面模板
	 */
	function loadPageTemplate(page,grids){
		loadGridTemplates(grids);
	}
	
	/**
	 * 遍历网格，并加载网格模板
	 */
	function loadGridTemplates(grids){
		if(grids && grids.length){
			for(var key in grids){
				var grid = grids[key];
				loadGridTemplate(grid);
			}
		}
	}
	
	/**
	 * 加载网格模板
	 */
	function loadGridTemplate(grid){
		loadRangeTemplates(grid["ranges"]);
	}
	
	/**
	 * 遍历当前网格下的所有栏目，并加载栏目模板
	 */
	function loadRangeTemplates(ranges){
		if(ranges && ranges.length){
			for(var key in ranges){
				var range = ranges[key];
				loadRangeTemplate(range);
			}
		}
	}
	
	/**
	 * 加载栏目模板
	 */
	function loadRangeTemplate(range){
		try{
			var datas = {};
			$.extend(datas,range);
			// 栏位id
			var rangeId = range["rangeId"];
			// 栏位数据
			var rangeData = range["rangeExtendData"];
			// 如果该栏位没有数据，则设默认数据为""
			if(!rangeData){
				rangeData = "{}";
			}
			// 将栏位数据转换为对象
			rangeData = eval("("+rangeData+")");
			// 如果栏位数据对象为false，则设默认{}
			if(!rangeData){
				rangeData = {};
			}
			// 创建每个栏位的数据
			datas["rangeData"]=rangeData;
			// 每个栏位js的接口
			
			var funName = "$.dmRange_"+rangeId+"(datas)";
				// 调用每个栏位自己的js文件
				eval(funName);
			}catch(ex){
				// 显示错误显示
				//console.log(ex);
			}
		
	}
	
})(jQuery);

$(document).ready(function(){
	try{
		if(pageDesignOptions){
			//初始化页面
			var ops = {"pageId":"","subSystemId":"","storeId":""};
			// 在模板页定义相关模板参数
			var options = pageDesignOptions;
			$.extend(ops,options);
			var dmLoadTemplate=$.dmLoadTemplate(ops);	
		}
	}catch(ex){
		
	}
});