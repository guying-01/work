<#macro render data>
<#escape x as x?html>
<div class="member-list m-t-20 orderMember">
    <ul class="tabT">
      <li onclick="recentGoods(1)" dm-container="guessInterested" class="on" ><span>同类商品</span></li>
      <li onclick="recentGoods(2)" dm-container="recentFav"><span>最近收藏的</span></li>
      <li onclick="recentGoods(3)" dm-container="recentFootprint"><span>最近浏览的</span></li>
    </ul>
    <input id="recentType" value="1" type="hidden"/>
    <div id="JKDivb_0" class="member-list-tab" dm-container="relativeGoods">
      
    </div>
  </div>
</div>
<script id="guessInterested" type="text/x-handlebars-template">
	{{#each this}}
	<div class="goods"><a href="/fsgd/{{id}}.jhtml" target="_blank" ><img src="{{picturePath}}"/></a>
		<h3><a href="/fsgd/{{id}}.jhtml" target="_blank" class="goodsName-g">{{name}}</a></h3>
		<p class="goodsprice"><strong class="left"><b>￥</b>{{salesMinPrice}} </strong></p>
	</div>
	{{/each}}
	<div class="clear"></div>
</script>

<script id="recentFav" type="text/x-handlebars-template">
	{{#each this}}
	<div class="goods" dm-actor="recentFav"><a href="/fsgd/{{goodsId}}.jhtml" value="{{goodsId}}" target="_blank"><img src="{{goodsPic}}"/></a>
		<h3><a href="/fsgd/{{goodsId}}.jhtml" target="_blank" class="goodsName_g">{{goodsName}}</a></h3>
		<p class="goodsprice"><strong class="left"><b>￥</b>{{salesPrice}} </strong></p>
	</div>
	{{/each}}
	<div class="clear"></div>
</script>

<script id="recentSearch" type="text/x-handlebars-template">
	{{#each this}}
	<div class="goods" dm-actor="recentSearch"><a href="/fsgd/{{id}}.jhtml" value="{{id}}" target="_blank"><img src="{{goodsPic}}"/></a>
		<h3><a href="/fsgd/{{id}}.jhtml" target="_blank">{{name}}</a></h3>
		<p class="goodsprice"><strong class="left"><b>￥</b>{{minSalesPrice}} </strong></p>
	</div>
	{{/each}}
	<div class="clear"></div>
</script>
<script id="sc-it-disable-tl" type="text/x-handlebars-template">
 
</script> 

</#escape>
</#macro>