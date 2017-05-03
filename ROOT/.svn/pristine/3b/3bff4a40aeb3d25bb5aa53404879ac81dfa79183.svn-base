<#include "/common/common_var_definds.ftl" /> <#import
"field_store_apply_validate_script.ftl" as
field_store_apply_validate_script /> <#import
"field_store_apply_third_script.ftl" as field_store_apply_third_script
/> <#macro render> <@field_store_apply_third_script.render/> <#--
引入店铺信息验证JS 开始 --> <@field_store_apply_validate_script.render data??/>
<#-- 引入店铺信息验证JS 结束 -->
<script type="text/javascript" src="${resources}/js/lib/date/laydate.js"></script>

<script>
	//回显4级地址
	function loadArea(guojia,sheng,shi,qu,param)
	{
		if(param)
		{
			async=false;
			var param=JSON.parse(param);
			$(guojia).html('<option value="" selected="selected" >请选择</option>');
			callService('${ctx}/area/areaList.ajax?grade=0',{},{async:async,callSuccess:function(data) {
				data = eval(data);
				$.each(data,function(index, val) {
						$('<option value="'+val.id+'" >' + val.name
											+ '</option>').appendTo(guojia);
				 });
				$(sheng).html('<option value="" selected="selected" >请选择省</option>');
				$(shi).html('<option value="" selected="selected" >请选择市</option>');
				$(qu).html('<option value="" selected="selected" >请选择区县</option>');
			}});
			$(guojia).val(param.idNation);
			$(guojia).change();
			$(sheng).val(param.idProvince);
			$(sheng).change();
			$(shi).val(param.idCity);
			$(shi).change();
			$(qu).val(param.idCounty);
			$(qu).change();
			async=true;
		}
	}
	$(document).ready(function(){

		$('.search').css('width', '605px');
		$('[dm-info="gd-search-word"]').css('width', '535px');
		
		if($("#companyType").val()=="${getConstant('dictionary.COMPANY_TYPE_10')!''}"){
			$("#h10").show();
			$("#h00").hide();
			$("#foodh10").show();
			$("#foodh00").hide();
		}else if($("#companyType").val()=="${getConstant('dictionary.COMPANY_TYPE_00')!''}"){
			$("#h10").hide();
			$("#h00").show();
			$("#foodh10").hide();
			$("#foodh00").show();
		}
		
		$(document).on('click',".bigimg",function(){
			$(".bigimg_up").fadeIn();
			$(this).parent().siblings("img").clone().prependTo(".bigimg_up div p")
		})
		$(".bigimg_up div p").click(function(){
	  $(this).empty();
	   $(this).parent().parent(".bigimg_up").fadeOut();
	  })
		divNameChang();
		//第一个页面的同意checkbox的动作
		$("#check_stepA").click(function() {
			if ($("#check_stepA").attr("checked")) {
				$(".step_A").addClass("small-button-green");
			}else{
				$(".step_A").removeClass("small-button-green");
			} 
		});
		//第二个页面的同意checkbox的动作
		$("#VoteOption1").click(function() {
			if ($("#VoteOption1").attr("checked")) {
					$("#businessLicenceEnd").val("9999-12-31");
					$("#fuhao").hide();
			     	$("#businessLicenceEnd").hide();
			}else{
				$("#businessLicenceEnd").val("")
				$("#businessLicenceEnd").show();
				$("#fuhao").show();
			}
		});
		async=false;
		<#if !storeEdit?exists>
		//初始化公司所在地
		company_init();
		//初始化营业执照所在地
		business_init();
		//初始化开户银行所在地
		bank_init();
		</#if>
		warehouse_init();
		disinfection_init();
		job_init();
		//发送验证码
		$("#send_msg").click(sendMobilMsg);
		<#if storeEdit?exists>
	    loadArea("#warehouse_nation","#warehouse_province","#warehouse_city","#warehouse_county",'${(storeEdit.licenceMap[getConstant('dictionary.MEDICAL_PROSECUTION_QUALIFICATIONS')!''].storehouseAddress)!""}');
	    loadArea("#disinfection_nation","#disinfection_province","#disinfection_city","#disinfection_county",'${(storeEdit.licenceMap[getConstant('dictionary.DISINFECTION_PRODUCTS')!''].storehouseAddress)!""}');
	    loadArea("#job_nation","#job_province","#job_city","#job_county",'${(storeEdit.licenceMap[getConstant('dictionary.DRUGGIST')].storehouseAddress)!""}');
	    </#if>
	    async=true;
	    
	    $('[mark="3"]').click(function(event){
	    	return false;
    	});
	});
	//下一页
	function cutDivNext(divId)
	{
		
		var status = document.getElementById("check_stepA");
		if (!status.checked) {
			jsErrAlert("请先阅读并勾选注册协议！");
			return;
		} 
		
		if($("#submit_form").valid()&validateUpload())
		{
			cutDivPrev(divId)

			var title = '申请入住第一步';
			switch(divId){
			case 'div_2':
				title = '申请入住第二步';
				break;
			case 'div_3':
				title = '申请入住第三步';
				break;
			case 'div_4':
				title = '申请入住第四步';
				break;
			default : 
				title = '申请入住第一步';
				break;
			}
			document.title=title;
			
			$("#"+divId).find(".myUpLoadClass").filter(":visible").each(function(i,v){
				var id=$(v).attr("id");
				if(id)
				{
					if(v["upload_implement"])
						v["upload_implement"].refresh();
					else
						initUpload(id);
				}
			})
		}
	}
	//上一页
	function cutDivPrev(divId)
	{
		var title = '申请入住第一步';
		switch(divId){
		case 'div_2':
			title = '申请入住第二步';
			break;
		case 'div_3':
			title = '申请入住第三步';
			break;
		case 'div_4':
			title = '申请入住第四步';
			break;
		default : 
			title = '申请入住第一步';
			break;
		}
		document.title=title;
		
		$(document).scrollTop(0)
		var divs=$("#submit_form").children();
		var showDiv=document.getElementById(divId);
		divs.each(function(i,v){
			if(v==showDiv)
			{
				$(v).show();
			}
			else{
				$(v).hide();
			}
		});
	}
	//校验上传控件
	var validateUpload=function (dom)
	{
		if(!$("#test_use").val())
		{
			if(dom)
				dom=$(dom);
			else
				dom=$(".myUpLoadClass:visible")
			var flg=true;
			dom.each(function(i,v){
				var dom=$(v);
				var arr=dom.attr("upload").split(",");
				var num=arr.length;
				dom.siblings(".error").remove();
				if(dom.siblings(".groupimg").children("li").length<num)
				{
					flg=false;
					$(v).next().after('<label class="m-l-10  error"><u>&nbsp;</u><i>&nbsp;</i>选择'+num+'张图片</label>')
				}else if(dom.siblings(".groupimg").children("li").length>num)
				{
					flg=false;
					$(v).next().after('<label class="error">只能选择'+num+'张图片</label>')
				}
			})
			if(flg)
			{
				dom.each(function(i,v){
					var arr=$(v).attr("upload").split(",");
					$(v).siblings(".groupimg").children("li").each(function(x,y){
						$(y).find("input").attr("name",arr[x]);
					});
				})
			}
			return flg;
		}else{
			return true;
		}
		
	};
	//提交表单
	function submit_func()
	{
		if($("#submit_form").valid()&validateUpload())
		{ 
			$(".showDiv").each(function(i,v){
				if($(v).css("display")=="none")
				{
					$(v).remove();
				}
			})
			var input=$("<input type='hidden' name='mainGoods'></input>");
			input.val(addHidden().toString());
			$("#submit_form").append(input);
			 var $target=$('#btnSubmintDiv');
			$.dm.block($target);//开始锁定	
			$("#submit_form").submit();
		}
		function getShowDiv()
		{
			var arr=[];
			$(".div3_radio:checked").each(function(){
				$.each(eval($(this).attr("divs")),function(t,q){
					arr.push(q);
				})
			})
			return arr;
		}
		function addHidden()
		{
			var arr=[];
			var checked=$('[name="prosecutionCkB"]:checked');
			checked.each(function(i,v){
				arr.push($(v).val());
			});
			return arr;
		}
	}
	$(function(){
	   jQuery.validator.addMethod("busLicNumber", function(value, element) {       
	        return jQuery.validator.prototype.optional(element) || /^\d{15}$/.test(value);      
	   }, "营业执照号格式不正确 例如：123456789012345");  
		jQuery.validator.addMethod("orgCode", function(value, element) {       
	        return jQuery.validator.prototype.optional(element) || /^\d{8}-\d{1}$/.test(value);     
	   }, "组织机构代码格式不正确 例如：12345678-9");  
		jQuery.validator.addMethod("taxRegCer", function(value, element) {       
	        return jQuery.validator.prototype.optional(element) || /(^\d{15}$|^\d{20}$|^\d{17}(X|x)\d{2}$)/.test(value);      
	   }, "税务登记证号格式不正确 例如：123456789012345");  
		jQuery.validator.addMethod("drugQualifications", function(value, element) {       
	        return jQuery.validator.prototype.optional(element) || /^[\u4e00-\u9fff][A-D][AB]\d{7}$/.test(value);      
	   }, "药品经营许可证号格式不正确 例如：辽AA1234567");  
		jQuery.validator.addMethod("gsp", function(value, element) {       
	        return jQuery.validator.prototype.optional(element) || /^[A-Z]{2}\d{2}[A-D][ab]\d{8}$/.test(value);      
	   }, "GSP证书编号格式不正确 例如：AA01Ab12341324");   
		//--------------开发方便用的----------------------
		
	   /* jQuery.validator.addMethod("busLicNumber", function(value, element) {       
	        return true
	   }, "营业执照号格式不正确 例如：123456789012345");  
		jQuery.validator.addMethod("orgCode", function(value, element) {       
	        return true
	   }, "组织机构代码格式不正确 例如：12345678-9");  
		jQuery.validator.addMethod("taxRegCer", function(value, element) {       
	        return true   
	   }, "税务登记证号格式不正确 例如：123456789012345");  
		jQuery.validator.addMethod("drugQualifications", function(value, element) {       
			return true
	   }, "药品经营许可证号格式不正确 例如：辽AA1234567");  
		jQuery.validator.addMethod("gsp", function(value, element) {       
			return true
	   }, "GSP证书编号格式不正确 例如：AA01Ab12341324");    */
	   
			var cnmsg = {
			    required: "不能为空",
			    remote: "请修正该字段",
			    email: "邮件格式错误",
			    url: "网址不合法",
			    date: "日期不合法",
			    dateISO: "日期不合法",
			    number: "数字不合法",
			    digits: "只能输入整数",
			    creditcard: "信用卡号不合法",
			    equalTo: "两次输入值不一致",
			    accept: "后缀名不合法",
			    maxlength: jQuery.validator.format("长度最多{0}位"),
			    minlength: jQuery.validator.format("长度最少{0}位"),
			    rangelength: jQuery.validator.format("长度介于{0}和{1}位之间"),
			    range: jQuery.validator.format("值介于{0}和{1}之间"),
			    max: jQuery.validator.format("最大值为{0}"),
			    min: jQuery.validator.format("最小值为{0}")
			};
		$.extend(jQuery.validator.messages, cnmsg);
		jQuery.validator.addMethod("uploadPicNum", function(value, element,param) {
			return $(element).siblings(".groupimg").children("li").length<param?false:true;
	    }, "请上传文件"); 
		var validOpts={
				errorPlacement:function(error,elem)
				{
					if($(elem).attr('name')=="prosecutionCkB")
					{
						var lable=$("<label class='m-l-10  error'><u>&nbsp;</u><i>&nbsp;</i>"+error.text()+"</label>");
						$(elem).removeClass("error");
						$(elem).parent().find("label").remove();
						if(error.text()!=null&&error.text()!=""){
							$("#errorLocal").after(lable); 
						}
						//$("#errorLocal").after(error);
					}else{
						var lable=$("<label class='m-l-10 error'><u>&nbsp;</u><i>&nbsp;</i>"+error.text()+"</label>");
						$(elem).removeClass("error");
						$(elem).parent().find("label").remove();
						if(error.text()!=null&&error.text()!=""){
							$(elem).after(lable);
						}
						
					}
				},
				success: function (elem) {
	            },
				rules:{
					'storeName':{
						remote:{
							'url':"${ctx}/sai/validStoreName.ajax",
							type:'post',
							cache:false,
							async:false,
							data:{
								storeName:function(){
									return $("[name='storeName']").val();
								}
							}
						}
					},
					'companyName':{
						remote:{
							'url':"${ctx}/sai/validCompanyName.ajax",
							type:'post',
							cache:false,
							async:false,
							data:{
								companyName:function(){
									return $("[name='companyName']").val();
								}
							}
						}
					},
					'prosecutionCkB':{
						required:true
					},
					'licenceList[3].attr2':{
						ipv4:true,
					},
					'licenceList[3].licenceEndDate_str':{
						requiredDate:$("#start3")
					},
					'licenceList[4].licenceEndDate_str':{
						requiredDate:$("#start4")
					},
					'licenceList[5].licenceEndDate_str':{
						requiredDate:$("#start5")
					},
					'licenceList[7].licenceEndDate_str':{
						requiredDate:$("#start7")
					},
					'licenceList[8].licenceEndDate_str':{
						requiredDate:$("#start8")
					},
					'licenceList[0].licenceEndDate_str':{
						requiredDate:$("#businessLicenceStart")
					},
					'licenceList[1].licenceEndDate_str':{
						requiredDate:$("#organizationStart")
					},
					'licenceList[2].licenceStartDate_str':{
						required:$("#taxRegistrationStart")
					},
					'licenceList[9].licenceEndDate_str':{
						requiredDate:$("#start9")
					},
					'licenceList[6].licenceStartDate_str':{
						required:true
					},
					'licenceList[10].licenceEndDate_str':{
						requiredDate:$("#start10")
					},
	 				contactsEmail:{
						email:true
	 				},
					companyCounty:{
						required:true
					},
					businessCounty:{
						required:true
					},
					bankCounty:{
						required:true
					},
					bankAccountNumber:{
						remote:{
							url:"${ctx}/sai/validBasicInfo.ajax",
							type:"post",
							cache:false,
							async:false,
							data:{
								"bankAccountNumber":function(){
									return $("[name='bankAccountNumber']").val();
								}
							}
						},
						number:true
					},
					authCode:{
						remote:{
							url:"${ctx}/sai/validateAuthCode.ajax",
							type:"post",
							cache:false,
							async:false,
							data:{
									authCode:function(){return $("#authCode").val()},
									contactsPhone:function(){return $("#contactsPhone").val()}
								  }
								}
							},
					'licenceList[0].businessLicenceCode':{
						'busLicNumber':true
						},
					'licenceList[1].businessLicenceCode':{
						'orgCode':true
						},
					'licenceList[2].businessLicenceCode':{
						'taxRegCer':true
						},
					 'licenceList[4].businessLicenceCode':{
						 'drugQualifications':true
					 },
					 'licenceList[5].businessLicenceCode':{
						 'gsp':true
					 }
				},
				messages:{
					authCode:{
						remote:"验证码输入错误或超时"
					},
					'storeName':{
						remote:"店铺名重复"
					},
					'companyName':{
						remote:"企业名已存在"
					},
					'licenceList[6].licenceStartDate_str':{
						required:"请填写证书有效期或备案开始日期"
					},	
					bankAccountNumber:{
						remote:"该字段重复"
					}
				}
			}
		var remote=function (){
				this.remote={
					url:"${ctx}/sai/validLicenceCode.ajax",
					type:"post",
					cache:false,
					async:false,
					data:{
					}
				}
		}
		var msg={
			remote:"该字段重复"
		}
		$("[name$='.businessLicenceCode']").each(function(i,v){
			var tmp=new remote();
			var name=$(v).attr("name");
			var type=$(v).parentsUntil(".information-into").parent().prev().val();
			tmp['remote']['data']['businessLicenceType']=function(){return type};
			tmp['remote']['data']['businessLicenceCode']=function(){
				return $(v).val();
			}
			if($("[name='storeId']").length)
			tmp['remote']['data']['storeId']=function(){return $("[name='storeId']").val()};
			validOpts['rules'][name]=$.extend(validOpts['rules'][name],tmp);
			validOpts['messages'][name]=$.extend(validOpts['messages'][name],msg);
		});
		$("#submit_form").validate(validOpts);
	})
	
	//把四级联动的地址转换成Json对象，再保存到hidden中
	function streetChangeJson(opName,hiddenName){
		var jsonValue = {"nameNation" : $("#"+opName+"_nation"+" option:selected").text(), "idNation" : $("#"+opName+"_nation").val()
		, "nameProvince" : $("#"+opName+"_province"+" option:selected").text() , "idProvince" : $("#"+opName+"_province").val()
		, "nameCity" : $("#"+opName+"_city"+" option:selected").text() , "idCity" : $("#"+opName+"_city").val()
		, "nameCounty" : $("#"+opName+"_county"+" option:selected").text() , "idCounty" : $("#"+opName+"_county").val()};
		jsonValue=JSON.stringify(jsonValue);
		$("#"+hiddenName).val(jsonValue);
	}
	
	function divNameChang(){
		$(".div3_radio").each(function(i,v){
			$(v).change();
		});
		//判断显示二级企业类型
		if($('#companyTypeSel').val()=="${getConstant('dictionary.COMPANY_TYPE_00')!''}")
		{
			$("#companyType").val("${getConstant('dictionary.COMPANY_TYPE_00')!''}");
			$("#jingyingDiv").attr('style','display:none;');
			$("#yaopin_id").attr("checked",false).change().attr("disabled",true);
			$("#prompt").show();
		}else{
			$("#jingyingDiv").attr('style','display:block;');
			//默认选择第一个
			$('[name="manageCompanyType"]').eq(0).attr('checked','checked');
			$("#companyType").val($('[name="manageCompanyType"]').eq(0).val());
			$("#yaopin_id").attr("disabled",false);
			$("#prompt").hide();
		}
		if($('#companyTypeSel').val()=="${getConstant('dictionary.COMPANY_TYPE_00')!''}"){
			$("#h10").show();
			$("#h00").hide();
			$("#foodh10").show();
			$("#foodh00").hide();
		}else{
			$("#h10").hide();
			$("#h00").show();
			$("#foodh10").hide();
			$("#foodh00").show();
		}
	}
	function manageCompanyTypeChange(obj){
		$("#companyType").val(obj.value);
	}
	</script>
</#macro>
