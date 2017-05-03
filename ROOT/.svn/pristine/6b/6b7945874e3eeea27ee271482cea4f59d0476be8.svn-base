$(document).ready(function () {
	try{
		// 页面初始化时加载购物车
		if($("#tool").size()==0){
			$("<div id='tool'></div>").appendTo(document.body);
		}
		initActors();
		// 初始化工具条
		$("#tool").dmLoadToolBar({"type":"html"});
	}catch(ex){
		
	}

});
//初始化动作
var initActors=function(){
	var $_actors = $("#tool [dm-actor]");
	$_actors.live('click', '[dm-actor]', function(){
		var $this=$(this);
		var actor=$this.attr('dm-actor');
		var itemId=$this.attr('dm-data');
		if(actor=='sc-select-all'){
			selectAllSc($this);
		}else if(actor=='sc-st-check'){
			selectAllSt($this);
		}else if(actor=='sc-del'){
			deleteItem($this);
		}else if(actor=='favGd-del'){
			deleteFavGd($this);
		}else if(actor=='favStore-del'){
			deleteFavStore($this);
		}else if(actor=='sc-del-list'){
			deleteItems();
		}else if(actor=='sc-amt-add'){
			var amount=parseInt($('[dm-info="sc-amt"][dm-data="'+itemId+'"]').html())+1;
			
			var stock=parseInt($('[dm-info="sc-amt"][dm-data="'+itemId+'"]').attr('dm-stock'));
			if(amount>=stock){
				amount=stock;
			}
			$('[dm-info="sc-amt"][dm-data="'+itemId+'"]').attr("dm-value",amount);
			$('[dm-info="sc-amt"][dm-data="'+itemId+'"]').html(amount);
		}else if(actor=='sc-amt-reduce'){
			var amount=parseInt($('[dm-info="sc-amt"][dm-data="'+itemId+'"]').html())-1;
			if(amount<=1){
				amount=1;
			}
			$('[dm-info="sc-amt"][dm-data="'+itemId+'"]').attr("dm-value",amount);
			$('[dm-info="sc-amt"][dm-data="'+itemId+'"]').html(amount);
		}else if(actor=='sc-del-disable'){
			deleteDisabledItems();
		}else if(actor=='fav-add'){
			
		}else if(actor=='sc-buy'){
			buy();
		}else if(actor=='browse-history-item-delete'){
			var goodsId=$this.attr('dm-data');
			$('[dm-container="browse-history-item"][dm-data="'+goodsId+'"]').remove();
			
			$.dm.delBrowseHistory({goodsId:goodsId});
		}
		reCalcAll();
	});
	$(document).on('change','[dm-info="sc-amt"]',function(){
		reCalcAll();
	});
};
//选择所有的购物车项目
var selectAllSc=function($actor){
	//jsAlert($actor.val());
	$('[dm-container="sc-st"]').find('[dm-actor="sc-check"],[dm-actor="sc-st-check"]').prop('checked', $actor.prop('checked'));
};

//选择店铺下所有的购物车项目
var selectAllSt=function($actor){
    //jsAlert($actor.prop('checked'));
	//jsAlert($actor.val());
	$('[dm-container="sc-st"][dm-data="'+$actor.val()+'"]').find('[dm-actor="sc-check"]').prop('checked', $actor.prop('checked'));
};
//重新计算所有项目
var reCalcAll=function(){
	var totalPrice=0;
	var $checkedItems=$('[dm-actor="sc-check"]:checked');
	var totalCount=$checkedItems.length;
	var $storePrices=$('[dm-info="store-price"]');
	
	var storePriceData={};
	$storePrices.attr('dm-value', 0);
	$storePrices.html('￥0.00');
	$('[dm-info="price"]').each(function(){
		
		var $rowPrice=$(this);
		var item=$rowPrice.attr('dm-data');
		var $amount=$('[dm-info="sc-amt"][dm-data="'+item+'"]'); 
		var amount = parseInt($amount.html());
		var stock=parseInt($amount.attr('dm-stock'))||0;
		if(isNaN(amount)){
			amount=0;
			$amount.val(amount);
		}	
					
		var $amtAdd=$('[dm-actor="sc-amt-add"][dm-data="'+item+'"]');
		if(amount>=stock){
			$amtAdd.addClass('add_0');
			$amtAdd.removeClass('add_1');
		} else {
			$amtAdd.addClass('add_1');
			$amtAdd.removeClass('add_0');
		}
		
		var $amtReduce=$('[dm-actor="sc-amt-reduce"][dm-data="'+item+'"]');
		if(amount<=1){
			$amtReduce.addClass('reduce_0');
			$amtReduce.removeClass('reduce_1');
		} else {
			$amtReduce.addClass('reduce_1');
			$amtReduce.removeClass('reduce_0');
		}
		
		var rowPrice=parseFloat($amount.attr('dm-price')) * parseInt(amount);
		//设置单店选中商品的总价
			var storeId=$rowPrice.attr('dm-data-store');
		storePriceData[storeId]=(storePriceData[storeId]||0)+rowPrice;
		$('[dm-info="store-price"][dm-data="'+storeId+'"]').html('￥'+fmoney(storePriceData[storeId]));
		
		var $checkedItem=$('[dm-actor="sc-check"][dm-data="'+item+'"]:checked');
		if($checkedItem.prop('checked')){
			totalPrice+=rowPrice;
		}
	});
	$('[dm-info="sc-selected-count"]').html(totalCount);
	$('[dm-info="sc-selectedtotal-price"]').html('￥'+fmoney(totalPrice));
	//我的购物车数量
	//$("[dm-actor='header_shopCar_Count']").html(result["data"].length);
	
};

