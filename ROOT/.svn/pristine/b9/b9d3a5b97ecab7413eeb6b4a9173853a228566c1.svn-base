<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<div class="member-list">
<input id="category" value="orderList" type="hidden"/>
<ul class="tabT">
  <li onclick="changeOrderState('','0')" class="on"><span>我的仓库</span></li>
  <#-- <li onclick="changeOrderState('${getConstant('dictionary.ORDER_STATES_INPAY')}','1')"><span>待付款</span></li><!--00
  <li onclick="changeOrderState('${getConstant('dictionary.ORDER_STATES_PAYED')}','1')"><span>待处理</span></li><!--10
  <li onclick="changeOrderState('${getConstant('dictionary.ORDER_STATES_SHIPPED')}','1')"><span>待收货</span></li><!--20
  <li onclick="changeOrderState('${getConstant('dictionary.ORDER_STATES_RECEIPTED')}','1')"><span>待评价</span></li><!--40
   -->
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
<div id="dt_box"></div><#--订单容器-->
<script id="orderList-tl" type="text/x_handlebars_template">
    {{#each this}}
    <div class="dd_box_t">
        <h1 class="caigoudan">采购单号：{{this.0.totalOrderId}}</h1>{{#shopcar_now this.0.totalOrderId}}{{/shopcar_now}}
        <table id="dt" width="97%" border="0" cellspacing="0" cellpadding="0" class="table-line">
            <tr class="bor-l bor-r bor-t" id="orderData">
                <th width="330" colspan="2" valign="middle" scope="col">商品名称</th>
                <th width="100" scope="col">单价（元）</th>
                <th width="100" scope="col">数量</th>
            <#--   <th width="100" scope="col">售后</th> -->
        <th width="120" scope="col">订单实付（元）</th>
    </tr>

    {{#each this}}
   <#-- <tr>

        <td colspan="8" class="table_bgA">
            <!--input type="checkbox" id="checkboxGroup" name="checkboxGroup" onclick="childrenSeclect(this)" 
            value="{{id}}" /-->
            <#-- <p class="left m-r-20">订单编号：<a href="javascript:toOrderDetail('{{id}}');">{{id}}</a></p>
            <p class=" m-r-10"> 下单时间：{{orderDate}}</p>
            <p>
            <a href="/st/{{storeId}}/index.jhtml">{{storeName}}</a>
            <a href="javascript:QQtalk('{{storeQQ}}');" class="consulting" 
            dm-actor="webim-store" dm-data="{{userCode}}">&nbsp;</a></p></td>
    </tr>
-->
    {{#each orderDetailVoList}}
    {{#if isCombination}}
    <tr>
        <td width="100"><a href="/fsgd/{{goodsId}}.jhtml"><img src="{{itemSmallPicturePath}}" width="160" height="160"></a></td>
        <td width="230" class="textalign-l "><a style='width:230px;display:block' href="/fsgd/{{goodsId}}.jhtml">{{goodsName}}</a>
            <p>{{itemName}}</p></td><#-- 商品名称 -->
        <td>{{itemPrice}}</td> <#-- 单价 -->
        <td>{{itemAmount}}</td><#-- 数量 -->
        {{#if size}}
        <td class="bor-l" rowspan="{{size}}">{{saleAfter @index}}</td> <#-- 售后 -->
        {{/if}}
        {{#if hasSpan}}
        <td rowspan="{{rowSpan}}" class="bor-l">{{#orderPay ../../../totalOrderId}}{{/orderPay}}</td><#-- 订单实付 -->
        {{/if}}
    </tr>
    {{else}}
    <tr>
        <td width="100"><a href="/fsgd/{{goodsId}}.jhtml"><img src="{{itemSmallPicturePath}}" width="160" height="160"></a></td>
        <td width="230" class="textalign-l ">
        <a style='width:230px;display:block' href="/fsgd/{{goodsId}}.jhtml">{{goodsName}}</a><#-- 商品名称 -->
            <p>{{itemName}}</p></td>
        <td class="bor-l">{{itemPrice}}</td><#-- 单价 -->
        <td class="bor-l">{{itemAmount}}</td><#-- 数量 -->
    <#-- <td class="bor-l" >{{saleAfter @index}}</td> -->

        {{#if hasSpan}}
        <td rowspan="{{rowSpan}}" class="bor-l">{{#orderPay ../../../totalOrderId}}{{/orderPay}}</td><#-- 实际支付 -->
        {{/if}}
                </tr>
                {{/if}}
                {{/each}}
                {{/each}}
                <tr>
                    <td colspan="8" class="ls_td_br">
                        <span>订单总数：{{#total_order_num this.0.totalOrderId}}{{/total_order_num}}</span>
                        <span>商品总数：{{#total_goods_num this.0.totalOrderId}}{{/total_goods_num}}</span>
                        <b>总计：<i>¥</i>{{#total_price_num this.0.totalOrderId}}{{/total_price_num}}元</b>
                        <div class="clear"></div>
                    </td>
                </tr>

            </table>
        </div>
        {{/each}}
    </script>
  <#-- end -->
  <div id="noData" style="width: 350px; height: 60px;margin: 0 auto;padding:50px 0;display:none">
  <img src="${ctx}/resources/img/member/null1.png" width="51" height="43" class="left">
  <div class="left m-l-10" style="line-height:20px;">
    <P class="font14">你没有采购单哦~~~</P>
    <P class="font14">去 <a href="${ctx}/index.jhtml" class="font-color-b">随便逛逛</a>吧，看看有没有喜欢的~</P>
      </div>
    </div> 
  </div>
       

<div class="allselect" id="allselect" style="display: none; background:#fff;"></div> 
</div>  
<!-延长收货时间-->
<#-- <div class="pop_up cx4">
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
</div> -->
</#escape> 
</#macro>