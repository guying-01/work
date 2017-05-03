<#include "/common/common_var_definds.ftl" />
<#macro render data>
	<#escape x as x?html>
	<div class="member-list-tab" >
	<h2 class="member-tit cashTitle" onclick="javascript :history.go(-1);"> <i></i><a class="goBack" href="javascript:void(0);"></a>提现账户</h2>
	    <div class="cashAccountBox" id="accountData"></div>
      	<input type="hidden" id="currentPage" name="currentPage" value="1"/>
        <input type="hidden" id="rows" name="rows" value="5"/>
        <script id="cashList-tl" type="text/x_handlebars_template">
          	{{#each this}}
            <div class="everyCashAccount">
              <div class="line"><strong>银行账号:</strong><span>{{bankAccount}}</span></div>
              <div class="line"><strong>银行名称:</strong><span>{{bank}}</span></div>
              <div class="line"><strong>银行开户名:</strong><span>{{accountName}} </span></div>
              <div class="line"><strong>开户银行支行名称:</strong><span>{{bankName}}</span></div>
              <div class="line"><strong>开户银行所在地:</strong><span>{{bankProvince}}省&nbsp;{{bankCity}}市&nbsp;{{bankDistrict}} </span></div>
              <div class="line line1"><strong>操作:</strong><span>
            	<a href="javascript:void(0);" class="m-l-10 font-color-c" onclick="deleteAccountInfo({{id}});" dm-actor="deleteAddress" value='{{id}}'>删除</a>
              	<a href="javascript:void(0)" class="font-color-c" onclick="toModifyAccountInfo({{id}});" dm-actor="editAddress" value='{{id}}'>编辑</a>
              </span></div>
            </div>
        	{{/each}}
        </script>
       
        </div>
        
        <div class="cash-collection" >
		 <h2 class="member-tit"> <i></i>新增提现账户</h2>
		 <form action="${ctx}/cash_gdb/addCashAccountInfo.jhtml" method="post" id="addForm" onkeydown="if(event.keyCode==13)$('#btnSubmit').click();"  autocomplete="off">
         <div class="cashBox cashBoxx">
        	 
          	<div class="cash-add"> 
          		<span> <i class="font-color"> * </i> 银行开户名： </span>
	        	<input class=" text_A laydate-icon dm-no-auto-clear" id="accountName" placeholder="请输入开户名" maxlength="50" name="accountName" value=""/>
	        </div>
          	<div class="cash-add"> 
          		<span><i class="font-color"> * </i> 银行账号： </span>
	        	<input class=" text_A laydate-icon dm-no-auto-clear"  maxlength="19" placeholder="请输入银行账号" id="bankAccount" name="bankAccount"/>
	        </div>
	        <div class="cash-add"> 
	       		<span > <i class="font-color"> * </i>开户银行支行名称： </span>
	        	<input class=" text_A laydate-icon dm-no-auto-clear"  maxlength="100" placeholder="请输入银行支行名称" id="bankName" name="bankName"/>
	        </div>
	        <div class="cash-add">
	        	<span> <i class="font-color"> * </i>开户行所在地： </span>
	        <div class="left">
        	<select name="countryId" id="country" onchange="country_init(this.value)" class="left"></select>
        	</div>
	        <div class="left">
        		<select name="bankProvince" id="bankProvince" onchange="proChange(this.value)" class="left m-l-10">
          			<option value="">请选择省</option>
        		</select>
        	</div>
        	<div class="left">
        		<select name="bankCity" id="bankCity" onchange="cityChange(this.value)" class="left m-l-10">
          			<option>请选择市</option>
        		</select>
        	</div>
        	<div class="left">
				<select name="bankDistrict" id="bankDistrict" class="left m-l-10">
          			<option>请选择区</option>
        		</select>
				<input type="hidden" id="areaName" name="areaName" value=""/>
        	</div>
        	</div>
        	<div class="cash-add"> 
        	<span> <i class="font-color"> * </i>提现密码： </span>
	        	<input type="password" class=" text_A laydate-icon dm-no-auto-clear" style="float:left;" maxlength="50" placeholder="请输入提现密码" id="withDrawPwd" name="withDrawPwd" />
	        </div>
        	<div class="cash-add">
	        	<a href="javascript:void(0);" onclick="save();" class="small-button">确定</a>
	  			 
	  		</div>
          	</div>
           </form>
            <div class="cashAccountFill"></div>

		</div>
	</#escape>
</#macro> 