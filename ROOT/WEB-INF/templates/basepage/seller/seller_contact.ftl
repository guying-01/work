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
	<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
	<#import "/basepage/seller/seller_header_search.ftl" as sellerSearch/>
	<@link.render />
	<!--导入共通样式-->
	<@script.render />
	<!--导入共通脚本-->
    <link rel="stylesheet" href="${resources}/basepage/seller/css/store.css" type="text/css">
    <link rel="stylesheet" href="${resources}/basepage/seller/css/seller_contact.css" type="text/css">
    <script src="${resources}/basepage/seller/js/store_common_head_load.js"></script>
    <script src="${resources}/basepage/seller/js/staticStore.js"></script>
    <script src="${resources}/basepage/seller/js/store_dynamics.js"></script>
    <!--联系商家地图加载start-->
<script src="${resources}/basepage/seller/js/about_lxsj_map.js"></script>
<script>
$(function() {
    var SP = {
    lng: 121.592797,
    lat: 38.921021

  }
    $.mapObj({
        mapWrap: "mapContainer",
        x: SP.lng,
        y: SP.lat,
        features:[{
            type: "Marker",
            name: "辽宁省大连市沙河口区鞍山路106号新长兴西一门旁四楼",
            color: "red", icon: "flg",
            offset: {x: -12, y: -26},
            lnglat: {lng: SP.lng, lat: SP.lat}
        }]
    });
});
</script>

</head>
<body>
<div id="pageInfo" lv1_id="${level1!""}" lv1_name="${name1!""}" lv2_id="${level2!""}" lv2_name="${name2!""}" lv3_id="${level3!""}" lv3_name="${name3!""}" currentPageRes="${resources!''}" isOrderByContractNo="${isOrderByContractNo!''}" style="display: none" store_id="${storeId!''}" store_template_code="${storeTemplateCode!''}" page_id="product"></div><!--页面信息-->
	<!--此处是头部开始-->
<div class="top">
<@header_bar.render "联系我们",""/>
</div>
	<!--此处是头部结束-->
    <!--网页头部&导航开始-->
    <div id="sp_hd_1"></div>
    <div id="sp_hd_2"></div>
    <@sellerSearch.render />
    <div id="mainMsg">
      <div class="main">
      <div class="contact_msg"></div>
      <div class="addr">
        <span class="my_addr">平台地址：<p>辽宁省大连市沙河口区鞍山<br>路106号新长兴西一门旁四楼</p></span>
        <span>平台网址：<p>http://www.fan1080.com/</p></span>
        <span class="wechat">平台微信公众号： <span class="twoCode"></span></span>
      </div>
      <!--高德地图容器开始-->
      <div id="wrap" class="my-map">
          <div id="mapContainer"></div>
      </div>
      <!--高德地图容器结束-->
      </div>
    </div>

<@footer.render />
<script>
    $(document).ready(function () {
        $('.contentSeller').css('color', '#d01202');
    });
</script>
</body>
</html>
