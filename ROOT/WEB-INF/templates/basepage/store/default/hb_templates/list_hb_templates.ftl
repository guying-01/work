<!--商品展示页面的Handlebars模板-->

<!--此处是商品广告模板开始 id="list_goodsList_ads"-->
<script type="text/x-handlebars-template" id="list_goodsList_ads">
	{{#goodsAds this}}
	<div class="contentRight-List">
		<div class="contentRight-List-Left">
			<div class="contentRight-List-img">
				<a href="/fsgd/{{goods_id}}.jhtml?lv3Id=${level3!''}">
					<img class="lazy" data-original="{{item_pic}}" />
				</a>
			</div>
			<a class="goodsCollect" goods_id="{{goods_id}}" store_id="{{store_id}}"><img class="lazy" src="${resources}/basepage/store/default/list_pages/img/collect32.jpg" />
				<p>收藏</p>
			</a>
			<#if lockStatus?? && lockStatus !=0>
				<div class="addShoppingCar">
					<span href="####" class="shoppingCarText" style="color:#b1191a">加入购物车</span>
					<div class="shoppingCarIcon">
						<span>账户未激活</span>
					</div>
				</div>
				<#else>
					<a class="addShoppingCar" amount="1" goodsId="{{goods_id}}" goodsName="{{goods_name}}" itemId="{{item_id}}" itemName=" {{item_name}}" pic="{{item_pic}}" storeId=" {{store_id}}" storeName="{{store_name}}"><img class="lazy" src="${resources}/basepage/store/default/list_pages/img/shoppingcar.png" />
						<p>加入购物车</p>
					</a>
			</#if>
		</div>
		<a  href="/fsgd/{{goods_id}}.jhtml?lv3Id=${level3!''}">
			<div class="contentRight-List-Right">
				<table cellspacing="0" cellpadding="0" class="contentRight-List-Right-table">
					<tr>
						<td class="goodsDecoration">品名</td>
						<td class="goodsDecoration2" title="{{goods_name}}">{{goods_name}}</td>
					</tr>
					<tr>
						<td class="goodsDecoration">生产企业</td>
						<td class="goodsDecoration2" title="{{goods_manufacturer}}">{{goods_manufacturer}}</td>
					</tr>
					<tr>
						<td class="goodsDecoration">饭饭单价</td>
						<td class="goodsDecoration1" title="{{showPrice item_saleprice}}">{{showPrice item_saleprice}}</td>
						<td class="goodsDecoration">规格</td>
						<td class="goodsDecoration1" title="{{item_guige}}">{{item_guige}}</td>
					</tr>
					<tr>
						<td class="goodsDecoration">产地</td>
						<td class="goodsDecoration1" title="{{goods_place}}">{{goods_place}}</td>
						<td class="goodsDecoration">送达时间</td>
						<td class="goodsDecoration1">
							<img style="width: 0.8rem;height: 0.4rem;margin-top: 0.04rem;" src="{{#deliverTime prepare_goods_day prepare_goods_time}}{{/deliverTime}}"/>

						</td>
					</tr>
					<tr>
						<td class="goodsDecoration">商品等级</td>
						<td class="goodsDecoration2" title="{{item_level_name}}">{{item_level_name}}</td>
					</tr>
					<tr>
						<td class="goodsDecoration">产品描述</td>
						<td class="goodsDecoration2" title="{{goods_description}}">{{goods_description}}</td>
					</tr>

					<tr>
						<td class="goodsDecoration">供应区域</td>
						<td class="goodsDecoration1" title="{{dilevery_area}}">全市</td>
						<td class="goodsDecoration">本日活动</td>
						<td class="goodsDecoration1" title="{{promotion}}">{{promotion}}</td>
					</tr>
				</table>
			</div>
		</a>
	</div>
	{{/goodsAds}}
</script>

<!--此处是商品展示模板开始 id="list_goodsList_main"-->
<script type="text/x-handlebars-template" id="list_goodsList_main">
	{{#each this.dataList}}
	<div class="contentRight-List">
		<div class="contentRight-List-Left">
			<div class="contentRight-List-img">
                <a  href="/fsgd/{{goods_id}}.jhtml?lv3Id=${level3!''}">
				    <img class="lazy" data-original="{{item_pic}}" />
                </a>
			</div>
				<a class="goodsCollect" goods_id="{{goods_id}}" store_id="{{store_id}}"><img class="lazy" src="${resources}/basepage/store/default/list_pages/img/collect32.jpg" />
					<p>收藏</p>
                </a>

		<#--<div class="see-details">查看详情</div>-->
			<#if lockStatus?? && lockStatus !=0>
				<div class="addShoppingCar">
					<span href="####" class="shoppingCarText" style="color:#b1191a">加入购物车</span>
					<div class="shoppingCarIcon">
						<span>账户未激活</span>
					</div>
				</div>
				<#else>
					<a class="addShoppingCar" amount="1" goodsId="{{goods_id}}" goodsName="{{goods_name}}" itemId="{{item_id}}" itemName=" {{item_name}}" pic="{{item_pic}}" storeId=" {{store_id}}" storeName="{{store_name}}"><img class="lazy" src="${resources}/basepage/store/default/list_pages/img/shoppingcar.png" />
						<p  style="color:#b1191a">加入购物车</p>
					</a>
			</#if>
		</div>
		<a  href="/fsgd/{{goods_id}}.jhtml?lv3Id=${level3!''}">
			<div class="contentRight-List-Right">
				<table cellspacing="0" cellpadding="0" class="contentRight-List-Right-table">
					<tr>
						<td class="goodsDecoration">品名</td>
						<td class="goodsDecoration2" title="{{goods_name}}">{{goods_name}}</td>
					</tr>
					<tr>
						<td class="goodsDecoration">生产企业</td>
						<td class="goodsDecoration2" title="{{goods_manufacturer}}">{{goods_manufacturer}}</td>
					</tr>
					<tr>
						<td class="goodsDecoration">饭饭单价</td>
						<td class="goodsDecoration1" title="{{showPrice item_saleprice}}">{{showPrice item_saleprice}}</td>
						<td class="goodsDecoration">规格</td>
						<td class="goodsDecoration1" title="{{item_guige}}">{{item_guige}}</td>
					</tr>
					<tr>
						<td class="goodsDecoration">产地</td>
						<td class="goodsDecoration1" title="{{goods_place}}">{{goods_place}}</td>
						<td class="goodsDecoration">送达时间</td>
						<td class="goodsDecoration1">
							<img style="width: 0.8rem;height: 0.4rem;margin-top: 0.03rem;" src="{{#deliverTime prepare_goods_day prepare_goods_time}}{{/deliverTime}}"/>
						</td>
					</tr>
					<tr>
						<td class="goodsDecoration">本日活动</td>
						<td class="goodsDecoration2" title="{{promotion}}">{{promotion}}</td>
					</tr>
					<tr>
						<td class="goodsDecoration">产品描述</td>
						<td class="goodsDecoration2" title="{{goods_description}}">{{goods_description}}</td>
					</tr>

					<tr>
						<td class="goodsDecoration">供应区域</td>
						<td class="goodsDecoration1" title="{{dilevery_area}}">全市</td>
						<td class="goodsDecoration">商品等级</td>
						<td class="goodsDecoration1" title="{{item_level_name}}">{{item_level_name}}</td>
					</tr>
				</table>
			</div>
		</a>
	</div>
	{{/each}}
</script>

