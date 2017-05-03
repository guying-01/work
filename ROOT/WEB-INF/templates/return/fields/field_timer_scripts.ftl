<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render >	

<script type="text/javascript">	
	var d,h,m,s,dstr,hstr,mstr,sstr,timestr;
	var etime=0;
	$(document).ready(function () {
	initTime();
		if(etime!=-1){
			window.setInterval('timer()',1000);
		};
	});
function initTime(){
		var requestUrl = "${ctx}/return/initTime.ajax";
		callService(
						requestUrl,
						{ "orderDetailId": $('#odid').val(),
						  "returnOrderId": $('#returnOrderId').val(),
						  "code":$('#autoTimeTypeCode').val()
						},
						{
							callSuccess:function(data){
								if(data != null && data != '') {
									etime=data;
								}
							}
						}
		);
	}
function timer(){
if(etime > -1){
	var itime=0;
    d = Math.floor(etime / (3600*24));
    itime = etime - d*3600*24;
	h = Math.floor(itime / 3600);
	m = Math.floor(itime / 60) % 60;
	s = Math.floor(itime % 60);
	
	d <0? d = 0 : d = d;
	h <0? h = 0 : h = h;
	m <0? m = 0 : m = m;
	s <0? s = 0 : s = s;
	d.toString().length < 2 ? dstr = "0" +d.toString() : dstr = d;
	h.toString().length < 2 ? hstr = "0" +h.toString() : hstr = h;
	m.toString().length < 2 ? mstr = "0" +m.toString() : mstr = m;
	s.toString().length < 2 ? sstr = "0" +s.toString() : sstr = s;
	
	timestr =dstr + "天" + hstr + ":" +mstr + ":" + sstr;
	$('#timekeep').html(timestr);
	
		etime = etime - 1;
	}else{
		timestr =00 + "天" + 00 + ":" +00 + ":" + 00;
	}
}

	//撤消退货申请
	function doCancelGoodsOrder(id){
		jsConfirm("确定要撤消退货申请吗?",{callback:function(result){
			if(result){
				var requestUrl = "${ctx}/return/doCancelReturnOrder.ajax";
				callService(
					requestUrl,
					{"id": id, "mfDate" : $("#motifyDate").val()},
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
	//撤消退款申请
	function doCancelReturnOrder(id){
		jsConfirm("确定要撤消退款申请吗?",{callback:function(result){
			if(result){
				var requestUrl = "${ctx}/return/doCancelReturnOrder.ajax";
				callService(
					requestUrl,
					{"id": id, "mfDate" : $("#motifyDate").val()},
					{
						callSuccess:function(data){
							if(data == true) {
								window.location.href="${ctx}/return/toApplyReturnOrderCancel.jhtml?returnOrderId="+id;
								//var dt = new dataTable("datatable");
								//dt.table.draw(false);
							} else {
								jsErrAlert("撤销退款申请失败！");
							}
						}
					}
				);
			}
		}});
	}
	
</script>
</#macro>