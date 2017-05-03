<#include "/common/common_var_definds.ftl" />
<#macro render>
 <div class="search">
	<i></i>
	<input type="text" class="search_input1" placeholder="在商铺内搜索" autocomplete="off">
	<div class="search_button_local_store">搜索</div>
</div>
<script type="text/javascript">
   	$(".search_input1").on("focus",function(){
   		$(this).val("");
   		$(".search_button_local_store").fadeIn();
   	}) 
   	
   	$(".search_input1").on("blur",function(){
   		$(".search_button_local_store").fadeOut();
   	})
	$(".search_button_local_store").on("click", function () {
        var keyword = html_encode($(".search_input1").val().replace(new RegExp("(onclick|onfocus|<|>)+","g"),""));
        var url = window.location.href;
        url = url.substring(url.indexOf("fsst")-1,url.indexOf("jhtml")+5)
        if(url != "/fsst/${storeId!''}/product.jhtml"){
        	location.href = "/fsst/${storeId!''}/product.jhtml?keyword=" + encodeURIComponent(keyword);
        }        
    });
</script>
</#macro>