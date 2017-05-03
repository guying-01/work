// JavaScript Document
$(function() {
	//点击“删除”功能
	$('[dm-actor="deleteAddress"]').live('click',function(){
		delAddress($(this).attr("value"));
	});
	//点击“设成默认地址功能”功能
	$('[dm-actor="setDefaultAddress"]').live('click',function(){
		updateDefault($(this).attr("value"));
	});
	//客户化验证插件
	$.validator.setDefaults({errorClass:'errorwrong',
		highlight: function( element, errorClass, validClass ) {
			if ( element.type === "radio" ) {
				this.findByName( element.name ).addClass( errorClass ).removeClass( validClass );
			} else {
				//$( element ).addClass( errorClass ).removeClass( validClass );
			}
		},
		unhighlight: function( element, errorClass, validClass ) {
			if ( element.type === "radio" ) {
				this.findByName( element.name ).removeClass( errorClass ).addClass( validClass );
			} else {
				//$( element ).removeClass( errorClass ).addClass( validClass );
			}
			
	}});
	
	$("#addressform").validate({
		errorPlacement : function(errorwrong, element) {
			if($(errorwrong).attr('id') == 'country-error' || $(errorwrong).attr('id') == 'province-error'
				 || $(errorwrong).attr('id') == 'city-error' || $(errorwrong).attr('id') == 'region-error'){
				$(errorwrong).css('left', '0px')
			}else{
				errorwrong.addClass('errorwrong_r');
				errorwrong.css({'top': '0px','left': '0px', 'position': 'relative','float': 'left','margin-left': '20px'});
			}
			element.after(errorwrong);
		},
		rules: {
    		countryId : {
				required : true
			},
			provinceId : {
				required : true
			},
			cityId : {
				required : true
			},
			areaId : {
				required : true
			},
			address : {
				maxlength:120,
				minlength:5,
				required : true
			},
			postcode : {
				maxlength:6,
				required : true,
				isZipCode:true
			},
			consignee :{
				maxlength :25,
				required : true
			},
			mobile : {
				maxlength:11,
				required : true,
				mobile : true
			},
			telephone1 :{
				maxlength:4,
				checkNumber : true
			},
			telephone2 :{
				maxlength:8,
				checkNumber : true
			},
			telephone3 :{
				maxlength:4,
				checkNumber : true
			}
	    },
	    messages: {
    		countryId : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请选择国家"
			},
			provinceId : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请选择省"
			},
			cityId : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请选择市"
			},
		    areaId : {
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请选择地区"
			},
			address : {
				maxlength: "<u>&nbsp;</u><i>&nbsp;</i>" + "地址不能大于120个字符",
				minlength: "<u>&nbsp;</u><i>&nbsp;</i>" + "地址不能小于5个字符",
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请填写详细地址"
			},
			postcode : {
				maxlength: "<u>&nbsp;</u><i>&nbsp;</i>" + "邮政编码不能大于6个字符",
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请填写邮政编码",
				isZipCode: "<u>&nbsp;</u><i>&nbsp;</i>" + "请填写正确的邮政编码"
			},
			consignee : {
				maxlength: "<u>&nbsp;</u><i>&nbsp;</i>" + "姓名不能大于25个字符",
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请填写收件人姓名"
			},
			mobile : {
				maxlength: "<u>&nbsp;</u><i>&nbsp;</i>" + "手机号码不能大于11个字符",
				required : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入手机号码",
				mobile : "<u>&nbsp;</u><i>&nbsp;</i>" + "请输入正确的手机号码"
			},
			telephone1 : {
				maxlength: "<u>&nbsp;</u><i>&nbsp;</i>" + "电话区号不能大于4个字符",
				checkNumber : "<u>&nbsp;</u><i>&nbsp;</i>" + "电话区号只能输入数字"
			},
			telephone2 : {
				maxlength: "<u>&nbsp;</u><i>&nbsp;</i>" + "电话号码不能大于8个字符",
				checkNumber : "<u>&nbsp;</u><i>&nbsp;</i>" + "电话号码只能输入数字"
			},
			telephone3 : {
				maxlength: "<u>&nbsp;</u><i>&nbsp;</i>" + "分机号不能大于4个字符",
				checkNumber : "<u>&nbsp;</u><i>&nbsp;</i>" + "分机号只能输入数字"
			}
		}
	});

	if($('#addressId').length == 0){
		searchAddress(1);
	}
});

function searchAddress(page) {
	
	var length=$("#rows").val();
	if(length==undefined){
		length=10;
	}
	var pageNumber=$("#currentPage").val();
	if(pageNumber==undefined){
		pageNumber=10;
	}
	$("#currentPage").val(page);
	$("#noData").hide();
	$("#addressData").html('<span style="color: #333333; font-size: 1.2em;">处理中...</span>');
	callService('/member/findMemberAddressList.ajax', 
		{ "length": $("#rows").val(),
		  "pageNumber": $("#currentPage").val()
		},
		{callSuccess:function(datas) {
			if(datas != "" && datas.data.length > 0) {
				var html=$("#addressValue").html();
				var handlebarObject=Handlebars.compile(html);//handlerbar对象
				var str=handlebarObject(datas.data);
				$("#addressData").html(str);
				$("#currentPage").val(datas.data[0].pageNumber);
			} else {
				$("#currentPage").val(1);
				$("#addressData").html("暂无收货地址！");
			}	
			$('#addresspager').pager(datas , {
				rows : [5, 10, 25 , 50],
				searchMethod : 'searchAddress',
				drawAfter : function(){
					$('.paging_full_numbers').parent().css('width', '600px');
					$("#datatable_length").css("float","left");
				}
			});	
		}}
	);
}

function saveAfter(){
	searchAddress(1);
}
/***删除地址功能***/	
function delAddress(id){
	jsWarConfirm("确定要删除收货地址吗?",{callback:function(result){
		if(result){									
			callService('/member/delAddress.ajax', {"id":id , "modifyDate":$('#modifyDate_'+id).val()}, 
				{async : false,
					callSuccess:function(data){
						if (data) {
							searchAddress(1);
						}
					}
				}); 
		}
	}});
}
/***设置为默认地址功能***/
function updateDefault(id,type){
	jsConfirm("确定要将此设置为默认地址吗?",{callback:function(result){
		if(result){
			callService('/member/updateDefaultAddress.ajax', 
				{ "id" : id , "telephone" : $("#telephone_"+id).val(), "modifyDate":$("#modifyDate_"+id).val()},
				{	callSuccess:function(data) {
					if(data) {
							//searchAddress(1)
						location.reload();	
						/*else if(type==2){
							location.reload();	
							//location.replace(location.href);
						}*/				
					} else {
						jsErrAlert("设置默认地址失败！");
					}
				}}
			);
		}
	}});
	
}