$(document).ready(function(){
	//隐藏无数据的默认画面
	$('.serchNull').hide();
	var pathNames=$.dm.getPathNames();
	var storeId=window.storeId||(pathNames.length>2?pathNames[pathNames.length-2]:'');
	window.storeId=storeId;
	
	//取得店铺信息
	$.dm.getStoreInfo(storeId, function(data){
		if(data){
//			$('title').html('店铺内搜索页-'+data.storeName+'-饭饭在线');
			$('title').html(data.storeName+'-饭饭在线');
			$('[dm-info="store-name"]').html(data.storeName);
		}
	});
	
	//$.dm.loadWidget('[dm-container="header-search-container"]', 'goodsSearch');//载入顶部商城搜索栏
	$.dm.loadWidget('[dm-container="store-goods-search-container"]', 'storeGoodsSearch');//载入左侧商铺搜索框
	$.dm.loadWidget('[dm-container="store-item-categroy-container"]', 'storeItemCategroy');//载入店铺商品分类
	$.dm.loadWidget('[dm-container="store-goods-rank-container"]', 'storeGoodsRank',{replace:true,range:{}});//载入店铺商品
	try{
    	isStoreHasRangeById(storeId,"range0008",function(flg,result){
    		if(flg){
    			var datas = result;
    			var rangeContainer = "";
    			var options = {replace:true,range:datas,container:rangeContainer}
    			$.dm.loadWidget('[dm-container="header-shopbanner-container"]','storeBanner',options);//载入头部店招
    		}
    	},function(){});
    	
	}catch(ex){
		console.log(ex);
	}
	try{
    	isStoreHasRangeById(storeId,"range0009",function(flg,result){
    		if(flg){
    			var datas = result;
    			var rangeContainer = "";
    			var options = {replace:true,range:datas,container:rangeContainer}
    			$.dm.loadWidget('[dm-container="header-shopnav-container"]','storeNav',options);//载入头部导航条
    		}
    	},function(){});
    	}catch(ex){
    	console.log(ex);
    	}
	// 查找要插入html的节点
	var $header_link_nav = $('[dm-container="header-link-nav-container"]');
	// 加载头部状态栏
	$header_link_nav.dmHeaderBar();
	
	var pathNames=$.dm.getPathNames();
	var storeId=window.storeId||(pathNames.length>2?pathNames[pathNames.length-2]:'');
	//var checkValue=$("#selectType").val();
	//全局默认值
	var opt={				
		url:'/goodsSearch.ajax'//发送搜索请求
		,urlParams:$.dm.getUrlParams()//url传递的参数
		,pageRows:20//每页默认的商品数量
		,pageCountPerGroup:15//默认的显示页数
		,storeId:storeId
	};	
	
	//模板相关模块
	var templates=(function(){
		//-结果数据相关模板
		var gd_item_tl=Handlebars.compile($('#gd-item-tl').html());
		
		var page_item_tl=Handlebars.compile($('#page-item-tl').html());

		var definds={
			gd_item_tl:gd_item_tl
			,page_item_tl:page_item_tl
		};
		return definds;
	})();

	//初始化页面中定义的动作
	var initActor=function(options){
		$(document).on('click','[dm-actor]',function(){
			var $actor=$(this);
			var actor=$actor.attr('dm-actor');
			if(actor==='query-sort'){
				querySort($actor);
			}else if(actor==='price-filter'){
				queryPriceFilter($actor);
			}else if(actor==='page-up' || actor==='page-down' || actor==='page-item'){
				initQueryPage($actor);
			}
		});
	};
	
	//清除查询条件与结果
	var clearPage=function(options){
		var opt={clearSort:true,clearPrice:true,clearResult:true};
		if(options){
			$.extend(opt,options);
		}
 
		if(opt.clearSort){
			clearSort('default');
		}
		if(opt.clearPrice){
			clearPrice();
		}
		if(opt.clearResult){
			clearResult();
		}
	};
	
	//清除价格
	var clearPrice=function(){
		$('[dm-info="min-price"]').val('');
		$('[dm-info="max-price"]').val('');
	};
	//清除排序
	var clearSort=function(sort){
		$('[dm-actor="query-sort"]').attr('dm-direct', 'asc');
		$('[dm-actor="query-sort"]').removeAttr('dm-sort');
		$('[dm-actor="query-sort"][dm-data="default"]').attr('dm-sort','');
		
		$('[dm-actor="query-sort"]').removeClass('sorting_foc');
		$('[dm-actor="query-sort"] u').removeClass('sorting_bot');
		$('[dm-actor="query-sort"] u').removeClass('sorting_top');
		$('[dm-actor="query-sort"] u').addClass('sorting_bot');
		$('[dm-actor="query-sort"][dm-data="'+sort+'"]').addClass('sorting_foc');
	};

	//清除商品结果
	var clearResult=function(){
		$('[dm-container="store-no-goods"]').hide();
		$('[dm-container="gd-item"]').remove();
		
		//$('[dm-container="pager-sort-bar"]').hide();
		$('[dm-container="shortPager"]').hide();
		$('[dm-container="basePager"]').hide();
		$('[dm-actor="page-curr-item"],[dm-actor="page-item"]').remove();
	};
	
	//构建搜索结果区域
	var queryGrid=null;
	var renderResultZone=function(options){
		if(!queryGrid){
			queryGrid=$.dmGrid({pageRows:opt.pageRows});
		}
		var parseDatas=options.parseDatas;
		$('[dm-container="pager-sort-bar"]').show();
		if(parseDatas && parseDatas.dataList && parseDatas.dataList.length>0){
			$('[dm-container="store-no-goods"]').hide();
			queryGrid.renderTable(options.parseDatas);
			queryGrid.renderPager(options.parseDatas);
		} else {
			//没有数据时显示
			clearResult();
			$('[dm-container="store-no-goods"]').show();
		}
	};	

	//排序处理
	var querySort=function($actor){
		var data=$actor.attr('dm-data');
		var direct=$actor.attr('dm-direct');
			
		var nextDirect='';
		var currClass='';
		var nextClass='';
		if(direct==='desc'){
			nextDirect='asc';
			currClass='top';
			nextClass='bot'
		}else{
			nextDirect='desc';
			currClass='bot';
			nextClass='top'
		}
		
		var $all=$('[dm-actor="query-sort"]');
				
		$('[dm-actor="query-sort"]').removeAttr('dm-sort');
		
		$all.attr('dm-direct','asc');
		$actor.attr('dm-direct',nextDirect);
		$actor.attr('dm-sort','');

		$all.removeClass('sorting_foc');
		$all.find('u').addClass('sorting_'+'bot');
		$actor.find('u').removeClass('sorting_' + direct);	
		$actor.addClass('sorting_foc');
		$actor.find('u').removeClass('sorting_'+'bot');
		$actor.find('u').addClass('sorting_'+nextClass);
		
		//调用搜索
		sortQuery();
	};
	//过滤价格
	var queryPriceFilter=function($actor){
		var minPrice=$('[dm-info="min-price"]').val();
		var maxPrice=$('[dm-info="max-price"]').val();
		
		//调用搜索
		appendConQuery({minPrice:minPrice, maxPrice:maxPrice});
	};

	//翻页
	var initQueryPage=function($actor){
		var pageNum=$actor.attr('dm-data');
		pageQuery({pageStart:pageNum});
	};
	
	var parseResult=function(result){
		var datas=JSON.parse(result.data);
		
		result.parseDatas=datas;
		result.clearOptions={};
		 
		return result;
	};
	
	var fullQuery=function(options){
		var query=renderQuery({queryOption:{catCondItems:true,condItems:false,sort:true,price:true}});
		callService(opt.url,query,{callSuccess:function(result){
			var datas=parseResult(result);
			clearPage({clearPrice:false});
			renderResultZone(datas);
		}});
	};

	//添加搜索条件搜索（需要重新构建搜索条件）
	var appendConQuery=function(options){
		var query=renderQuery(options);
		callService(opt.url,query,{callSuccess:function(result){
			var datas=parseResult(result);

			renderResultZone(datas);
		}});
	};
	//排序搜索（不需要重新构建搜索条件）
	var sortQuery=function(options){
		var query=renderQuery(options);
		callService(opt.url,query,{callSuccess:function(result){
			var datas=parseResult(result);

			renderResultZone(datas);
		}});
	};
	
	//翻页搜索（不需要重新构建搜索条件）
	var pageQuery=function(options){
		var query=renderQuery(options);
		callService(opt.url,query,{callSuccess:function(result){
			var datas=parseResult(result);
			
			renderResultZone(datas);
		}});
	};
	
	//构建检索条件
	var renderQuery=function(options){
		options=options||{};
		options.queryData=options.queryData||{};
		options.queryOption=options.queryOption||{};
		var queryOption={sort:true,price:true};
		
		$.extend(queryOption, options.queryOption);
		
		var queryData={"pageRows":opt.pageRows,"pageStart":1,
				"filterQueryMap":{},"searchText":opt.urlParams['ss']||"","sorts":{}
			};
 		
		queryData.filterQueryMap['store_id']=[opt.storeId];
		
		if(opt.urlParams['st-cat']){
			//如果存在店铺分类
			queryData.filterQueryMap['store_category_id_2']=['*'+opt.urlParams['st-cat']+'*'];
		}
		if(queryOption.sort){
			//排序
			var $sortItem=$('[dm-actor="query-sort"][dm-sort]');
			if($sortItem.length>0){
				var sortType=$sortItem.attr('dm-data');
				var sortDirect=$sortItem.attr('dm-direct');
				
				if(sortType==='default'){
					queryData.sorts['sales_amount']=sortDirect;	
				} else if(sortType==='sale'){
					queryData.sorts['sales_amount']=sortDirect;	
				} else if(sortType==='price'){
					queryData.sorts['item_sales_min_price_mall']=sortDirect;	
				} else if(sortType==='attention'){
					queryData.sorts['sales_score']=sortDirect;	
				} else if(sortType==='new'){
					queryData.sorts['goods_create_date']=sortDirect;	
				}
			}
		}

		if(queryOption.price){
			//价格范围
			var minPrice=$('[dm-info="min-price"]').val();
			var maxPrice=$('[dm-info="max-price"]').val();
			if(minPrice==''){
				minPrice='*';
			}
			if(maxPrice==''){
				maxPrice='*';
			}
			
			if(minPrice !='*' || maxPrice!='*'){
				queryData.filterQueryMap['item_sales_min_price_mall']=['['+minPrice+' TO '+maxPrice+']'];
			}
		}
 
		$.extend(queryData, options);
		var query={condition:''};
		query.condition=JSON.stringify(queryData);

		return query;
	};
	
	//数据表
	$.dmGrid=function(options){
		var pageRows=options.pageRows || 20;
		
		//构建结果列表
		var renderTable=function(options){
			if(!options || !options.dataList){
				return;
			}
			
			$('[dm-container="gd-item"]').remove();
			
			var datas=[];
			$(options.dataList).each(function(){
				var tempData=JSON.parse(this);
				datas.push({
					goodsId:tempData.goods_id
					,goodsName:tempData.goods_name
					,salesMinPrice:tempData.item_sales_min_price_mall
					,marketMaxPrice:tempData.item_market_max_price_mall
					,storeId:tempData.store_id
					,storeName:tempData.store_name
					,goodsPic:tempData.middle_picture_path});
			});

			if(datas.length != 0){
	 			var targetHtml=templates.gd_item_tl(datas);
	 			var $goodsList=$('[dm-container="goods-list"]');	
	 
	 			$goodsList.prepend(targetHtml);
	 			
	 			//获取销量，评价
	 			findGoodsDatas(datas);
				//$('.serchNull').hide();
			}else{
				//显示无数据的默认画面
				$('.serchNull').show();
			}
		};

		//获取商品相关市场数据（销量，评论）
		var findGoodsDatas=function(options){
			$('[dm-info="review-count"]').each(function(){
				var $counter=$(this);
				var goodsId=$counter.attr('dm-data');
				
				if(goodsId){
					callService("/gd/findGoodsScoreNum.ajax", {goodsId:goodsId}, {callSuccess:function(result){
						$counter.html(result);

					}})
				}
			});
			$('[dm-info="deal-count"]').each(function(){
				var $counter=$(this);
				var goodsId=$counter.attr('dm-data');
				
				if(goodsId){
					callService("/gd/getSaleAmountById.ajax", {goodsId:goodsId}, {callSuccess:function(result){
						$counter.html(result);
					}})
				}
			});
		};
		
		var clearPager=function(){		
			var $basePager=$('[dm-container="basePager"]').hide();			
			var shortPager=$('[dm-container="shortPager"]').hide();
			$('[dm-actor="pageItem"]').remove();
		};			
		
		//构建分页
		var renderPager=function(options){
			clearPager();
			if(!options || !options.pagerMap || !options.pagerMap.rows_total 
					|| options.pagerMap.rows_total==0){
				return;
			}
			var $basePager=$('[dm-container="basePager"]').show();
			var shortPager=$('[dm-container="shortPager"]').show();
 			var rowsTotal=parseInt(options.pagerMap.rows_total); 
 			var pageNum=parseInt(options.pagerMap.page_num);
 			
 			if(isNaN(rowsTotal) || rowsTotal<=0 || isNaN(pageNum) || pageNum<=0){
 				//总数或者当前页数不为数字时，跳出页码处理
 				return;
 			}
 			var pageCount=Math.ceil(rowsTotal/pageRows);
 			
 			var prePageNo=(pageNum-1);
 			prePageNo=(prePageNo<=0?1:(pageNum-1));
 			var nextPageNo=(pageNum+1);
 			nextPageNo=(nextPageNo>pageCount?pageCount:(pageNum+1));
 			
 			$('[dm-actor="page-up"]').attr('dm-data', prePageNo);
 			$('[dm-actor="page-down"]').attr('dm-data', nextPageNo);
 			$('[dm-info="pageInfo"]').html(pageNum+'/'+pageCount);
 			
 			var pageItems=createPagerItems(pageNum,rowsTotal,pageCount);//获取页码数组
 			
 			$('[dm-actor="page-item"],[dm-actor="page-curr-item"]').remove();
 			var page_item_tl_html=templates.page_item_tl(pageItems);
 			$('[dm-container="basePager"]').find('[dm-actor="page-down"]').before(page_item_tl_html);
 			$('[dm-actor="page-item"]').each(function(){
 				if($(this).attr('dm-data')==pageNum){
 					$(this).replaceWith('<span dm-actor="page-curr-item">'+pageNum+'</span>');
 				}
 			});
		};

		//计算显示的页码
		var createPagerItems=function(pageNum,rowsTotal,pageCount){
 			var pageItems=[];
 			
 			var curPageGroup=Math.ceil(pageNum/opt.pageCountPerGroup);//当前页所在的组
 			
 			var startPageNum=(curPageGroup-1)*opt.pageCountPerGroup+1;//开始页号
 			
 			//结束页号 
 			var endPageNum=curPageGroup*opt.pageCountPerGroup;
 			endPageNum=(endPageNum>pageCount)?pageCount:endPageNum;
 			
 			for(var i=startPageNum;i<=endPageNum;i++){
 				pageItems.push({pageNum:i,pageLabel:i});
 			}
 			if(endPageNum<pageCount){
 				//入过还不没有到达最后页，则添加一个更多页
 				var morePage={pageNum:endPageNum+1,pageLabel:'...'};
 				if(endPageNum+1==pageCount){
 					morePage.pageLabel=pageCount;
 				}
 				pageItems.push(morePage);
 			}
 			return pageItems;
		};
		
		var api={
			renderTable:renderTable
			,renderPager:renderPager
			,pageRows:pageRows
			,clearPager:clearPager
		};
		
		return api;
	};
	
	
	$('[dm-info="min-price"]').val(opt.urlParams['min']);
	$('[dm-info="max-price"]').val(opt.urlParams['max']);
	initActor();
	fullQuery();
});

 

