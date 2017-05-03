<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
    <div class="member-list-tab p-t-40">
      <div class="progress_five progress_D">
        <p class="progress_textA font-color-b">采购商提交订单</p>
        <p class="progress_textB font-color-b">采购商付款</p>
        <p class="progress_textC font-color-b">商家发货</p>
        <p class="progress_textD progress_text">订单已完成</p>
        <p class="progress_textE">采购商评价交易</p>
      </div>
      <div class="payment-page">
	<#if orderMap['orderForm']??>
	<h2 class="member-tit"> <i>&nbsp;</i>订单信息</h2>
	<div class="orderdedetail">
	    <ul class="order-information">
	    <input id="orderId" type="hidden" value="${orderMap['orderForm'].id!''}"/>
			<li>订单编号：${orderMap['orderForm'].id!''}</li>
			<li>下单时间：${orderMap['orderForm'].orderDate?string('yyyy-MM-dd HH:mm:ss')}</li>
			<li>发货时间：<#if orderMap['orderForm'].modifyDate??>
			<#--发货成功状态为30在so_order_track表里面，但是传值的时候只传40，取不到值，问题未知，但是modifydate经过多次测试和dometime时间相同-->
				${orderMap['orderForm'].modifyDate!?string('yyyy-MM-dd HH:mm:ss')}</#if>
			</li>
			<li>
				支付单号：${(orderDetailMap['tradeSerialNumber'])!''}
			</li>
			<li>
				付款时间：
				<#if orderDetailMap['orderForm']??>
					<#if orderDetailMap['orderForm'].tradeAsynNotifyTime??>
						${orderDetailMap['orderForm'].tradeAsynNotifyTime!?string('yyyy-MM-dd HH:mm:ss')}
					</#if>
				</#if>
			</li>
			
            <li></li>
			<li class="float-no" style="word-break:break-all">
				收货信息：
				${(orderMap['shippingInfoForm'].countryName)!''} 
				${(orderMap['shippingInfoForm'].provinceName)!''} 
				${(orderMap['shippingInfoForm'].cityName)!''} 
				${(orderMap['shippingInfoForm'].areaName)!''}${(orderMap['shippingInfoForm'].address)!''}，
				邮编：${(orderMap['shippingInfoForm'].postCode)!''} ，
				${(orderMap['shippingInfoForm'].customer)!''}(收)，
				${(orderMap['shippingInfoForm'].mobile)!''}
				<#if orderMap['shippingInfoForm'].telephone??>
				，
				</#if>

				<li>物流公司：<#if shippingBill??>${shippingBill.companyName!''}</#if>    </li>
				
				<#if orderMap['shippingInfoForm'].telephone??>
				，
				</#if>



				
				${(orderMap['shippingInfoForm'].telephone)!''}
			</li>
			<li class="float-no">
				<span class="left">商家信息：<span id="sellerName">${orderMap['sellerName']!''}</span></span>
				<a href="javascript:void(0);" class="left m-l-10 m-t-5">
				<img src="${resources}/img/common/consulting.png" dm-actor="webim-store" dm-data="${orderMap['sellerName']!''}"/>
				</a>
			</li>
			<li class="float-no" style="word-break:break-all">采购商留言：${(orderMap['orderForm'].memo)!''}</li>
  	  		<li class="float-no">商品清单：</li>
      		<div class="anclose-button">
      			<p></p>
      		</div>
	    </ul>
	</div>
	<#if orderDetailMap['orderDetailFormList']??>
	<div class="goodslist">
		<div class="table-tit">
			<span class="width400">商品名称</span><span class="width200">商品规格</span>
			<span>单价（元）</span><span >数量</span><span>小计（元）</span>
		</div>
		<div class="order-tab m-t-10">
		    <#list orderDetailMap['orderDetailFormList'] as orderDetailForm>
				<div class="table-produce" id="div_${orderDetailForm.id!''}">
					<p  class="textalign-l width400" style="word-break:break-all">
						<span class="p-l-10"><a href="${ctx}/gd/${orderDetailForm.goodsId}.jhtml"><img src="${orderDetailForm.itemSmallPicturePath!''}" /></a></span>
						<a href="${ctx}/gd/${orderDetailForm.goodsId}.jhtml" class="left">${orderDetailForm.goodsName!''}</a>
					</p>
					<p class="width200 textalign-l" style="word-break:break-all"><strong>${orderDetailForm.itemName!''}</strong></P>
					<p>${orderDetailForm.itemPrice?string("0.00")}</p>
					<p>${orderDetailForm.itemAmount}</p>
					<p>${(orderDetailForm.itemAmount * orderDetailForm.itemPrice)?string("0.00")}</p>
				</div>
		    </#list>
	    </div>
	</div>
    <div class="table-message">
		<div class="order-sum">
			<ul>
			<#if soPromotionTrack??>
					<li><span>活动（元）：</span><strong id="psyf">${soPromotionTrack.discountAmount?string("0.00")!}</strong></li>
			</#if>
			<#if couponList??>
				<#list couponList as couponList>
					<li><span>${activityCouponTypeMap[couponList.couponType].name}（元）：</span><strong id="psyf">${couponList.discountAmount?string("0.00")}</strong></li>
				</#list>
			</#if>
			<#if pointsSale!=0>
					<li><span>积分（元）：</span><strong id="psyf">${pointsSale?string("0.00")!}</strong></li>
			</#if>
				<li><span>商品合计（元）：</span><strong>${orderDetailMap['orderForm'].goodsMoney?string("0.00")}</strong></li>
				<li><span>配送运费（元）：</span><strong id="psyf">${orderDetailMap['orderForm'].shippingMoney?string("0.00")}</strong></li>
				<li><span>优惠金额（元）：</span>
					<strong class="font-color-d" id="ddsf" style="font-size:10px;">
						${((orderDetailMap['orderForm'].goodsMoney) + (orderDetailMap['orderForm'].shippingMoney) - (orderDetailMap['orderForm'].payMoney))?string("0.00")}
					</strong>
				</li>
				<li><span>订单实付（元）：</span>
					<strong class="font-color-d" id="ddsf" style="font-size:20px;">
							${(orderDetailMap['orderForm'].payMoney)?string("0.00")}
					</strong>
				</li>
			</ul>
		</div>
	</div>
</#if>
	</div>
	<div class="bottom-button p-t-20" ><a href="javascript:void(0);" onclick="toConfirmReceiveSuccess();" class="big-button" >确认收货</a></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>     
</#if>
 </#escape> 
</#macro>