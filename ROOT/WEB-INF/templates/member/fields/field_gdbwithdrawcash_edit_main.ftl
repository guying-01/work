<#include "/common/common_var_definds.ftl" />
<#macro render data>
	<#escape x as x?html>
	 
        <div class="cash-collection" >
		 <h2 class="member-tit cashTitle" onclick="javascript :history.go(-1);">> <i></i><a class="goBack" href="javascript:void(0);" </a>编辑提现账户</h2>
		 <form action="${ctx}/cash_gdb/modifyCashAccountInfo.jhtml" method="post" id="addForm" onkeydown="if(event.keyCode==13)$('#btnSubmit').click();"  autocomplete="off">
         <input type="hidden" id="memberId" name="memberId" value="${withdrawCashForm.id!''}"/>
         <div class="cashBoxxx cashBox">
          	
          	<div class="cash-add"> 
          		<span><strong>银行开户名：</strong></span>
	        	<input class=" text_A laydate-icon dm-no-auto-clear" id="accountName" placeholder="请输入开户名" maxlength="50" name="accountName" value="${withdrawCashForm.accountName!''}"/>
	        </div>
          	<div class="cash-add"> 
        	<input type="hidden" id="bankAccountName" name="bankAccountName" value="${withdrawCashForm.bankAccount!''}">
          		<span><strong>银行账号：</strong></span>
	        	<input class=" text_A laydate-icon dm-no-auto-clear" maxlength="20" placeholder="请输入银行账号" id="bankAccount" name="bankAccount" value="${withdrawCashForm.bankAccount!''}"/>
	        </div>
	        <div class="cash-add"> 
          		<span><strong>开户银行支行名称：</strong></span>
	        	<input class=" text_A laydate-icon dm-no-auto-clear" maxlength="100" placeholder="请输入银行支行名称" id="bankName" name="bankName" value="${withdrawCashForm.bankName!''}"/>
	        </div>
	        <div class="cash-add">
	        <span><strong>开户行所在地：</strong></span>
	        <div class="left">
	        <input type="hidden" id="countryName" name="countryName" />
        	<select name="countryId" id="country" onchange="country_init(this.value)" class="left"></select>
        	</div>
	        <div class="left">
	        	<input type="hidden" id="bankCountryName" name="bankCountryName" value="${withdrawCashForm.bankCountry!''}"/>
				<input type="hidden" id="provinceName" name="provinceName" value="${withdrawCashForm.bankProvince!''}"/>
				
        		<select name="bankProvince" id="bankProvince" onchange="proChange(this.value)" class="left m-l-10">
          			<option value="">请选择省</option>
        		</select>
        	</div>
        	<div class="left">
				<input type="hidden" id="cityName" name="cityName" value="${withdrawCashForm.bankCity!''}"/>
        		<select name="bankCity" id="bankCity" onchange="cityChange(this.value)" class="left m-l-10">
          			<option>请选择市</option>
        		</select>
        	</div>
        	<div class="left">
				<input type="hidden" id="bankDistrictName" name="bankDistrictName" value="${withdrawCashForm.bankDistrict!''}"/>
				<select name="bankDistrict" id="bankDistrict" class="left m-l-10">
          			<option>请选择区</option>
        		</select>
				<input type="hidden" id="areaName" name="areaName" value=""/>
        	</div>
        	</div>
        	<div class="cash-add">
	  			 
	        	<a href="javascript:void(0);" onclick="modifyAccountInfo();" class="small-button">保存</a>
	  			<a href="javascript:void(0);" onclick="closeAccountInfo();" dm-actor="confirm-message-cancel" class="small-button-greay m-l-20 shut">取消</a>  
	  		</div>
          	</div>
          	 
           </form>
         </div> 
 
	</#escape>
</#macro> 