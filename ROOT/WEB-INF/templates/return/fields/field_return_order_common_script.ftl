<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render>
<script type="text/javascript">
	
	//编辑退款申请初始化
	function editApplyRefund(id){
		var url='${ctx}/return/returnEditApplyRefund.jhtml';
		var params={
			returnOrderId:id
		};
		$.dm.jumpTo(url, params);
	}
	
	//撤消退款申请
	function doCancelReturnOrder(id, mfDate){
		jsConfirm("确定要撤消退款申请吗?",{callback:function(result){
			if(result){
				var requestUrl = "${ctx}/return/doCancelReturnOrder.ajax";
				callService(
					requestUrl,
					{"id": id, "mfDate" : mfDate},
					{
						callSuccess:function(data){
							if(data == true) {
								window.location.href="${ctx}/return/toApplyReturnOrderCancel.jhtml?returnOrderId="+id;
								var dt = new dataTable("datatable");
								dt.table.draw(false);
							} else {
								jsErrAlert("撤销退款申请失败！");
							}
						}
					}
				);
			}
		}});
	}
	
	//撤消退货申请
	function doCancelGoodsOrder(id, mfDate){
		jsConfirm("确定要撤消退货申请吗?",{callback:function(result){
			if(result){
				var requestUrl = "${ctx}/return/doCancelReturnOrder.ajax";
				callService(
					requestUrl,
					{"id": id, "mfDate" : mfDate},
					{
						callSuccess:function(data){
							if(data) {
								window.location.href="${ctx}/return/toApplyReturnGoodsCancel.jhtml?returnOrderId="+id;
							} else {
								jsErrAlert("撤销退货申请失败！");
								
							}
							
						}
					}
				);
			}
		}});
	}
	//跳转填写退款物流信息
	function toshipping(id){
	var url='${ctx}/return/toShipping.jhtml';
		var params={
			returnOrderId:id
		};
		$.dm.jumpTo(url, params);
	}
</script>
</#macro>