/** 检索用Js**/
(function($) {
	$.dmSearch=function(options) {
		var opt={};
		$.extend(opt,$.dmSearch.defaults);
		if(options){
			$.extend(opt,options);
		}
		
		//模板相关模块
		var templates=(function(){
			//-类目面包屑相关模板
			var crumb_item_tl=Handlebars.compile($('#crumb-item-tl').html());
			var crumb_item_group_tl=Handlebars.compile($('#crumb-item-group-tl').html());
			
			//-选中项相关模板
			var cond_item_tl=Handlebars.compile($('#cond-item-tl').html());
			
			//-类目相关模板
			var cat_item_tl=Handlebars.compile($('#cat-item-tl').html());
			
			//-品牌相关模板
			var brand_item_tl=Handlebars.compile($('#brand-item-tl').html());
			var brand_letter_item_tl=Handlebars.compile($('#brand-letter-item-tl').html());
			var brand_single_item_tl=Handlebars.compile($('#brand-single-item-tl').html());		
			var brand_multi_item_tl=Handlebars.compile($('#brand-multi-item-tl').html());
			var brand_selected_item_tl=Handlebars.compile($('#brand-selected-item-tl').html());
			
			//-属性相关模板
			var attr_item_tl=Handlebars.compile($('#attr-item-tl').html());
			
			//-结果数据相关模板
			var gd_item_tl=Handlebars.compile($('#gd-item-tl').html());
			
			var page_item_tl=Handlebars.compile($('#page-item-tl').html());
 
			var definds={
				crumb_item_tl:crumb_item_tl
				,crumb_item_group_tl:crumb_item_group_tl
				,cond_item_tl:cond_item_tl
				,cat_item_tl:cat_item_tl
				,brand_item_tl:brand_item_tl
				,brand_letter_item_tl:brand_letter_item_tl
				,brand_single_item_tl:brand_single_item_tl
				,brand_multi_item_tl:brand_multi_item_tl
				,brand_selected_item_tl:brand_selected_item_tl
				,attr_item_tl:attr_item_tl
				,gd_item_tl:gd_item_tl
				,page_item_tl:page_item_tl
			};
			return definds;
		})();

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
					$('.serchNull').hide();
				}else{
					$('.serchNull').show();
				}
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
		
		//初始化页面
		var initPage=function(options){
			if(opt.urlParams['s'] && opt.urlParams['s'] != ''){
				$('.search').children('p').fadeOut();
				$('[dm-info="gd-search-word"]').val(opt.urlParams['s']);
			}else{
				$('.search').children('p').fadeIn();
			}
			//初始化页面动作处理
			initActor();
		};		
		
		//清除查询条件与结果
		var clearPage=function(options){
			var opt={clearCrumb:false,clearCat:true,clearBrand:true,clearAttr:true
					,clearSort:true,clearPrice:true,clearResult:true};
			if(options){
				$.extend(opt,options);
			}
			if(opt.clearCrumb){
				clearCrumb();
			}
			if(opt.clearCat){
				clearCat();
			}
			if(opt.clearBrand){
				clearBrand();
			}
			if(opt.clearAttr){
				clearAttr();
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
		//清除选中的类目搜索条件区域
		var clearCrumb=function(){
			$('[dm-container="serch-cond-crumb"] em').remove();
			$('[dm-container="crumb-cat-item"]').remove();
		};
		//清除类目搜索条件区域
		var clearCat=function(){
			$('[dm-actor="cat-item"]').remove();
		};
		//清除品牌搜索条件区域
		var clearBrand=function(){
			
		};
		//清除属性搜索条件区域
		var clearAttr=function(){
			$('[dm-info="cond-item"]').remove();
			$('[dm-container="attr-cond"]').remove();
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
			$('[dm-container="gd-item"]').remove();
			
			$('[dm-container="shortPager"]').hide();
			$('[dm-container="basePager"]').hide();
			$('[dm-actor="page-curr-item"],[dm-actor="page-item"]').remove();
		};
		
		//初始化页面中定义的动作
		var initActor=function(options){
			$(document).on('click','[dm-actor]',function(){
				var $actor=$(this);
				var actor=$actor.attr('dm-actor');
				if(actor==='cat-show-more'){
					initCatShowMore($actor);
				}else if(actor==='all-crumb-cat-item'){
					queryAllCatItem($actor);
				}else if(actor==='cat-item'){
					querySelectCatItem($actor);
				}else if(actor==='crumb-cat-item'){
					queryCatItem($actor);
				}else if(actor==='crumb-cat-other-item'){
					queryCatOtherItem($actor);
				}else if(actor==='cond-del'){
					initCondDel($actor);
				}else if(actor==='brand-item'){	
					queryBrandItem($actor);
				}else if(actor==='brand-letter-item'){
					initBrandLetterItem($actor);
				}else if(actor==='brand-single-item'){
					queryBrandSingleItem($actor);
				}else if(actor==='brand-multi-item'){
					initBrandMultiItem($actor);
				}else if(actor==='brand-show-more'){
					initBrandShowMore($actor);
				}else if(actor==='brand-show-multi'){
					initBrandShowMulti($actor);
				}else if(actor==='brand-selected-item'){
					initBrandSelectedItem($actor);
				}else if(actor==='brand-multi-ok'){
					initBrandMultiOk($actor);
				}else if(actor==='brand-multi-cancel'){
					initBrandMultiCancel($actor);
				}else if(actor==='attr-item'){
					querySelectAttrItem($actor);
				}else if(actor==='query-sort'){
					querySort($actor);
				}else if(actor==='price-filter'){
					queryPriceFilter($actor);
				}else if(actor==='page-up' || actor==='page-down' || actor==='page-item'){
					initQueryPage($actor);
				}
			});
			
			//搜索指定名称的品牌
			$('[dm-actor="brand-input-item"]').bind('input propertychange','[dm-actor="brand-input-item"]',function(){
				var searchBrand=$('[dm-actor="brand-input-item"]').val();
				$('[dm-container="brand-single-item"]').hide();
				$('[dm-container="brand-multi-item"]').hide();
				if(searchBrand==''){
					//显示所有的品牌
					$('[dm-container="brand-single-item"]').show();
					$('[dm-container="brand-multi-item"]').show();
				}else{
					$('[dm-container="brand-single-item"]').filter('[dm-data-name*="'+searchBrand+'"]').show();
					$('[dm-container="brand-multi-item"]').filter('[dm-data-name*="'+searchBrand+'"]').show();
				}
			});
		};
		
		//类目相关搜索条件
		var initCatShowMore=function($actor){
		 	var initRowHeight=35;
		 	var $targetContainer=$('[dm-container="cat-cond"]');
		 	var realHeight=$('[dm-container="cat-items"]').height();
		 	realHeight = (realHeight>initRowHeight)?realHeight:initRowHeight;
 
		 	var callShowMore=function($actor){
		 		$targetContainer.height(realHeight + 'px');
		 	};
		 	var callShowLess=function($actor){
		 		$targetContainer.height(initRowHeight);
		 	};
		 	initShowMore($actor,callShowMore,callShowLess);
		};
		//添加选定的类目到搜索条件，并执行搜索
		var queryAllCatItem=function($actor){
			var $catItems=$('[dm-actor="crumb-cat-item"]');
			$catItems.remove();
			
			$('[dm-container="serch-cond-crumb"]').find('em').remove();
			//调用搜索
			fullQuery();
		};
		
		//添加选定的类目到搜索条件，并执行搜索
		var querySelectCatItem=function($actor){
 			var $catItems=$('[dm-actor="cat-item"]');
 			var targetHtml='';
 			var datas;
 			var catGrade=$('[dm-container="crumb-cat-item"]').length+1;
 			if($catItems.length>1){
 				//构建多条记录
 				datas={top:{catId:$actor.attr('dm-data-id'),catName:$actor.attr('dm-data-name')},
 						others:[],catGrade:catGrade};
 				$catItems.each(function(){
 					var $currItem=$(this);
 					var data={catId:$currItem.attr('dm-data-id'),
 							catName:$currItem.attr('dm-data-name')};
 					if($currItem.attr('dm-data-id')===datas.top.catId){
 						data.current=true;
 					}
					datas.others.push(data);
 				});
 				targetHtml=templates.crumb_item_group_tl(datas);
 				
 			}else{
 				//构建单条记录
 				datas={catId:$actor.attr('dm-data-id'),catName:$actor.attr('dm-data-name'),catGrade:catGrade};
 				targetHtml=templates.crumb_item_tl(datas);
 			}
 			var $targetHtml=$(targetHtml);
 			$targetHtml.find('[dm-current]').hide();
 			$('[dm-container="serch-cond-crumb"]').append($targetHtml);
			$catItems.remove();
			
			//调用搜索
			fullQuery();
		};

		//选择类目项目
		var queryCatItem=function($actor){
 			var grade=parseInt($actor.attr('dm-data'));
			
			$('[dm-container="crumb-cat-item"]:gt('+(grade-1)+')').remove();
			$('[dm-container="serch-cond-crumb"] em:gt('+(grade-1)+')').remove();
			
			//调用搜索
			fullQuery();
		};
		
		//选择类目下拉框中的项目
		var queryCatOtherItem=function($actor){
			$actor.siblings('[dm-actor="crumb-cat-other-item"]').andSelf().removeAttr('dm-current').show();
			$actor.attr('dm-current','').hide();
			var $container=$actor.parents('[dm-container="crumb-cat-item"]');
			var grade=parseInt($container.attr('dm-data'));
			var $top=$container.find('[dm-info="crumb-cat-item"]');
			$top.html($actor.attr('dm-data-name'));
			$top.attr('dm-data-id', $actor.attr('dm-data-id'));
			$top.attr('dm-data-name', $actor.attr('dm-data-name'));
			
			$('[dm-container="crumb-cat-item"]:gt('+(grade-1)+')').remove();
			$('[dm-container="serch-cond-crumb"] em:gt('+(grade-1)+')').remove();
			
			//调用搜索
			fullQuery();
		};
		
		//删除查询条件
		var initCondDel=function($actor){
			$actor.parent('[dm-info="cond-item"]').remove();
			appendConQuery();
		};
		//选择首字母
		var initBrandLetterItem=function($actor){
			$('.fan1080_serch_letter_ofc').removeClass();
			$actor.append("<i></i>");
			$('[dm-actor="brand-input-item"]').val('');
			var data=$actor.attr('dm-data');
			if(data==='all'){
				$actor.parent().addClass('fan1080_serch_letter_ofc');
				$('[dm-container="brand-single-item"]').show();
				$('[dm-container="brand-multi-item"]').show();
			}else if(!/[A-Z]/.test(data)){
				$actor.addClass('fan1080_serch_letter_ofc');
				$('[dm-container="brand-single-item"]').hide();
				$('[dm-container="brand-multi-item"]').hide();
				$('[dm-container="brand-single-item"]').each(function(){
					if(!/[A-Z]/.test($(this).attr('dm-data-letter'))){
						$(this).show();
					}
				});
				$('[dm-container="brand-multi-item"]').each(function(){
					if(!/[A-Z]/.test($(this).attr('dm-data-letter'))){
						$(this).show();
					}
				});
			}else {
				$actor.addClass('fan1080_serch_letter_ofc');
				$('[dm-container="brand-single-item"]:not([dm-data-letter="'+data+'"])').hide();
				$('[dm-container="brand-multi-item"]:not([dm-data-letter="'+data+'"])').hide();
				$('[dm-container="brand-single-item"][dm-data-letter="'+data+'"]').show();
				$('[dm-container="brand-multi-item"][dm-data-letter="'+data+'"]').show();
			}
		};
		
		//选择单项品牌
		var queryBrandItem=function($actor){
			var brandId=$actor.attr('dm-data-id');
			var brandName=$actor.attr('dm-data-name');
			
			if(!hasSelectCondItem('brand', brandId)){
				//没有选择过此属性，添加属性项目到选择条件区域
				var targetHtml=templates.cond_item_tl({condType:'brand', condId:brandId,
							condName:'品牌',condValue:brandName});
				$('[dm-info="serch-cond-select"]').find('#cond-item-tl').before(targetHtml);	
			
				$actor.remove();
			}
			
			//调用搜索
			appendConQuery();
		};
		var queryBrandSingleItem=function($actor){
			var brandId=$actor.attr('dm-data-id');
			var brandName=$actor.attr('dm-data-name');
			
			if(!hasSelectCondItem('brand', brandId)){
				//没有选择过此属性，添加属性项目到选择条件区域
				var targetHtml=templates.cond_item_tl({condType:'brand', condId:brandId,
					condName:'品牌',condValue:brandName});
				$('[dm-info="serch-cond-select"]').find('#cond-item-tl').before(targetHtml);	
			
				$actor.remove();
			}
			
			//调用搜索
			appendConQuery();
		};
		//品牌多选
		var initBrandMultiItem=function($actor){
			var brandId=$actor.attr('dm-data-id');
			var brandName=$actor.attr('dm-data-name');
			var brandLetter=$actor.attr('dm-data-letter');
			var $selectedBrands=$('[dm-actor="brand-selected-item"]');
			if($actor.prop('checked')){
				if($('[dm-container="brand-selected-item"][dm-data-id="'+brandId+'"]').length>0){
					//已经选择过了
					return;
				}
				var selectedTargetHtml=templates.brand_selected_item_tl([{brandId:brandId,brandName:brandName,brandLetter:brandLetter}]);
				$('[dm-container="brand-selected-item-list"]').append(selectedTargetHtml)
			} else {
				$('[dm-container="brand-selected-item"][dm-data-id="'+brandId+'"]').remove();
			}
		};
		//品牌相关搜索条件
		var initBrandShowMore=function($actor){
			if($('[dm-container="brand-cond-more"]').css('display')!=='none'
				&& $('[dm-container="brand-cond-multi-more"]').css('display')!=='none'){
				$('[dm-container="brand-cond-multi-more"]').hide();
				$('[dm-container="brand-cond-multi-more-buttons"]').hide();
			}
			initShowMore($actor,function(){
		 		$('[dm-container="brand-cond-simple-list"]').hide();
		 		$('[dm-container="brand-search-conditions"]').show();
			},function(){
		 		$('[dm-container="brand-cond-simple-list"]').show();
		 		$('[dm-container="brand-search-conditions"]').hide();
			});
		};
		
		var initShowMore=function($actor,callShowMore,callShowLess){
			var data=$actor.attr('dm-data');
		 	if(data=='less'){
		 		$actor.attr('dm-data', 'more');
		 		$actor.html('收起');
		 		if(callShowMore){
		 			callShowMore($actor);
		 		}
		 	}else{
		 		$actor.attr('dm-data', 'less');
		 		$actor.html('更多');
		 		if(callShowLess){
		 			callShowLess($actor);
		 		}
		 	}
		};
		//初始化多选
		var initBrandShowMulti=function($actor){
			var data=$actor.attr('dm-data');
			$('[dm-actor="brand-show-more"]').attr('dm-data', 'more');
			$('[dm-actor="brand-show-more"]').html('收起');
		 	if(data=='single'){
		 		$actor.attr('dm-data', 'multi');
		 		$actor.html('单选');
		 		$('[dm-container="brand-cond-simple-list"]').hide();
		 		$('[dm-container="brand-search-conditions"]').show();
		 		$('[dm-container="brand-cond-more"]').hide();
		 		$('[dm-container="brand-cond-multi-more"]').show();
		 		$('[dm-container="brand-cond-multi-more-buttons"]').show();
		 	}else{
		 		$actor.attr('dm-data', 'single');
		 		$actor.html('多选');
		 		$('[dm-container="brand-cond-simple-list"]').hide();
		 		$('[dm-container="brand-search-conditions"]').show();
		 		$('[dm-container="brand-cond-more"]').show();
		 		$('[dm-container="brand-cond-multi-more"]').hide();
		 		$('[dm-container="brand-cond-multi-more-buttons"]').hide();
		 	}
		};	
		//取消品牌多选项目
		var initBrandSelectedItem=function($actor){
			var brandId=$actor.attr('dm-data-id');
			$('[dm-actor="brand-multi-item"][dm-data-id="'+brandId+'"]').prop('checked',false);
			$actor.remove();
		};
		//确定多选品牌
		var initBrandMultiOk=function($actor){
			var brandDatas=[];
			var $selectedBrands=$('[dm-container="brand-selected-item"]');
			
			$($selectedBrands).each(function(){
				var brandId=$(this).attr('dm-data-id');
				var brandName=$(this).attr('dm-data-name');
				if(!hasSelectCondItem('brand', brandId)){
					//没有选择过此属性，添加属性项目到选择条件区域
					var targetHtml=templates.cond_item_tl({condType:'brand', condId:brandId,
								condName:brandName});
					$('[dm-info="serch-cond-select"]').find('#cond-item-tl').before(targetHtml);	
				}
				
			});

			//调用搜索
			appendConQuery();
		};
		//取消多选品牌
		var initBrandMultiCancel=function($actor){
			$('[dm-actor="brand-multi-item"]').prop('checked', false);
			$('[dm-container="brand-selected-item"]').remove();
		};
		
		//选择属性项目
		var querySelectAttrItem=function($actor){
			var attrDicId=$actor.attr('dm-data-id');
			var attrName=$actor.attr('dm-data-name');
			var attrValue=$actor.attr('dm-data-value');
			
			if(!hasSelectCondItem('attr',attrDicId)){
				//没有选择过此属性，添加属性项目到选择条件区域
				var targetHtml=templates.cond_item_tl({condType:'attr', condId:attrDicId,
							condName:attrName,condValue:attrValue});
				$('[dm-info="serch-cond-select"]').find('#cond-item-tl').before(targetHtml);	
			
				$actor.parent('[dm-container="attr-item"][dm-data-id="'+attrDicId+'"]').remove();
			}
			
			//调用搜索
			appendConQuery();
		};

		//
		var getSelectedConDatas=function(){
			var $condItems=$('[dm-info="cond-item"]');
			var datas={attrs:{},brands:{}};
			
			$condItems.each(function(){
				var condType=$(this).attr('dm-data-type');
				if(condType==='attr'){
					datas.attrs[$(this).attr('dm-data-id')]=$(this).attr('dm-data');
				}else if(condType==='brand'){
					datas.brands[$(this).attr('dm-data-id')]=$(this).attr('dm-data');
				}
			});
			return datas;
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
		
		//构建类目搜索条件区域
		var renderCatConds=function(datas){
			var $catConds=$('[dm-container="cat-cond"]');
			var $catItems =$('[dm-container="cat-items"]');
			var $showMore=$('[dm-actor="cat-show-more"]');
			
			$catConds.hide();
			if(datas && datas.facetMap){
				var $crumbCatItems=$('[dm-container="crumb-cat-item"]');
				
				var nextLevel=$crumbCatItems.length+1;
				
				var catIdObj=datas.facetMap['item_category_id_'+nextLevel];
				if(!catIdObj){
					//没有类目相关的数据
					return;
				}	
 
				var catItems=[];
				for(var key in catIdObj){
					catItems.push({catId:key,catName:catIdObj[key].name,catCount:parseInt(catIdObj[key].count)});
				}
 
 				catItems=$.grep(catItems,function(item,i){
 					var result= (item.catCount>0);
 					return result;
 				});
 				
				var targetHtml=templates.cat_item_tl(catItems);
				$('[dm-actor="cat-item"]').remove();

				$catItems.append(targetHtml);			
			}
			
			if($catItems.height()>$catConds.height()){
				$showMore.show();
			} else{
				$showMore.hide();
			}
			$catConds.show();
		};
		
		//品牌相关搜索条件
		var renderBrandConds=function(options){
			$('[dm-container="brand-cond"]').hide();
			$('[dm-container="brand-search-conditions"]').hide();
			
			$('[dm-container="brand-item"]').remove();
			//$('[dm-info="brand-input-item"]').remove();
			$('[dm-container="brand-letter-item"]').remove();
			$('[dm-container="brand-single-item"]').remove();
			$('[dm-container="brand-multi-item"]').remove();
			$('[dm-container="brand-selected-item"]').remove();

			if(!options || !options.facetMap){
				return;
			}
			var brandDatas=[];
			
			var brand = options.facetMap['brand_name'];
			if(!brand){
				//没有品牌相关的数据
				return;
			}	
			
			for(var item in brand){
				var letter=pinyin.getCamelChars(item);
				if(letter && letter.length>0){
					letter=letter[0];
				}
				var brandData={brandId:item,brandName:item,brandLetter:letter};
				
				brandDatas.push(brandData);
			}
			
			if(brandDatas.length==0){
				//没有品牌相关的数据
				return;
			}		

			var letterDatas1={};
			for(var i in brandDatas){
				if(/[A-Z]/.test(brandDatas[i].brandLetter)){
					letterDatas1[brandDatas[i].brandLetter]=brandDatas[i].brandLetter;
				}else{
					letterDatas1['其他']='其他';
				}
			}
			letterDatas=[];
			for(var letter in letterDatas1){
				letterDatas.push(letter);
			}
			letterDatas.sort();
			var $selectedBrands=$('[dm-info="serch-cond-select"]').find('[dm-info="cond-item"][dm-data-type="brand"]');
			if($selectedBrands.length>0){
				//已经选择过品牌
				return;
			}
			
			$('[dm-actor="brand-show-more"]').attr('dm-data', 'less');
			$('[dm-actor="brand-show-more"]').html('更多');
			$('[dm-actor="brand-show-multi"]').attr('dm-data', 'single');
			$('[dm-actor="brand-show-multi"]').html('多选');
			$('[dm-container="brand-cond-simple-list"]').show();

			$('[dm-container="brand-cond"]').show();
			var simpleTargetHtml=templates.brand_item_tl(brandDatas);
			var letterTargetHtml=templates.brand_letter_item_tl(letterDatas);
			var singleTargetHtml=templates.brand_single_item_tl(brandDatas);
			var multiTargetHtml=templates.brand_multi_item_tl(brandDatas);
			var selectedTargetHtml=templates.brand_selected_item_tl(brandDatas);

			//品牌单选项目
			$('[dm-container="brand-cond-simple-list"]').append(simpleTargetHtml);
			$('[dm-container="brand-letter-list"]').append(letterTargetHtml);
			$('[dm-container="brand-single-item-list"]').append(singleTargetHtml);
			$('[dm-container="brand-multi-item-list"]').append(multiTargetHtml);
			//$('[dm-container="brand-selected-item-list"]').append(selectedTargetHtml);
		};
		//属性相关搜索条件
		var renderAttrConds=function(options){
			if(!options.facetMap){
				return;
			}
			
			var selectedCondDatas=getSelectedCondDatas();
			
			var attrDatas={attrDics:[]};

			for(var key in options.facetMap){
				if(key.indexOf('attr_dic_')==0){
					var attrDicItem=options.facetMap[key];
					var attr={attrId:key.substr('attr_dic_'.length),attrs:[]};

					for(var name in attrDicItem){
						attr.attrName=attrDicItem[name].name;
					}
					if(attr.attrName){
						attrDatas.attrDics.push(attr);
					}					
				}
			}
			var attrs={};
			for(var key in options.facetMap){
				if(key.indexOf('attr_value_')==0){
					var attrItems=options.facetMap[key];
					var attrId=key.substr('attr_value_'.length);
					
					var attrData=[];
					
					for(var name in attrItems){
						var count=parseInt(attrItems[name].count);
						if(!isNaN(count) && count>0){
							attrData.push({attrValue:attrItems[name].name});
						}						
					}
					if(attrData.length>0){
						attrs[attrId]=attrData;
					}					
				}
			}
			
			for(var i=0;i<attrDatas.attrDics.length;i++){
				var attrDic=attrDatas.attrDics[i];
				
				attrDic.attrs=attrs[attrDic.attrId];
			}
			
			attrDatas.attrDics=$.grep(attrDatas.attrDics,function(attrDic,i){
				if(attrDic.attrs){
					attrDic.attrs=$.grep(attrDic.attrs,function(attr,i){
						return !selectedCondDatas.exist('attr',attrDic.attrId,attr.attrValue);
					});
					
					return (attrDic.attrs.length>0);
				} else {
					return false;
				}
			})

			var targetHtml=templates.attr_item_tl(attrDatas);
			$('[dm-container="attr-cond"]').remove();

			$('[dm-container="serch-conditions"]').append(targetHtml);		
			initSearchMore();
		};
		// 筛选条件超过5个隐藏
		var initSearchMore=function(){
			if (($(".serch_conditions").children(".serch_conditions_ul").length) > 5) {
				$(".fan1080_serch_more p").show()
				$(".serch_conditions>.serch_conditions_ul:eq(4)")
								.nextAll(".serch_conditions_ul").hide()
				if (($(".serch_conditions>.serch_conditions_ul:eq(4)").nextAll(
						".serch_conditions_ul").is(":hidden"))) {
					$(".fan1080_serch_more p span").text("更多选项")
				} else {
					$(".fan1080_serch_more p span").text("收起")
				}
			} else {
				$(".fan1080_serch_more p").hide()
			}
		}
		// 搜索类型下拉列表渲染
		var renderSelectZone = function(){
			var selectType = getCookie("selectType");
			if(selectType == 'byGoods'){
				$("#selectType option[value='byGoods']").attr("selected", true);
			}else{
				$("#selectType option[value='byStore']").attr("selected", true);
			}
			removeCookie('selectType');
		};
		//翻页
		var initQueryPage=function($actor){
			var pageNum=$actor.attr('dm-data');
			pageQuery({pageStart:pageNum});
		};
		
		//构建搜索条件区域
		var renderQueryZone=function(options){
			// 搜索类型下拉列表渲染
			//renderSelectZone();
			renderCatConds(options.parseDatas);
			renderBrandConds(options.parseDatas);			
			renderAttrConds(options.parseDatas);		
		};
		
		//构建搜索结果区域
		var queryGrid=null;
		var renderResultZone=function(options){
			if(!queryGrid){
				queryGrid=$.dmGrid({pageRows:opt.pageRows});
			}
			queryGrid.renderTable(options.parseDatas);
			queryGrid.renderPager(options.parseDatas);
		};	
 
		var parseResult=function(result){
			var datas=JSON.parse(result.data);
			
			result.parseDatas=datas;
			result.clearOptions={};
			
			console.log(result);
			return result;
		};
		
		//构建选定类目
		var buildSelectCatItem=function(){
 			var targetHtml='';
 			var $crumbCatItem=$('[dm-container="crumb-cat-item"]');
			
			//构建单条记录
			var itemCat;
			for(var i=1;i<4;i++){
				itemCat=opt.urlParams['itemCat'+i];
				if(itemCat){
					var itemCatId=itemCat.split(':')[0];
					var itemCatName=itemCat.split(':')[1];
					var itemData={catId:itemCatId,catName:itemCatName,catGrade:i};
					
					//显示类目面包屑
					targetHtml=templates.crumb_item_tl(itemData);
					var $targetHtml=$(targetHtml);
					$targetHtml.find('[dm-current]').hide();
					$('[dm-container="serch-cond-crumb"]').append($targetHtml);
				}
			}
		};
		
		//重新搜索（通过url参数构建搜索条件）
		var urlParamsQuery=function(options){
			//var checkValue=$("#selectType").val();
			//setCookie('selectType',checkValue,'10');
			var query=renderQueryByUrl({queryOption:{catCondItems:true,condItems:true,sort:true,price:false}});
			buildSelectCatItem();
			callService(opt.url,query,{callSuccess:function(result){
				var datas=parseResult(result);
				clearPage();
				renderQueryZone(datas);
				renderResultZone(datas);
			}});
		};
		//重新搜索（需要重新构建【搜索关键词】外的搜索条件）
		var fullQuery=function(options){
			//var checkValue=$("#selectType").val();
			//setCookie('selectType',checkValue,'10');
			var query=renderQuery({queryOption:{catCondItems:true,condItems:false,sort:true,price:false}});
			callService(opt.url,query,{callSuccess:function(result){
				var datas=parseResult(result);
				clearPage();
				renderQueryZone(datas);
				renderResultZone(datas);
			}});
		};
		//翻页搜索（不需要重新构建搜索条件）
		var pageQuery=function(options){
			//var checkValue=$("#selectType").val();
			//setCookie('selectType',checkValue,'10');
			var query=renderQuery(options);
			callService(opt.url,query,{callSuccess:function(result){
				var datas=parseResult(result);
				renderResultZone(datas);
			}});
		};
		//添加搜索条件搜索（需要重新构建搜索条件）
		var appendConQuery=function(options){
			//var checkValue=$("#selectType").val();
			//setCookie('selectType',checkValue,'10');
			var query=renderQuery(options);
			callService(opt.url,query,{callSuccess:function(result){
				var datas=parseResult(result);
				renderQueryZone(datas);
				renderResultZone(datas);
			}});
		};
		//排序搜索（不需要重新构建搜索条件）
		var sortQuery=function(options){
			//var checkValue=$("#selectType").val();
			//setCookie('selectType',checkValue,'10');
			var query=renderQuery(options);
			callService(opt.url,query,{callSuccess:function(result){
				var datas=parseResult(result);
				renderResultZone(datas);
			}});
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
		
		var getSelectedCondDatas=function(){
			var $conds=$('[dm-info="cond-item"]');
			
			var datas={};
			$conds.each(function(){
				var $this=$(this);
				var condType=$this.attr('dm-data-type');
				var condId=$this.attr('dm-data-id');
				var condValue=$this.attr('dm-data-value');
				
				datas[condType]=datas[condType]||{};
				datas[condType][condId]=datas[condType][condId]
					||{condType:condType,condId:condId,condValue:condValue};
			});
			
			var selectedCondDatas={datas:datas,exist:function(condType,condId,condValue){
				var result=true;
				if(!datas[condType]){
					result=false;
				} else if(!datas[condType][condId]){
					result=false;
				} else if(condType==='attr' && datas[condType][condId].condValue!==condValue){
					result=false;
				}
				return result;
			}};
			return selectedCondDatas;
		};
		
		//检查是否选择了指定的搜索条件
		var hasSelectCondItem=function(condType,condId){
			var $conds=$('[dm-info="cond-item"][dm-data-type="'+condType+'"][dm-data-id="'+condId+'"]');
 
			return ($conds.length>0);
		};
		
		//构建检索条件(仅通过url参数)
		var renderQueryByUrl=function(options){
			options=options||{};
			options.queryData=options.queryData||{};
			options.queryOption=options.queryOption||{};
			var queryOption={catCondItems:true,condItems:true,sort:true,price:true};
			
			$.extend(queryOption, options.queryOption);
			
			var queryData={"pageRows":opt.pageRows,"pageStart":1,
					"filterQueryMap":{},"searchText":opt.urlParams['s']||"","sorts":{}
				};
			
			if(queryOption.catCondItems){
				//类目搜索key
				for(var i=1;i<4;i++){
					if(opt.urlParams['itemCat'+i]){
						var urlParam=opt.urlParams['itemCat'+i];
						queryData.filterQueryMap['item_category_id_'+i]=[urlParam.split(':')[0]];
					}
				}				
			}
 
			$.extend(queryData, options);
			var query={condition:''};
			query.condition=JSON.stringify(queryData);
			return query;
		};
		
		//构建检索条件
		var renderQuery=function(options){
			options=options||{};
			options.queryData=options.queryData||{};
			options.queryOption=options.queryOption||{};
			var queryOption={catCondItems:true,condItems:true,sort:true,price:true};
			
			$.extend(queryOption, options.queryOption);
			
			var queryData={"pageRows":opt.pageRows,"pageStart":1,
					"filterQueryMap":{},"searchText":opt.urlParams['s']||"","sorts":{}
				};
			
			if(queryOption.catCondItems){
				//类目搜索key
				$('[dm-info="crumb-cat-item"]').each(function(i){
					queryData.filterQueryMap['item_category_id_'+(i+1)]=[$(this).attr('dm-data-id')];
				});
			}
			
			if(queryOption.condItems){
				//选择条件Key(品牌)
				$('[dm-info="cond-item"][dm-data-type="brand"]').each(function(i){
					queryData.filterQueryMap['brand_name']=queryData.filterQueryMap['brand_name']||[];
					queryData.filterQueryMap['brand_name'].push($(this).attr('dm-data-id'));
				});
				//选择条件Key(商品)
				$('[dm-info="cond-item"][dm-data-type="attr"]').each(function(i){
					queryData.filterQueryMap['attr_dic_'+$(this).attr('dm-data-id')]=['*'];
					queryData.filterQueryMap['attr_value_'+$(this).attr('dm-data-id')]=[$(this).attr('dm-data-value')];
				});
			}
			
			if(queryOption.sort){
				//排序
				var $sortItem=$('[dm-actor="query-sort"][dm-sort]');
				if($sortItem.length>0){
					var sortType=$sortItem.attr('dm-data');
					var sortDirect=$sortItem.attr('dm-direct');

					if(sortType==='sale'){
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
		var api={
			initPage:initPage
			,clearPage:clearPage
			,initActor:initActor
			,renderQueryZone:renderQueryZone
			,renderResultZone:renderResultZone
			,fullQuery:fullQuery
			,pageQuery:pageQuery
			,appendConQuery:appendConQuery
			,sortQuery:sortQuery
			,urlParamsQuery:urlParamsQuery
		};
		
		return api;
	};
	//全局默认值
	$.dmSearch.defaults={				
		url:'/goodsSearch.ajax'//发送搜索请求
		,urlParams:$.dm.getUrlParams()//url传递的参数
		,pageRows:20//每页默认的商品数量
		,pageCountPerGroup:15//默认的显示页数
	};	

})(jQuery);

$(document).ready(function(){
	//初始化页面
	var dmSearch=$.dmSearch();
	dmSearch.initPage();
	dmSearch.urlParamsQuery();
});


function setCookie(name, value, iDay){
	var oDate=new Date();
	oDate.setDate(oDate.getDate()+iDay);
	document.cookie=name+'='+encodeURIComponent(value)+';expires='+oDate;
}

function getCookie(name){
	var arr=document.cookie.split('; ');
	var i=0;
	for(i=0;i<arr.length;i++)
	{
		var arr2=arr[i].split('=');
		if(arr2[0]==name)
		{	
			var getC = decodeURIComponent(arr2[1]);
			return getC;
		}
	}
	return '';
}

function removeCookie(name){
	setCookie(name, '1', -1);
}