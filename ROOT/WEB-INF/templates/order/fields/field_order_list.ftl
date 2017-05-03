<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<#macro render data>
<#escape x as x?html>
	<@scrollTop.render />
	<style type="text/css">
		.od_store_info_box{
			padding:0.1rem;
			/*background: #f8f8f8;*/
			border-bottom: 1px solid #dcdcdc;			
		}
		.od_store_info_box span{
			display: block;
			width: 100%;
			font-size: 0.22rem;
			line-height: 0.34rem;
			box-sizing: border-box;
		}
		.ff_button_unc.cx1{
			width: auto;
			border-radius: 0.1rem;
			padding:0 0.1rem;
		    height: 0.7rem;
		    background: #f88c0e;
		    text-align: center;
		    color: #fff;
		    font-size: 0.2rem;
		    line-height: 0.7rem;
		    margin-bottom: 0.05rem;
		    margin-right: 15px;
		}
	    .nomore{
			background:#fff!important;
            color:#666!important;
		}
		/*.dd_box_t{
			margin-bottom: 0.2rem;
		}*/
        .member-list .tabT .on span{
            height:100%;
        }
	</style>

<div class="member-list">
<input id="category" value="orderList" type="hidden"/>
   <div class="myOrderTitle"><a class="goBack" href="/member/index.jhtml"></a>我的采购单</div>
<ul class="tabT mobileMyOrderTabt">
  <li onclick="changeOrderState('','0','0')" class="on"><span>我的采购单</span></li>
    <li onclick="changeOrderState('${getConstant('dictionary.ORDER_STATES_INPAY')}','1','1')"><span>待付款</span></li><!--00-->
    <li onclick="changeOrderState('${getConstant('dictionary.ORDER_STATES_NOT_RECEIPTED')}','1','2')"><span>处理中</span></li><!--1020-->
<#--<li onclick="changeOrderState('${getConstant('dictionary.ORDER_STATES_SHIPPED')}','1')"><span>待收货</span></li><!--20&ndash;&gt;-->
    <li onclick="changeOrderState('${getConstant('dictionary.ORDER_STATES_SCORE_NO')}','2','3')"><span>待评价</span></li><!--40-->
  <input type="hidden" id="stateType" value=""/>
