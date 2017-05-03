<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<#macro render data>
    <#escape x as x?html>
    	<@scrollTop.render />
    	<style type="text/css">
    		.line{
    			width: 100%;
    			border-top: 1px solid #d8d8da;
    		}
    		.orderMore{
			    display: block;
			    height: 0.6rem;
			    line-height: 0.6rem;
			    text-align: center;
			    color: #fff;
			    font-size: 0.26rem;
			    background: #d01202;
    		}
			.nomore{
				background:#fff!important;
	            color:#666!important;
			}

			#noData:after{
				content: '.';
				clear: both;
				visibility: hidden;
				height: 0;
				display: block;
			}
			#noData img{
				width:0.51rem ;
				height: 0.43rem;
				margin-top: 0.13rem;
			}
			#noData p,#noData a{
				font-size: 0.24rem;
			}
            .all_order_tit i {
                display: inline-block;
                height: 100%;
                width: 6%;
                float: left;
                background: url("${resources}/img/member/goBack.png") no-repeat center center;
                background-size: contain;
                margin-left: 0.1rem;
            }
            .member-list .all_order_tit li span {
                display: inline-block;
                float: left;
                text-align: center;
                width: 82%;
            }
    </style>
    <div class="member-list account">
        <input id="category" value="orderList" type="hidden"/>
        <ul class="tabT all_order_tit">
            <li onclick="changeOrderState('','0','0')" ><i onClick="javascript :history.back(-1);"></i><span style="color: black;border-right: none">所有采购单</span></li>
            <input type="hidden" id="stateType" value=""/>
        </ul>
        <div id="showData" style="background:#fff;">
            <div class="order-serch"  style="display:none;" id="order-serch">
                <strong>商品名称：</strong>
                <input type="text" name="goodsName" id="goodsName" class="text_A dm-no-auto-clear" maxLength="100"/>
                <strong>下单日期：</strong>
                <input  readonly class=" text_A laydate-icon dm-no-auto-clear" id="startDate">
                <span>-</span>
                <input  readonly class=" text_A laydate-icon dm-no-auto-clear" id="endDate">
                <a href="javascript:void(0)" onclick="searchOrder(1,1)" class="small-button left m-l-20">查找</a>
                <div class="clear"></div>

                <input type="hidden" id="orderState" name="length" value=""/>
                <input type="hidden" id="rows" name="length" value="10"/>
                <input type="hidden" id="currentPage" name="currentPage" value="1"/>
            </div>
        <#-- start -->
            <div id="dt_box" businessed='${businessed?c !'系统错误'}' n_time='${SystemTime!"获取系统时间错误！"}'></div><#--订单容器-->
            <script id="orderList-tl" type="text/x_handlebars_template">
                {{#each this}}
                <div class="dd_box_t accountOrder">
                    <div class="accountTitle">
                        <h1 class="caigoudan">采购单号：{{this.0.totalOrderId}}</h1>
                        <div class="line"></div>
                        {{#pay_now this.0.totalOrderId this.0.tradeAttr1}}{{/pay_now}}
                    </div>
                    <div  id="dt"class="accountContent">

                        {{#each this}}

                            <div class="everyOrderTitle">
                                <!--input type="checkbox" id="checkboxGroup" name="checkboxGroup" onclick="childrenSeclect(this)"
                                value="{{id}}" /-->
                                <p class="left m-r-20 float-no">订单编号：<a href="javascript:toOrderDetail('{{id}}');">{{id}}</a></p>
                                <p class=" m-r-10"> 下单时间：{{orderDate}}</p>
                                <p>
                                    商铺名称：<a href="/fsst/{{storeId}}/top.jhtml">{{storeName}}</a>
                                    <#--<a href="javascript:QQtalk('{{storeQQ}}');" class="consulting"-->
                                       <#--dm-actor="webim-store" dm-data="{{userCode}}">&nbsp;</a>-->
                                </p>
                                {{#show_tradeAsynNotifyTime tradeAsynNotifyTime}}{{/show_tradeAsynNotifyTime}}
                                {{#show_payStatus payStatus}}{{/show_payStatus}}
                                <a class="font-color-c look_order_detail" href="javascript:toOrderDetail('{{id}}')">查看订单详情</a>
                            </div>

                        {{#each orderDetailVoList}}
                    <#--组合废弃了-->
                        {{#if isCombination}}
                        <#--<tr>-->
                            <#--<td width="1000"><a href="/fsgd/{{goodsId}}.jhtml"><img src="{{itemSmallPicturePath}}" width="160" height="160"></a></td>-->
                            <#--<td width="230" class="textalign-l "><a style='width:230px;display:block' href="/fsgd/{{goodsId}}.jhtml">{{goodsName}}</a>-->
                                <#--<p>{{itemName}}</p></td>&lt;#&ndash; 商品名称 &ndash;&gt;-->
                            <#--<td>{{itemPrice}}</td> &lt;#&ndash; 单价 &ndash;&gt;-->
                            <#--<td>{{itemAmount}}</td>&lt;#&ndash; 数量 &ndash;&gt;-->
                            <#--{{#if size}}-->
                        <#--&lt;#&ndash;<td class="bor-l" rowspan="{{size}}">{{saleAfter @index}}</td> &lt;#&ndash; 售后 &ndash;&gt;&ndash;&gt;-->
                            <#--{{/if}}-->
                            <#--{{#if hasSpan}}-->
                            <#--<td rowspan="{{rowSpan}}" class="bor-l">{{#orderPay ../../../totalOrderId}}{{/orderPay}}</td>&lt;#&ndash; 订单实付 &ndash;&gt;-->
                            <#--<td rowspan="{{rowSpan}}" class="bor-l">{{#orderState ../../../totalOrderId}}{{/orderState}}</td>&lt;#&ndash; 订单状态 &ndash;&gt;-->
                        <#--&lt;#&ndash;<td rowspan="{{rowSpan}}" class="bor-l">{{#orderDone ../../../totalOrderId}}{{/orderDone}}</td>&lt;#&ndash; 操作 &ndash;&gt;&ndash;&gt;-->
                            <#--{{/if}}-->
                        <#--</tr>-->
                        {{else}}
                        <div class="accountEveryOrder">
                            <a href="/fsgd/{{goodsId}}.jhtml" class="goods_pic"><img src="{{itemSmallPicturePath}}" width="160" height="160"></a>
                            <div class="textalign-l accountGoodsName">
                                <a style='display:block' href="/fsgd/{{goodsId}}.jhtml">{{goodsName}}</a><#-- 商品名称 -->
                                <p style="margin-top: 0.1rem;">{{itemName}}</p>
                            </div>
                            <div class="price_and_num">
                            	 <div class="accountGoodsPrice"><em>¥</em>&nbsp;{{itemPrice}}</div><#-- 单价 -->
                            	<div class="accountGoodsNum"><em>×</em>{{itemAmount}}</div><#-- 数量 -->
                            </div>                           
                        <#--<td class="bor-l" >{{saleAfter @index}}</td>-->

                            {{#if hasSpan}}
                            <#--<td rowspan="{{rowSpan}}" class="bor-l">{{#orderPay ../../../totalOrderId}}{{/orderPay}}</td>&lt;#&ndash; 实际支付 &ndash;&gt;-->
                            <div rowspan="{{rowSpan}}" class="accountOrderState">{{#orderState ../../../totalOrderId}}{{/orderState}}</div><#-- 状态 -->
                        <#--<td rowspan="{{rowSpan}}" class="bor-l">{{#orderDone ../../../totalOrderId}}{{/orderDone}}&lt;#&ndash;{{saleAfter @index}}&ndash;&gt;</td>&lt;#&ndash; 操作 &ndash;&gt;-->
                            {{/if}}
                        </div>
                        {{/if}}
                        {{/each}}
                        {{/each}}
                        <#--<tr>-->
                            <#--<td colspan="8" class="ls_td_br">-->
                                <#--<span>订单总数：{{#total_order_num this.0.totalOrderId}}{{/total_order_num}}</span>-->
                                <#--<span>商品总数：{{#total_goods_num this.0.totalOrderId}}{{/total_goods_num}}</span>-->
                                <#--<b>总计：<i>¥</i>{{#total_price_num this.0.totalOrderId}}{{/total_price_num}}元</b>-->
                                <#--<div class="clear"></div>-->
                            <#--</td>-->
                        <#--</tr>-->

                    </div>
                </div>
                {{/each}}
            </script>
        <#-- end -->
            <div id="noData" style="width: 5rem;margin: 0 auto;padding:0.5rem 0;display:none">
                <img src="${ctx}/resources/img/member/null1.png" class="left">
                <div class="left m-l-10">
                    <P>您还没有采购单哦~~~</P>
                    <P>去 <a href="${ctx}/index.jhtml" class="font-color-b">随便逛逛</a>吧，看看有没有喜欢的~</P>
                </div>
            </div>
        </div>

		<div class="orderMore orderListMore" onclick="orderMore(this)">加载更多</div>
        <div class="allselect" id="allselect" style="display: none; background:#fff;height: 0.3rem;padding:0;"></div>
    </div>
    <div style="height: 0.87rem;"></div>
    <!-延长收货时间-->
    <div class="pop_up cx4">
        <div class="pop_up_A pop_up_C">
            <h2><a href="javascript:void(0);" class="shut"><img src="${resources}/img/common/shutB.png"></a>延长收货时间</h2>
            <div class="pop_bg">
                <div class="pop_note"><span class="font14">您要将本次交易的确认收货时间延长
  			<input type="hidden" id="strid" value=""/>
  			<select id="sel" name="code" class="m-l-10 m-r-10">
                <option value="00">3</option>
            </select>
 				 天</span>
                </div>
                <div class="pop_up_button">
                    <a href="javascript:void(0);" class="small-button" onclick="saveExtendReceive();" >确 定</a>
                    <a href="javascript:void(0);" class="small-button-greay m-l-20 shut" onclick="clo()">取 消</a>
                </div>
            </div>
        </div>
    </div>
    </#escape>
</#macro>