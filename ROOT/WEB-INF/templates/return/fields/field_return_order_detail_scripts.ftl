<#include "/common/common_var_definds.ftl" />
<#macro render >
<script src="${resources}/js/common/img_operation.js"></script>
<script>
$(document).ready(function () {
	if($('#returnType').val()==${getConstant('dictionary.MEMBER_TYPE_00')}){
		$('.progress_three').attr("style","display:show");
		$('.progress_five').attr("style","display:none");
		if(($('#stateId').val()==${getConstant('dictionary.RETURN_MONEY_STATE_10')})||
			($('#stateId').val()==${getConstant('dictionary.RETURN_MONEY_STATE_30')})||
			($('#stateId').val()==${getConstant('dictionary.RETURN_MONEY_STATE_50')})){
			$('.progress_three').addClass("progress_A");
			$('.progress_textA').addClass("font-color-b");
		}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_MONEY_STATE_00')})){
			$('.progress_three').addClass("progress_B");
			$('.progress_textB').addClass("font-color-b");
		}else if(
			($('#stateId').val()==${getConstant('dictionary.RETURN_MONEY_STATE_20')})||
			($('#stateId').val()==${getConstant('dictionary.RETURN_MONEY_STATE_40')})){
			$('.progress_three').addClass("progress_C");
			$('.progress_textC').addClass("font-color-b");
		}
	}else if($('#returnType').val()==${getConstant('dictionary.MEMBER_TYPE_10')}){
		$('.progress_five').attr("style","display:show");
		$('.progress_three').attr("style","display:none");
		if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_10')})||
			($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_50')})||
			($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_70')})){
			$('.progress_five').addClass("progress_A");
			$('.progress_textA').addClass("font-color-b");
		}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_00')})){
			$('.progress_five').addClass("progress_B");
			$('.progress_textB').addClass("font-color-b");
		}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_20')})){
			$('.progress_five').addClass("progress_C");
			$('.progress_textC').addClass("font-color-c");
		}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_30')})){
			$('.progress_five').addClass("progress_D");
			$('.progress_textD').addClass("font-color-c");
		}else if(($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_40')})||
				 ($('#stateId').val()==${getConstant('dictionary.RETURN_GOODS_STATE_60')})){
			$('.progress_five').addClass("progress_E");
			$('.progress_textE').addClass("font-color-b");
		}
	}
	
	
});
function toOrderDetail(orderId){
	var url='/order/toOrderDetail.jhtml';
	var opt={method:'post', target:'_blank'};
	var params={orderId:orderId};
	$.dm.jumpTo(url, params,opt);
}
//介入操作
	function adminCheck(id){
		jsConfirm("确定后请拨打平台客服电话：${getConstant('constant.PMO_SERVICE_PHONE')}",{callback:function(result){
			if(result){
				var requestUrl = '/order/platformInterpose.ajax';
				callService(
					requestUrl,
					{ "returnOrderId":id},
					{
						callSuccess:function(data){					
							//jsAlert("平台介入成功！请拨打平台客服电话：${getConstant('constant.PMO_SERVICE_PHONE')}");
							window.location.reload();
							//changeStateId('1');
						},callValidFailed:function(error){
							jsAlert(error.businessErrAttachs[0][0].defaultMessage);
						}
					}
				);
			}
		}});
	}
</script>
</#macro>
