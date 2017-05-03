<#include "/common/common_var_definds.ftl" />
<#macro render data>
<script>
var async=true;

	//初始化公司所在地
	function company_init() {
		$('#company_nation').html('');
		callService('${ctx}/area/areaList.ajax?grade=0',{},{async:async,callSuccess:function(data) {
			data = eval(data);
			$.each(data,function(index, val) {
					$('<option value="'+val.id+'" >' + val.name
										+ '</option>').appendTo('#company_nation');
			 });
			$('#company_province').html('<option value="" selected="selected" >请选择省</option>');
			$('#company_city').html('<option value="" selected="selected" >请选择市</option>');
			$('#company_county').html('<option value="" selected="selected" >请选择县区</option>');
			$('#company_nation').change();
		}});
	}
	
	
	function job_init() {
		$('#job_nation').html('');
		callService('${ctx}/area/areaList.ajax?grade=0',{},{async:async,callSuccess:function(data) {
			data = eval(data);
			$.each(data,function(index, val) {
					$('<option value="'+val.id+'" >' + val.name
										+ '</option>').appendTo('#job_nation');
			 });
			$('#job_province').html('<option value="" selected="selected" >请选择省</option>');
			$('#job_city').html('<option value="" selected="selected" >请选择市</option>');
			$('#job_county').html('<option value="" selected="selected" >请选择县区</option>');
			$('#job_nation').change();
		}});
	}
	
	
	function business_init() {
		$('#business_nation').html('');
		callService('${ctx}/area/areaList.ajax?grade=0',{},{async:async,callSuccess:function(data) {
			data = eval(data);
			$.each(data,function(index, val) {
					$('<option value="'+val.id+'" >' + val.name
										+ '</option>').appendTo('#business_nation');
			 });
			$('#business_province').html('<option value="" selected="selected" >请选择省</option>');
			$('#business_city').html('<option value="" selected="selected" >请选择市</option>');
			$('#business_county').html('<option value="" selected="selected" >请选择县区</option>');
			$('#business_nation').change();
		}});
	}
	
	function bank_init() {
		$('#bank_nation').html('');
		callService('${ctx}/area/areaList.ajax?grade=0',{},{async:async,callSuccess:function(data) {
			data = eval(data);
			$.each(data,function(index, val) {
					$('<option value="'+val.id+'" >' + val.name
										+ '</option>').appendTo('#bank_nation');
			 });
			$('#bank_province').html('<option value="" selected="selected" >请选择省</option>');
			$('#bank_city').html('<option value="" selected="selected" >请选择市</option>');
			$('#bank_county').html('<option value="" selected="selected" >请选择县区</option>');
			$('#bank_nation').change();
		}});
	}
	
	//初始化公司所在地
	function warehouse_init() {
		$('#warehouse_nation').html('');
		callService('${ctx}/area/areaList.ajax?grade=0',{},{async:async,callSuccess:function(data) {
			data = eval(data);
			$.each(data,function(index, val) {
					$('<option value="'+val.id+'" >' + val.name
										+ '</option>').appendTo('#warehouse_nation');
			 });
			$('#warehouse_province').html('<option value="" selected="selected" >请选择省</option>');
			$('#warehouse_city').html('<option value="" selected="selected" >请选择市</option>');
			$('#warehouse_county').html('<option value="" selected="selected" >请选择区</option>');
			$('#warehouse_nation').change();
		}});
	}
	
	function disinfection_init() {
		$('#disinfection_nation').html('');
		callService('${ctx}/area/areaList.ajax?grade=0',{},{async:async,callSuccess:function(data) {
			data = eval(data);
			$.each(data,function(index, val) {
					$('<option value="'+val.id+'" >' + val.name
										+ '</option>').appendTo('#disinfection_nation');
			 });
			$('#disinfection_province').html('<option value="" selected="selected" >请选择省</option>');
			$('#disinfection_city').html('<option value="" selected="selected" >请选择市</option>');
			$('#disinfection_county').html('<option value="" selected="selected" >请选择区</option>');
			$('#disinfection_nation').change();
		}});
	}
	//国家更改事件
	function nation_change(nationObj,param1 ,fun )
	{
		nationObj = $(nationObj);
		if(nationObj.val() == ""){
			var clickChange = nationObj.parent().find("select").not(nationObj);
			clickChange.each(function(i,v){
				$(v).html('<option value="" selected="selected" >请选择</option>');
			});
		}else if(param1.find("option").length<2){
			address_change(nationObj,param1,fun);
		}
	}
	
	//地区更改事件
	function address_change(addressObj,param1,fun)
	{
		param1 = $(param1);
		addressObj = $(addressObj);
		var str = "";
		var flag=false;
		var grade = param1.attr("mark");
		addressObj.nextAll("select").each(function(i,v){
			var s="";
			var m=$(v).attr('mark');
			if(m==0)
				s="请选择国家";
			else if(m==1)
				s="请选择省";
			else if(m==2)
				s="请选择市";
			else if(m==3)
				s="请选择县区";
			$(v).html('<option value="" selected="selected" >'+s+'</option>');
		})
		if((grade != 0 && addressObj.val() != "") || grade == 0){
			if(grade != 0)
			str = "&parentId="+addressObj.val();
			flag = true;
		}
		if(flag){
			callService('${ctx}/area/areaList.ajax?grade='+grade+str,{},{async:async,callSuccess:function(data) {
				data = eval(data);
				$.each(data,function(index, val) {
						$('<option value="'+val.id+'" >' + val.name
											+ '</option>').appendTo(param1);	
				 });
				if(typeof(fun)=='function')
					fun();
			}});
		}
	}

	//下载文档模板
	function downLoadDoc(){
		$("#down_form").submit();
	}
	
	//发送手机验证码
	function sendMobilMsg(){
		var self=$(this);
		if(!checkLen($("#contactsPhone").val())){
			alert("手机号码不正确");
		}else{
			callService("${ctx}/sai/sendMobileMessage.ajax",
			{'contactsPhone': $("#contactsPhone").val()},{self:self,callSuccess:function(data){
				if(data.result){
					if(data.show){
						if(data.authCode)
							alert( data.authCode);
						showTime();
					}else if(data.content==1){
						showTime();
						this.self.addClass('sendCode');
						this.self.unbind("click");
						$("#send_timeout").show();
					}
				}else{
					showTime();
					$("#send_failed").css("display", "inherit");
				}
			}});
		}
	}
	
	//发送验证码的时间限制
	function showTime(){
		var self=$("#send_msg");
		self.addClass('sendCode');
		self.unbind("click");
		$("#timeshow").show();
		$("#second").html('60');
		var interval=setInterval(function(){
			var second=$.trim($("#second").html());
			if(second==0)
			{
				self.removeClass('sendCode');
				self.bind("click", sendMobilMsg);
				$("#timeshow").hide();
				$("#send_failed").hide();
				$("#send_timeout").hide();
				clearInterval(interval);
			}
			$("#second").html(--second);
		},1000);
	}
	
	//验证手机号码格式是否正确
	function checkLen(value){
		return (value.length == 11 && (/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value)));
	}
	
	//给隐藏域storeName赋值
	function storeNameChange(){
		$(".storeNameCss").each(function(i, v){
			$(v).val($("#storeName").val());
		})
	}
	
	//上传身份证图片两张
	function uploadImg(self,arr){
		var num=arr.length;
		var me=$(self);
		me.siblings(".groupimg").children("li").each(function(i,v){
			var name=$(v).find("input").attr("name");
			$.each(arr,function(x,y){
				if(y==name)
				{
					arr.splice(x,1);
					return false;
				}
			})
		})
		upload(self,num,arr[0]);
	}
	
</script>
</#macro>