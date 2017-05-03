<#include "/common/common_var_definds.ftl" />
<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
<title>店内搜索页</title>
<link type="text/css" rel="stylesheet" href="${resources}/css/common/lib.css"/>
<link type="text/css" rel="stylesheet" href="${resources}/css/goods/goods.css"/>
<link type="text/css" rel="stylesheet" href="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.css"/>
<link type="text/css" rel="stylesheet" href="${resources}/css/goods/goods_list.css" />
<style>
.goods-list{ width:auto;}

.goods {
	margin: 0 6px 20px 6px !important;
}

</style>
<script src="${resources}/js/lib/jquery/jquery-1.8.3.js"></script>
<script src="${resources}/js/lib/jquery/jquery.validate.min.js"></script>
<script src="${resources}/js/common/validation.js"></script>
<script src="${resources}/js/lib/handlebars/handlebars-v2.0.0.js"></script>
<script src="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>

<script src="${resources}/js/common/common.js"></script>
<script src="${resources}/js/common/tool.js"></script>
<script src="${resources}/js/common/page_design.js"></script>
<script src="${resources}/js/common/headerbar.js"></script>
<script src="${resources}/js/common/goods_search.js"></script>

<script src="${resources}/js/store/shopbanner.js"></script>

<script src="${resources}/js/common/top_toolbar.js"></script>
<script src="${resources}/js/common/page.js"></script>
<script src="${resources}/js/common/hover.js"></script>
<script src="${resources}/js/common/hideshow.js"></script>
<script src="${resources}/js/goods/other.js"></script>

<script src="${resources}/js/common/scrollTop.js"></script>
<script src="${resources}/js/common/sys_info.js"></script>
<script src="${resources}/js/member/member_api.js"></script>
<script src="${resources}/js/common/activity.js"></script>

<script src="${resources}/js/store/store_goods_search.js"></script>
    <!--[if lt IE 9]>
	<script src="/resources/js/lib/html5/es5-shim.min.js"></script>
	<script  type="text/javascript" src="/resources/js/lib/html5/html5shiv.min.js"></script>
    <![endif]-->
<script>
$(document).ready(function(){
<#if data??>
	var storeId='${storeId!""}';
	if(storeId){
		$.dmLoadTemplate({'subSystemId':'00','pageId':'page0002','storeId':storeId});
	}
</#if>
	$("input:text").focus(function() {
	    $(this).siblings("p").fadeOut()
	});
	$("input").blur(function() {
	    if ($(this).val().length == 0) {
	        $(this).siblings("p").fadeIn()
	    }
	});

});
</script>
</head>
<body>
<#escape x as x?html>
<div id="top_toolbar" dm-container="header-link-nav-container"></div>


	<div class="header">
		<div class="wrapper">
			<h1 class="left">
				<a href="/"><img src="${resources}/img/common/logo.png" /></a>
			</h1>
			<div class="topAnimate">
			<a id="leftLink" target="_blank" href="${Session.url1!''}">
			<img id="leftImg" src=${Session.ad_pic1!''} width="120" height="60"></a>
			</div>
			<div class="search">
				<#--<select id="selectType" onchange="changeShowInfo(this)">
					<option value="byGoods">按商品</option>
					<option value="byStore">按店铺</option>
				</select> --> <input name="searchWord" type="text" value=""
					dm-info="gd-search-word" class="dm-no-auto-clear">
				<p id="showInfo">商品名称/商铺名称</p>
				<a href="javascript:void(0);" dm-actor="gd-search">搜 索</a>
			</div>
			<div class="hot-search" dm-info="gd-hot-search-list"></div>
			<div class="headapp"><a id="rightLink" target="_blank" href="${Session.url2!''}"><img id="rightImg" src=${Session.ad_pic2!''} width="240" height="100"></a></div>
		</div>
	</div>

<!-- 商城搜索 Start -->
<#--<div class="header" dm-container="header-search-container"></div>-->
<!-- 商城搜索 End -->

<div dm-container="header-shopbanner-container"></div>
<div dm-container="header-shopnav-container"></div>

