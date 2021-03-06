<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<style>
	.content {
        position: absolute;
        right: 0.15rem;
        top: 1.5rem;
        width: 1rem;
        height: 1rem;
        box-sizing: border-box;
	}
</style>
    <div id="JKDiva_1" class="member-list-tab">
      <div class="collection" dm-container="fav-st" dm-data="store">
 <#-- 店铺收藏列表 开始 -->

 <#-- 店铺收藏列表 结束 -->
      </div>
      <div class="clear p-b-20"></div>
    </div>
<script id="fav-st-tl" type="text/x-handlebars-template">
	{{#each this}}
		<div class="collection-shop" dm-container="fav-sto-item" dm-data="{{id}}">
			<a dm-actor="fav-sto-del" dm-data="{{id}}" class="delete" title="删除" >删除</a>
			<a href="${ctx}/fsst/{{storeId}}/top.jhtml">
				{{#if storeLogo}}
					<img src="{{storeLogo}} "  class="bbb">
				{{else}}
					<img src="/resources/img/common/storeUser.jpg" class="bbb">
				{{/if}}
			</a>
			<h3><a href="${ctx}/fsst/{{storeId}}/top.jhtml" class="storeContent-g">{{storeName}}</a></h3>
            <div class="collection-strat">
            	{{#storeLevel supplierType}}{{/storeLevel}}
            	<a href="javascript:javascript:QQtalk('1739073619');" class="consulting favContact" dm-actor="webim-store" dm-data="{{userCode}}">&nbsp;</a>
            </div>
            <div class="contact" onclick="contact(this)">
				<ul>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
            <div class="hiddenpt">
                <div class="leftpart">
                    <div class="icon-left"></div>
                    <span>取消收藏</span>
                </div>
                <a class="rightpart" href="javascript:javascript:QQtalk('1739073619');"  target="_blank">
                    <div class="icon-right"></div>
                    <span>联系客服</span>
                </a>

            </div>
		</div>
	{{/each}}
</script>
<script id="not-favorite" type="text/x-handlebars-template">
<div class="nullA"><img src="${resources}/img/member/null2.png" width="48" height="45" class="left m-t-5">
          <div class="left">
            <P>你还没收藏过商铺哦~~~</P>
            <P>去 <a href="${ctx}/index.jhtml">随便逛逛</a>吧，看看有没有喜欢的~</P>
          </div>
        </div>		
<div class="clear p-b-20"></div>
</script>

<script>
Handlebars.registerHelper("storeLevel",function(param,options){
	var html = '';
	switch(param){
	case '10':/*大*/
		html += '<img title="饭饭大供应商" src="${resources}/basepage/store/default/common_img/store_level_icon_01.png"/>';
	break;
	case '20':/*股*/
		html += '<img title="战略股东供应商" src="${resources}/basepage/store/default/common_img/store_level_icon_02.png"/>';
	break;
	case '30':/*控*/
		html += '<img title="合作共赢供应商" src="${resources}/basepage/store/default/common_img/store_level_icon_03.png"/>';
	break;
	case '40':/*强*/
		html += '<img title="强强联手供应商" src="${resources}/basepage/store/default/common_img/store_level_icon_04.png"/>';
	break;
	case '50':/*亲*/
			html += '<img title="亲密会员供应商" src="${resources}/basepage/store/default/common_img/store_level_icon_05.png"/>';
			break;
			case '60':
			html += '<img title="亲密会员供应商" src="${resources}/basepage/store/default/common_img/store_level_icon_05.png"/>';
break;
	}	
	return html;
})
</script>
</#escape>
</#macro>