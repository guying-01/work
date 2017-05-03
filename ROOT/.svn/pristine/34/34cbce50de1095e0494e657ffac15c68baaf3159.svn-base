//商品推荐
var isRange0011_memberLoged = false;
(function($) {
	$.dmRange_range0011 = function(datas) {
		try {
			var gridId = datas["gridId"];
			var rangeId = datas["rangeId"];
			var currentOrder = datas["orders"];
			
			if(datas.rangeData.showTitle == 'off'){
				datas.rangeData.title = null;
			}
			
			var range0011_tl = $("#range0011-tl").html();
			var range0011_template=Handlebars.compile(range0011_tl);
			var range0011_html=range0011_template(datas);
			
			var loacationBefor = $.dmFindRangLocationBefore(gridId,rangeId,currentOrder);
			if(loacationBefor){
				$(loacationBefor).before(range0011_html);
			}else{
				var $_grid = $("[dm-layout-grid='"+gridId+"']>.clear");
				$_grid.before(range0011_html);
			}
			
			var goodsListStr = datas.rangeData.goodsListStr;
			var goodsList = JSON.parse(goodsListStr);
			var goodsIdList = [];
			$.each(goodsList, function(inx, val){
				if(val.id){
					goodsIdList.push(val.id)
				}
			});
			callService('/gd/findGoodsInfoByIds.ajax', {"ids":goodsIdList}, {
				callSuccess:function(data){
					for(var i = 0; i < data.length; i++){
						if(data[i].sgItemPictureFormList.length != 0){
							data[i].pic = data[i].sgItemPictureFormList[0].middlePicturePath;
						}else{
							data[i].pic = '';
						}
					}

					// 模板
					var range_tl = $("#recommend-list-tl").html();
					// 将模板编译成handlerbars对象
					var range_template = Handlebars.compile(range_tl);
					// 将模板与数据结合
					var range_html = range_template(data);
					
					var selector = "[dm-layout-grid='" + gridId+ "'] [dm-layout-range='"+ rangeId+ "'][order='"+currentOrder+"']";
					// 查找要插入html的节点
					$_range = $(selector).find('.recommend-produce-div');
					// 插入html
					$_range.html(range_html);
				}
			});
		} catch (e) {
			console.log(e);
		}
	}
	
	$.dmRange0011Start = function(datas){
		try{
			var rangeData = datas["rangeData"];
			var ids = (rangeData["ids"]||"").split(",");
			var query={"storeId":storeId,"ids":ids};
			var url ="/gd/findGoodsDetailListWithSaleFavByIds.ajax";
			callService(url, query,
					{
						callSuccess : function(recomendResult) {
							recomendResult = editRecommendGoodsList(recomendResult);
							$.dmRenderRange0011(datas,recomendResult);
							},
						callError : function(status, errorThrown,data) {
							$.dmRenderRange0011(datas,[]);
						}
					});
		
		}catch(ex){
			console.log(ex);
		}
	}
	
	
	/**
	 * 编辑数据
	 */
	var editRecommendGoodsList = function(goodsList){
		try{
			var combGoodsList = new Array();
			for(var goodsIndex in goodsList){
				var combGoods = {};
				var goodsObj = goodsList[goodsIndex] || {};
				$.extend(combGoods,goodsObj);
				combGoods["isLoged"]=isRange0011_memberLoged;
				var basicInfo = goodsObj["goodsBasicInfo"] || {};
				$.extend(combGoods,basicInfo);
				var attrList = goodsObj["attrList"] || [];
				var attrObj = attrList[0] || {};
				
				var itemList = goodsObj["itemList"] || [];
				
				combGoodsList.push(combGoods);
			}
			
			return combGoodsList;
		}catch(ex){
			console.log(ex);
		}
		
	}
	
	$.dmRenderRange0011 = function(datas,recomendResultDataList){
		try{
			// 模板
			var range_tl = $("#recommend-list-tl").html();
			// 将模板编译成handlerbars对象
			var range_template = Handlebars.compile(range_tl);
			// 商品推荐楼层数据
			var floorList = [];
			// 商品索引
			var goodsIndex = 0;
			// 每个楼层所放商品个数
			var floorGoodsCount = 4;
			
			if(recomendResultDataList && recomendResultDataList.length){
				floorList.push(recomendResultDataList);
			}else{
				floorList.push(new Array());
			}
			floorList["storeId"] = storeId;
			floorList["title"] = datas.rangeData.range_title_show;
			// 将模板与数据结合
			var range_html = range_template(floorList);
			// 选择栏位节点
			var rangeId = datas["rangeId"];
			var gridId = datas["gridId"];
			var order = datas["orders"];
			var selector = "[dm-layout-grid='" + gridId+ "'] [dm-layout-range='"+ rangeId+ "'][order='"+order+"']";
			// 查找要插入html的节点
			$_range = $(selector);
			// 插入html
			$_range.html(range_html);
		}catch(ex){
			console.log(ex);
		}
	}

	$.dmInitAction = function() {
		try {
			$("[dm-actor='favOrCancle']").unbind("click").bind("click",
					function() {
						var goodsId = $(this).attr("dm-goodsId");
						var favId = $(this).attr("dm-favId");
						var className = $(this).attr("class");
						var $_favIcon = $(this);
						// 是为收藏时,点击收藏
						if (className == "recommend-no-i") {
							var options = {"goodsId":goodsId,"favId":favId};
							$.dmAddGoodsToFav(options,function(flg,result){
								if(flg){
									var favId = result["form"]["id"];
									$_favIcon.attr("dm-favId",favId);
									$_favIcon.removeClass('recommend-no-i').addClass('recommend-i');
								}
							});

						} else if (className == "recommend-i") {// 是收藏时,点击取消收藏
							var options = {"goodsId":goodsId,"favId":favId};
							$.dmDelGoodsToFav(options,function(flg,result){
								if(flg){
									$_favIcon.removeClass('recommend-i').addClass('recommend-no-i');
								}
								
							})

						}
					});
		} catch (ex) {
			console.log(ex);
		}

	}
	
	
	/**
	 * 编辑当前店铺被收藏的商品的排行
	 */
	function editSaleAndFavriteGoods(result){
		try{
			// 商品数组
			var goodsList = {};
			if(result["data"]){
				goodsList = result["data"];
			}
			// 
			var dataList = new Array();
			// 
			for(var goodsIndex in goodsList){
				// 编辑前的商品对象
				var goodsObj = goodsList[goodsIndex];
				// 编辑完成后的商品对象
				var comBoGoods = {};
				// 商品基本信息
				var goodsInfo = goodsObj["goodsInfo"];
				// 商品详情
				var goodsDetailInfo = goodsObj["goodsDetailInfo"];
				// 如果商品基本存在，拷贝商品基本信息到comBoGoods
				if(goodsInfo){
					$.extend(comBoGoods,goodsInfo);
					// 拷贝商品id
					comBoGoods["comBoGoodsId"] = goodsInfo["id"];
				}
				// 如果商品详情存在，拷贝商品详情到comBoGoods
				if(goodsDetailInfo){
					var goodsPictureList = goodsDetailInfo["goodsPictureList"];
					if(goodsPictureList && goodsPictureList.length){
						$.extend(comBoGoods,goodsPictureList[0]);
					}
					// 商品里的单品集合
					var itemList = goodsDetailInfo["itemList"];
					// 如果有商品的单品集合不为空
					if(itemList && itemList.length){
						for(var itemIndex in itemList ){
							var item = itemList[itemIndex];
							if(!comBoGoods["salesMinPrice"] || comBoGoods["salesMinPrice"]>item["salesPrice"]){
								comBoGoods["salesMinPrice"] = item["salesPrice"];
							}
							if(!comBoGoods["salesMaxPrice"] || comBoGoods["salesMaxPrice"]<item["marketPrice"]){
								comBoGoods["salesMaxPrice"] = item["marketPrice"];
							}
						}
					}
					
				}
				// 拷贝基本信息
				$.extend(comBoGoods,goodsObj);
				dataList.push(comBoGoods);
			}

			
			// 按照收藏数量大小进行排序
			for(var i=0;i<dataList.length;i++){
				
				for(var j=0;j<dataList.length - i;j++){
					var obj1 = dataList[j];
					var obj2 = dataList[j+1];
					var tempObj = obj1;
					if(obj1 && obj2){
						if(obj1["goodsCount"] < obj2["goodsCount"]){
							dataList[j] = obj2;
							dataList[j+1] = tempObj;
							
						}
					}
					
				}
				
			}
			return dataList;
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 获取店面id storeId
	 */
	function getStoreId(){
		var urls ="";
		if(location.pathname){
			urls = location.pathname.split("/");
		}
		var urLen = 0;
		if(urls.length){
			urLen = urls.length;
		}
		var suburl = "";
		if(urLen>0){
			suburl = urls[urLen-2]
		}
		var storeId = "";
		if(suburl){
			storeId = suburl.split(".")[0];
		}
		return storeId;
	}
	
})(jQuery);