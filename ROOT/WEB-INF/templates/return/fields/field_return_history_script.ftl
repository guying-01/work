<#include "/common/common_var_definds.ftl" />
<#macro render>
<script>
	$(document).ready(function(){
		if($('#billId').val() == ''){
			$('#shippingDiv').remove();
		}
		callService('${ctx}/return/findReturnOrderHistoryForStore.ajax', {returnOrderId : $('#returnOrderId').val(), returnType : $('#returnType').val()},{
			callSuccess:function(returnHistory){
				if($('#returnType').val()==${getConstant('dictionary.MEMBER_TYPE_00')}){
					// 加载操作纪录
					for(var i = 0; i < returnHistory.length; i++){
						var divStr = '<div class="orderdedetail bor-b">'
						var history = returnHistory[i];
						if(i < returnHistory.length - 1){
							var	lastReturnHistoryForm = returnHistory[i+1].returnHistoryForm;
							switch(history.returnHistoryForm.stateId){
								case '${getConstant('dictionary.RETURN_MONEY_STATE_00')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">商家于 ' + history.returnHistoryForm.createDate + ' 修改了退款申请</li>';
									if(lastReturnHistoryForm.returnMoney != history.returnHistoryForm.returnMoney){
										divStr += '<li class="float-no">退款金额：从&nbsp;<strong class="font-color-b">' + formatnumber(lastReturnHistoryForm.returnMoney, 2) + '&nbsp;</strong>元&nbsp;修改为&nbsp;<strong class="font-color-b">' +  formatnumber(history.returnHistoryForm.returnMoney, 2) + '&nbsp;</strong>元</li>';
									}
									if(lastReturnHistoryForm.amount != history.returnHistoryForm.amount){
										divStr += '<li class="float-no">退款商品数量：从&nbsp;<strong >' + lastReturnHistoryForm.amount + '&nbsp;</strong>&nbsp;修改为&nbsp;<strong >' + history.returnHistoryForm.amount + '&nbsp;</strong></li>';
									}
									if(lastReturnHistoryForm.returnReason != history.returnHistoryForm.returnReason){
										var returnReason = "";
										if(history.returnHistoryForm.returnReason != null){
											returnReason = history.returnHistoryForm.returnReason;
										}
										divStr += '<input type="hidden" class="returnReason" value="' + returnReason + '" />';
										divStr += '<li class="float-no">退款原因：从&nbsp;' + lastReturnHistoryForm.returnReasonText + '&nbsp;修改为&nbsp;' + history.returnHistoryForm.returnReasonText + '&nbsp;</li>';
									}
									if($.trim(history.returnHistoryForm.memo) != ''){
										divStr += '<li class="float-no">补充说明：' + history.returnHistoryForm.memo.split('<').join('&lt').split('>').join('&gt') + '</li>';
									}
									divStr += '</ul>';
									lastReturnHistoryForm = history.returnHistoryForm;
									break;
								case '${getConstant('dictionary.RETURN_MONEY_STATE_10')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">商家于 ' + history.returnHistoryForm.createDate + ' 拒绝了退款申请</li>';
									divStr += '<li class="float-no">拒绝原因：' + history.returnHistoryForm.memo + '</li>';
									divStr += '</ul>';
									break;
								case '${getConstant('dictionary.RETURN_MONEY_STATE_20')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">商家于  ' + history.returnHistoryForm.createDate + ' 同意退款</li>';
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_MONEY_STATE_30')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">平台于  ' + history.returnHistoryForm.createDate + ' 介入处理</li>';
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_MONEY_STATE_40')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">退款申请已完成</li>';
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_MONEY_STATE_50')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">采购商于  ' + history.returnHistoryForm.createDate + ' 撤销了退款申请</li>';
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_MONEY_STATE_60')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">支付平台' + history.returnHistoryForm.createDate + ' 退款失败</li>';
									divStr += '</ul>';
								break;
							}
						}else{
							divStr += '<ul class="order-information">';
							divStr += '<li class="float-no">采购商于' + history.returnHistoryForm.createDate + ' 提交了退款申请</li>';
							divStr += '<li class="float-no">退款原因：' + history.returnHistoryForm.returnReasonText + '</li>';
							divStr += '<li class="float-no">退款金额：<strong class="font-color-b">' + formatnumber(history.returnHistoryForm.returnMoney, 2) + '</strong>元</li>';
							divStr += '<li class="float-no">退款商品数量：&nbsp;<strong>' + history.returnHistoryForm.amount + '&nbsp;</strong></li>';
							if($.trim(history.returnHistoryForm.memo) != ''){
								divStr += '<li class="float-no">补充说明：' + history.returnHistoryForm.memo.split('<').join('&lt').split('>').join('&gt') + '</li>';
							}
							divStr += '</ul>';
							var returnReason = history.returnHistoryForm.returnReason;
							divStr += '<input type="hidden" class="returnReason" value="' + returnReason + '" />';
						}
						
						if(history.returnPictureFormList.length != 0){
							divStr += '<div class="information-line p-t-0">';
							divStr += '<span class="linespan wauto">上传凭证：</span>';
							divStr += '<ul class="groupimg left m-0" style="clear:none;">';
							for(var j = 0; j < history.returnPictureFormList.length; j++){
								divStr += '<li>';
								divStr += '<img src="'+ history.returnPictureFormList[j].picUrl + history.returnPictureFormList[j].picName + '" width="800" height="800">';
								divStr += '<div class="goodsoperation"><span title="放大" class="bigimg" onclick="bigimg(this);">放大</span></div>';
								divStr += '</li>';
							}
							divStr += '</ul>';
							divStr += '</div>';
						}
						divStr +=  '<div class="clear"></div>';
						divStr +=  '</div>';
						$('#history').append(divStr);
					}
				}else{
					// 加载操作纪录
					for(var i = 0; i < returnHistory.length; i++){
						var divStr = '<div class="orderdedetail bor-b">'
						var history = returnHistory[i];
						if(i < returnHistory.length - 1){
							var	lastReturnHistoryForm = returnHistory[i+1].returnHistoryForm;
							switch(history.returnHistoryForm.stateId){
								case '${getConstant('dictionary.RETURN_GOODS_STATE_00')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">采购商于 ' + history.returnHistoryForm.createDate + ' 修改了退货申请</li>';
									if(lastReturnHistoryForm.returnMoney != history.returnHistoryForm.returnMoney){
										divStr += '<li class="float-no">退款金额：从&nbsp;<strong class="font-color-b">' + formatnumber(lastReturnHistoryForm.returnMoney, 2) + '&nbsp;</strong>元&nbsp;修改为&nbsp;<strong class="font-color-b">' +  formatnumber(history.returnHistoryForm.returnMoney, 2) + '&nbsp;</strong>元</li>';
									}
									if(lastReturnHistoryForm.amount != history.returnHistoryForm.amount){
										divStr += '<li class="float-no">退货商品数量：从&nbsp;<strong >' + lastReturnHistoryForm.amount + '&nbsp;</strong>&nbsp;修改为&nbsp;<strong >' + history.returnHistoryForm.amount + '&nbsp;</strong></li>';
									}
									if(lastReturnHistoryForm.returnReason != history.returnHistoryForm.returnReason){
										divStr += '<li class="float-no">退货原因：从&nbsp;' + lastReturnHistoryForm.returnReasonText + '&nbsp;修改为&nbsp;' + history.returnHistoryForm.returnReasonText + '&nbsp;</li>';
										var returnReason = "";
										if(history.returnHistoryForm.returnReason != null){
											returnReason = history.returnHistoryForm.returnReason;
										}
										divStr += '<input type="hidden" class="returnReason" value="' + returnReason + '" />';
									}
									if($.trim(history.returnHistoryForm.memo) != ''){
										divStr += '<li class="float-no" style="word-break:break-all">补充说明：' + history.returnHistoryForm.memo.split('<').join('&lt').split('>').join('&gt')
										 + '</li>';
									}
									divStr += '</ul>';
									lastReturnHistoryForm = history.returnHistoryForm;
									break;
								case '${getConstant('dictionary.RETURN_GOODS_STATE_10')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">商家于 ' + history.returnHistoryForm.createDate + ' 拒绝了退货申请</li>';
									if($.trim(history.returnHistoryForm.memo) != ''){
										divStr += '<li class="float-no" style="word-break:break-all">拒绝原因：' + history.returnHistoryForm.memo.split('<').join('&lt').split('>').join('&gt')
										 + '</li>';
									}else{
										divStr += '<li class="float-no" style="word-break:break-all">拒绝原因：' + history.returnHistoryForm.memo + '</li>';
									}
									
									divStr += '</ul>';
									break;
								case '${getConstant('dictionary.RETURN_GOODS_STATE_20')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">商家于 ' + history.returnHistoryForm.createDate + ' 同意了退货申请并将退货地址发送给采购商</li>';
									if($.trim(history.returnHistoryForm.memo) != ''){
										divStr += '<li class="float-no" style="word-break:break-all">补充说明：' + history.returnHistoryForm.memo.split('<').join('&lt').split('>').join('&gt') + '</li>';
									}
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_GOODS_STATE_30')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">采购商于  ' + history.returnHistoryForm.createDate + ' 退货给商家</li>';
									var billId = '';
									divStr += '<li class="float-no">运单编号：<span>' + $('#billId').val() + '</span></li>';
									var shippingCompanyName = '';
									divStr += '<li class="float-no">物流公司：<span>' + $('#shippingCompanyName').val() + '</span></li>';
									if($.trim(history.returnHistoryForm.memo) != ''){
										divStr += '<li class="float-no" style="word-break:break-all">补充说明：' + history.returnHistoryForm.memo.split('<').join('&lt').split('>').join('&gt') + '</li>';
									}
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_GOODS_STATE_40')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">商家于  ' + history.returnHistoryForm.createDate + ' 收到采购商退货并同意退款</li>';
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_GOODS_STATE_50')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">商家于  ' + history.returnHistoryForm.createDate + ' 收到采购商退货但拒绝退款，平台介入处理</li>';
									if($.trim(history.returnHistoryForm.memo) != ''){
										divStr += '<li class="float-no" style="word-break:break-all">补充说明：' + history.returnHistoryForm.memo.split('<').join('&lt').split('>').join('&gt') + '</li>';
									}
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_GOODS_STATE_60')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">退货申请已完成</li>';
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_GOODS_STATE_70')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">采购商于  ' + history.returnHistoryForm.createDate + ' 撤销了退货申请</li>';
									divStr += '</ul>';
								break;
								case '${getConstant('dictionary.RETURN_GOODS_STATE_80')}' :
									divStr += '<ul class="order-information">';
									divStr += '<li class="float-no">支付平台  ' + history.returnHistoryForm.createDate + ' 退款失败</li>';
									divStr += '</ul>';
								break;
							}
						}else{
							divStr += '<ul class="order-information">';
							divStr += '<li class="float-no">采购商于' + history.returnHistoryForm.createDate + ' 提交了退货申请</li>';
							divStr += '<li class="float-no">退货原因：' + history.returnHistoryForm.returnReasonText + '</li>';
							divStr += '<li class="float-no">退款金额：<strong class="font-color-b">' + formatnumber(history.returnHistoryForm.returnMoney, 2) + '</strong>元</li>';
							divStr += '<li class="float-no">退货商品数量：&nbsp;<strong>' + history.returnHistoryForm.amount + '&nbsp;</strong></li>';
							if($.trim(history.returnHistoryForm.memo) != ''){
								divStr += '<li class="float-no" style="word-break:break-all">补充说明：' + history.returnHistoryForm.memo.split('<').join('&lt').split('>').join('&gt') + '</li>';
							}
							
							divStr += '</ul>';
							var returnReason = history.returnHistoryForm.returnReason;
							divStr += '<input type="hidden" class="returnReason" value="' + returnReason + '" />';
						}
						
						if(history.returnPictureFormList.length != 0){
							divStr += '<div class="information-line p-t-0">';
							divStr += '<span class="linespan wauto">上传凭证：</span>';
							divStr += '<ul class="groupimg left m-0" style="clear:none;">';
							for(var j = 0; j < history.returnPictureFormList.length; j++){
								divStr += '<li>';
								divStr += '<img src="'+ history.returnPictureFormList[j].picUrl + history.returnPictureFormList[j].picName +'" width="800" height="800">';
								divStr += '<div class="goodsoperation"><span title="放大" class="bigimg"  onclick="bigimg(this)">放大</span></div>';
								divStr += '</li>';
							}
							divStr += '</ul>';
							divStr += '</div>';
						}
						divStr +=  '<div class="clear"></div>';
						divStr +=  '</div>';
						$('#history').append(divStr);
					}
				}
				
			}
	   });
	});
	
	// 找出买家的上一条记录
	function findLastReturnHistoryForm(returnHistory){
		for(var i = 0; i < returnHistory.length; i++){
			var returnHistory = returnHistory[i];
			if(returnHistory.returnHistoryForm.stateId == '${getConstant('dictionary.RETURN_GOODS_STATE_00')}' && returnHistory.returnHistoryForm.historyTypeId == '${getConstant('dictionary.MEMBER_TYPE_00')}'){
				return returnHistory.returnHistoryForm;
			}
		}
	}
	function formatnumber(value, num){
     var a, b, c, i;
     if(value == 0){
     	return value;
     }
     a = value.toString();
     b = a.indexOf(".");
     c = a.length;
     if (b == -1) {
         a = a + ".";
         for (i = 1; i <= num; i++) {
             a = a + "0";
         }
     } else {
         a = a.substring(0, b + num + 1);
         for (i = c; i <= b + num; i++) {
             a = a + "0";
         }
     }
     return a;
 	}
</script>
</#macro>