<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render>

<script src="${ctx}/resources/js/common/tab.js"></script>
<script src="${ctx}/resources/js/member/card.js"></script>
<script src="${ctx}/resources/js/lib/jquery/jquery.dataTables.js" type="text/javascript"></script>
<script src="${ctx}/resources/js/lib/jquery/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="${ctx}/resources/js/lib/jquery/dt-operation-commons.js" type="text/javascript"></script>




<script type="text/javascript">
var div0_mark=0;
var div1_mark=1;
var div2_mark=2;
$(document).ready(function() {
	$("#JKDiva_0").attr("mark",div0_mark);
	$("#JKDiva_1").attr("mark",div1_mark);
	$("#JKDiva_2").attr("mark",div2_mark);
	
	  // 领取优惠券后，进入商城优惠券界面
	  if($("#showFlg").val() == "showFlg"){
		 ChangeDiv('1','JKDiva_',2);
		 $("#selected1").removeClass();
		 $("#selected2").attr("class","on");
	  }
	  
	  //初始化排序
	  $(".denominationSortNum").val('1');
	  $(".endDateSortNum").val('');
	  $(".createDateSortNum").val('');
	  
	  toFindActivityCouponList(1);
	  $(".denominationSort").click(function(){
		  var dom=$(this).parents();
	      //重置其他筛选项
	  	  dom.find(".endDateSortNum").val('');
	  	  dom.find(".createDateSortNum").val('');
	  	  if(!dom.find(".denominationSortNum").val()){
	  		dom.find(".denominationSortNum").val('2')
	  	  } 
	  	dom.find(".denominationSortNum").val(dom.find(".denominationSortNum").val() == 1 ? 2 : 1);
	  	  toFindActivityCouponList(1);
	  });
	  $(".endDateSort").click(function(){
		  var dom=$(this).parents();
	      //重置其他筛选项
	      dom.find(".denominationSortNum").val('');
	      dom.find(".createDateSortNum").val('');
	  	  if(!dom.find(".endDateSortNum").val()){
	  		dom.find(".endDateSortNum").val('1')
	  	  }
	  	dom.find(".endDateSortNum").val(dom.find(".endDateSortNum").val() == 1 ? 2 : 1);
	  	  toFindActivityCouponList(1);
	  });
	  $(".createDateSort").click(function(){
		  var dom=$(this).parents();
	      //重置其他筛选项
	      dom.find(".denominationSortNum").val('');
	      dom.find(".endDateSortNum").val('');
	      if(!dom.find(".createDateSortNum").val()){
	    	  dom.find(".createDateSortNum").val('1')
	  	  }
	      dom.find(".createDateSortNum").val(dom.find(".createDateSortNum").val() == 1 ? 2 : 1);
	  	  toFindActivityCouponList(1);
	  });
	  $(".commit").click(function(){
		  var dom=$(this).parents("[mark*=]");
	      toFindActivityCouponList(1);
	  });
});

function ChangeDiv(p, divName, zDivCount){
	for(i=0;i<=zDivCount;i++){ 
		$('#'+divName+i).hide(); 
	}
	$('#'+divName+p).show(); 
	$('#status').val(p);
	$('#currentPage').val(1);
	$('#rows').val('6');
	toFindActivityCouponList(1);
}

function toFindActivityCouponList(currentPage){
	var mark = $('#status').val();
	var issuerName = $(".issuerName").val();
	var param={};
	var appendDom;
	var tableUrl="${ctx}/activity/findMemberCouponListByConditions.ajax";
	$("#currentPage").val(currentPage);
	var start = (currentPage-1) * $("#rows").val();
	var length = $("#rows").val();
	if(mark==0)
	{
		param['notIssuerId']='${getConstant('activity.ISSUER_ID_00')}';
		appendDom=$("#JKDiva_0");
	}else if (mark==1){
		param['issuerId']='${getConstant('activity.ISSUER_ID_00')}';
		appendDom=$("#JKDiva_1");
	}
	param=$.extend(param,{"issuerName":issuerName,"start":start,"length":length,"denominationSort":appendDom.find(".denominationSortNum").val()
			 ,"endDateSort":appendDom.find(".endDateSortNum").val(),"createDateSort":appendDom.find(".createDateSortNum").val()});
	callService(tableUrl,param,{async: false, callSuccess:function(datas){
	      if(datas != "" && datas.data.length > 0){
	          var str = "";
	          for(var i = 0; i < datas.data.length; i++) {
	        	    if(mark==div1_mark||mark==div2_mark)
	        	    	datas.data[i].issuerName="商城"
					str += "<div class='member-coupons'>";
					str += "<h2><i>&nbsp;</i>"+datas.data[i].issuerName+"<span onclick='removeByIds(this)' id='"+datas.data[i].id+"' title='删除'></span></h2>";
					
					if(datas.data[i].icon){
						str += "<div class='coupons' style='background:url("+${ctx}datas.data[i].icon+");background-size :100% auto;'>";
					}else{
						//默认背景颜色
						str += "<div class='coupons coupons-bgA'>";
					}
					
					str += "<i class='coupons-top-black'></i><i class='coupons-bottom-black'></i>"
						+ "<div class='coupons-price'>￥<strong>"+datas.data[i].denomination+"</strong></div>"
						+ "<div class='coupons-infor'>"
						+ "<p class='font14'>"+datas.data[i].issuerName+"</p>"
						+ "<p>全店通用</p>";
					if(mark!=div2_mark)
						str	+= "<p>全店"+datas.data[i].money+"使用</p>";
					if(mark==div0_mark||mark==div1_mark)
						str	+= "<p>有效期 "+datas.data[i].startDate+" - "+datas.data[i].endDate+"</p>"
							+ "</div></div>";
					else
						str += "<p>有效期 "+datas.data[i].endDate+"</p>"
						    +  "</div></div>";
					str += "</ul></div></div>";
					str += "</div>";
				}
				str += "<div class='clear'></div>";
				
				appendDom.find(".content").html(str);
				appendDom.pager(datas, {
					rows : [6, 12, 24, 48],
					searchMethod : 'toFindActivityCouponList',
					drawAfter : function(){
						$('#datatable_info').parent().css('width', '400px');
					}
				})
		}else{
			var str = '<div style="text-align: center;" class="clear">没有匹配的记录</div>'
			appendDom.find(".content").html(str);
			appendDom.pager(datas, {
				rows : [6, 12, 24, 48],
				searchMethod : 'toFindActivityCouponList',
				drawAfter : function(){
					$('#datatable_info').parent().css('width', '400px');
				}
			})
		}
	}});
}

function removeByIds(dom){
	jsConfirm('确定要删除这条数据吗?',{callback:function(result){
	if(result){
	var url = "${ctx}/activity/removeMemberCouponByCouponId.ajax";
	var query = {"id":$(dom).attr("id")};
	var status = $('#status').val();
	callService(url,query,{async: false,callSuccess:function(result){
		if(result > 0){
			var currentPage = $('#currentPage').val();
			toFindActivityCouponList(currentPage);
		}
	}});
	}}
	})
}
</script>
</#macro>