<#include "/common/common_var_definds.ftl" />
<#macro render data>
<script src="${resources}/js/lib/jquery/jquery.validate.min.js"></script> 
<script src="${resources}/js/common/validation.js"></script> 
<script src="${resources}/js/ranges/range0005.js"></script>
<script src="${resources}/js/ranges/range0008.js"></script>
<script src="${resources}/js/ranges/range0009.js"></script>
<script src="${resources}/js/ranges/range0010.js"></script>
<script src="${resources}/js/ranges/range0011.js"></script>
<script src="${resources}/js/ranges/range0012.js"></script>
<script src="${resources}/js/ranges/range0013.js"></script>
<script src="${resources}/js/ranges/range0014.js"></script>
<script src="${resources}/js/common/page_design.js"></script>
<script>
$(document).ready(function(){
<#if data??>
	var storeId='${storeId!""}';
	if(storeId){
		$.dmLoadTemplate({'subSystemId':'00','pageId':'page0002','storeId':storeId}); 
	}
</#if>
});
</script>
<!--range0010开始  店铺内搜索-->
<script id="range0010-tl" type="text/x-handlebars-template">
	<div dm-layout-range="range0010" id='range0010' order="{{orders}}">
		<div dm-container="store-search-container" style="display:none;"></div>
	</div>
</script>
<!--range0010结束  店铺内搜索-->

<!--range0014结束  店内商品分类 -->
<script id="range0014-tl" type="text/x-handlebars-template">
	<div dm-layout-range="range0014" id='range0014' order="{{orders}}">
		<div dm-container="store-item-categroy-container" style="display:none;"></div>
	</div>
</script>
<!--range0014结束  店内商品分类-->

<!--range0012开始  店内商品排行 -->
<script id="range0012-tl" type="text/x-handlebars-template">
	<div dm-layout-range="range0012" id='range0012' order="{{orders}}">
		<div dm-actor="store-rank" style="display:none;"></div>
	</div>
</script>
<!--range0012结束  店内商品排行 -->
</#macro>