<#include "/common/common_var_definds.ftl" /> <#macro render data>
<#escape x as x?html>
<div class="member-list-tab">
	<div class="orderdedetail m-a p-t-10">
		<div class="progress_five progress_B">
			<p class="progress_textA font-color-b">采购商申请退货</p>
			<p class="progress_textB font-color-b">商家处理退货申请</p>
			<p class="progress_textC">采购商退货给商家</p>
			<p class="progress_textD width200" style="left:600px;">商家确认收货并处理退款</p>
			<p class="progress_textE">完成</p>
		</div>
		<div class="web-note">
			<input type="hidden" id="autoTimeTypeCode"
				value="${getConstant('dictionary.AUTO_RETURN_GOODS_TIME')!''}"></input>
			<h2>您已提交退货申请，请耐心等待商家处理</h2>
			<P>如果商家同意退货，会将退货地址发给您，需要您退货给卖家。</P>
			<P>如果商家拒绝退货，需要您修改退货申请，您也可以要求平台介入。</P>
			<P>
				如果商家在 <span class="font-color-d" id="timekeep">${(timekeep)!}天00:00:00</span>
				内未处理，系统会将商家的默认退货地址发给您，需要您退货给商家。
			</P>
			<input value="${returnOrderForm.orderDetailId!}" type="hidden"
				id="odid" />
			<P>
				您还可以 <a href="javascript:void()"
					onclick='doCancelGoodsOrder("${returnOrderForm.id!}")'
					class="font-color-c"> 撤销退货申请</a>
			</P>
		</div>
		<input type="hidden" id="motifyDate"
			value="${returnOrderForm.mfDate!}">
	</div>
</div>
</#escape> </#macro>
