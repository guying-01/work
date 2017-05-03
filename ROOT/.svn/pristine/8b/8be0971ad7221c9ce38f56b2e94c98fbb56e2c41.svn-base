<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<script src="${resources}/js/common/hideshow.js"></script>
    <div class="member-list-tab">
      <div class="orderdedetail m-a p-t-40">
	  	<div class="progress_three progress_B">
	      <p class="progress_textA font-color-b">采购商申请退款</p>
	      <p class="progress_textB font-color-b">商家处理退款申请</p>
	      <p class="progress_textC">完成</p>
	    </div>
	    <div class="web-note">
	    <input type="hidden" id="autoTimeTypeCode" value="${getConstant('dictionary.AUTO_REFUND_TIME')!''}"></input>
	      <h2>您已成功修改退款申请，请耐心等待商家处理</h2>
	      <P>如果商家同意退款，系统将直接退款给您</P>
	      <P>如果商家拒绝退款，需要您修改退货申请，您也可以要求平台介入。</P>
	      <P>如果商家在 <span class="font-color-d" id="timekeep">${(timekeep)!}天00:00:00</span> 内未处理本申请，系统将自动退款给您</P>
	      <input value="${returnOrderForm.orderDetailId}" type = "hidden" id="odid"/>
	      <P>您还可以 <a href="javascript:void(0)" onclick='doCancelGoodsOrder("${returnOrderForm.id}")' class="font-color-c"> 撤销退款申请</a> </P>
	    </div>
</div>
</div>
<div class="pop_up cx2">
			<div class="pop_up_A pop_up_C">
				<h2>
					<a href="javascript:void(0);" class="shutB"><img
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

</#escape>
</#macro>