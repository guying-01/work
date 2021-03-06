<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<#macro render data>
    <#escape x as x?html>
    	<@scrollTop.render />
    	<style type="text/css">
    		.everyOrder:after{
    			content: '';
    			clear: both;
    			visibility: hidden;
    			height: 0;
    			display: block;
    		}
			.orderList{
				padding:0;
				margin-bottom: 1.66rem;
			}
			.nomore{
				background:#fff!important;
	            color:#666!important;
			}
			.disnone{
				display: none!important;
			}
			.dd_box_t h1{
				padding:0 0 0 0.15rem;
			}
    	</style>
    <div class="member-list orderList">
        <input id="category" value="orderList" type="hidden"/>
        <ul class="tabT" style="height: 0.8rem;line-height: 0.8rem;position: relative">
            <div id="category-tit" style="position: relative;text-align: center"><a class="goBack" href="javascript:void(0);" onclick="javascript :history.go(-1);"></a><span style="font-size: 0.3rem;font-weight: 600;line-height: 0.8rem">我的仓库</span></div>
            <input type="hidden" id="stateType" value=""/>
            <#--<div class="all" onclick="editBtn()">编辑</div>-->
        </ul>
        <div id="showData" style="background:#fff;">
        <#--<div class="order-serch"  style="display:none;" id="order-serch">-->
        <#--<strong>商品名称：</strong>-->
        <input type="text" name="goodsName" id="goodsName" class="text_A dm-no-auto-clear disnone" maxLength="100"/>
        <#--<strong>下单日期：</strong>-->
       <input  readonly class=" text_A laydate-icon dm-no-auto-clear disnone" id="startDate">
        <#--<span>-</span>-->
        <input  readonly class=" text_A laydate-icon dm-no-auto-clear disnone" id="endDate">
        <#--<a href="javascript:void(0)" onclick="searchOrder(1,1)" class="small-button left m-l-20">查找</a>-->
        <#--<div class="clear"></div>-->
        <input type="hidden" id="orderState" name="length" value="" class="disnone"/>
        <input type="hidden" id="rows" name="length" value="10" class="disnone"/>
        <#--<input type="hidden" id="currentPage" name="currentPage" value="1"/>-->
        <#--</div>-->
        <#-- start -->
            <div id="dt_box"></div>
            <div class="orderMore" onclick="orderMore()" style="display: none">加载更多</div>
        <#--订单容器-->
            <script id="orderList-tl" type="text/x_handlebars_template">
                <#--<div class="select orderSelect">-->
                    <#--<div class="order-button" onclick="mobileAdd()" style="font-size: 0.24rem;">加入购物车</div>      &lt;#&ndash; big-btn &ndash;&gt;-->
                    <#--<div class="selectBox" onclick="allOrder(this)"></div>-->
                    <#--<div class="orderSelectAll" style="font-size: 0.24rem;">全选</div>-->
                <#--</div>-->
                {{#each this}}
                <div class="dd_box_t">
                    <div class="orderNum" order-id="{{this.0.totalOrderId}}">
                        <#--onclick="slide(this)"-->
                        <div class="buyAgain">加入购物车</div>
                        <div class="selectOrderBtn" ></div>
                        <#--onclick="orderBoxSelect(this,event)"-->
                        <h1 class="caigoudan">采购单号：{{this.0.totalOrderId}}</h1>
                    </div>

                    <div class="orderBox">
                        {{#each this}}
                        {{#each orderDetailVoList}}
                    {{#if isCombination}}
                    <div class="everyOrder" style="padding: 0.1rem 0.52rem;">
                    <a href="/fsgd/{{goodsId}}.jhtml" style="float: left;margin-right: 0.2rem;"><img src="{{itemSmallPicturePath}}"></a>
                    <a class="categoryName" style='width:3.5rem;display:block;float: left;white-space: nowrap;overflow: hidden;
                            text-overflow: ellipsis;margin-bottom: 0.2rem;margin-top: 0.1rem;' href="/fsgd/{{goodsId}}.jhtml">{{goodsName}}</a>
                    <span class="orderPrice" style="float: left;"><em style="font-size: 0.27rem">单价:</em>{{itemPrice}}</span>
                    <span class="orderAmount" style="float: right;font-size: 0.27rem">{{itemAmount}}</span>
                    {{#if size}}
                    <div class="bor-l" rowspan="{{size}}">{{saleAfter @index}}</div> <#-- 售后 -->
                    {{/if}}
                    {{#if hasSpan}}
                    <div class="orderPay" rowspan="{{rowSpan}}" class="bor-l">{{#orderPay ../../../totalOrderId}}{{/orderPay}}</div><#-- 订单实付 -->
                    {{/if}}
                    <div class="circle-g"></div>
                    </div>
                    {{else}}
                        <div class="everyOrder" style="padding: 0.1rem 0.52rem;">
                            <a href="/fsgd/{{goodsId}}.jhtml" style="float: left;margin-right: 0.2rem;"><img src="{{itemSmallPicturePath}}"></a>
                            <a class="categoryName" style='width:3.5rem;display:block;float: left;white-space: nowrap;overflow: hidden;
                            	text-overflow: ellipsis;margin-bottom: 0.2rem;margin-top: 0.1rem;' href="/fsgd/{{goodsId}}.jhtml" class="">{{goodsName}}</a><#-- 商品名称 -->
                            <div style="width: 3.5rem;float: left;margin-top: 0.5rem">
                            	<span class="orderPrice" style="float: left;"><em style="font-size: 0.27rem">¥</em>&nbsp;{{itemPrice}}</span>
                            	<span class="orderAmount" style="float: right;font-size: 0.27rem"><em style="font-size: 0.27rem">×</em>{{itemAmount}}</span>
                            </div>	
                            
                            <div class="circle-g"></div>

                        </div>
                    {{/if}}
                        {{/each}}
                        {{/each}}

                    </div>
                </div>
                {{/each}}
            </script>
        <#-- end -->
            <div id="noData" style="display: none">
                <img src="${ctx}/resources/img/member/null1.png" class="left">
                <div class="left m-l-10" style="line-height:20px;">
                    <P class="font14">你没有采购单哦~~~</P>
                    <P class="font14">去<a href="${ctx}/index.jhtml" class="font-color-b">随便逛逛</a>吧，看看有没有喜欢的~</P>
                </div>
            </div>
        </div>
        <div class="allselect" id="allselect" style="display: none; background:#fff;"></div>
    </div>
    </#escape>
</#macro>