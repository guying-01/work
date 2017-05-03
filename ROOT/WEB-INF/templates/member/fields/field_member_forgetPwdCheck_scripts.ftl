<#include "/common/common_var_definds.ftl" />
<#macro render>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.validate.min.js"></script>
<script type="text/javascript">
var pageUrl="${pageUrl!''}";
$(document).ready(function() {
	var authType="${authType!''}"
	if(authType)
	{
		$("#loginverify").val(authType);
	}
        if("${authType!''}"=='${getConstant("dictionary.DIC_AUTH_TYPE_000")!""}'){
		    $('#phone-verify em').html("${errInfo!''}");
		}
        if("${authType!''}"=='${getConstant("dictionary.DIC_AUTH_TYPE_100")!""}'){
		    $('#email-verify em').html("${errInfo!''}");
		}
		if("${authType!''}"=='${getConstant("dictionary.DIC_AUTH_TYPE_200")!""}'){
		    $('#answear-verify em').html("${errInfo!''}");
		}
		//发送手机验证码
		$("#send_msg").click(send_mobile_msg);
		//发送邮件验证码
		$("#send_mail").click(function(){
			callService("${ctx}/forget/sendMail.ajax",{},{callSuccess:function(data){
				if(data){
					$("#mail_info").show();
				}else{
					jsErrAlert("发送失败，请重试");
				}
			}});
		});
		$(".big-button").click(function(){
			var form=$(this).parentsUntil("form").parent();
			form.find("[name='pageUrl']").val(pageUrl);
			form.find("[name='authType']").val($("#loginverify").val());
			form.submit();
		});
		jQuery.validator.addMethod("selfValid", function(value, element) {       
	         return $(".verify :selected[value='"+$(element).val()+"']").length>1?false:true;      
	    }, "<div class='label-g'>此项不可与其他选项相同</div>");
		var cnmsg = {
			    required: "<div class='label-g'>必需填写项</div>",
			    remote: "<div class='label-g'>请修正该字段</div>",
			    email: "<div class='label-g'>邮件格式错误</div>",
			    url: "<div class='label-g'>网址不合法</div>",
			    date: "<div class='label-g'>日期不合法</div>",
			    dateISO: "<div class='label-g'>日期不合法</div>",
			    number: "<div class='label-g'>数字不合法</div>",
			    digits: "<div class='label-g'>只能输入整数</div>",
			    creditcard: "<div class='label-g'>信用卡号不合法</div>",
			    equalTo: "<div class='label-g'>两次输入值不一致</div>",
			    accept: "<div class='label-g'>后缀名不合法</div>",
			    maxlength: $.validator.format("长度最多{0}位"),
			    minlength: $.validator.format("长度最少{0}位"),
			    rangelength: $.validator.format("长度介于{0}和{1}位之间"),
			    range: $.validator.format("值介于{0}和{1}之间"),
			    max: $.validator.format("最大值为{0}"),
			    min: $.validator.format("最小值为{0}")
			};
			$.extend(jQuery.validator.messages, cnmsg);
		$("#mobile_form").validate({
			onkeyup:false,
			errorClass:"errorwrong",
			rules:{
				authCode:{
					required:true,
					remote:{
						url:"${ctx}/forget/validateMessage.ajax",
						type:"post",
						data:{
							authCode:function(){return $("#mobile_authCode").val()}
						}
					}
				}
			},
			messages:{
				authCode:{remote:"<div class='label-g'>校验码超时或错误</div>"}
			}
		})
		$("#action_form").validate({
			rules:{
				ppCode0:{
					selfValid:true
				},
				ppCode1:{
					selfValid:true
				},
				ppCode2:{
					selfValid:true
				},
				ppAnswer0:{
					required:true,
				},
				ppAnswer1:{
					required:true,
				},
				ppAnswer2:{
					required:true,
				}
			}
		})
		$("#loginverify").change();
});


function send_mobile_msg(){
	var self=$(this);
	callService("${ctx}/forget/checkSendMessage.ajax",{},
			{self:self,callSuccess:function(data){
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
				if(data.show){
					jsAlert(data.code);
				}
		}});
}

function showSecTime(){
	var self = $("#send_msg");
	self.addClass('sendCode');
	self.unbind("click");
	$("#message_info").show();
	$("#second").html('60');
	var interval=setInterval(function(){
		var second=$.trim($("#second").html());
		if(second==0)
		{
			self.bind("click", send_mobile_msg);
			self.removeClass('sendCode');
			$("#send_failed").hide();
			$("#message_info").hide();
			$("#send_timeout").hide();
			clearInterval(interval);
		}
		$("#second").html(--second);
	},1000);
}

function changeAuthType() {
		var selected =$("#loginverify option:selected").val()
		if(selected=='${getConstant("dictionary.DIC_AUTH_TYPE_000")!""}'){
		    $('#phone-verify').show();
		    $('#email-verify').hide();
		    $('#answear-verify').hide();
		}
		if(selected=='${getConstant("dictionary.DIC_AUTH_TYPE_100")!""}'){
		    $('#phone-verify').hide();
		    $('#email-verify').show();
		    $('#answear-verify').hide();
		}
		if(selected=='${getConstant("dictionary.DIC_AUTH_TYPE_200")!""}'){
		    $('#phone-verify').hide();
		    $('#email-verify').hide();
		    $('#answear-verify').show();
		}
}

</script>
</#macro>