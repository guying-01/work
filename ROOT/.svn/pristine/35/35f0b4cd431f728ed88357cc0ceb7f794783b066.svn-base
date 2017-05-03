<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
		<div class="member-list-tab">
      <div class="orderdedetail m-a p-t-40">
			<div class="progress_five progress_A">
		      <p class="progress_textA font-color-b">采购商申请退货</p>
		      <p class="progress_textB">商家处理退货申请</p>
		      <p class="progress_textC">采购商退货给卖家</p><br />
		      <p class="progress_textD width200" style="left:600px;">商家确认收货并处理退款</p>
		      <p class="progress_textE">完成</p>
		    </div>
			
			<div class="web-note">
		      <h2>您已撤销退货申请</h2>
		      <P>您可以 <a  href="javascript:toOrderDetail('${orderId}')"   class="font-color-c"> 查看订单详情</a></P>
		    </div>
</div>
</div>
<script>
//跳转到订单详情页面
	function toOrderDetail(orderId){
		var url = "${ctx}/order/toOrderDetail.jhtml";
		$.dm.jumpTo(url,{orderId:orderId},{target:"_blank"});
	}
</script>
</#escape>
</#macro>