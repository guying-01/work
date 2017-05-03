
<#include "/common/common_var_definds.ftl" /> 
<#macro render>

<script src="${ctx}/resources/js/common/tab.js"></script>
<script src="${ctx}/resources/js/lib/jquery/jquery.dataTables.js"
	type="text/javascript"></script>
<script src="${ctx}/resources/js/lib/jquery/dataTables.bootstrap.js"
	type="text/javascript"></script>
<script src="${ctx}/resources/js/lib/jquery/dt-operation-commons.js"
	type="text/javascript"></script>
<script src="${ctx}/resources/js/lib/jquery/jquery.md5.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/dataTables.bootstrap.js"></script>
<script src="${ctx}/resources/js/lib/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${resources}/js/common/validation.js"></script> 
<script src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">
	var labelinfo = "";
	var errorprovince="";
    var errorcity="";
    var errorregion ="";
    var labeerrorinfo = "";
    var countryId = "";
	var bankProvinceId = "";
	var bankCityId = "";
	var bankDistrictId = "";
	var bankProvinceId = "";
	var bankCityPareId = "";
	var bankDistrictPareId = "";
	var bankProvinceFlag ="0";
	var bankCityFlag ="0";
	var bankDistrictFlag ="0";
	
	$(document).ready(function(){
		country_init();
		 
		$('#bankProvince option[value='+bankProvinceId+']').attr("selected", "selected"); 
		$('#bankCity option[value='+bankCityId+']').attr("selected", "selected"); 
		$('#bankDistrict option[value='+bankDistrictId+']').attr("selected", "selected"); 
	});
	
	//初始化国家
	function country_init() {
			callService('/member/findAllAreaByGrade.ajax', {grade:0}, 
			{
				async : false,
				callSuccess:function(data){
					data = eval(data);
					$.each(data, function(index, val) {
						
						var countryName =$('#bankCountryName').val() ;
						$('<option value="'+val.id+'" >' + val.name + '</option>')
								.appendTo('#country');
								if(countryName==val.name){
									countryId=$('#country').val();  
								}
					});
					$('#bankProvince').html('<option value="" selected="selected" >请选择省</option>');
            		
				}
			}); 
		 
		proChange($("#country").val());
	}
	
	//初始化省
	function proChange(obj) {
		callService('/member/findAllAreaByGrade.ajax', {grade : 1 , parentId :obj}, 
		{
			async : false,
			callSuccess:function(data){
				data = eval(data);
				var bankProvinceName = $("#provinceName").val();
				$.each(data, function(index, val) {
					$('<option name="'+val.id+'" value="'+val.id+'" >' + val.name + '</option>')
						.appendTo('#bankProvince');
					if(bankProvinceName==val.name){
						bankProvinceId=val.id;
						bankProvinceFlag="1";
					}else{
						bankCityPareId = val.id;
					}
				});
				
			}
		});
		if(bankProvinceFlag=="0"){
		$('#bankCity').html('<option value="" selected="selected" >请选择市</option>');
			cityChange(obj);
		}else if(bankProvinceFlag=="1"){
			cityChange(bankProvinceId);
			bankProvinceFlag="0";
		}
	}
	
	//初始化市
	function cityChange(obj) {
		if(obj != ''){
			callService('/member/findAllAreaByGrade.ajax', {grade : 2 , parentId :obj }, 
			{
				async : false,
				callSuccess:function(data){
					data = eval(data);
					var cityName = $("#cityName").val();
					$.each(data, function(index, val) {
						$('<option value="'+val.id+'" >' + val.name + '</option>').appendTo('#bankCity');
						if(cityName==val.name){
							bankCityId=val.id;
							bankCityFlag="1";
					   }
					});
					 
				}
			});
		}
		if(bankCityFlag=="0"){
			$('#bankDistrict').html('<option value="" selected="selected" >请选择区县</option>');
			secChange(obj);
		}else if(bankCityFlag=="1"){
			secChange(bankCityId);
			bankCityFlag="0";
		}
		
	}
	
	//初始化区县
	function secChange(obj) {
		if(obj != ''){
			callService('/member/findAllAreaByGrade.ajax', {grade : 3 , parentId : obj}, 
			{
				async : false,
				callSuccess:function(data){
					data = eval(data);
					var bankDistrictName = $("#bankDistrictName").val();
					$.each(data, function(index, val) {
						$('<option value="'+val.id+'" >' + val.name + '</option>').appendTo('#bankDistrict');
						if(bankDistrictName==val.name){
						bankDistrictId = val.id;
						bankDistrictFlag = "1";
					}
					});
					
				}
			});
		}
		
	}

	//采购商账户信息编辑 
	function modifyAccountInfo(){
		var url = '${ctx}/gdb_cash/modifyCashAccountInfo.jhtml';
		var accountName = $("#accountName").val();
		var bankAccount = $("#bankAccount").val();
		var bankAccountName = $("#bankAccountName").val();
		var bankName = $("#bankName").val();
		var bankCountry = $("#bankCountryName").val();
		var bankProvince = $("#bankProvince").find('option:selected').text();
		var bankCity = $("#bankCity").find('option:selected').text();
		var bankDistrict = $("#bankDistrict").find('option:selected').text();
		var memberId = $("#memberId").val();
		 
		//编辑页面校验
		var errorCount = 0;
		$("#bankAccount").bind("keyup",function(){
			bankAccount = $("#bankAccount").val();
		});
		$("#bankAccount").bind("keydown",function(){
			bankAccount = $("#bankAccount").val();
		});
		$.validator.addMethod("bankAccountCheck", function(value, element, params) {
			callService(
				"${ctx}/gdb_cash/checkBankAccountInfo.ajax", 
				{
					bankAccount : bankAccount
				},
				{
					async : false,
					callSuccess : function(data) {
						result = data;
						if(bankAccountName==bankAccount){
							flag=true;
							
						}else{
							if("银行账号已存在"== result){
								flag = false;
							}else{
								flag = true;
								$("#bankAccount").parent().find("label").remove();
							}
						}
							
					}
				});
				 
			return flag;
			}, "银行账号已存在，请重新输入。 	");
	
		$("#addForm").validate({
			ignore:"",
			focusCleanup : true,
			highlight : function(element, errorClass, validClass) {  
			if (errorCount == 0) {
				var top = $(element).offset().top;
				$("html,body").animate({
					scrollTop : top
				}, 500);
				errorCount++;
			}
		},
		errorPlacement: function (error, elem) {
            	 
            	$(elem).parent().find("label").remove();
            	var label = $("<label class='error'><u>&nbsp;</u><i>&nbsp;</i>"  + error.text() + "</label>");
            	var errorLabel ="";
            	var id = $(elem).attr('id');
            	var errorinfo =error.text();
             	
            	if(('bankProvince' == id||'bankCity' == id||'bankDistrict' == id)&&errorinfo!=''){
            		    $(elem).parent().find('label').remove();
            	  		labelinfo += error.text()+',';
						var info = labelinfo.split(',');
						for(var i=0;i<info.length;i++){
								if(info[i].trim()=='省'){
									errorprovince = info[i];
								}
								if(info[i].trim()=='市'){
									errorcity = info[i];
								}
								if(info[i].trim()=='区'){
									errorregion = info[i];
								}
								
						}
						labeerrorinfo = errorprovince+","+errorcity+","+errorregion;
            	  		label = $("<label class='error'><u>&nbsp;</u><i>&nbsp;</i>"  + '请选择'+labeerrorinfo.trim() + "</label>");
						$(elem).addClass("error");
						$("#bankDistrict").parent().find('label').remove();
						$("#bankDistrict").after(label);
						
            	}else {
            		labelinfo = "";
            	}
		      	if('accountName' == id){
            		if (error.text() != null && error.text() != "") {
            			$(elem).parent().find('label').remove();
            			$(elem).addClass("error");
               		 	$(elem).after(label);
           		 	}
            	}
            	
            	if('bankAccount' == id){
            		if (error.text() != null && error.text() != "") {
            			$(elem).parent().find('label').remove();
            			$(elem).addClass("error");
               		 	$(elem).after(label);
           		 	}
            	}
            	
            	if('bankName' == id){
            		if (error.text() != null && error.text() != "") {
            			$(elem).parent().find('label').remove();
            			$(elem).addClass("error");
               		 	$(elem).after(label);
           		 	}
            	}
            	}
          ,
       			 success: function (elem) {
       			 },
		rules: {
			accountName : {
				required : true
			},
			bankAccount : {
				integer : true,
				required : true,
				bankAccountCheck : true
			},
			bankName : {
				required : true
			},
			bankProvince : {
				required : true
			},
			bankCity : {
				required : true
			},
			bankDistrict : {
				required : true
			}  
	    },
	    messages: {
	        accountName : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入账户名"
			},
			bankAccount : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入银行账号",
				integer : "<u>&nbsp;</u><i>&nbsp;</i>"+"请输入数字",
				bankAccountCheck : "<u>&nbsp;</u><i>&nbsp;</i>" +"银行账号已存在，请重新输入。 "
			},
			bankName : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入银行支行名称"
			},
			bankProvince : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "省"
			},
			bankCity : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "市"
			},
		    bankDistrict : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "区"
			} 
		}
		});
	 
		if (!$('#addForm').valid()) {
			// 未通过校验
			return;
		}
		// 添加蒙版
		$.dm.block();
		
		var param = {id:memberId, accountName:accountName,bankAccount:bankAccount,bankName:bankName,bankCountry:bankCountry,bankProvince:bankProvince,bankCity:bankCity,bankDistrict:bankDistrict };
		callService(url, param, {type:'post',
					callSuccess : function(data) {
					 
						 if (data.success) {
							 $.dm.unblock();
							 jsAlert("保存成功");
							 var params = {
								tab : 'judge'
							 };
							 params.tabStatus = $('#tabStatus').val();
							 $.dm.jumpTo('${ctx}/gdb_cash/toFindGDBAccountList.jhtml', params, {
								'method' : 'get'
							});
							} else {
						 	 $.dm.unblock();
							 jsAlert("保存失败");
						}
					}
				});
		}
		
	function closeAccountInfo(){
		var url = '${ctx}/gdb_cash/toFindGDBAccountList.jhtml';
		$.dm.jumpTo(url, {}, {
		'method' : 'post'
		})
	}	
</script>
</#macro>