<#include "/common/common_var_definds.ftl" />
<#macro render >	
<script src="${resources}/js/member/orderinfomantion.js"></script>
<script src="${resources}/js/common/img_operation.js"></script>
<script  type="text/javascript">
$(document).ready(function () {
	if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_00')})||
			($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_70')})){
		$('.progress_five').addClass("progress_A");
		$('.progress_textA').addClass("font-color-b");
	}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_10')})||
			($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_50')})){
		$('.progress_five').addClass("progress_B");
		$('.progress_textB').addClass("font-color-b");
	}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_20')})){
		$('.progress_five').addClass("progress_C");
		$('.progress_textC').addClass("font-color-b");
	}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_30')})||
			($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_40')})){
		$('.progress_five').addClass("progress_D");
		$('.progress_textD').addClass("font-color-b");
	}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_60')})){
		$('.progress_five').addClass("progress_E");
		$('.progress_textD').addClass("font-color-b");
	}
	
});
//保存退款物流信息
function editApplyRefund(){
if(valuedata()){
jsConfirm("确定保存退货物流信息吗?",{callback:function(result){
			if(result){
 	var target = $(".orderdedetail");
	//$.dm.block(target);//开始区域锁定
	var url = "${ctx}/return/saveShippingInfo.ajax";
	var shippingCompanyId = $('#shippingCompanyId').val();
	var billId = $('#billIds').val();
	var memo = encodeURI($('#shippingMemo').val());
	var returnOrderId = $('#returnOrderId').val();
	var returnMoney = $('#returnMoney').text();
	var returnReason = $('#returnReasonId').val();
	var orderDetailId = $('#orderDetailId').val();
	var returnType = $('#returnType').val();
	var modifyDate = $('#modifyDate').val();
	var j = 0;
		var str = "{";
			   str += "\"retrunOrderForm.shippingCompanyId\":\""+shippingCompanyId+"\",\"retrunOrderForm.billId\":\""+billId+"\",\"retrunOrderForm.memo\":\""+memo+"\",";
			   str += "\"retrunOrderForm.returnMoney\":\""+returnMoney+"\",\"retrunOrderForm.returnReason\":\""+returnReason+"\",\"retrunOrderForm.mfDate\":\""+modifyDate+"\",\"retrunOrderForm.id\":\""+returnOrderId+"\"";
		var groupimg = $("#groupimg input");
		if(groupimg.length>0){
			str += ",";
		}
		for(var j = 0 ; j < groupimg.length ; j++){
			var scorePicture = groupimg.eq(j).val();
			if(j == groupimg.length-1 ){
				str += "\"list["+j+"].picUrl\":\""+scorePicture+"\"";
			}else{
				str += "\"list["+j+"].picUrl\":\""+scorePicture+"\",";
			}
		}
		str += "}";
		json_data=eval("("+str+")");
		
		 var toUrl='${ctx}/return/toShippingSuccess.jhtml';
		  var params={
		   orderDetailId:orderDetailId,
		   returnType:returnType
		   };
		  
		  
		callService(
					url,
					json_data,
					{
						callSuccess:function(mg){
						    if(mg){
						    	//新打开页面
						    	$.dm.jumpTo(toUrl, params);
						    	$.dm.unblock(target);//区域解锁
						    }
						},callError:function(textStatus, errorThrown, error){
							jsErrAlert(error.errMsg||'');
							$.dm.unblock(target);//区域解锁
						},
						callValidFailed:function(error){
							if(error.businessErrAttachs[0][0].code=='typeMismatch'){
								jsErrAlert(error.errMsg||'');
							}else{
								jsErrAlert(error.businessErrAttachs[0][0].defaultMessage);
							}
							$.dm.unblock(target);
						}
					}			
		);
	}

			
		}});
	}
}
//非空验证
function valuedata(){
var flag=true;
	if($('#shippingCompanyId').val()==''){
		jsErrAlert("请选择物流公司");
		flag = false;
	}
	if($('#billIds').val()==''){
		jsErrAlert("请填写运单编号");
		flag = false;
	}
	if(!checkBillInputType($('#billIds').val())){
		jsErrAlert("输入的运单编号只能是字母、数字、-的组合");
		flag = false;
	}
	if($('#shippingMemo').val().length > 200){
		jsErrAlert("补充说明最多只能输入200个字。");
		flag = false;
	}
	return flag;
}

//运单编号只能输入字母、数字、-
function checkBillInputType(value){
	return /^[a-zA-Z0-9\-]{1,}$/.test(value);
}

//跳转到订单详情页面
	function toOrderDetail(orderId){
		var url = "${ctx}/order/toOrderDetail.jhtml";
		$.dm.jumpTo(url,{orderId:orderId});
		
		return false;
	}
</script>
</#macro>