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
	var labelinfo = "";
	var errorprovince="";
    var errorcity="";
    var errorregion ="";
    var labeerrorinfo = "";
    var flag = false;
	$(document).ready(function(){
		searchCashList(1);
		country_init();
	});
	 
	//查询方法
	function searchCashList(currentPage){
		$("#accountName").val("");
		$("#bankAccount").val("");
		$("#bankName").val("");
		$('#bankProvince option[value="请选择省"] ').attr("selected",true);
		$("#bankCity").empty();
		$("#bankDistrict").empty();
		$('#bankCity').html('<option value="" selected="selected" >请选择市</option>');
		$('#bankDistrict').html('<option value="" selected="selected" >请选择区</option>');
		$("#withDrawPwd").val("");
		//查询银行账户列表
		$("#accountData tr").not(".bor-t").remove();
		$("#currentPage").val(currentPage);
		$("tr").remove(".newadd");
		$("tr").remove(".loading");
		$("#accountData").append("<tr class='loading'><td colspan='5'>数据加载中。。。</td></tr>");
		var param = {};
		param.start = (currentPage-1) * $("#rows").val();
		param.length = $("#rows").val();
		
		callService('${ctx}/gdb_cash/findGDBAccountPage.ajax',param,{"dataType": 'json',
			callSuccess:function(result){
				$("tr").remove(".loading");
					if(result.data.length>0){
				
						// handlebars模板
						var cashListTmp = Handlebars.compile($('#cashList-tl').html());
						// 装载数据
						var cashListHtml = cashListTmp(result.data)
						// 插入基础html
						$('#accountData').append(cashListHtml);
						}else{
						var str = '<tr>'
	            			+ '<td colspan="6" class=" table_bgA" style="text-align:center;">'
	            			+	'暂无账户！'
	            			+'</td>'
	            			+ '</tr>';
						$('#accountData').append(str);
					}
				
			}
		});
	}
	
	//初始化国家
	function country_init() {
			callService('/member/findAllAreaByGrade.ajax', {grade:0}, 
			{
				async : false,
				callSuccess:function(data){
					data = eval(data);
					$.each(data, function(index, val) {
						$('<option value="'+val.id+'" >' + val.name + '</option>')
								.appendTo('#country');
					});
				}
			}); 
		 
		$('#bankProvince').html('<option value="请选择省" selected="selected" >请选择省</option>');
		proChange($("#country").val());
	}
	
	//初始化省
	function proChange(obj) {
		callService('/member/findAllAreaByGrade.ajax', {grade : 1 , parentId :obj}, 
		{
			async : false,
			callSuccess:function(data){
				data = eval(data);
				$.each(data, function(index, val) {
					$('<option name="'+val.id+'" value="'+val.id+'" >' + val.name + '</option>')
						.appendTo('#bankProvince');
				});
			}
		});
		$('#bankCity').html('<option value="" selected="selected" >请选择市</option>');
		$('#bankDistrict').html('<option value="" selected="selected" >请选择区</option>');
		
		cityChange(obj);
	}
	
	//初始化市
	function cityChange(obj) {
		if(obj != ''){
			callService('/member/findAllAreaByGrade.ajax', {grade : 2 , parentId :obj }, 
			{
				async : false,
				callSuccess:function(data){
					$.each(data, function(index, val) {
						$('<option value="'+val.id+'" >' + val.name + '</option>').appendTo('#bankCity');
					});
				}
			});
		}
		$('#bankDistrict').html('<option value="" selected="selected" >请选择区</option>');
		secChange($('#bankCity').val());
	}
	//初始化区县
	function secChange(obj) {
		if(obj != ''){
			callService('/member/findAllAreaByGrade.ajax', {grade : 3 , parentId : obj}, 
			{
				async : false,
				callSuccess:function(data){
					data = eval(data);
					$.each(data, function(index, val) {
						$('<option value="'+val.id+'" >' + val.name + '</option>').appendTo('#bankDistrict');
					});
				}
			});
		}
	}
	
	function save(){
	 
		var accountName = $("#accountName").val();
		var bankAccount = $("#bankAccount").val();
		var bankName = $("#bankName").val();
		var bankCountry = $("#bankCountry").find('option:selected').text();
		var bankProvince = $("#bankProvince").find('option:selected').text();
		var bankCity = $("#bankCity").find('option:selected').text();
		var bankDistrict = $("#bankDistrict").find('option:selected').text();
		var withDrawPwd = $("#withDrawPwd").val();
		withDrawPwd = $.md5(withDrawPwd);
		var url = '${ctx}/gdb_cash/addCashAccountInfo.jhtml';
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
						var result = data;
						if("银行账号已存在"== result ){
							flag = false;
						}else{
							flag = true;
							$("#bankAccount").parent().find("label").remove();
						}	
					}
				});
				 
			return flag;
			}, "银行账号已存在，请重新输入。 	");
	
		//新增页面校验
		var errorCount = 0;
	
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
            	
            	if('withDrawPwd' == id){
            		if (error.text() != null && error.text() != "") {
            			$(elem).parent().find('label').remove();
            			$(elem).addClass("error");
               		 	$(elem).after(label);
           		 	}
            	}
       			 },
       			 success: function (elem) {
       			 },
		rules: {
			accountName : {
				required : true
			},
			bankAccount : {
				required : true,
				minlength: 19,
				digits : true,
				bankAccountCheck : true
			},
			bankName : {
				required : true
			},
			bankProvince : {
				number : true,
				required : true
			},
			bankCity : {
				required : true
			},
			bankDistrict : {
				required : true
			},
			withDrawPwd : {
				required : true
			} 
	    },
	    messages: {
	        accountName : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入账户名"
			},
			bankAccount : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入银行账号",
				minlength : "<u>&nbsp;</u><i>&nbsp;</i>"+"请输入一个长度最少是19位的整数",
				digits : "<u>&nbsp;</u><i>&nbsp;</i>"+"请输入整数",
				bankAccountCheck : "<u>&nbsp;</u><i>&nbsp;</i>" +"银行账号已存在，请重新输入。 "
			},
			bankName : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入银行支行名称"
			},
			bankProvince : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "省",
				number :"<u>&nbsp;</u><i>&nbsp;</i>" + "省"
			},
			bankCity : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "市"
			},
		    bankDistrict : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "区"
			},
			withDrawPwd : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入提现密码"
			} 
		}
		});
	 
		if (!$('#addForm').valid()) {
			// 未通过校验
			return;
		}
		// 添加蒙版
		$.dm.block();
		var param = { accountName:accountName,bankAccount:bankAccount,bankName:bankName,bankCountry:bankCountry,bankProvince:bankProvince,bankCity:bankCity,bankDistrict:bankDistrict,withDrawPwd:withDrawPwd};
		callService(url, param, {type:'post',
					callSuccess : function(data) {
						 if (data.success=='true') {
							 $.dm.unblock();
							 searchCashList(1);
							 jsAlert("添加成功");
							} else if(data.fail=='true'){
							 $.dm.unblock();
							 jsAlert("已有提现账户");
							}else{
							 $.dm.unblock();
							 jsAlert("密码不正确");
							}
					}
				});
		}
	
		function deleteAccountInfo(memberId){
			var url = '${ctx}/gdb_cash/deleteCashAccountPage.jhtml';
			jsConfirm("确认删除？", {
				callback : function(result) {
		 
					if (result) {
					// 添加蒙版
						$.dm.block();
	
						callService(url, {
							id : memberId 
						}, {
							callSuccess : function(data) {
							if (data.success) {
								$.dm.unblock();
								jsAlert("删除成功");
								searchCashList(1);
							} else {
								// 取消蒙版
								$.dm.unblock();
								jsAlert("删除失败");
								 
						}
					}
				});
			}
		}
		
	});
		}
	
	//转到编辑页面
		function toModifyAccountInfo(memberId){
			var url = '${ctx}/gdb_cash/toModifyCashAccountPage.jhtml?id='+memberId;
			var params ={};
			$.dm.jumpTo(url, params, {'method' : 'post'});
		}
	
</script>
</#macro>