$(document).ready(function(){
	searchReturnOrderList();
	//点击查看退款退货详细
		$('[dm-actor="toReturnOrderDetail"]').live('click',function(){
			toReturnOrderDetail($(this).attr("value"));
		});
		//点击撤销退款
		$('[dm-actor="doCancelReturnOrder"]').live('click',function(){
			doCancelReturnOrder($(this).attr("value"));
		});
		//点击撤销退货申请
		$('[dm-actor="doCancelGoodsOrder"]').live('click',function(){
			doCancelGoodsOrder($(this).attr("value"));
		});
		//点击修改退货退款申请
		$('[dm-actor="editApplyRefund"]').live('click',function(){
			editApplyRefund($(this).attr("value"));
		});
		//点击填写物流信息
		$('[dm-actor="toshipping"]').live('click',function(){
			toshipping($(this).attr("value"));
		});
	/*	//点击平台接入
		$('[dm-actor="showPop"]').live('click',function(){
			showPop($(this).attr("value"));
		});*/
		
});

	//点击搜索按钮调用的查询方法
	function searchReturnOrderList(){
		$("#datatable").append("<tr class='loading'><td colspan='5'>数据加载中。。。</td></tr>");
		var startDate = encodeURIComponent($("#startDate").val());
		var endDate = encodeURIComponent($("#endDate").val());
		start.delFunc.call(start,start);
		end.delFunc.call(end,end);
		//var goodsName = encodeURIComponent($("#goodsName").val());
		var goodsName = $("#goodsName").val();
		var returnType = encodeURIComponent($("#returnType").val());
		var tagType = encodeURIComponent($("#tagType").val());
		var param = {};
		//$("#noData").show;   //用于界面显示（隐藏）
		param.startDate = startDate;
		param.endDate = endDate;
		param.tagType = tagType;
		param.goodsName = goodsName;
		param.returnType = returnType;
		param.length= $("#rows").val();
		param.pageNumber = $("#currentPage").val();
		$('#datatable tr').not('#dttr').remove();   //清空数据
		callService("/return/findReturnOrderList.ajax",param,{
			callSuccess:function(order){
				var itemName=order.data.itemName;
				var html = $("#returnDetail").html();
				var template = Handlebars.compile(html);
				var strHtml=template(order.data);
				//console.log(order.data);
				$('#datatable').append(strHtml);

				$('#datatable').pager(order , {
					rows : [5, 10, 25 , 50],
					searchMethod : 'searchReturnOrderList',
					drawAfter : function(){
						$('.paging_full_numbers').parent().css('width', '600px');
						$('.dataTables_info').css({'margin-left': '15px', 'margin-top': '-6px'});
					}
				});
			}
		});
	}
	
	//退款单状态切换
	function changeStateId(tagType) {
		$("#goodsName").val("");
		$("#startDate").val("");
		$("#endDate").val("");
		$("#tagType").val(tagType);
		searchReturnOrderList();  //重复调用问题
	}
	
	//跳转到查看退款详情页面
	function toReturnOrderDetail(returnOrderId){
		var url = "/return/toReturnOrderDetail.jhtml";
		var opt={method:'post', target:'_blank'};
		var params={
			returnOrderId:returnOrderId
		};
		$.dm.jumpTo(url, params,opt);
	}
//	// 要求平台介入
//	function showPop(){
//		
//		jsAlert("请拨打平台客服电话：400-000-0001。");  //功能未知，服务器上1.0版本是这么写的 暂时就这样好了
//		//$(".cx2").fadeIn();
//	}
	
	//撤消退款申请
	function doCancelReturnOrder(id, mfDate){
		jsConfirm("确定要撤消退款申请吗?",{callback:function(result){
			if(result){
				var requestUrl = "/return/doCancelReturnOrder.ajax";
				callService(
					requestUrl,
					{"id": id, "mfDate" : mfDate},
					{
						callSuccess:function(data){
							if(data == true) {
								window.location.href="/return/toApplyReturnOrderCancel.jhtml?returnOrderId="+id;
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
				var requestUrl = "/return/doCancelReturnOrder.ajax";
				callService(
					requestUrl,
					{"id": id, "mfDate" : mfDate},
					{
						callSuccess:function(data){
							if(data) {
								window.location.href="/return/toApplyReturnGoodsCancel.jhtml?returnOrderId="+id;
							} else {
								jsErrAlert("撤销退货申请失败！");
								
							}
							
						}
					}
				);
			}
		}});
	}
	
	//编辑退款申请初始化
	function editApplyRefund(id){
		var url='/return/returnEditApplyRefund.jhtml';
		var params={
			returnOrderId:id
		};
		$.dm.jumpTo(url, params);
	}
	
	//跳转到订单详情页面
	function toOrderDetail(orderId){
		var url = "/order/toOrderDetail.jhtml";
		$.dm.jumpTo(url,{orderId:orderId},{target:"_blank"});
	}
	
	//跳转填写退款物流信息
	function toshipping(id){
	var url='/return/toShipping.jhtml';
		var params={
			returnOrderId:id
		};
		$.dm.jumpTo(url, params);
	}
	//介入操作
	function adminCheck(id){
		jsConfirm("确定后请拨打平台客服电话：22222222222",{callback:function(result){
			if(result){
				var requestUrl = '/order/platformInterpose.ajax';
				callService(
					requestUrl,
					{ "returnOrderId":id},
					{
						callSuccess:function(data){					
							//jsAlert("平台介入成功！请拨打平台客服电话：${getConstant('constant.PMO_SERVICE_PHONE')}");
							//jsAlert("平台介入成功！请拨打平台客服电话：${getConstant('constant.PMO_SERVICE_PHONE')}");
							changeStateId('1');
						},callValidFailed:function(error){
							jsAlert(error.businessErrAttachs[0][0].defaultMessage);
						}
					}
				);
			}
		}});
	}
	
	