<div class="wrapper">
  <div class="detail-bottom">

	<div class="sorting">
		<div class="left">
			<span>排序方式：</span>
			<a href="javascript:void(0)" class="sorting_foc" dm-actor="query-sort" dm-direct="asc" dm-data="default" dm-sort><i>综合</i><u class="sorting_bot"></u></a>
            <a href="javascript:void(0)" dm-actor="query-sort" dm-direct="asc" dm-data="sale"><i>销量</i><u class="sorting_bot"></u></a>
            <a href="javascript:void(0)" dm-actor="query-sort" dm-direct="asc" dm-data="price"><i>价格</i><u class="sorting_bot"></u></a>
          <#--  <a href="javascript:void(0)" dm-actor="query-sort" dm-direct="asc" dm-data="attention"><i>人气</i><u class="sorting_bot"></u></a>-->
            <a href="javascript:void(0)" dm-actor="query-sort" dm-direct="asc" dm-data="new"><i>新品</i><u class="sorting_bot"></u></a>
            <span>价格区间：</span>
            <input name="input" type="text" class="left text_A dm-no-auto-clear" dm-info="min-price" />
            <span>-</span>
            <input name="" type="text" class="left text_A dm-no-auto-clear" dm-info="max-price" />
            <a href="javascript:void(0)" class="small-button m-l-10 m-t-5" dm-actor="price-filter">确定</a>
		</div>
		<div class="right" dm-container="shortPager" style="display: none;">
			<a href="javascript:void(0)" dm-actor="page-up">上一页</a> <span dm-info="pageInfo">/</span> <a href="javascript:void(0)"
				dm-actor="page-down">下一页</a>
		</div>
	</div>
	<div class="goods-list" dm-container="goods-list">
		<div class="serchNull" dm-container="store-no-goods">
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

		<div class="page clear" dm-container="basePager" style="display: none;">
			<a href="javascript:void(0)" dm-actor="page-up">上一页</a><a href="javascript:void(0)" dm-actor="page-down">下一页</a>
		</div>
		<script id="page-item-tl" type="text/x-handlebars-template">
				{{#each this}}
				<a href="javascript:void(0)" dm-actor="page-item" dm-data="{{pageNum}}" title="{{pageNum}}">{{pageLabel}}</a>
				{{/each}}
		</script>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
</div>
<div class="Related-products">
	<!-- 店内搜索 开始 -->
	<div class="Related-products-div" dm-container="store-goods-search-container"></div>
	<!-- 店内搜索  结束 -->

	<!-- 店铺商品分类 开始 -->
	<div class="Related-products-div" dm-container="store-item-categroy-container" style="display:none;"></div>
	<!-- 店铺商品分类  结束 -->

	<!-- 店铺商品排行 开始 -->
	<div dm-container="store-goods-rank-container" style="display:none;"></div>
	<!-- 店铺商品排行  结束 -->

	<div class="clear"></div>
</div>

<!-- 右侧工具条 Start -->
<script src="${resources}/js/common/hover.js"></script>
<div class="tool">
  <div class="tool-top">
    <div class="tool-tab tool-tabA"><a href="/member/index.jhtml"><i>&nbsp;</i>
      <P><u>&nbsp;</u>个人中心</P>
      </a></div>
    <div class="tool-tab tool-tabB"><em id="shopCtCountEm">0</em><a href="/sc/toList.jhtml"><i>&nbsp;</i>
      <P><u>&nbsp;</u>购物车</P>
      </a></div>
    <div class="tool-tab tool-tabC"><a href="/fav/toList.jhtml"><i>&nbsp;</i>
      <P><u>&nbsp;</u>我的收藏</P>
      </a></div>
    <div class="tool-tab tool-tabE"><a id="setQQ" href="javascript:QQtalk('1739073619');"><i>&nbsp;</i>
      <P><u>&nbsp;</u>平台客服</P>
      </a></div>
    <div class="tool-tab tool-tabD"><i>&nbsp;</i>
      <div class="tool-code"><u></u><img src="${resources}/img/common/code.jpg"> </div>
    </div>
    <div class="tool-scroll"></div>
  </div>
</div>
<!-- 右侧工具条 End -->
<div class="clear"></div>
<#include "/common/fields/field_common_footer.ftl" />
<script src="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${resources}/js/goods/other.js"></script>
</#escape>
</body>
</html>
