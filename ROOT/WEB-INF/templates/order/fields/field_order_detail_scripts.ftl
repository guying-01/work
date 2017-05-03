<#include "/common/common_var_definds.ftl" />
<#macro render>
<script src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script src="${resources}/js/lib/jquery/jquery.validate.min.js"></script>
<script src="${resources}/js/common/validation.js"></script>

<script src="${resources}/js/common/tab.js"></script>
<script src="${resources}/js/common/hideshow.js"></script>
<script src="${resources}/js/common/img_operation.js"></script>
<script src="${resources}/js/member/orderinfomantion.js"></script>

<script src="${resources}/js/order/order_detail.js"></script>
<script type="text/javascript">

function searchShippingInfo(){
	var url='${getConstant('constant.POM_SHIPPING_URL')}';
	var opt={method:'post', target:'_blank'};
	$.dm.jumpTo(url, {}, opt);
}
function toPay(orderId){
	var payUrl = "";
	if(${getConstant('constant.PAYMENT_TYPE')}=="0"){
		payUrl = "${ctx}/order/toPayFromOrder.jhtml";
	}else if(${getConstant('constant.PAYMENT_TYPE')}=="1"){
		payUrl = "${ctx}/order/toPayFromOrderB2C.jhtml";
	}
	$.dm.jumpTo(payUrl,{orderIds:orderId});
}
function toSendBack(orderId){
    var url='${ctx}/order/toGeneSendBack.jhtml';
    var params={orderId:orderId};
    $.dm.jumpTo(url, params);
}
</script>
</#macro>