//删除项目
var deleteItem=function($actor){
	if(!haveRightItem()){
		return;	
	}
	var itemId=$actor.attr('dm-data');
	var $row=$('[dm-container="sc-row"][dm-data="'+itemId+'"]');
	var request={"id":itemId};
	//console.info(request);
	callService('/sc/delSc.ajax', request,{callSuccess:function(data){
		//console.info(data);
		if(data && data["data"]){
			 $row.remove();
			 $.dmTopShopCar();
	 		 reCalcAll();
		}
	}});
};

//删除收藏商品
var deleteFavGd=function($actor){
	// 单品id
	var itemId = $actor.attr("dm-data");
	//console.info(itemId);
	var url = "/fav/delGdFav.ajax";
	var requestData = {"id":itemId};
	//console.info(requestData);
	/*callService(url, requestData, {
		callSuccess : function(result){
			// 如果删除成功，则重新初始化购物车
			if(result && result["data"]){
				jsAlert("侧边工具栏删除收藏商品成功!!!");
				if($("#tool").dmLoadToolBar){
					$("#tool").dmLoadToolBar({"type":"html"});
					}
					if($(".topnav").dmHeaderBar){
					$(".topnav").dmHeaderBar({"type":"replaceWith"});
					}
			}else{
				// TODO 提示删除失败
				jsAlert("侧边工具栏删除收藏商品失败!!!");
			}
		}
	});*/
	//实现取消收藏商品功能
	$.dmDelGoodsToFav({"favId":itemId});
};
//删除收藏店铺
var deleteFavStore=function($actor){
	// 单品id
	var itemId = $actor.attr("dm-data");
	//console.info(itemId);
	var url = "/mf/deleteStoreFavorite.ajax";
	var requestData = {"id":itemId};
	//console.info(requestData);
	callService(url, requestData, {
		callSuccess : function(result){
			// 如果删除成功，则重新初始化
			if(result){
				jsAlert("侧边工具栏删除收藏店铺成功!!!");
				if($("#tool").dmLoadToolBar){
					$("#tool").dmLoadToolBar({"type":"html"});
				}
				if($(".topnav").dmHeaderBar){
					$(".topnav").dmHeaderBar({"type":"replaceWith"});
				}	
			}else{
				// TODO 提示删除失败
				jsErrAlert("侧边工具栏删除收藏店铺失败!!!");
			}
		}
	});
};

//判断是否存在有效项目
var haveRightItem=function(){
	return $('[dm-actor="sc-check"]').length>0;
};

//购买动作
var buy=function(){
	//遮罩锁定开始
	var $area=$(".tool_btn");
	$.dm.block($area);
	
	
	
	var request={ids:[],amts:[],chks:[]};
	$('[dm-actor="sc-check"]').each(function(){
		var id=$(this).attr("dm-data");
	    var amt=$('[dm-actor="sc-check"][dm-data="'+id+'"]').parent().find("p[dm-value],[numbox]").attr("dm-value");
	    request.ids[request.ids.length]=id;
		request.amts[request.amts.length]=amt;
		request.chks[request.chks.length]=$(this).prop('checked');
	});

	callService('/sc/upScLst.ajax', request,{callSuccess:function(data){
		var params={immediately:false};	
		var gourl='/order/toOrderConfirm.jhtml';
		$.dm.jumpTo(gourl, params);
 		//location.href='/order/toOrderConfirm.jhtml';
	}});
};

