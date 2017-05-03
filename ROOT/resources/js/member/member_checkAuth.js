$(document).ready(function() {
	
	if(authType)
	{
		$("#loginverify").val(authType);
	}
        if(authType==DIC_AUTH_TYPE_000){
		    $('#phone-verify em').html(errInfo);
		}
        if(authType==DIC_AUTH_TYPE_100){
		    $('#email-verify em').html(errInfo);
		}
		if(authType==DIC_AUTH_TYPE_200){
		    $('#answear-verify em').html(errInfo);
		}
		
		//发送手机验证码
		$("#send_msg").click(sendMsg);
		//发送邮件验证码
		$("#send_mail").click(function(){
			callService("/member/sendMail.ajax",{'pageUrl':pageUrl},
			{callSuccess:function(data){
				if(data){
					$("#mail_info").show();
				}else{
					jsErrAlert("发送失败，请重试");
				}
			}});
		});
		
		$("#next_step").click(function(){
			var form=$("#mobile_form");
			//var form=$(this).parentsUntil("form").parent();			
			form.attr("action","/member/"+pageUrl+".jhtml");
			form.find("[name='authType']").val($("#loginverify").val());
			form.submit();
		});
		$("#mibao_next_step").click(function(){
			//debugger;
			var form=$("#action_form");		
			form.attr("action","/member/"+pageUrl+".jhtml");
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
			errorClass:"errorwrong",
			onkeyup:false,
			rules:{
				authCode:{
					required:true,
					remote:{
						url:"/member/validateMessage.ajax",
						type:"post",
						data:{
							authCode:function(){return $("#mobile_authCode").val()},
							authMobile:function(){return $("#mobile").val()},
							pageUrl:function(){return pageUrl},
						}
					}
				}
			},
			messages:{
			authCode:{remote:"<div class='label-g'>校验码超时或错误</div>"}
			}
		
		})
		$("#action_form").validate({
			errorClass:"errorwrong",
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
					required:true
				},
				ppAnswer1:{
					required:true
				},
				ppAnswer2:{
					required:true
				}
			}
		})
		$("#loginverify").change();
});

//发送手机验证码
function sendMsg(){
	var self=$(this);
	callService("/member/sendMobileMessage.ajax",{'pageUrl':pageUrl, 'mobile': $("#mobile").val()},
	{self:self,callSuccess:function(data){
		if(data.result){
			if(data.content==null){
				time_show();
			}else if(data.content==1){//已经发送了
				time_show();
				this.self.addClass('sendCode');
				this.self.unbind("click");
				$("#send_timeout").show();
			}
		}else{//系统发送失败
			time_show();
			$("#send_failed").css("display", "inherit");
		}
		if(data.show){
			alert(data.code);
		}
	}});
}

function time_show(){
	var self = $("#send_msg");
	self.addClass('sendCode');
	self.unbind("click");
	$("#message_info").show();
	$("#second").html('60');
	interval=setInterval(function(){
		var second=$.trim($("#second").html());
		if(second==0)
		{
			self.bind("click", sendMsg);
			self.removeClass('sendCode');
			$("#message_info").hide();
			$("#send_failed").hide();
			$("#send_timeout").hide();
			clearInterval(interval);
		}
		$("#second").html(--second);
	},1000);
}
function changeAuthType() {
		var selected =$("#loginverify option:selected").val()
		if(selected==DIC_AUTH_TYPE_000){
		    $('#phone-verify').show();
		    $('#email-verify').hide();
		    $('#answear-verify').hide();
		}
		if(selected==DIC_AUTH_TYPE_100){
		    $('#phone-verify').hide();
		    $('#email-verify').show();
		    $('#answear-verify').hide();
		}
		if(selected==DIC_AUTH_TYPE_200){
		    $('#phone-verify').hide();
		    $('#email-verify').hide();
		    $('#answear-verify').show();
		}
}


function errorMessageShowHide(){
	 $('#errorMessage').hide();
}