<#include "/common/common_var_definds.ftl" /> <#macro render data>
<#escape x as x?html>
<style>
    .message-title-gy{
		position: relative;
		background: #fff;
		color: #000;
	}
	.message-title-gy i{
        background: url(/resources/img/common/goBack.png) no-repeat center;
        background-size: contain;
        display: inline-block;
        width: 0.3rem;
        position: absolute;
        left: 0.2rem;
		height: 0.3rem;
        top:50%;
		margin-top: -0.15rem;
	}
</style>
<div class="wrapper">
	<#--<div class="wulua-content-left">-->
		<#--<div class="member-wulua">-->
			<#--<h2>-->
				<#--<a class="back" href="javascript:void(0);" onclick="history.go(-1);"></a>-->
				<#--${shippingBillFormList[0].companyName!''}<span>${shippingBillFormList[0].billId!''}</span>-->
			<#--</h2>-->
			<#--<p>发货方式：${shippingBillFormList[0].shippingWayName!''}</p>-->

			<#--<p>订单编号：${shippingBillFormList[0].orderId!''}</p>-->
		<#--</div>-->
	<#--</div>-->
	<div class="wulua-content-right">
		<#--<h2 class="tit">-->
			<#--物流动态-->
		<#--</h2>-->
		<#--<#if shippingBillFormList?? && shippingBillFormList?size gt 0>-->
			<#--<#list shippingBillFormList as shippingBillForm>-->
			<#--<#if shippingBillForm ??>-->
		<#--<#if shippingBillForm.shippingType ==getConstant('dictionary.ORDER.SHIPPING.TYPE.NORMAL')>-->
			<#--<#if orderMap.orderForm.orderFlow ==getConstant('dictionary.ORDER.ORDER_FLOW.NORMAL_FLOW')||(orderMap.orderForm.orderFlow ==-->
		<#--getConstant('dictionary.ORDER.ORDER_FLOW.GENE_CHECK')-->
		<#--&&orderMap.orderForm.serviceStatus ==-->
		<#--getConstant('dictionary.ORDER.SERVICE_STATUS.CLOSE') &&-->
		<#--!orderMap.orderForm.firstSendTime?exists)>-->
		<#--<ul>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--物流类型:&nbsp;&nbsp;${shippingBillForm.shippingTypeName!''}</li> <#if-->
			<#--shippingBillForm.billId??>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--物流编号:&nbsp;&nbsp;${shippingBillForm.id!''}</li>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--发货方式:&nbsp;&nbsp;${shippingBillForm.shippingWayName!''}</li>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--物流公司:&nbsp;&nbsp;${shippingBillForm.companyName!''}</li>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--运单编号:&nbsp;&nbsp;${shippingBillForm.billId!''}</li>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--备注：&nbsp;&nbsp;${shippingBillForm.memo!''}</li>-->
			<#--<li class="wulua-content-right-foc">物流跟踪：<a-->
				<#--href="javascript:searchShippingInfo();">-->
					<#--&nbsp;${getConstant('constant.POM_SHIPPING_URL')}&nbsp;</a>-->
			<#--</li> <#else>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--<h2>-->
					<#--<i style="color: gray;font-size: 0.24rem">您的发货方式为<font-->
						<#--style="color: red">无需物流</font>，物流信息不存在！-->
					<#--</i>-->
				<#--</h2>-->
			<#--</li> </#if>-->

		<#--</ul>-->
		<#--</#if> <#else>-->
		<#--<ul>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--物流类型:&nbsp;&nbsp;${shippingBillForm.shippingTypeName!''}</li> <#if-->
			<#--shippingBillForm.billId??>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--物流编号:&nbsp;&nbsp;${shippingBillForm.id!''}</li>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--发货方式:&nbsp;&nbsp;${shippingBillForm.shippingWayName!''}</li>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--物流公司:&nbsp;&nbsp;${shippingBillForm.companyName!''}</li>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--运单编号:&nbsp;&nbsp;${shippingBillForm.billId!''}</li>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--备注：&nbsp;&nbsp;${shippingBillForm.memo!''}</li>-->
			<#--<li class="wulua-content-right-foc">物流跟踪：<a-->
				<#--href="javascript:searchShippingInfo();">-->
					<#--&nbsp;${getConstant('constant.POM_SHIPPING_URL')}&nbsp;</a>-->
			<#--</li> <#else>-->
			<#--<li class="wulua-content-right-foc">-->
				<#--<h2>-->
					<#--<i style="color: gray; margin: 0 0 0 200px">您的发货方式为<font-->
						<#--style="color: red">无需物流</font>，物流信息不存在！-->
					<#--</i>-->
				<#--</h2>-->
			<#--</li> </#if>-->
		<#--</ul>-->
		<#--</#if> </#if> </#list> </#if>-->
		<#--<div class="wulua-three">-->
			<#--物流详情请点击上述查询链接进行查询-->
		<#--</div>-->
		<h2 class="tit message-title-gy" onclick="window.history.go(-1)">
			宝贝信息
			<i></i>
		</h2>
		<div class="payment-page-orderdedetaila">
            <h4>
               <strong>商铺：${orderMap.orderForm.storeName}</strong>
             </h4>
			<#if orderDetailMap['orderDetailFormList']??>
				<#list orderDetailMap['orderDetailFormList'] as orderDetailForm>
					<div class="payment-page-order-tab">
						<div class="payment-page-table-produce">
                            <div class="pageLeft">
								<a href="${ctx}/gd/${orderDetailForm.goodsId}.jhtml"><img src="${orderDetailForm.itemSmallPicturePath!''}" /></a>
							</div>
                            <div class="pageRight">
								<div>
									<span class="pageT">商品名称：</span><a href="${ctx}/gd/${orderDetailForm.goodsId}.jhtml" class="pageT">${orderDetailForm.goodsName!''}</a>
								</div>
								<p><span class="pageT">价格：</span><b class="pageTp">${orderDetailForm.itemPrice?string("￥0.00")}</b></p>

								<p><span class="pageT">数量：</span>${orderDetailForm.itemAmount}</p>

								<p class=" width150">
									<span class="pageT">小计：</span><b>${(orderDetailForm.itemAmount *orderDetailForm.itemPrice)?string("￥0.00")}</b>
								</p>
							</div>
						</div>
					</div>
				</#list>
			</#if>
		</div>
		<div class="order-sum">
			<ul>
				<#if couponList??> <#list couponList as couponList>
				<li style="text-align: left;padding-left: 0.2rem;">
					<span>${activityCouponTypeMap[couponList.couponType].name}（元）：</span>
					<strong id="psyf">-${couponList.discountAmount?string("0.00")}</strong>
				</li>
				</#list> </#if> <#if pointsSale!=0>
				<li style="text-align: left;padding-left: 0.2rem;">
					<span>积分（元）：</span><strong id="psyf">-${pointsSale?string("0.00")!}</strong>
				</li>
				</#if>
				<li style="text-align: left;padding-left: 0.2rem;">
					<span>商品合计（元）：</span><strong>${orderDetailMap['orderForm'].goodsMoney?string("0.00")}</strong>
				</li>
				<li style="text-align: left;padding-left: 0.2rem;"><span>配送运费（元）：</span><strong id="psyf">${orderDetailMap['orderForm'].shippingMoney?string("0.00")}</strong></li>
				<li style="text-align: left;padding-left: 0.2rem;"><span>订单实付（元）：</span>
					<strong class="font-color-d" id="ddsf"> ${(orderDetailMap ['orderForm'].payMoney)?string("￥0.00")}</strong>
				</li>
			</ul>
		</div>
		<div class="wulua-content-txt clear" style="height: auto">
			<p class="receiveAdd">
				<strong>收货信息：</strong>
				<span style="display: inline-block;width: 75%;font-size: 0.23rem;vertical-align: top;">
				${(orderMap['shippingInfoForm'].provinceName)!''}
				${(orderMap['shippingInfoForm'].cityName)!''}
				${(orderMap['shippingInfoForm'].areaName)!''}${(orderMap['shippingInfoForm'].address)!''}，
				${(orderMap['shippingInfoForm'].customer)!''}，
				${(orderMap['shippingInfoForm'].mobile)!''} <#if
				orderMap['shippingInfoForm'].telephone??> ， </#if>
				${(orderMap['shippingInfoForm'].telephone)!''}
				</span>
			</p>

			<p class="receiveAdd" style="display: none">
				<strong>发货信息：</strong>四川省成都市金牛区成都国际商贸城6-1-1287，610000，张本杰，
				159820444103
			</p>
		</div>
	</div>
</div>

</#escape> </#macro>