(function($){
	/**
	 * 加载购物车模板
	 */
	$.fn.dmLoadToolBar = function(ops){
		try {
			$_toobar = $(this);
			ops = $.extend({'notRun':false},ops);
			var type = ops["type"] || "html";
			// 查询布局数据url
			var url = "/resources/js/ranges/range0001/html/toolbar.html";
			// 参数
			var query = {};
			// 调用后台，获取数据并加载模板
			callService(url,query,{type:'GET',callSuccess:function(template_tl){
				if(!ops['notRun']){
					// 将模板加载到指定dom节点上
					if(type == "replaceWith"){
						$_toobar.replaceWith(template_tl);
					}else if(type == "append"){
						$_toobar.append(template_tl);
					}else{
						$_toobar.html(template_tl);
					}
				}else{
					ops.needtext=false;
				}
				// 初始工具条功能
				$.dmInitTool(ops);
				// 给tab添加样式变化
				$.dmToolClickTab();
			}});
			
		} catch (ex) {
			console.log(ex);
		}
	
	}
	/**
	 * 收藏商品和收藏店铺tag切换
	 */
	$.dmToolClickTab = function() {
		try{
			var $dLi = $(".tool ul.tabT li");
			// 给每个tab加上click事件
			$dLi.click(function() {
				$(this).addClass("on").siblings().removeClass("on");
				var tabLength = $(this).parent().children().length;
				var tabIndex = $(this).parent().children().index($(this));
				$(this).parent().parent().children("#JKDivb_"+tabIndex).css("display","block");
				for(var i=0;i<tabLength;i++){
					if(i!=tabIndex){
						$(this).parent().parent().children("#JKDivb_"+i).css("display","none");
					}
				}
			});
		}catch(ex){
			console.log(ex);
		}

	}
	
	/**
	 * 初始化工具条功能
	 */
	$.dmInitTool = function(ops){
		try{
			// 初始化工具条
			var dmShortcutBar = $.initShortcutbar(ops);
			// 加载购物车功能
			$.dmToolLoadShopCar(dmShortcutBar);
			
			//我收藏商品的功能
			$.dmToolLoadFavrites(dmShortcutBar);
			//我收藏店铺的功能
			$.dmToolLoadFavStore(dmShortcutBar);
			//我收藏店铺的功能
			$.dmToolLoadBrowseHistory(dmShortcutBar);
		}catch(ex){
			console.log(ex)
		}
	};
	/**
	 * 初始化工具条
	 */
	$.initShortcutbar = function(ops){
		// 添加工具条
		var dmShortcutBar = $('.tool').dmShortcutBar(ops);
		// 给工具栏的tab页添加变化事件
		var $dLi = $("ul.tabT li");
		// 给每个tab加上click事件
		$dLi.click(function(){$(this).addClass("on").siblings().removeClass("on");});
		
		return dmShortcutBar;
	}
	
	/**
	 * 实现购物车功能
	 */
	$.dmToolLoadShopCar = function(dmShortcutBar){
		try{
			// 我的购物车物品url
			var url = "/sc/findScLst.ajax";
			// 请求参数
			var requestData={};
			// 调用后台服务
			callService(url, requestData, {callSuccess:function(result){
					// 默认购物车里的数据
					var car_datas = {};
					// 购物车里商品的条数
					var header_shopCar_Count = 0;
					// 如果从后台加载的购物车数据不为空，则使用后台请求到的数据
					if(result["data"] && result["data"].length){
						// 编辑购物车的数据
						car_datas = setShopCart(result);
						for(var key in car_datas){
							var items = car_datas[key]["items"];
							if(items && items.length){
								header_shopCar_Count += items.length;
							}
							for(var key in items){
								if(items[key].amount>items[key].localStock){
									items[key].amount=items[key].localStock;
								}
							}
								
						}
					}
					// 编译购物代码段
					dmShortcutBar.buildCar(car_datas);
					//展示购物车里的数量
					$("[dm-actor='header_shopCar_Count']").html(header_shopCar_Count);
					$('[dm-info="toolbar-shopcart-goods-count"]').html(header_shopCar_Count);
				}
			}); 

		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 加载我的收藏商品
	 */
	$.dmToolLoadFavrites = function(dmShortcutBar){
		try{
			// 个人收藏是商品
			var url = "/fav/findGdFavLst.ajax";//收藏URL
			var requestData={};//请求参数
			callService(url,requestData,{callSuccess:function(result){ //调用后台服务
				var facorite_datas = {"list":[]};
				if(result["data"] && result["data"].length){
					//编辑收藏的数据
					facorite_datas = setFavoriteCart(result);
				}
				//数据模板结合
				dmShortcutBar.buildFavoriteGoods(facorite_datas); 
			}});
		}catch(ex){
			console.log(ex);
		}
	}
	/**
	 * 加载我的收藏店铺
	 */
	$.dmToolLoadFavStore = function(dmShortcutBar){
		try{
			//我收藏的店铺的数据
			var url = "/mf/findStoreFavorite.ajax";
			var resultData={};
			callService(url,resultData,{callSuccess:function(result){

				var facorite_datas = {"list":[]};
				if(result && result.length){
					//编辑收藏的数据
					facorite_datas = result;
				}else{
					var facorite_datas = []; // 编辑收藏的数据
				}
				//数据模板结合
				dmShortcutBar.buildFavoriteShop(facorite_datas);
			}});
		}catch(ex){
			console.log(ex);
		}
	}

	$.dmToolLoadBrowseHistory=function(dmShortcutBar){
		try{		
			$.dm.findBrowseHistory({callback:function(datas){
				//数据模板结合
				
				if(datas.classifyResult['1day']){
					dmShortcutBar.buildBrowseHistory({show:'1day', list:datas.classifyResult['1day']});
				}
				if(datas.classifyResult['1day-before']){
					dmShortcutBar.buildBrowseHistory({show:'1day-before', list:datas.classifyResult['1day-before']});
				}
				if(datas.classifyResult['1week-before']){
					dmShortcutBar.buildBrowseHistory({show:'1week-before', list:datas.classifyResult['1week-before']});
				}				
				
				if(!datas.result){
					return;
				}
				var browse_history_source = $("#browse_history_enable_list").html();
				var browse_history_template = Handlebars.compile(browse_history_source);
				
				for(var item in datas.result){					
					var requestData={"ids":[datas.result[item].goodsId]};
					var url ="/gd/findGoodsInfoByIds.ajax";
					// 想后台服务获取数据
					callService(url, requestData, {callSuccess:function(goodsList){		 
						for(var goods in goodsList){
							// 查找到要插入html的节点
							if($.isNumeric(goods)){
								var goodsInfo=goodsList[goods].goodsBasicInfo;
								var id=goodsInfo.id;
								var data={goodsId:id,name:goodsInfo.name,goodsPrice:goodsInfo.salesMinPrice,pic:goodsInfo.smallPicturePath};
								var browseHistoryhtml=browse_history_template(data);
								$('[dm-container="browse-history-item"][dm-data="'+id+'"]').show();
								$('[dm-container="browse-history-item"][dm-data="'+id+'"]').html(browseHistoryhtml);
							}
						}
					}});
				}

			}});
		}catch(ex){
			console.log(ex);
		}
	}
})(jQuery);
   
/**
 * 编辑购物车里的数据
 */
function setShopCart(result) {
	try {
		var storeMap = {};
		$(result.data).each(function(i, item) {
			if (!storeMap[item.storeId]) {
				storeMap[item.storeId] = {
					storeName : item.storeName,
					storeId : item.storeId,
					localStack : item.localStack,
					items : []
				};
			}
			var store = storeMap[item.storeId];
			store.items[store.items.length] = item;
		});
		// 购物车数据
		return storeMap;
	} catch (ex) {
		console.log(ex);
	}

}
/**
 * 编辑我的收藏里数据
 *@author TanLiang
 *@param result
 */
function setFavoriteCart(result) {
	try {
		var goodsList = new Array();
		var data = result["data"]; // 后台的正式商品数据
		for ( var i = 0; i < data.length; i++) { // 循环遍历取得每一个数据的值
			var item = data[i]; // 每一个item代表购物车里收藏的一件商品

			var goods = {}; // 初始化的商品对象为0
			goods["goodsId"] = item["goodsId"];
			// 商品id（主键）
			goods["id"] = item["id"];
			// 商品名称
			goods["goodsName"] = item["goodsName"];
			// 商品规格
			goods["itemName"] = item["itemName"];
			// 商品卖价
			goods["goodsPrice"] = item["salesPrice"];
			// 商品图片位置
			goods["goodsPic"] = item["goodsPic"];

			goodsList.push(goods);
		}
		// 购物车数据
		var fav_datas = {
			list : goodsList
		};
		return fav_datas;
	} catch (ex) {
		console.log(ex);
	}
}

/**
 * 查找当前数组对象中是否存在已有的对象
 * @param arr
 * @param name
 * @param value
 * @returns
 */
function findObjIndex(arr, name, value) {
	try {
		var objIndex = 0;
		while (objIndex < arr.length) {
			var obj = arr[objIndex];
			if (obj[name] == value) {
				return objIndex;
			}
			objIndex++;
		}
		return arr.length;
	} catch (ex) {
		console.log(ex);
	}

}