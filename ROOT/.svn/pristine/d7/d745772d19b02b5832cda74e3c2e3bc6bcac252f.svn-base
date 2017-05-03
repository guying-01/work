<#include "/common/common_var_definds.ftl" /> 
<#macro render>
  
<script src="${ctx}/resources/js/lib/jquery/jquery.md5.js"></script>
 
<script src="${ctx}/resources/js/lib/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${resources}/js/common/validation.js"></script> 
<script src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script type="text/javascript">
	 
	function save(){
		var bankAccount = $("#bankAccount").html();
		var accountName = $("#bankAccountName").html();
		var withDrawCashPwd = $("#withDrawCashPwd").val();
		var cashAmount = $("#cashAmount").val();
		var balance = $("#balance").val();
		var passwordVerify = $("#passwordVerify").val();
		var url = '${ctx}/gdb_cash/withdrawCashPage.jhtml';
		 
		//提现页面校验
		$("#addForm").validate({
		rules: {
			cashAmount: {
				required : true
			},
			bankAccountName : {
				integer : true,
				required : true
			} ,
			withDrawCashPwd : {
				required : true
			},
			passwordVerify : {
				integer : true,
				required : true
			}  
	    },
	    messages: {
	        cashAmount : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入提现金额 "
			},
			bankAccountName : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入银行账户",
				integer : "<u>&nbsp;</u><i>&nbsp;</i>"+"请输入银行账户" 
			},
			withDrawCashPwd : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入提现密码"
			},
			passwordVerify : {
				integer : "请输入验证码",
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入验证码"
			} 
		}
		});
	    if (!$('#addForm').valid()) {
			// 未通过校验
			return;
		}
		// 添加蒙版
		$.dm.block();
		var param = { accountName:accountName,bankAccount:bankAccount,cashAmount:cashAmount , balance:balance,withDrawCashPwd:withDrawCashPwd,passwordVerify:passwordVerify};
		callService(url, param, {type:'post',
					callSuccess : function(data) {
					if(data.errorVerifyCode=="验证码错误"){
						$.dm.unblock();
						jsAlert(data.errorVerifyCode);
					}else if(data.errorPassword=="密码输入错误"){
						$.dm.unblock();
						jsAlert(data.errorPassword);
					}else if(data.errorMessage!=""&&data.errorMessage!=null){
						$.dm.unblock();
						jsAlert(data.errorMessage);
					}else{
						if(data.success) {
							 setInterval(function(){
							 },6000);
							 jsAlert(data.paysuccess);
							 $.dm.unblock();
							 var params = {
								tab : 'judge'
							 };
							 params.tabStatus = $('#tabStatus').val();
							 $.dm.jumpTo('${ctx}/gdb_cash/toWithdrawCashPage.jhtml', params, {
								'method' : 'get'
							});
						}else{
						 	 $.dm.unblock();
							 jsAlert("提现失败");
						}
					 }
					}
				});
		}
	
	//发送验证码
	function sendVerifyPassword(){
			var mobile = $("#mobile").val();
			var self=$(this);
			$("#passwordVerify").val("");
			callService("${ctx}/gdb_cash/generateAuthCode.ajax",{mobile: mobile},
				{type: 'GET',self:self,callSuccess:function(data){
					if(data.result){
						if(data.content==null){
							showSecTime();
						}else if(data.content==1){
							showSecTime();
							this.self.addClass('sendCode');
							this.self.unbind("click");
							$("#send_timeout").show();
						}
					}else{
						//showSecTime();
						$("#send_failed").css("display", "inherit");
					}
					//短信发送成功
					if(data.show){
						jsAlert(data.msgContent);
					}
			}});
	}
	
	//倒计时
	function showSecTime(){
		var self = $("#send_message");
		self.addClass('sendCode');
		self.unbind("click");
		$("#message_info").show();
		$("#second").html('60');
		//$("#send_msg").css("disabled","disabled");
		var interval=setInterval(function(){
		var second=$.trim($("#second").html());
		if(second==0)
		{
			self.bind("click",sendVerifyPassword);
			self.removeClass('sendCode');
			$("#send_failed").hide();
			$("#message_info").hide();
			$("#send_timeout").hide();
			clearInterval(interval);
		}
		$("#second").html(--second);
	},1000);
	}
	 
	function rememberme(){
		var url="${ctx}/gdb_cash/toModifyCashAccountPasswordPage.jhtml"
		var params={};
		$.dm.jumpTo(url , params, {
								'method' : 'get'
							});
	}
</script>
</#macro>