</ul>
<div id="showData" style="background:#fff;">
    <p id="payAllEnable" style="display: none"><a href='javascript:void(0)' onclick='orderPaymentAll()' class=''>全部支付</a></p>
    <p id="payAllDisable" style="display: none"><a href='javascript:void(0)' class=''>全部支付</a><span>当前时间点不允许交易，欲知详情请联系客服</span></p>
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
            <div class="dd_box_t">
                <div class="orderNum" onclick="slide(this)">
                    <div class="sanjiao"></div>
                    <div class="selectOrderBtn" onclick="orderBoxSelect(this,event)"></div>
                    <h1 class="caigoudan">采购单号：{{this.0.totalOrderId}}</h1>
                </div>
                <div class="orderBox">
                    {{#each this}}
                    {{#each orderDetailVoList}}
                {{#if isCombination}}
                    <div class="everyOrder everyOrderList">
                    <a href="/fsgd/{{goodsId}}.jhtml"><img src="{{itemSmallPicturePath}}" width="160" height="160"></a>
                    <a  class="categoryName" href="/fsgd/{{goodsId}}.jhtml">{{goodsName}}</a>
                    <span><em>单价:</em>{{itemPrice}}</span>
                    <span>{{itemAmount}}</span>
                    {{#if size}}
                    <div class="bor-l" rowspan="{{size}}">{{saleAfter @index}}</div> <#-- 售后 -->
                    {{/if}}
                    {{#if hasSpan}}
                    <#--<div  rowspan="{{rowSpan}}" class="bor-l orderPay">{{#orderPay ../../../totalOrderId}}{{/orderPay}}</div>&lt;#&ndash; 订单实付 &ndash;&gt;-->
                    <#--<div rowspan="{{rowSpan}}" class="bor-l  mobileOrderPay">{{#orderState ../../../totalOrderId}}{{/orderState}}</div>&lt;#&ndash; 订单状态 &ndash;&gt;-->
                    <#--<div rowspan="{{rowSpan}}" class="bor-l">{{#orderDone ../../../totalOrderId}}{{/orderDone}}</div>&lt;#&ndash; 操作 &ndash;&gt;-->

                    {{/if}}
                        <a class="order_state_btn" href="javascript:toOrderDetail('{{orderId}}');">查看订单详情</a>

                    </div>
                {{else}}
                    <div class="everyOrder everyOrderList">
                        <a href="/fsgd/{{goodsId}}.jhtml" class="goods_pic"><img src="{{itemSmallPicturePath}}" width="160" height="160"></a>
                        <a class="categoryName"  href="/fsgd/{{goodsId}}.jhtml" class="">{{goodsName}}</a><#-- 商品名称 -->
                        <div class="price_num_box">
                        	 <span class="orderPrice"><em style="font-size: 0.26rem;">¥</em>&nbsp;{{itemPrice}}</span>
                        	<span class="orderAmount"><em style="font-size: 0.26rem;">×</em>{{itemAmount}}</span>
                        </div>                       
                        {{#if size}}
                        <div class="" rowspan="{{size}}">{{saleAfter @index}}</div> <#-- 售后 -->
                        {{/if}}

                        {{#if hasSpan}}
                        <#--<div rowspan="{{rowSpan}}" class="orderPay">{{#orderPay ../../../totalOrderId}}{{/orderPay}}</div>&lt;#&ndash; 订单实付 &ndash;&gt;-->
                        <!--<div  rowspan="{{rowSpan}}" class="mobileOrderDo">{{#orderDone ../../../totalOrderId}}{{/orderDone}}</div>-->
                        {{/if}}
                        <div  rowspan="{{rowSpan}}" class="mobileOrderState">{{#orderState ../../totalOrderId}}{{/orderState}}</div><#-- 订单状态 -->
                        {{#orderDone ../../totalOrderId}}{{/orderDone}}	<#-- 操作 -->
                        <a class="order_state_btn" href="javascript:toOrderDetail('{{orderId}}');">查看订单详情</a>

                    </div>
                {{/if}}
                    <#--{{debug this}}-->
                    {{/each}}
                    <#--<form action="/order/toPayFromOrder.jhtml" id="toPayForm" name="toPayForm" method="post"> <input type="hidden" id="orderIds" name="orderIds" value={{id}}><input type="hidden" id="money" name="money" value={{goodsMoney}}><input type="hidden" id="showHeadBranchInfo" name="showHeadBranchInfo" value="0"></form>-->
                    {{/each}}
                </div>
            </div>
            <div class="addShopCar">{{#pay_now this.0.totalOrderId this.0.tradeAttr1}}{{/pay_now}}</div>
            {{/each}}
            <div class="orderMore orderListMore" onclick="orderMore(this,event)">加载更多</div>
    </script>
  <#-- end -->
  <div id="noData" style="width: 350px;	height: 60px;margin: 0 auto;padding:50px 0;display:none">
  <img src="${ctx}/resources/img/member/null1.png" width="51" height="43" class="left">
  <div class="left m-l-10" style="line-height:20px;">
    <P class="font14">你没有采购单哦~~~</P>
    <P class="font14">去 <a href="${ctx}/index.jhtml" class="font-color-b">随便逛逛</a>吧，看看有没有喜欢的~</P>
      </div>
    </div>
  </div>
    <div class="allselect" id="allselect" style="display: none; background:#fff;"></div>
    <div class="orderListFill"></div>
</div>
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
<div id="totalOrderDiv" style="display:none"></div>
<div class="zhao" style="width: 100%;height: 800px;position: fixed;z-index: 9999;background: black;color: #fff;top: 0;left: 0;text-align: center;line-height: 10rem;font-size: 0.3rem;display: none;opacity: 0.5">加载中</div>
</#escape>
</#macro>
