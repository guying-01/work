<#--店铺首页-->
<#include "/common/common_var_definds.ftl" />
<#include "/basepage/store/default/hb_templates/store_hb_templates.ftl" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>饭饭1080°直采平台</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
	<script type="text/javascript">
		var deviceWidth = document.documentElement.clientWidth;
		if(deviceWidth>768){
			deviceWidth=768;
		}
		document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
	</script>
	<#import "/basepage/store/default/common/common_link.ftl" as link/>
	<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
	<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
	<#--<#import "/basepage/store/default/common/common_footer.ftl" as footerNoTab/>  进入产品区域没有footer，替换为store-tab-->
	<#import "/basepage/seller/seller_header_search.ftl" as sellerSearch/>
	<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
	<@link.render />
	<!--导入共通样式-->
	<@script.render />
	<!--导入共通脚本-->
    <link rel="stylesheet" href="${resources}/basepage/seller/css/store.css" type="text/css">    
    <script src="${resources}/basepage/seller/js/store_common_head_load.js"></script>
    <script src="${resources}/basepage/seller/js/staticStore.js"></script>
    <script src="${resources}/basepage/seller/js/store_dynamics.js"></script>
    <script src="${resources}/basepage/seller/js/product_dynamics.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="pageInfo" lv1_id="${level1!""}" lv1_name="${name1!""}" lv2_id="${level2!""}" lv2_name="${name2!""}" lv3_id="${level3!""}" lv3_name="${name3!""}" currentPageRes="${resources!''}" isOrderByContractNo="${isOrderByContractNo!''}" style="display: none" store_id="${storeId!''}" store_template_code="${storeTemplateCode!''}" page_id="product"></div><!--页面信息-->
	<!--此处是头部开始-->
<div class="top">
<@header_bar.render "产品大集",""/>
</div>
	<!--此处是头部结束-->
    <!--网页头部&导航开始-->
    <div id="sp_hd_1"></div>
    <div id="sp_hd_2"></div>
    <@sellerSearch.render />
    <div class="line"></div>
	<div class="now_choose_box">
	</div>
	<div class="all-goods-num-box-wrap">
   		<img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg"/>   			
		<div class="all-goods-num-box">
   		</div>
	</div>

    <div id="contentRight-nav">
		<div class="left">
			<a href="javascript:void(0)" class="sorting_foc btn_sort" name="search_sort_default"><i>综合</i></a>
			<a href="javascript:void(0)" class="btn_sort" name="search_sort_sales" order="desc"><i>销量</i><u class=""></u></a>
			<a href="javascript:void(0)" class="btn_sort" name="search_sort_price" order="desc"><i>价格</i><u class=""></u></a>
			<#--<a href="javascript:void(0)" class="btn_sort" name="search_sort_popularity" order="desc"><i>人气</i><u class=""></u></a>-->
			<a href="javascript:void(0)" class="btn_sort" name="search_sort_new" order="desc"><i>新品</i><u class=""></u></a>

		</div>
	</div>
    <div class="line"></div>
    <ul class="product_items"></ul>
    <a class="look_more pro_bt" id="loadmore">加载更多</a>
   <#--<@footerNoTab.render />-->
   <@scrollTop.render />
   <div class="store-tab">
   		<div class="store-tab-category">
   			<i></i>
   			<span>商品分类</span>
   		</div>
   		<div class="store-tab-price">   			
   			<span>价格区间</span>
   			<i></i>
   		</div>    
     </div>
     
     	<div class="category_menu">
	    	<div class="menu_t">
		    	<span>商品分类</span>
		    	<i class="close-menu close-category"></i>
		    </div>
		    <!--<div class="all_category"></div>-->
		    <ul class="category_list">
		    	<li class="all_category">全部分类</li>
		    </ul>
	    </div>
	    
	    <div class="price-menu">
	    	<div class="menu_t">
		    	<span>价格区间</span>
		    	<i class="close-menu close-category"></i>
		    </div>
		    <div class="price-search">
	            <input name="input" type="text" class="price_min" style="font-size: 0.22rem">
	            <span style="font-size: 0.22rem">-</span>
	            <input name="input" style="font-size: 0.22rem" type="text" class="price_max" "="" >
	            <a href="javascript:void(0)" class="small-button">确定</a>
		    </div>
	    </div>
</body>
</html>