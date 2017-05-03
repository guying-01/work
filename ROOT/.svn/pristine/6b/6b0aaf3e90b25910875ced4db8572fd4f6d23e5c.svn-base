<#include "/common/common_var_definds.ftl" /> <#macro render data>
<#escape x as x?html>
<div class="member-list-tab">
	<div class="orderdedetail m-a p-t-40">
		<div class="progress_three progress_B">
			<p class="progress_textA font-color-b">采购商申请退款</p>
			<p class="progress_textB font-color-b">商家处理退款申请</p>
			<p class="progress_textC">完成</p>
		</div>
		<div class="web-note">
			<input type="hidden" id="autoTimeTypeCode"
				value="${getConstant('dictionary.AUTO_REFUND_TIME')!''}"></input>
			<h2>您已成功提交退款申请，请耐心等待商家处理</h2>
			<P>如果商家同意退款，系统将直接退款给您。</P>
			<P>如果商家拒绝退款，需要您修改退货申请，您也可以要求平台介入。</P>
			<P>
				如果商家在 <span class="font-color-d" id="timekeep">${(timekeep)!}天00:00:00</span>
				内未处理，系统将自动退款给您。
			</P>
			<input value="${returnOrderForm.orderDetailId!''}" type="hidden"
				id="odid" />
			<P>
				您还可以 <a href="javascript:void(0)"
					onclick='doCancelReturnOrder("${returnOrderForm.id!'
					'}")' class="font-color-c"> 撤销退款申请</a>
					
			</P>
		</div>

		<input type="hidden" id="motifyDate"
			value="${returnOrderForm.mfDate!''}">
	</div>
</div>
</#escape> </#macro>
