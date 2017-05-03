<#include "/common/common_var_definds.ftl" /> <#macro render>
<script src="${resources}/js/member/orderinfomantion.js"></script>
<script src="${resources}/js/common/img_operation.js"></script>
<script src="${resources}/js/common/hideshow.js"></script>
<script src="${resources}/js/common/common.js"></script>
<script src="${resources}/js/lib/jquery/jquery.validate.min.js"></script>
<script src="${resources}/js/common/validation.js"></script>
<script  type="text/javascript" src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>

<#import "field_return_image_scripts.ftl" as field_return_image_scripts
/> <@field_return_image_scripts.render />

<script type="text/javascript">
$(document).ready(function () {

	//将需要退款的商品加标记
	$("#div_"+$('#orderDetailId').val()).attr("style","border: 0px");
	var returnType = $('#returnType').val();
	
	if(returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_10')}){
		returnGoods(0);
	}else{
		returnOrder(0);
	}
	
	$("#moneyForm").validate({
		errorPlacement : function(error, element) {
			element.after(error);

		},
		rules: {
			returnMoney : {
				required : true,
				money : {noZero:false, integer:20, fraction:'2'}
			}
			
	    },
	     messages: {
		   returnMoney : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "填写退款金额",
				money : "<u>&nbsp;</u><i>&nbsp;</i>" + "请正确填写金额"
			}
		 }
	});
	
	var txtArea = $('#memo').val();
	$('#countCsg').text(200-txtArea.length); 
	threturnAmountChange();
});

//新增保存退款申请
function addApplyRefund(){
if($("#moneyForm").valid()){
//组合商品
if($("input[orderType='combinationStoreId']").length==0){
var orderDetailId = $('#orderDetailId').val();
var storeId = $('#storeId').val();
var storeName = $('#storeName').val();
//isCombination  0:非组合 1:组合
var isCombination = "0";
}else{
var orderDetailId = $('#mainOrderDetailId').val();
var storeId = $('#mainStoreId').val();
var storeName = $('#mainStoreName').val();
var isCombination = "1";
}
	var returnType = $('#returnType').val();
	 if(valuedata(returnType)){
	 	var target = $(".orderdedetail").first();
		$.dm.block(target);//开始区域锁定
		var url = "${ctx}/return/addApplyRefund.ajax";
		var returnReason = $('#returnReason').val();
		var returnMoney = $('#returnMoney').val();
		var memo = encodeURI($('#memo').val());
		var orderId = $('#orderId').val();
		var threturnAmount = $("#threturnAmount").val();
		
			var j = 0;
			var str = "{";
				   str += "\"retrunOrderForm.returnReason\":\""+returnReason+"\",\"retrunOrderForm.returnMoney\":\""
				   +returnMoney+"\",\"retrunOrderForm.memo\":\""+memo+"\",";
				   str += "\"retrunOrderForm.orderId\":\""+orderId+"\",\"retrunOrderForm.orderDetailId\":\""
				   +orderDetailId+"\",\"retrunOrderForm.storeId\":\""+storeId+"\",";
				   str += "\"retrunOrderForm.returnType\":\""+returnType+"\",\"retrunOrderForm.storeName\":\""
				   +storeName+"\",\"retrunOrderForm.amount\":\""+threturnAmount+"\",\"retrunOrderForm.isCombination\":\""+isCombination+"\"";
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
			
			var toUrl='${ctx}/return/toApplyRefundSuccess.jhtml';
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
									$.dm.jumpTo(toUrl, params);
									$.dm.unblock(target);//区域解锁
							    	//window.location.href="${ctx}/return/toApplyRefundSuccess.jhtml?orderDetailId="+orderDetailId;
							    }
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
  }

}

