<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<div class="member-list-tab p-t-20">
        <div class="m-a p-t-40">
          <div class="payment-page">	
	<#if returnType == "${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
		<div class="progress_three progress_A" style="display:show;">
	      <p class="progress_textA font-color-b">采购商申请退款</p>
	      <p class="progress_textB">商家处理退款申请</p>
	      <p class="progress_textC">完成</p>
		</div>
    <#else>
		<div class="progress_five  progress_A" >
	      <p class="progress_textA  font-color-b">采购商申请退货</p>
	      <p class="progress_textB ">商家处理退货申请</p>
	      <p class="progress_textC ">采购商退货给卖家</p><br />
	      <p class="progress_textD">商家确认收货并处理退款</p>
	      <p class="progress_textE">完成</p>
		</div>
    </#if>
<#if returnOrderDetailForm??>
	<#if returnType == "${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
    <h2 class="member-tit"> <i>&nbsp;</i>退款信息</h2>
    <#else>
    <h2 class="member-tit"> <i>&nbsp;</i>退货信息</h2>
    </#if>
    <div class="orderdedetail">
      <ul class="order-information">      	
	    <input  type="hidden" value="${returnOrderStateMap['orderStateName'].code!''}" id="stateId"/>
	    <input  type="hidden" value="${returnOrderDetailForm.returnOrderForm.returnReason!}" id="returnReasonId"/>
	    <input  type="hidden" value="${returnType}" id="returnType"/>
      	<input type="hidden" id="returnOrderId" value="${returnOrderDetailForm.returnOrderForm.id!}"/>
        <li ><span class="left" style=" margin-left:24px;">商家：${userCode!''}</span><a href="javascript:QQtalk('1739073619');" class="consulting"  dm-actor="webim-store" dm-data="${userCode!''}"><i></i>联系客服</a></a></li>
        <li>申请时间：${returnOrderDetailForm.returnOrderForm.applyDate?string('yyyy-MM-dd HH:mm:ss')!}</li>
        <#if returnType == "${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
        <li>退款商品：</li>
        <#else>
        <li>退货商品：</li>
        </#if>
        <div class="refund-goods"> <a href="/gd/${returnOrderDetailForm.goodsId!}.jhtml"><img src="${returnOrderDetailForm.itemSmallPicturePath!}" width="50" height="50" /></a>
          <P><a href="/gd/${returnOrderDetailForm.goodsId!}.jhtml">${returnOrderDetailForm.goodsName!}</a>${(returnOrderDetailForm.itemName!'')?replace(returnOrderDetailForm.goodsName!'','','f')}</P>
        </div>
        <li>退款类型：${returnTypes}</li>
        <li class="width435">退款金额：<strong class="font-color-d" id="returnMoney">${returnOrderDetailForm.returnOrderForm.returnMoney?string("0.00")!}</strong> 元 </li>
        
        <#if returnType == "${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
        <li id="returnReason">退款商品数量：<#if returnAmount??>${returnAmount}</#if></li>
        
        <li id="returnReason">退款原因：${returnReason}</li>
        <#else>
        <li id="returnReason">退货商品数量：<#if returnAmount??>${returnAmount}</#if></li>
        <li id="returnReason">退货原因：${returnReason}</li>
        </#if>
        <li>订单编号：<a href="javascript:toOrderDetail('${returnOrderDetailForm.returnOrderForm.orderId!}')">${returnOrderDetailForm.returnOrderForm.orderId!}</a></li>
        <li></li>
	        <input type="hidden" id="goodsShippingStateId" value="${returnOrderDetailForm.returnOrderForm.goodsShippingStateId!}"/>
	        <input type="hidden" id="billId" value="${returnOrderDetailForm.returnOrderForm.billId!}"/>
	        <input type="hidden" id="shippingCompanyName" value="${returnOrderDetailForm.returnOrderForm.shippingCompanyName!}"/>
	        <input type="hidden" id="returnMoney" value="${returnOrderDetailForm.returnOrderForm.returnMoney!}"/>
	        <input type="hidden" id="memo" value="${returnOrderDetailForm.returnOrderForm.memo!}"/>
        <#if returnType == "${getConstant('dictionary.RETURN_ORDER_TYPE_10')}">
        	<div id="shippingDiv">
		        <li>商品状态：${returnOrderDetailForm.returnOrderForm.goodsShippingStateId!}</li>
		        <li>运单编号：<a href="javascript:void(0);">${returnOrderDetailForm.returnOrderForm.billId!}</a></li>
		        <li>物流公司：${returnOrderDetailForm.returnOrderForm.shippingCompanyName!}</li>
        	<div>
        </#if>
      </ul>
      <div class="clear"></div>
    </div>
 <#if returnType=="${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
	<h2 class="member-tit"> <i>&nbsp;</i>退款状态</h2>
	<div class="orderdedetail">
      <h3>退款当前状态：${returnOrderStateMap['orderStateName'].name!''}</h3>
      <#if returnOrderStateMap['orderStateName'].code=="${getConstant('dictionary.RETURN_MONEY_STATE_00')}">
      <div class="order-status">
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
        onclick='editApplyRefund("${returnOrderDetailForm.returnOrderForm.id}")'/> 修改退款申请</a></p>
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
         onclick='doCancelReturnOrder("${returnOrderDetailForm.returnOrderForm.id}", "${returnOrderDetailForm.returnOrderForm.mfDate}")'> 撤销退款申请</a></p>
      </div>
      </#if>
      <#if returnOrderStateMap['orderStateName'].code=="${getConstant('dictionary.RETURN_MONEY_STATE_10')}">
      <div class="order-status">
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
        onclick='editApplyRefund("${returnOrderDetailForm.returnOrderForm.id}")'/> 修改退款申请</a></p>
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
         onclick='doCancelReturnOrder("${returnOrderDetailForm.returnOrderForm.id}", "${returnOrderDetailForm.returnOrderForm.mfDate}")'> 撤销退款申请</a></p>
         <p><span><i></i>您可以</span><a href="javascript:void(0);" class="font-color-c cx1" onclick="script:adminCheck('${returnOrderId}')">要求平台介入</a></p>
      </div>
      </#if>
      <#if returnOrderStateMap['orderStateName'].code=="${getConstant('dictionary.RETURN_MONEY_STATE_60')}">
      <div class="order-status">
        <p>支付平台退款失败，您可以联系卖家重新申请退款</p>  
      </div>
      </#if>
    </div>
    <#else>
    <h2  class="member-tit"> <i>&nbsp;</i>退货状态</h2>
    <div class="orderdedetail">
      <h3>退货当前状态：${returnOrderStateMap['orderStateName'].name!''}</h3>
      <#if returnOrderStateMap['orderStateName'].code=="${getConstant('dictionary.RETURN_GOODS_STATE_00')}">
      <div class="order-status">
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
        onclick='editApplyRefund("${returnOrderDetailForm.returnOrderForm.id}")'/> 修改退货申请</a></p>
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
         onclick='doCancelReturnOrder("${returnOrderDetailForm.returnOrderForm.id}", "${returnOrderDetailForm.returnOrderForm.mfDate}")'> 撤销退货申请</a></p>
      </div>
      <#elseif returnOrderStateMap['orderStateName'].code=="${getConstant('dictionary.RETURN_GOODS_STATE_10')}">
      <div class="order-status">
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
        onclick='editApplyRefund("${returnOrderDetailForm.returnOrderForm.id}")'/> 修改退货申请</a></p>
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
         onclick='doCancelReturnOrder("${returnOrderDetailForm.returnOrderForm.id}", "${returnOrderDetailForm.returnOrderForm.mfDate}")'> 撤销退货申请</a></p>
        <p><span><i></i>您可以</span><a href="javascript:void(0);" class="font-color-c cx1" onclick="script:adminCheck('${returnOrderId}')"> 要求平台介入</a></p>
      </div>
      <#elseif returnOrderStateMap['orderStateName'].code=="${getConstant('dictionary.RETURN_GOODS_STATE_20')}">
      <div class="order-status">
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
        onclick='toshipping("${returnOrderDetailForm.returnOrderForm.id}")'> 提交退货物流信息</a></p>
      </div>
      <#elseif returnOrderStateMap['orderStateName'].code=="${getConstant('dictionary.RETURN_GOODS_STATE_50')}">
      <div class="order-status">
        <p><span><i></i>您可以</span><a href="javascript:void(0);" 
         onclick='doCancelReturnOrder("${returnOrderDetailForm.returnOrderForm.id}", "${returnOrderDetailForm.returnOrderForm.mfDate}")'> 撤销退货申请</a></p>
      </div>
      <#elseif returnOrderStateMap['orderStateName'].code=="${getConstant('dictionary.RETURN_GOODS_STATE_80')}">
      	<div class="order-status">
        	<p>支付平台退款失败，您可以联系卖家重新申请退款</p>  
      	</div>
       </#if>
    </div>
 </#if>
<h2 class="member-tit"> <i>&nbsp;</i>操作记录</h2>
<input id="returnOrderId" type="hidden" value="${returnOrderId}"/>
<input id="returnType" type="hidden" value="${returnType}"/>
		<div id="history">
		</div>
</div></div></div>
<div class="pop_up cx2">
			<div class="pop_up_A pop_up_C">
				<h2>
					<a href="javascript:void(0);" class="shut"><img
						src="${resources}/img/common/shutB.png" /></a>操作提示
				</h2>
				<div class="pop_bg">
					<div class="pop_note">
						<i><img src="${resources}/img/common/popico1.png"
							width="32" height="33"></i>
						<ul>
							<li>请拨打平台客服电话：${getConstant('constant.PMO_SERVICE_PHONE')}。</li>
						</ul>
					</div>
					<div class="pop_up_button">
						<a href="javascript:void(0);" class="small-button shut">确 定</a>
					</div>
				</div>

				<div class="pop_up_button">
					<a href="javascript:void(0);" class="small-button shut">确 定</a>
				</div>
			</div>
		</div>
<div class="pop_up bigimg_up">
<div>
<P></P>
</div>
</div>
</#if>
</#escape>
</#macro>