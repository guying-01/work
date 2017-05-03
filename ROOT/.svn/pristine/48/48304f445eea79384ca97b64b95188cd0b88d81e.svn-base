<#include "/common/common_var_definds.ftl" /> <#macro render data>
<#escape x as x?html>
<style>
.dataTables_info{ margin-top:0!important;}
</style>
<div class="member-list">
	<ul class="tabT" id="stateIdTab">
		<li
			onclick="JavaScript:changeStateId('${getConstant('system.ALL_RETURN_MONEY_OR_GOODS_TAG')}')"
			class="on"><span>所有退款/退货</span></li>
		<li
			onclick="JavaScript:changeStateId('${getConstant('system.RETURN_MONEY_OR_GOODS_RETURNING_TAG')}')"><span>退款/退货中</span></li>
		<li
			onclick="JavaScript:changeStateId('${getConstant('system.RETURN_MONEY_OR_GOODS_FINISH_TAG')}')"><span>已完成</span></li>
	</ul>
	<div id="JKDiva_0" class="member-list-tab">
		<div class="order-serch">
				<strong>商品名称：</strong> 
				<input type="text" class=" text_A dm-no-auto-clear" id="goodsName" name="goodsName" maxLength="100"> 
				<strong>退款申请时间：</strong>
				<input readonly=""class=" text_A laydate-icon dm-no-auto-clear" id="startDate"name="startDate">
				<span>-</span> 
				<input readonly="" class=" text_A laydate-icon dm-no-auto-clear" id="endDate" name="endDate">  
				<input type="hidden" value="" id="tagType" />
				<strong>退款类型：</strong> 
				<select id="returnType" class="form-control" >
                    <option selected="selected" value="">请选择退款类型</option>
					<option value="00">退款</option>
					<option value="10">退货</option>
                </select>
			 <a href="javascript:void(0)" class="small-button left m-l-20" onClick="searchReturnOrderList()"> 查找 </a>
		</div>
		
		<table width="960" border="0" cellspacing="0" cellpadding="0" class="table-line" id="datatable">
          <tr id="dttr" class="bor-l bor-r bor-t">
            <th width="330" colspan="2" scope="col">商品名称</th>
            <th width="120" scope="col">交易金额（元）</th>
         
            <th width="120" scope="col">退款类型</th>
            <th width="130" scope="col">退款金额（元）</th>
            <th width="130" scope="col">退款状态 </th>
            <th scope="col">操作</th>
          </tr>
        </table>
		<div class="page" id="pageShow" style="display: none;"></div>
		<input id="currentPage" type="hidden" value="1"/>
		<input id="rows" type="hidden" value="10"/>
	</div>
	<div id="JKDiva_1"  class="member-list-tab"  style="display:none" >
      		<div class="order-empty"><i></i>你还没有退款～</div>
      </div>
	 <div id="JKDiva_2"  class="member-list-tab"  style="display:none" >没有订单</div>
</div>
<div class="nullA" id="noData" style="padding:50px 0;display:none"><img src="${ctx}/resources/img/member/null1.png" width="51" height="43" class="left m-t-10">
          <div class="left">
           <P >没有订单哦~~~</P>
           </div>
 </div>           