//编辑保存退款申请
function editApplyRefund(){
if($("#moneyForm").valid()){

	var returnOrderId = $('#returnOrderId').val();
	var returnType = $('#returnType').val();
	//非空验证
	 if(valuedata(returnType)){
		 	var target = $(".orderdedetail").first();
			$.dm.block(target);//开始区域锁定
			var url = "${ctx}/return/editApplyRefund.ajax";
			var returnReason = $('#returnReason').val();
			var returnMoney = $('#returnMoney').val();
			var memo = encodeURI($('#memo').val())/*.split('<').join('&lt').split('>').join('&gt')*/;
			var orderId = $('#orderId').val();
			var orderDetailId = $('#orderDetailId').val();
			var storeId = $('#storeId').val();
			var storeName = $('#storeName').val();
			var modifyDate = $('#modifyDate').val();
			var threturnAmount = $("#threturnAmount").val();
			
			var j = 0;
				var str = "{";
					   str += "\"retrunOrderForm.returnReason\":\""+returnReason+"\",\"retrunOrderForm.returnMoney\":\""+returnMoney+"\",\"retrunOrderForm.memo\":\""+memo+"\",";
					   str += "\"retrunOrderForm.orderId\":\""+orderId+"\",\"retrunOrderForm.orderDetailId\":\""+orderDetailId+"\",\"retrunOrderForm.storeId\":\""+storeId+"\",";
					   str += "\"retrunOrderForm.returnType\":\""+returnType+"\",\"retrunOrderForm.id\":\""+returnOrderId+"\",\"retrunOrderForm.storeName\":\""+storeName+"\",";
					   str += "\"retrunOrderForm.mfDate\":\""+modifyDate+"\",\"retrunOrderForm.amount\":\""+threturnAmount+"\"";;
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
				
				
				}
				 var toUrl='${ctx}/return/toEditRefundSuccess.jhtml';
				  var params={
				   orderDetailId:orderDetailId,
				   returnType:returnType
				   };
				  
				  
				callService(
							url,
							json_data,
							{
								callSuccess:function(mg){
								    if(typeof(mg) == "boolean"){
								    	//新打开页面
								    	$.dm.jumpTo(toUrl, params);
								    	$.dm.unblock(target);//区域解锁
								    	//window.location.href="${ctx}/return/toEditRefundSuccess.jhtml?orderDetailId="+orderDetailId;
								    }
								},callError:function(textStatus, errorThrown, error){
									jsErrAlert(error.errMsg||'');
										$.dm.unblock(target);
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
 }

//非空验证
function valuedata(returnType){
var flag=true;
	if($('#returnReason').val()==''){
		if(returnType==${getConstant('dictionary.RETURN_ORDER_TYPE_00')}){
			jsErrAlert("请选择退款原因");
		}else{
			jsErrAlert("请选择退货原因");
		}
		
		flag = false;
	}
	if($('#returnMoney').val()==''){
		jsErrAlert("请填写退款金额");
		flag = false;
	}else{
		if(parseFloat($('#returnMoney').val())>parseFloat($('.ccd').text())){
			jsErrAlert("退款金额不能大于最高退款金额");
			$('#returnMoney').val('');
			flag = false;
		}
		//if(parseFloat($('#returnMoney').val())>parseFloat($("#returnmoneynone").val())){
		//	jsErrAlert("退款金额不能大于"+$(".linespan[name='returnMoneyType']:visible").text().split("*")[1].split("：")[0]+"可退金额");
		//	flag = false;
		//}
	if($("#threturnAmount").val()==''){
		if(returnType==${getConstant('dictionary.RETURN_ORDER_TYPE_10')}){
			jsErrAlert("请选择退货数量");
			}
		flag = false;
	}
	}

	if($('#memo').val().length > 200){
		jsErrAlert("补充说明最多只能输入200个字。");
		flag = false;
	}
	return flag;
}
//退款
function returnOrder(type){
	$('#jtk').addClass("on");
	$('#thtk').removeClass("on");
	$('.progress_three').attr("style","display:show");
	$('.tk').attr("style","display:show");
	$('.progress_five').attr("style","display:none");
	$('.th').attr("style","display:none");
	$('#returnType').val('${getConstant('dictionary.RETURN_ORDER_TYPE_00')}');
	if(type==1){
		$("#returnReason").val('');
		$("#tkreturnReason").find("option[value='']").attr("selected",true);
	}
}
//退货
function returnGoods(type){
	$('#thtk').addClass("on");
	$('#jtk').removeClass("on");
	$('.progress_five').attr("style","display:show");
	$('.tk').attr("style","display:none");
	$('.progress_three').attr("style","display:none");
	$('.th').attr("style","display:show");
	$('#returnType').val('${getConstant('dictionary.RETURN_ORDER_TYPE_10')}');
	if(type==1){
		$("#returnReason").val('');
		$("#threturnReason").find("option[value='']").attr("selected",true);
	}
}
function sel(obj){
	$("#returnReason").val(obj.value);
}
//退货数量改变事件
function threturnAmountChange(){
	$("#threturnAmount").change(function(){
		//mainOrderDetailId为空的话不是组合商品
		if($("#mainOrderDetailId").val()==null){
			var orderDetailId = $("#orderDetailId").val();
		}else{
			var orderDetailId = $("#mainOrderDetailId").val();
		}
		var orderId = $("#orderId").val();
		var amount = $(this).val();
		var requestUrl = '/return/retrunItemAmountMoney.ajax';
		if(amount!=""){
			callService(
				requestUrl,
				{ "orderDetailId":orderDetailId,"orderId" : orderId,"amount":amount},
				{
					callSuccess:function(data){					
						//运费
						var hideShipMoney = $("#hideShipMoney").val();
						
						$("#changeShippingMoney").text(hideShipMoney);
						var returnMoney = null;
						//如果是最后一件商品加上运费
						if($("#returnOrderamount").val()==$("#threturnAmount").val()){
							if(hideShipMoney==null){
								returnMoney=parseFloat(data);
							}else{
								if(parseFloat(data)!=0){	
								returnMoney=parseFloat(data)+parseFloat($("#changeShippingMoney").text());
								if(returnMoney<hideShipMoney){
									$("#other").css("display","none");
								}else{
									$("#other").css("display","")
								}
								}else{
									returnMoney=parseFloat(data);
									$("#other").css("display","none");
								}
							}
							$("#isLastGood").css("display","none")
							
						}else{
							returnMoney=data;
							$("#isLastGood").css("display","")
						}
						//$("#returnMoney").val(returnMoney.toFixed(2));
						$("#returnmoneynone").val(returnMoney.toFixed(2));
						$("#changeReturnMoney").text(returnMoney.toFixed(2));
					},callValidFailed:function(error){
						jsAlert(error.businessErrAttachs[0][0].defaultMessage);
					}
				}
			);
		}else{
			$("#returnMoney").val("");
			$("#changeReturnMoney").text("0.00");
			$("#changeShippingMoney").text("0.00");
		}
	})
	}
</script>
</#macro>
