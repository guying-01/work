<#include "/common/common_var_definds.ftl" /> 
<#macro render>
  
<script src="${ctx}/resources/js/lib/jquery/jquery.md5.js"></script>
<script src="${ctx}/resources/js/lib/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${resources}/js/common/validation.js"></script> 
<script src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
 
<script type="text/javascript">
	$(document).ready(function(){
			$("#passwordVerify").val("");
		    $("#withDrawPwd").val("");
		    $("#withDrawPwdConfirm").val("");
		 //发送短信绑定事件
		 $("#send_message").bind("click",sendVerifyPassword);
		
		 //新密码失去焦点绑定事件
		 $("#withDrawPwd").blur(function () {
		  $("#pwdrule").css("display","none");
            var password = $("#withDrawPwd").val();
            var passwordConfirm = $("#withDrawPwdConfirm").val();
            var ragex =	/^[a-zA-Z0-9_]*$/;
            if (withDrawpassword.length > 0) {
                if (!ragex.test(withDrawpassword) || withDrawpassword.length < 6) {
                     
                    $("#withDrawPwd").addClass("redborder");
                    return false;
                }
 
            }
            pwdStrongCheck(withDrawpassword);
        });
        
        //提示信息
        $("#withDrawPwd").focus(function(){
		 	$("#pwdrule").css("display","inherit");
	 	});
		
        $("#withDrawPwdConfirm").blur(function () {
            var confirmPassword = $("#withDrawPwdConfirm").val();
            var withDrawpassword = $("#withDrawPwd").val();
            if (confirmPassword.length != withDrawpassword.length || confirmPassword != withDrawpassword) {
                
                $("#withDrawPwdConfirm").addClass("redborder");
                return false;
            }else{
                $("#withDrawPwdConfirm").removeClass("redborder");
            }
        });
	});
	
	//发送验证码
	function sendVerifyPassword(){
			var mobile = $("#mobile").val();
			var self=$(this);
			$("#passwordVerify").val("");
		    $("#withDrawPwd").val("");
		    $("#withDrawPwdConfirm").val("");
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
						showSecTime();
						$("#send_failed").css("display", "inherit");
					}
					//短信发送成功
					if(data.show){
						jsAlert(data.msgContent);
					}
			}});
	}
	
	//采购商提现密码编辑 
	function modifyAccountPassword(){
		var url = '${ctx}/gdb_cash/modifyCashAccountPassword.jhtml';
		var verifyCode = $("#passwordVerify").val();
		var withDrawpassword = $("#withDrawPwd").val();
		var passwordConfirm = $("#withDrawPwdConfirm").val();
		var memberId = $("#memberId").val();
		var mobile = $("#mobile").val();
		password = $.md5(withDrawpassword) ;
		//编辑页面校验
		$("#withDrawPwd").bind("keyup",function(){
			withDrawpassword = $("#withDrawPwd").val();
			pwdStrongCheck(withDrawpassword);
		});
		
		$("#withDrawPwd").bind("keydown",function(){
			withDrawpassword = $("#withDrawPwd").val();
		});
		
		$("#withDrawPwdConfirm").bind("keyup",function(){
			passwordConfirm = $("#withDrawPwdConfirm").val();
		});
		
		$("#withDrawPwdConfirm").bind("keydown",function(){
			passwordConfirm = $("#withDrawPwdConfirm").val();
		});
		
		$.validator.addMethod("passwordCheck", function(value, element, params) {
			var flag = true;
			if(passwordConfirm==withDrawpassword){
				flag= true;
			}else{
				flag = false;				
			}
				return flag;
			}, "请重新输入");
		//密码校验
		jQuery.validator.addMethod("passwordCheck", function() {   
			var check = ($("#withDrawPwd").val() == $("#withDrawPwdConfirm").val());
			return check}, "两次密码输入不一致");
		jQuery.validator.addMethod("checkIsUserName", function() {   
			var check3 = !($("#withDrawPwd").val() == $("#userCode").val());
			return check3}, "输入密码不能与用户名相同");
		jQuery.validator.addMethod("checkNewPwdRule", function(){
			 var pwd = $("#withDrawPwd").val();
			 var ragex=/^[0-9]*$/;
			 var ragexa=/^[A-Za-z]*$/;
			 var ragexb =/^[^ ]*$/;
			 var rag = /^[^_][A-Za-z]*[a-z0-9_]*$/;
			 //var result = (!(ragex.test(pwd)||ragexa.test(pwd))) && ragexb.test(pwd);
			 var result = (rag.test(pwd)) ;
			 return result}, "密码格式不正确");
		 
		$("#modifyPasswordForm").validate({
			 
		 	rules: {
			passwordVerify : {
				required : true
			},
			withDrawPwd : {
				required : true,
				minlength: 6,
				maxlength:16,
				checkIsUserName:true,
				checkNewPwdRule:true
			},
			withDrawPwdConfirm : {
				required : true,
				passwordCheck:true
			} 
	    },
	    messages: {
	        passwordVerify : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入验证码"
			},
			withDrawPwd : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入密码",
				checkIsUserName : "<u>&nbsp;</u><i>&nbsp;</i>" +"输入密码不能与用户名相同",
				checkNewPwdRule : "<u>&nbsp;</u><i>&nbsp;</i>" +"密码格式不正确"
			},
			withDrawPwdConfirm : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请再次输入密码",
				passwordCheck : "<u>&nbsp;</u><i>&nbsp;</i>" + "两次输入的密码不一致"
			} 
		}
		});
	 
		if (!$('#modifyPasswordForm').valid()) {
			// 未通过校验
			return;
		}
		// 添加蒙版
		$.dm.block();
		
		var param = {memberId:memberId, withDrawPwd:password,mobile:mobile,verifyCode:verifyCode};
		callService(url, param, {type:'post',
					callSuccess : function(data) {
						 if (data.success) {
							 $.dm.unblock();
							 jsAlert("密码设置成功");
							 var params = {
								tab : 'judge'
							 };
							 params.tabStatus = $('#tabStatus').val();
							 $.dm.jumpTo('${ctx}/member/index.jhtml', params, {
								'method' : 'get'
								});
							} else {
						 	 $.dm.unblock();
						 	 $("#passwordVerify").val("");
							 //$("#withDrawPwd").attr("disabled", "false");
							 $("#withDrawPwd").val("");
							 $("#withDrawPwdConfirm").val("");
							 jsAlert( data.fail );
						}
					}
				});
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
	 
	 //验证密码强度
	function pwdStrongCheck(pwd){
		var Modes=0;
		for (i=0;i<pwd.length;i++){ 
			//测试每一个字符的类别并统计一共有多少种模式. 
			Modes|=CharMode(pwd.charCodeAt(i)); 
		} 
		var S_level = bitTotal(Modes);
		$("#pwStrength").val(S_level);
		switch(S_level) { 
			case 0: 
				$("#pwdStren1").css("display","none");
				$("#pwdStren2").css("display","none");
				$("#pwdStren3").css("display","none");
				break; 
			case 1: 
				$("#pwdStren1").css("display","inherit");
				$("#pwdStren2").css("display","none");
				$("#pwdStren3").css("display","none");
				break; 
			case 2: 
				$("#pwdStren1").css("display","none");
				$("#pwdStren2").css("display","inherit");
				$("#pwdStren3").css("display","none");
				break; 
			case 3: 
				$("#pwdStren1").css("display","none");
				$("#pwdStren2").css("display","none");
				$("#pwdStren3").css("display","inherit");
				break;
			} 
	}
	
	//测试某个字符是属于哪一类. 
	function CharMode(iN){ 
		if (iN>=48 && iN <=57) //数字 
			return 1; 
		if (iN>=65 && iN <=90) //大写字母 
			return 2; 
		if (iN>=97 && iN <=122) //小写 
			return 4; 
		else 
			return 8; //特殊字符 
	}
	
	//计算出当前密码当中一共有多少种模式 
	function bitTotal(num){ 
		var modes=0; 
		for (i=0;i<4;i++){ 
			if (num & 1) modes++; 
			num>>>=1; 
		} 
		return modes; 
	}
	 
</script>
</#macro>