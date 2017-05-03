<!--商品分类页面的Handlebars模板-->

<!--此处是商品分类列表模板开始 id="category_categoryList"-->
<script type="text/x-handlebars-template" id="category_categoryList">
    <a class="page_yiji_title" href="/page1/{{lv1.id}}.jhtml?name1={{lv1.name}}">{{lv1.name}}</a>
    <div class="page_yiji_title_b">
        <dl>
            {{#each lv2_lv3}}
            <dt><a <#--href="/page2/{{lv2.id}}.jhtml?name2={{lv2.name}}&level1={{../lv1.id}}&name1={{../lv1.name}}"-->>{{lv2.name}}</a></dt>
            <dd>
                {{#each lv3}}
                <a <#--href="/FSgoodsSearch.jhtml?level1={{../../lv1.id}}&name1={{../../lv1.name}}&level2={{../lv2.id}}&name2={{../lv2.name}}&level3={{this.id}}&name3={{this.name}}"-->>{{this.name}}</a>
                {{/each}}
            </dd>
            {{/each}}
        </dl>
    </div>
</script>

<!--此处是品牌厂家模板开始 id="category_categoryBrand"-->
<script type="text/x-handlebars-template" id="category_categoryBrand">
	<a class="page_yiji_title" href="/page1/307_00000000000000379_gic.jhtml?name1=品牌厂家">品牌厂家</a>
	<div class="page_yiji_title_b">
	    <dl>
            {{#each this}}
            <dt><a <#--href="{{brand_href}}"-->>{{brand_name}}</a></dt>
            <dd></dd>
            {{/each}}
        </dl>

	</div>
</script>
<!--此处是产地直供模板开始 id="category_categoryDirect"-->
<script type="text/x-handlebars-template" id="category_categoryDirect">
	<a class="page_yiji_title" href="/page1/307_00000000000000374_gic.jhtml?name1=产地直供#tab0">产地直供</a>
	<div class="page_yiji_title_b">
	    <dl>
            {{#each this}}
            <dt><a <#--href="{{brand_href}}"-->>{{brand_name}}</a></dt>
            <dd></dd>
            {{/each}}
        </dl>

	</div>
</script>

<!--此处是餐饮名店特色菜模板开始 id="category_categoryBrand"-->
<script type="text/x-handlebars-template" id="category_categoryNongJia">
	<a class="page_yiji_title" href="/others/comingSoon_3th.jhtml">餐饮名店特色菜</a>
	<div class="page_yiji_title_b">
	    <dl>
            {{#each this}}
            <dt><a <#--href="{{brand_href}}"-->>{{brand_name}}</a></dt>
            <dd></dd>
            {{/each}}
        </dl>

	</div>
</script>
<#--维修保养 id="category_categoryService"-->
<script type="text/x-handlebars-template" id="category_categoryService">
    <a class="page_yiji_title" href="/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab0">维修保养</a>
    <div class="page_yiji_title_b">
        <dl>
            {{#each this}}
            <dt><a <#--href="{{brand_href}}"-->>{{brand_name}}</a></dt>
            <dd></dd>
            {{/each}}
        </dl>
    </div>
</script>
<#--酒店专业装修 id="category_categoryService"-->
<script type="text/x-handlebars-template" id="category_hotel_Service">
    <a class="page_yiji_title" href="/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab0">酒店专业装修</a>
    <div class="page_yiji_title_b">
        <dl>
            {{#each this}}
            <dt><a <#--href="{{brand_href}}"-->>{{brand_name}}</a></dt>
            <dd></dd>
            {{/each}}
        </dl>
    </div>
</script>
<!--此处是进口免税模板开始 id="category_categoryBrand"-->
<script type="text/x-handlebars-template" id="category_taxExemption">
	<a class="page_yiji_title" href="####">进口免税</a>
	<div class="page_yiji_title_b">
	    <dl>
            {{#each this}}
            <dt><a <#--href="{{brand_href}}"-->>{{brand_name}}</a></dt>
            <dd></dd>
            {{/each}}
        </dl>
	</div>
</script>