<script id="returnDetail" type="text/x-handlebars-template">
{{#each this}}
          <tr>
            <td colspan="7" class=" table_bgA">
           <#-- {{#compare orderId}} --><#--判断订单编号是否重复-->
	              <p class="left m-r-20">退款单编号：<a href="javascript:void(0);" dm-actor="toReturnOrderDetail" value='{{id}}');">{{id}}</a></p>
	              <p class="left m-r-20">订单编号：<a href="javascript:toOrderDetail('{{orderId}}');">{{orderId}}</a></p>
	              <p class=" m-r-10"> 退款时间：{{applyDate}}</p>
	              <p><a href="/fsst/{{storeId}}/top.jhtml">{{storeName}}</a><a href="javascript:QQtalk('1739073619');" class="consulting" dm-actor="webim-store" dm-data="{{userCode}}"><i></i>联系客服</a></p>
	            <#--  {{/compare}}-->
            </td>
          </tr>   
          <tr>	
            <td width="100" ><a href="/fsgd/{{goodsId}}.jhtml"><img src="{{itemSmallPicturePath}}" width="160" height="160" /></a></td>
            <td width="230" class="textalign-l ">
            <a href="/fsgd/{{goodsId}}.jhtml" title="{{goodsName}}">{{goodsName}}</a>
            <P>${(itemName!'')?replace(goodsName!'','','f')}</P>
            </td>
            <td >{{payMoney}}</td>
            <td class="bor-l">
                          {{#tuikuanleixing returnType}}
                          {{/tuikuanleixing}}  <#--退款，退货-->
              </td>
            <td rowspan="2" class="bor-l" >{{returnMoney}}<br />
             </td>
            <td rowspan="2" class="bor-l">
         		           <P>{{#tuikuanzhuangtai returnType stateId}}{{/tuikuanzhuangtai}}</P> <#--状态-->
      <#------------------------------------------------------handlebar 判断---------------------------------------------------------------->
         	{{#tuikuan returnType}}
              <a href="javascript:void(0);" class="font-color-c" dm-actor="toReturnOrderDetail" value='{{id}}'>查看退款详情</a><br />
              {{/tuikuan}}
              
         	{{#tuihuo returnType}}
              <a href="javascript:void(0);" class="font-color-c" dm-actor="toReturnOrderDetail" value='{{id}}'>查看退货详情</a><br />
              {{/tuihuo}}
              
              </td>
            <td rowspan="2" class="bor-l">
            
            {{#nothing returnType stateId}}
				<a href="javascript:void(0);" class="font-color-c" style="cursor:default; text-decoration:none;"></a>
			{{else}}
				<a href="javascript:void(0);" class="font-color-c" dm-actor="doCancelReturnOrder" value='{{id}}'>撤销{{#tuikuan returnType}}退款{{else}}退货{{/tuikuan}}申请</a><br>
			{{/nothing}}
            {{#maijiajujue stateId}}
	            <a href="javascript:void(0);" class="font-color-c" dm-actor="editApplyRefund" value='{{id}}'>修改{{#tuikuanleixing returnType}}{{/tuikuanleixing}}申请</a><br>
				<a  href="javascript:void(0);" class="font-color-c" onclick="adminCheck('{{id}}')">平台介入</a>
			{{/maijiajujue}}
			{{#wuliu returnType stateId id}}
				
			{{/wuliu}}
            </td>
          </tr>
  {{/each}}
</script>

<script type="text/javascript">	
<#-- 卖家同意退货（填写物流信息）-->
Handlebars.registerHelper("wuliu",function(returnType,stateId,id,options){
	var str = '<a href="javascript:void(0);" class="font-color-c" dm-actor="toshipping" value="'+id+'">填写物流信息</a><br />';
	 if(returnType=='00'){
		 return options.fn(this);
	 }else{
	 	if(stateId=='20'){
	 		return new Handlebars.SafeString(str);
	 	}else{
	 		return options.fn(this);
	 	}
	 }
});
<#--退款的时候，，，，卖家拒绝-->
Handlebars.registerHelper("maijiajujue",function(param,options){
	 if(param=='10'){
	  return options.fn(this);
	 }else{
	  return options.inverse(this);
	 }
});

<#--退款关闭 退款完成就是-->
Handlebars.registerHelper("nothing",function(returnType,param,options){
   if(returnType=='00'){
   	if(param=='20' || param=='40' || param=='50'){
	  return options.fn(this);
	 }else{
	  return options.inverse(this);
	 }
   }else{
   	if(param=='40' || param=='60' || param=='70'){
	  return options.fn(this);
	 }else{
	  return options.inverse(this);
	 }
   }
	 
});
<#--退款-->
Handlebars.registerHelper("tuikuan",function(param,options){
	 if(param=='00'){
	  return options.fn(this);
	 }else{
	  return options.inverse(this);
	 }
});
<#--退货-->
Handlebars.registerHelper("tuihuo",function(param,options){
	 if(param=='10'){
	  return options.fn(this);
	 }else{
	  return options.inverse(this);
	 }
});




<#--*****各种状态*****-->
Handlebars.registerHelper("tuikuanleixing",function(param,options){
	 if(param=='10'){
	  return "退货";
	 }else{
	  return "退款";
	 }
});
Handlebars.registerHelper("tuikuanzhuangtai",function(type,param,options){
	if(type == '10'){
		switch(param)
		{
			case '00':
			  return "等待商家处理";
			  break;
			case '10':
			  return "商家拒绝退货";
			  break;
			case '20':
			  return "等待采购商退货";
			  break;
			case '30':
			  return "等待商家收货";
			  break;
			case '40':
			  return "等待系统处理";
			  break;
			case '50':
			  return "等待平台处理";
			  break;
			case '60':
			  return "退货完成";
			case '70':
			  return "退货关闭";
		}
	}else{
		 switch(param)
		{
			case '00':
			  return "等待商家处理";
			  break;
			case '10':
			  return "商家拒绝退款";
			  break;
			case '20':
			  return "等待系统退款";
			  break;
			case '30':
			  return "等待平台处理";
			  break;
			case '40':
			  return "退款完成";
			  break;
			case '50':
			  return "退款关闭";
			  break;
		}
	}
});
<#--比较上一个orderId是不是和当前的orderId相等-->
 Handlebars.registerHelper("compare",function(orderId,opt){
	var index = opt.data.index;
	var dataSrc = opt.data.root;
	if(index == 0 || orderId != dataSrc[index-1].orderId){
         return opt.fn(this);
	}
 });

</script>
</#escape> 
</#macro>
