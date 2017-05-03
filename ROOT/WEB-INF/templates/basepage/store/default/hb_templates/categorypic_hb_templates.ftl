<!--商品分类页面的Handlebars模板-->

<!--此处是商品分类列表模板开始 id="category_categoryList"-->
<script type="text/x-handlebars-template" id="category_categoryList">
	{{#each lv2_lv3}}
	<li class="cg_{{lv2.id}}">
		<a href="/FSgoodsSearch.jhtml?level1={{../lv1.id}}&name1={{../lv1.name}}&level2={{lv2.id}}&name2={{lv2.name}}">
			<img src="/resources/basepage/store/default/category_navigation/img/cg_{{lv2.id}}.jpg" alt="" />
			<p>{{lv2.name}}</p>
		</a>
	</li>
	{{/each}}

</script>
<!--此处是商品分类列表模板开始 id="category_categoryBrand"--><!--品牌厂家-->
<script type="text/x-handlebars-template" id="category_categoryBrand">
	{{#each this}}
	<li>
		<a href="{{brand_href}}">
			<img src="{{brand_img}}" alt="" />
			<p>{{brand_name}}</p>
		</a>
	</li>
	{{/each}}
</script>
<#--燃料类-->
<script type="text/x-handlebars-template" id="category_fuel">
    {{#each this}}
    <li>
        <a href="{{brand_href}}">
            <img src="{{brand_img}}" alt="" />
            <p>{{brand_name}}</p>
        </a>
    </li>
    {{/each}}
</script>
<#--维修保养-->
<script type="text/x-handlebars-template" id="category_categoryService">
    {{#each this}}
    <li>
        <a href="{{brand_href}}">
            <img src="{{brand_img}}" alt="" />
            <p>{{brand_name}}</p>
        </a>
    </li>
    {{/each}}
</script>
<#--产地直供-->
<script type="text/x-handlebars-template" id="category_categoryDirect">
    {{#each this}}
    <li>
        <a href="{{brand_href}}">
            <img src="{{brand_img}}" alt="" />
            <p>{{brand_name}}</p>
        </a>
    </li>
    {{/each}}
</script>
<#--餐饮名店特色菜-->
<script type="text/x-handlebars-template" id="category_categoryNongJia">
    {{#each this}}
    <li>
        <a href="{{brand_href}}">
            <img src="{{brand_img}}" alt="" />
            <p>{{brand_name}}</p>
        </a>
    </li>
    {{/each}}
</script>
<#--酒店专业装修-->
<script type="text/x-handlebars-template" id="category_hotel_Service">
    {{#each this}}
    <li>
        <a href="{{brand_href}}">
            <img src="{{brand_img}}" alt="" />
            <p>{{brand_name}}</p>
        </a>
    </li>
    {{/each}}
</script>
<#--酒店专业装修-->
<script type="text/x-handlebars-template" id="category_taxExemption">
    {{#each this}}
    <li>
        <a href="{{brand_href}}">
            <img src="{{brand_img}}" alt="" />
            <p>{{brand_name}}</p>
        </a>
    </li>
    {{/each}}
</script>