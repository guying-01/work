<#include "/common/common_var_definds.ftl" />
<#macro render >
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.md5.js"></script>
<script type="text/javascript" src="${resources}/js/common/validation.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script>
	$(document).ready(function(){
		//提示密碼填寫規則
	 	 $("#newPassword1").focus(function(){
		 		 $("#pwdrule").css("display","inherit");
	 	 });

		$("#newPassword1").blur(function(){
			$("#pwdrule").css("display","none");
		});

		$("#forgetPwdForm").validate({
			errorClass:"errorwrong",
			rules:{
				newPassword1:{
					 required:true,
					 minlength: 6,
					 maxlength:16,
					 checkIsUserName:true,
					 checkNewPwdRule:true
				 },
				 twoPassword:{
					 required:true,
					 checkPwd:true
				 }
			},
			messages:{
				newPassword1:{
					 required:"<div class='label-g'>请填写新密码！</div>",
					 
				 },
				 twoPassword:{
					 required:"<div class='label-g'>请填写确认密码！</div>",
				 }
			}
		});
		jQuery.validator.addMethod("checkPwd", function() {
			var check2 = ($("#newPassword1").val() == $("#twoPassword").val());
			return check2}, "<div class='label-g'>两次密码输入不一致</div>");
		jQuery.validator.addMethod("checkIsUserName", function() {
			var check3 = !($("#newPassword1").val() == $("#userCode").val());
			return check3}, "<div class='label-g'>输入密码不能与用户名相同</div>");
		jQuery.validator.addMethod("checkNewPwdRule", function(){
			 var pwd = $("#newPassword1").val();
			 var ragex=/^[0-9]*$/;
			 var ragexa=/^[A-Za-z]*$/;
			 var ragexb =/^[^ ]*$/;
			 var rag = /^[^_][A-Za-z]*[a-z0-9_]*$/;
			 //var result = (!(ragex.test(pwd)||ragexa.test(pwd))) && ragexb.test(pwd);
			 var result = (rag.test(pwd)) ;
			 return result}, "<div class='label-g'>密码格式不正确</div>");
	});

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
				$("#pwdStren1").css("display","inline-block");
				$("#pwdStren2").css("display","none");
				$("#pwdStren3").css("display","none");
				break;
			case 2:
				$("#pwdStren1").css("display","none");
				$("#pwdStren2").css("display","inline-block");
				$("#pwdStren3").css("display","none");
				break;
			case 3:
				$("#pwdStren1").css("display","none");
				$("#pwdStren2").css("display","none");
				$("#pwdStren3").css("display","inline-block");
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

	//提交表单
	function updateForgetPwd(){
		if($("#forgetPwdForm").valid()){
			$.dm.block($(".content-right"));
			var keyVal1 = $("#newPassword1").val();
			$("#newPassword").val($.md5(keyVal1));
			//$("#newPassword").val(keyVal1);
			 $("#newPassword1").attr("disabled", "true");
			$("#forgetPwdForm").submit();
		}
	}

</script>
</#macro>
