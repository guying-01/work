<#include "/common/common_var_definds.ftl" /> <#macro render data>
<#escape x as x?html>
<div class="member-list-tab">
	<div class="orderdedetail m-a p-t-40">
		<div class="progress_five progress_C">
			<p class="progress_textA font-color-b">采购商申请退货</p>
			<p class="progress_textB font-color-b">商家处理退货申请</p>
			<p class="progress_textC font-color-b">采购商退货给卖家</p>
			<br />
			<p class="progress_textD width200" style="left: 600px;">商家确认收货并处理退款</p>
			<p class="progress_textE">完成</p>
		</div>
		<div class="web-note">
			<input type="hidden" id="autoTimeTypeCode"
				value="${getConstant('dictionary.AUTO_CONFIRM_RETURN_GOODS_TIME')!''}"></input>
			<h2>您已提交退货物流信息，请耐心等待商家收货</h2>
			<P>如果商家收到退货后同意退款，系统将直接退款给您。</P>
			<P>如果商家收到退货后拒绝退款，平台将直接介入处理。</P>
			<P>
				如果商家在 <span class="font-color-d" id="timekeep">${(timekeep)!}天00:00:00</span>
				内未处理，系统将自动退款给您。
			</P>
			<#if returnOrderForm??>
			<input value="${returnOrderForm.orderDetailId}" type="hidden"
				id="odid" />
			<P>
				您还可以 <a href="javascript:void(0)"
					onclick='doCancelGoodsOrder("${returnOrderForm.id}")'
					class="font-color-c"> 撤销退货申请</a>
			</P>
			</#if>
		</div>
	</div>
</div>
</#escape> </#macro>
