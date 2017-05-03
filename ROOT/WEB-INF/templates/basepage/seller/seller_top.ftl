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
	<#import "/basepage/store/default/common/common_footer.ftl" as footerNoTab/>
	<#import "/basepage/seller/seller_header_search.ftl" as sellerSearch/>
	<@link.render />
	<!--导入共通样式-->
	<@script.render />
	<!--导入共通脚本-->
	<script type="text/javascript" src="${resources}/js/common/common.js"></script>	
    <link rel="stylesheet" href="${resources}/basepage/seller/css/store.css" type="text/css">    
    <script src="${resources}/basepage/seller/js/store_common_head_load.js"></script>
    <script src="${resources}/basepage/seller/js/staticStore.js"></script>
    <script src="${resources}/basepage/seller/js/store_dynamics.js"></script>
</head>
<body>
<div id="pageInfo" store_id="${storeId!''}" store_template_code="${storeTemplateCode!''}" page_id="index" style="display: none"></div>
	<!--此处是头部开始-->
<div class="top">
<@header_bar.render "商铺",""/>
</div>
	<!--此处是头部结束-->
    <!--网页头部&导航开始-->
    <div id="sp_hd_1"></div>
    <div id="sp_hd_2"></div>
    <@sellerSearch.render />
   <div class="range range1">
   		<ul>
   		</ul>
   </div>
      <div class="range range2">
   		<ul>
   		</ul>
   </div>
      <div class="range range3">
   		<ul>
   			
   		</ul>
   </div>
   <a class="look_more" href="/fsst/${storeId!""}/product.jhtml">查看更多商品</a>
   <div id="static_box"></div>
   <@footerNoTab.render />
</body>
</html>
