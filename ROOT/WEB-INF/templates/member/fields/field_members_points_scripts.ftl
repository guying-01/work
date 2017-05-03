<#include "/common/common_var_definds.ftl" />
<#macro render>
<#--<script type="text/javascript" src="${resources}/js/common/menu.js"></script>-->
<#-- 引用jquery dataTable 的js文件     开始 -->
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.dataTables.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/dt-operation-commons.js"></script>
<#-- 引用jquery dataTable 的js文件       结束-->
<script type="text/javascript" src="${resources}/js/common/tab.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    initPoints();
    initSearch();
    
});

// 初始化获取总积分
function initPoints(){
	var url ='${ctx}/member/findSellerPoints.ajax';
	$.ajax({
		type: 'POST',
		url: url,
		dataType: 'json',
		success: function(data){
			if(data.success == true){
				if(data.result != null){
					$("#points").html("").append(data.result.totalPoints);
				}
			}else{
				jsErrAlert(data.message||'获取积分失败！');
			}
		}
	});
}


function initSearch(){
	$("#datatable").addIndex().DataTable({
  		"ajax": {
   		"url": dm_ctx +"/member/findSellerPointsDetailList.ajax",
    	"type": "POST"
  		},
  		"columns": [
			{ "mRender":function(data,type,full){
							//changeReason
							var str = full.changeReason;
							var orderId= full.orderId ;
							if(orderId != null){
								str = str + '<br>订单号 :'+ orderId;
							}
							
							//str = str + '订单号 : <a class="font-color-c" href="javascript:searchOrderDetail(\''+ orderId +'\');">'+orderId+'</a>';
							return str;
						}
			},
			{ "mRender":function(data,type,full){
							var str = '';
							if(full.changeType == '00'){
								str = '+'+full.changeValue;
							}else if(full.changeType == '10'){
								if(full.changeValue == 0){
									str = full.changeValue;
								}else{
									str = '-'+full.changeValue;
								}
							}
							return str;
						}
			},
			{ "mRender":function(data,type,full){
							var date = format(full.changeTime, 'yyyy-MM-dd HH:mm:ss');
							return date;
						}
			}
  		],
  		"fnDrawCallback" : function(){
			$('.dataTables_info').css('margin-left', '15px');
			$('.dataTables_length').css('margin-left', '10px');
			$('.dataTables_length').css('margin-top', '10px');
  		}
	});
};


// 跳转到订单详情页面
function searchOrderDetail(orderId){
//
}

// 毫秒转成日期格式
function format(time, format){
    var t = new Date(time);
    var tf = function(i){return (i < 10 ? '0' : '') + i};
    return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
        switch(a){
            case 'yyyy':
                return tf(t.getFullYear());
                break;
            case 'MM':
                return tf(t.getMonth() + 1);
                break;
            case 'mm':
                return tf(t.getMinutes());
                break;
            case 'dd':
                return tf(t.getDate());
                break;
            case 'HH':
                return tf(t.getHours());
                break;
            case 'ss':
                return tf(t.getSeconds());
                break;
        }
    })
}
</script>
</#macro>