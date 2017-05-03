<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<div class="wrapper" style="overflow:;">
	<div style="display:none;" dm-container="store-no-goods">
 		没有相关商品
	</div>
	<div class="fan1080_crumbCon" dm-container="serch-cond-crumb">
		<p>所有类目</p>
		<script id="crumb-item-tl" type="text/x-handlebars-template">
			<em />
			<div class="fan1080_category" dm-container="crumb-cat-item" dm-actor="crumb-cat-item" dm-data="{{catGrade}}">
			<a href="javascript:void(0)" dm-info="crumb-cat-item" dm-data-id="{{catId}}" dm-data-name="{{catName}}">{{catName}}</a>
			</div>
		</script>
		<script id="crumb-item-group-tl" type="text/x-handlebars-template">
		    <em />
		    <div class="fan1080_category" dm-container="crumb-cat-item" dm-data="{{catGrade}}">
		      <div class=" fan1080_category_group"><a href="javascript:void(0)" dm-info="crumb-cat-item"  dm-data-id="{{top.catId}}" dm-data-name="{{top.catName}}">{{top.catName}}</a><i>&nbsp;</i></div>	  
		      <ul>
		      	{{#each others}}
		      	<li class="fan1080_category_one" dm-actor="crumb-cat-other-item" dm-data-id="{{catId}}" dm-data-name="{{catName}}" {{#if current}}dm-current{{/if}}>{{catName}}</li>
		        {{/each}}
		      </ul>
		    </div>
		</script>
  	</div>
	<div class="serch_conditions" dm-container="serch-conditions">
		<div class="serch_conditions_ul" style="height: 35px;">
			<div class="serch_conditions_h" dm-container="serch-cond">
				<strong>已选条件：</strong>
				<div class="serch_conditions_select" dm-info="serch-cond-select">&nbsp;
					<script id="cond-item-tl" type="text/x-handlebars-template">
						<p dm-info="cond-item" dm-data-type="{{condType}}" dm-data-id="{{condId}}" dm-data-value="{{condValue}}">
							<span>{{condName}}：{{condValue}}</span>
							<a href="javascript:void(0)" title="取消" dm-actor="cond-del">&nbsp;</a>
						</p>
					</script>
	      			<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="serch_conditions_ul" dm-container="cat-cond" style="overflow-y: hidden;height: 35px;"><strong>商品类目：</strong>
			<ul dm-container="cat-items">
			</ul>
			<script id="cat-item-tl" type="text/x-handlebars-template">
			{{#each this}}
			<li dm-actor="cat-item" dm-data-id="{{catId}}" dm-data-name="{{catName}}"><a href="javascript:void(0)">{{catName}}</a></li>
			{{/each}}
			</script>
			<a href="javascript:void(0)" class="serch_add" dm-actor="cat-show-more" dm-data="less">更多</a>
			<P class="clear"></P>
		</div>
		<div class="serch_conditions_ul" dm-container="brand-cond" style="display:none;"><strong>品牌：</strong>
			<ul dm-container="brand-cond-simple-list" style="overflow-y:hidden;height:30px;">
			</ul>
			<script id="brand-item-tl" type="text/x-handlebars-template">
			{{#each this}}
			<li dm-container="brand-item" dm-actor="brand-item" dm-data-name="{{brandName}}" dm-data-id="{{brandId}}" dm-data-letter="{{brandLetter}}"><a href="javascript:void(0)" dm-data="{{brandId}}">{{brandName}}</a></li>
			{{/each}}
			</script>
			<a href="javascript:void(0)" class="serch_add" dm-actor="brand-show-more" dm-data="less">更多</a>
			<a href="javascript:void(0)" class="serch_more" dm-actor="brand-show-multi" dm-data="single">多选</a>
			<div class="fan1080_search_conditions_model" dm-container="brand-search-conditions">
				<input name="" type="text" class="text_A width300 m-t-5" placeholder="搜索品牌名称" dm-actor="brand-input-item" />
				<div class="fan1080_serch_letter" dm-container="brand-letter-list">
					<P class="fan1080_serch_letter_ofc"><a href="javascript:void(0)" dm-actor="brand-letter-item" dm-data="all">所有品牌</a><i></i></P>
					<script id="brand-letter-item-tl" type="text/x-handlebars-template">
					{{#each this}}
					<p dm-container="brand-letter-item" dm-actor="brand-letter-item" dm-data="{{this}}"><a href="javascript:void(0)">{{this}}</a></p>
					{{/each}}
					</script>
				</div>
				<div class="fan1080_serch_divmore" dm-container="brand-cond-more">
					<div class="fan1080_serch_div" dm-container="brand-single-item-list">
						<script id="brand-single-item-tl" type="text/x-handlebars-template">
						{{#each this}}
						<p dm-container="brand-single-item" dm-actor="brand-single-item" dm-data-name="{{brandName}}" dm-data-id="{{brandId}}" dm-data-letter="{{brandLetter}}"><a href="javascript:void(0)" dm-data="{{brandId}}">{{brandName}}</a></p>
						{{/each}}
						</script>
					</div>
				</div>
				<div class="fan1080_serch_divmore" dm-container="brand-cond-multi-more">
					<div class="fan1080_serch_div" dm-container="brand-multi-item-list">
						<script id="brand-multi-item-tl" type="text/x-handlebars-template">
						{{#each this}}
						<P dm-container="brand-multi-item" dm-data-id="{{brandId}}" dm-data-name="{{brandName}}" dm-data-letter="{{brandLetter}}">
						<input name="" type="checkbox" value="{{brandId}}" dm-actor="brand-multi-item" dm-data-name="{{brandName}}" dm-data-id="{{brandId}}" dm-data-letter="{{brandLetter}}"/><span>{{brandName}}</span></P>
						{{/each}}
						</script>
					</div>
					<div class="fan1080_serch_select">
						<div class="left width70">已选品牌：</div>
						<div class="left width900" dm-container="brand-selected-item-list"> 
							<script id="brand-selected-item-tl" type="text/x-handlebars-template">
							{{#each this}}
							<p dm-container="brand-selected-item" dm-actor="brand-selected-item" dm-data-name="{{brandName}}" dm-data-id="{{brandId}}" dm-data-letter="{{brandLetter}}">
							<input name="" type="checkbox" value="" checked="checked" dm-data="{{brandId}}"/>
							<span>{{brandName}}</span></p>
							{{/each}}
							</script>
						</div>
						<div class="clear"></div>
					</div>
				</div>
		        <div class="fan1080_search_bt" dm-container="brand-cond-multi-more-buttons">
			        <a href="javascript:void(0)" class="small-button" dm-actor="brand-multi-ok" >确 定</a>
			        <a href="javascript:void(0)" class="small-button-greay m-l-10" dm-actor="brand-multi-cancel" >取 消</a></div>
		      	</div>
	      		<P class="clear"></P>
			</div>

			<script id="attr-item-tl" type="text/x-handlebars-template">
				{{#each attrDics}}
			    <div class="serch_conditions_ul" dm-container="attr-cond" dm-data="{{attrId}}" {{#if hide}}style="display:none;"{{/if}}><strong>{{attrName}}：</strong>
			      <ul dm-container="attr-cond-list" >
			      	{{#each attrs}}
			        <li dm-container="attr-item" dm-data-id="{{../attrId}}"><a href="javascript:void(0)" dm-actor="attr-item" dm-data-id="{{../attrId}}" dm-data-name="{{../attrName}}" dm-data-value="{{attrValue}}">{{attrValue}}</a></li>
			        {{/each}}
			      </ul>
			      <P class="clear"></P>
			    </div>
			    {{/each}}
			</script>
			<div class="fan1080_serch_more" dm-container="attr-more">
				<p><span dm-actor="attr-more">更多选项</span><i>&nbsp;</i></p>
			</div>
		</div>
	<div class="sorting">
	    <div class="left"> <span>排序方式：</span>
			<a href="javascript:void(0)" class="sorting_foc" dm-actor="query-sort" dm-direct="asc" dm-data="default" dm-sort><i>综合</i></a>
			<a href="javascript:void(0)" dm-actor="query-sort"  dm-direct="asc" dm-data="sale"><i>销量</i><u class="sorting_bot"></u></a>
			<a href="javascript:void(0)" dm-actor="query-sort" dm-direct="asc" dm-data="price"><i>价格</i><u class="sorting_bot"></u></a>
			<#--<a href="javascript:void(0)" dm-actor="query-sort" dm-direct="asc" dm-data="attention"><i>人气</i><u class="sorting_bot"></u></a>-->
			<a href="javascript:void(0)" dm-actor="query-sort" dm-direct="asc" dm-data="new"><i>新品</i><u class="sorting_bot"></u></a>
			<span>价格区间：</span>
	      	<input name="input" type="text" class="left text_A dm-no-auto-clear" dm-info="min-price"/>
	      	<span>-</span>
	      	<input name="" type="text" class="left text_A dm-no-auto-clear" dm-info="max-price"/>
	      	<a href="javascript:void(0)" class="small-button m-l-10 m-t-5" dm-actor="price-filter">确定</a>
		</div>
	    <div class=" right" dm-container="shortPager" style="display:none;">
		    <a href="javascript:void(0)" dm-actor="page-up">上一页</a>
			<span dm-info="pageInfo">/</span>
			<a href="javascript:void(0)" dm-actor="page-down">下一页</a>
		</div>
	</div>
  	<div class="goods-list" dm-container="goods-list">
  		<div class="serchNull" style="display:none";>
	      <div class="nullA">
	        <img src="${resources}/img/goods/null.png" width="85" height="120" class="left">
			<div class="right">
       		<h3> 根据您输入的关键字没有搜索到相应宝贝～</h3>
	          <p><strong class="font-color-c font14">建议您:</strong></p>
	          <p>1、查看输入的文字是否有误。</p>
	          <p>2、调整关键字。如“饭饭核酸胶囊”改为“饭饭 核酸胶囊”</p>
	        </div>
	      </div>
	    </div>
		<script id="gd-item-tl" type="text/x-handlebars-template">
		{{#each this}}
		<div class="goods" dm-container="gd-item" dm-data="{{goodsId}}">
			<a href="/fsgd/{{goodsId}}.jhtml" class="goodsimg" target="_blank">
			<img src="{{goodsPic}}" width="430" height="430" /></a>
			<p class="goodsprice"><strong>￥{{salesMinPrice}} </strong>
			<u>￥{{marketMaxPrice}}</u></p>
			<h3><a href="/fsgd/{{goodsId}}.jhtml" target="_blank">{{goodsName}}</a></h3>
			<div class="goods_store"><a href="/chat.jtml?store={{storeId}}" target="_blank">
			<img src="${resources}/img/common/consulting.png" width="24" height="22" style="display:none;" dm-actor="webim-store" dm-data="{{storeId}}"/></a>
			<p class="left"><a href="/fsst/{{storeId}}/top.jhtml" target="_blank">{{storeName}} </a></p></div>
			<div class="goods_sum">
			<P class="left">成交：<strong dm-info="deal-count" dm-data="{{goodsId}}">{{dealCount}}</strong></P>
			<!--<P class="right">评价 ：<strong><a href="javascript:void(0)" dm-info="review-count" dm-data="{{goodsId}}">{{reviewCount}}</a></strong></P>-->
			</div>
		</div>
		{{/each}}
		</script>

	  	<div class="page clear" dm-container="basePager" style="display:none;">
	  		<a href="javascript:void(0)" dm-actor="page-up">上一页</a><a href="javascript:void(0)" dm-actor="page-down">下一页</a></div>
			<script id="page-item-tl" type="text/x-handlebars-template">
			{{#each this}}
			<a href="javascript:void(0)" dm-actor="page-item" dm-data="{{pageNum}}" title="{{pageNum}}">{{pageLabel}}</a>
			{{/each}}
			</script>
    		<div class="clear"></div>
  		</div>
</div>
</#escape>
</#macro>