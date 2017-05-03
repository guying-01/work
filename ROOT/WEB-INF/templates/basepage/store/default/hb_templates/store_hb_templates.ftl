<!--此处是商铺信息模板开始 id="store_storeInfo"-->
<script type="text/x-handlebars-template" id="store_storeInfo">
	<#--<a class="goBack" onclick="window.history.back()"></a>-->
	<div class="favStore">收藏商铺</div>
    <div class="store-info-box">
    	<div class="store-name-box">
    		<span class="store-name">{{storeName}}</span>
    		<span class="store-level">{{#storeLevel supplierTypeCode}}{{/storeLevel}}</span>
    	</div>
    	<ul>
            <li>
               	描述&nbsp;{{storeScore}}
            </li>
            <li>
                
               	服务&nbsp;{{storeServiceCredit}}
            </li>
            <li>
                
               	价格&nbsp;{{storePriceCredit}}
            </li>
        </ul>
	</div>
</script>

<!--此处是商铺信息模板开始 id="store_qq"-->
<script type="text/x-handlebars-template" id="store_qq">
		<li onclick="">
			<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin={{qq}}&amp;site=qq&amp;menu=yes">联系客服</a>
		</li>
</script>
