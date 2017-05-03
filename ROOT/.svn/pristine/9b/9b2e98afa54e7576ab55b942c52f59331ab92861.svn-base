<#include "/common/common_var_definds.ftl" />
<#macro render data>
	<#escape x as x?html>

	<script type="text/javascript">
	 $(document).ready(function() {
	  		//发送短信绑定事件
		 $("#send_message").bind("click",sendVerifyPassword);
		
	 		$("#passwordVerify").attr("");
 			var bankAccountNameId = $("#bankAccountName").val();
 			var html;
			var params={bankAccountNameId:bankAccountNameId};
			
			$.ajax( {
				type : "POST",
				url : "${ctx}/gdb_cash/findAllAccountName.ajax",
				data :{},
				dataType : 'json',
				success : function(data){
						var Curedata = data;
						//html=Curedata.gdbWithdrawCashVos.accountName;
						$("#bankAccountName").empty();
						$("#bankAccount").empty();
						$("#bankAccountName").append(Curedata.bankAccountName) ;
						$("#bankAccount").append(Curedata.bankAccount);
						}
			});
			 
			$.ajax( {
				type : "POST",
				url : "${ctx}/gdb_cash/findAccountBalance.ajax ",
				data :params,
				dataType : 'json',
				success : function(data){
						var Curedata = data;
							$("#accountbalance").empty();
							$("#accountbalance").append(data.balance).append(" 元");
						 	$("#balance").val(data.balance);
						 	$("#bankName").val(data.bankName);
						}
			});
	 	  
 	});
	
	</script>
	<div class="member-list-tab" >
        <div class="cash-collection" >
		 <h2 class="member-tit cashTitle" onclick="javascript :history.go(-1);'><a class="goBack" href="javascript:;"></a> <i></i>提现</h2>
		 <form action="${ctx}/cash_gdb/addCashAccountInfo.jhtml" method="post" id="addForm" onkeydown="if(event.keyCode==13)$('#btnSubmit').click();"  autocomplete="off">
         <div class="cashBox">
        	<input type="hidden" id="balance" value="${balance!''}" />
        	<input type="hidden" id="mobile" value="${mobileNumber!''}" />
        	<input type="hidden" id="userCode" name="userCode" <#if memberForm??>value="${memberForm.userCode!''}" </#if>/>
        	<div class="cash-add"> 
	       		<span> 可用余额： </span>
	       		<div id="accountbalance" name="accountbalance">  </div>
	        </div>
	        
	        <div class="cash-add"> 
	       		<span> <i class="font-color"> * </i>提现金额： </span>
	        	<input class=" text_A laydate-icon dm-no-auto-clear"  maxlength="100" placeholder="请输入提现金额" id="cashAmount" name="cashAmount"/>
	        </div>
	        
	        <div class="cash-add"> 
	       		<span> 账户： </span>
	        	<div class="left" style="position: relative;">
        		<label name="bankAccountName"  id="bankAccountName" class="left m-l-10">
        		</label>
        		</div>
	        </div>
	        
	        <div class="cash-add">
	        	<span> 账号： </span> <div id="bankAccount" name="bankAccount" style="float:left;"></div>
        	</div>
        	 
          	<div class="cash-add">
          		<span> 手机号码： </span>
          		<span class="phoneNum"> ${mobile!''}
          		</span>
	        	<a href="javascript:void(0);" id="send_message" class="small-button ">发送验证码</a>
                <em></em>
                <div id="send_failed" class="message_info" style="color:red;display:none;">发送失败，请重试</div>
	            <div id="send_timeout" class="message-info" style="color:red;display:none;" >请等待一分钟后发送您的请求</div>
            	<div class="loginError" id="message_info" style="display:none;"> <span>验证码已发出，请注意查收短信，如果没有收到，您可以在</span><span class="font-color-b" style="float:left;" id="second"> 60 </span> <span style="float:left;" >秒后要求系统重新发送 </span></div>
            </div>
            <div class="cash-add">
          		<span><i class="font-color"> * </i>验证码：</span>
	        	<input id="passwordVerify" name="passwordVerify" class="text_A left width150 dm-no-auto-clear" value=""  maxlength="6" placeholder="请输入验证码" type="text"/>
	        </div>
	        
        	<div class="cash-add"> 
        		<span> <i class="font-color"> * </i>提现密码： </span>
	        	<input type="hidden" id="withDrawPwd" name="withDrawPwd" />
	        	<input type="password" class=" text_A laydate-icon dm-no-auto-clear"  maxlength="50" placeholder="请输入提现密码" id="withDrawCashPwd" name="withDrawCashPwd" />
	        	<a href="javascript:void(0);" onclick="rememberme();" class="forgetPsw">忘记密码？</a>
	        </div>
	        
        	<div class="cash-add">
	        	<a href="javascript:void(0);" id="withDrawCash" onclick="save();" class="small-button">提现</a>
	  			 
	  		</div>
          	</div>
          	 
           </form>
         </div> </div> 
	</#escape>
</#macro> 