$(document).ready(function(){
		$('.shut').click(function(){
			$("#addressform").validate().resetForm();
		});
		//点击“编辑”功能
		$('[dm-actor="editAddress"]').live('click',function(){
			cliclEditAddress($(this).attr("value"));
		});
	});
	//新增地址
	function useOtherAddress() {
		$('#title').html("添加收货地址");
		$('#city').html('<option value="" selected="selected" >请选择市</option>');
		$('#region').html('<option value="" selected="selected" >请选择区</option>');
		$('#address').val('');
		$('#postcode').val('');
		$('#consignee').val('');
		$('#telephone1').val('');
		$('#telephone2').val('');
		$('#telephone3').val('');
		$('#mobileNum').val('');
		$('#telephone').val('');
		$('#memberId').val('');
		$("#defaultFlag").attr("checked", false);
		country_init();
		
	}
	//初始化国家
	function country_init() {

		$('#country').html('<option value="" selected="selected" >请选择国家</option>');
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
		$('#province').html('<option value="" selected="selected" >请选择省</option>');
		$('#city').html('<option value="" selected="selected" >请选择市</option>');
		$('#region').html('<option value="" selected="selected" >请选择区</option>');
	}
	//省初始化
	function add_init(obj) {
		$('#province').html('<option value="" selected="selected" >请选择省</option>');
		callService('/member/findAllAreaByGrade.ajax', {grade : 1 , parentId : obj}, 
		{
			async : false,
			callSuccess:function(data){
				data = eval(data);
				$.each(data, function(index, val) {
					$('<option value="'+val.id+'" >' + val.name + '</option>')
						.appendTo('#province');
				});
			}
		});
		$('#city').html('<option value="" selected="selected" >请选择市</option>');
		$('#region').html('<option value="" selected="selected" >请选择区</option>');
	}
	//初始化市
	function friChange(obj) {
		$('#city').html('<option value="" selected="selected" >请选择市</option>');
		if(obj != ''){
			callService('/member/findAllAreaByGrade.ajax', {grade : 2 , parentId : obj}, 
			{
				async : false,
				callSuccess:function(data){
					$.each(data, function(index, val) {
						$('<option value="'+val.id+'" >' + val.name + '</option>').appendTo('#city');
					});
				}
			});
		}
		$('#region').html('<option value="" selected="selected" >请选择区</option>');
	}
	//初始化区县
	function secChange(obj) {
		$('#region').html('<option value="" selected="selected" >请选择区</option>');
		if(obj != ''){
			callService('/member/findAllAreaByGrade.ajax', {grade : 3 , parentId : obj}, 
			{
				async : false,
				callSuccess:function(data){
					data = eval(data);
					$.each(data, function(index, val) {
						$('<option value="'+val.id+'" >' + val.name + '</option>').appendTo('#region');
					});
				}
			});
		}
	}

	//修改地址初始化
	function edit_init(province, city, region, address, postcode, consignee,
			mobile, telephone, country) {
		$('#telephone').parent().children().val('')
		$('#address').val(address);
		$('#postcode').val(postcode);
		$('#consignee').val(consignee);
		if(telephone!=null && telephone!=""){
			$('#telephone1').val(telephone.split("-")[0]);
			$('#telephone2').val(telephone.split("-")[1]);
			$('#telephone3').val(telephone.split("-")[2]);
		}
		$('#mobileNum').val(mobile);
		$('#country').children().remove();
		$('#province').children().remove();
		$('#region').children().remove();
		
		callService('/member/findAllAreaByGrade.ajax', {grade:0}, 
		{
			callSuccess:function(data){
				for(var i = 0; i < data.length; i++){
					if (country == data[i].id) {
						$('<option value="'+data[i].id+'" selected="selected">' + data[i].name + '</option>').appendTo('#country');
					} else {
						$('<option value="'+data[i].id+'" >' + data[i].name + '</option>').appendTo('#country');
					}
				}
			}
		});
		
		callService('/member/findAllAreaByGrade.ajax', {grade:1 , parentId : country}, 
		{
			callSuccess:function(data){
				for(var i = 0; i < data.length; i++){
					if (province == data[i].id) {
						$('<option value="'+data[i].id+'" selected="selected">' + data[i].name + '</option>').appendTo('#province');
					} else {
						$('<option value="'+data[i].id+'" >' + data[i].name + '</option>').appendTo('#province');
					}
				}
			}
		});
		
		callService('/member/findAllAreaByGrade.ajax', {grade:2 , parentId : province}, 
		{
			callSuccess:function(data){
				for(var i = 0; i < data.length; i++){
					if (city == data[i].id) {
						$('<option value="'+data[i].id+'" selected="selected">' + data[i].name + '</option>').appendTo('#city');
					} else {
						$('<option value="'+data[i].id+'" >' + data[i].name + '</option>').appendTo('#city');
					}
				}
			}
		});

		callService('/member/findAllAreaByGrade.ajax', {grade:3, parentId : city}, 
		{
			callSuccess:function(data){
				for(var i = 0; i < data.length; i++){
					if (region == data[i].id) {
						$('<option value="'+data[i].id+'" selected="selected">' + data[i].name + '</option>').appendTo('#region');
					} else {
						$('<option value="'+data[i].id+'" >' + data[i].name + '</option>').appendTo('#region');
					}
				}
			}
		});
	}
	//修改地址
	function cliclEditAddress(id) {
		callService('/member/findMemberAddressById.ajax', {id:id}, 
		{async : false,
			callSuccess:function(data){
			    $('#title').html("编辑收货地址");
				$(".cx2").fadeIn();
				edit_init(data.provinceId, data.cityId, data.areaId,
							data.address, data.postcode, data.consignee,
							data.mobile, data.telephone, data.countryId);
					$('#id').val(data.id);
					$('#memberId').val(data.memberId);
					if (data.isDefault) {
						$("#defaultFlag").attr("checked", true);
					} else {
						$("#defaultFlag").attr("checked", false);
					}
			}
		});
	}
	//保存修改
	function edit() {
		if($("#addressform").valid()){
			var target = $(".pop_up_button");
			$.dm.block(target);//开始区域锁定
			defaultFlag();
			var country = $('#country').find("option:selected").text();
			var province = $('#province').find("option:selected").text();
			var city = $('#city').find("option:selected").text();
			var region = $('#region').find("option:selected").text();
			var address = $('#address').val();
			var phone = "";
			if ($('#mobileNum').val() != null && $('#mobileNum').val() != '') {
				phone = $('#mobileNum').val();
			} else {
				phone = $('#telephone').val();
			}
			var consignee = $('#consignee').val();
			var text = province + "&nbsp;&nbsp;" + city + "&nbsp;&nbsp;" + region
					+ "&nbsp;&nbsp;" + address + "(" + consignee + "收)" + phone
			 var  shdz =province+"    "+
			 		   city+"    "+
			 		   region+"    "+	
			 		   address;	   
			 var shr = consignee+"    "+phone
			 var name = "span_"+$("#id").val();
			var telephopeVal = '';
			if($('#telephone1').val()!=''){
				telephopeVal = $('#telephone1').val();
			}
			if($('#telephone2').val()!=''){
				if(telephopeVal!=''){
					telephopeVal += "-"+$('#telephone2').val();
				}else{
					telephopeVal = $('#telephone2').val();
				}
				
			}
			if($('#telephone3').val()!=''){
				if(telephopeVal!=''){
					telephopeVal += "-"+$('#telephone3').val();
				}else{
					telephopeVal = $('#telephone3').val();
				}
			}
			$('#telephone').val(telephopeVal);
			$('#provinceName').val($('#province').find("option:selected").text());
			$('#cityName').val($('#city').find("option:selected").text());
			$('#areaName').val($('#region').find("option:selected").text());
			$('#countryName').val($('#country').find("option:selected").text());
			var adressId = $("#addressform").find($('#id')).val();
			$('#addres_modifyDate').val($('#modifyDate_'+adressId).val())
			var fm = $('#addressform').serialize();
			callService('/member/editAddress.ajax', {}, 
			{data:fm,
				callSuccess:function(data){
					if (data) {
						$.dm.unblock(target);//区域解锁
						$(".cx2").fadeOut();
						if($(".Shipping-address").length>0){
							saveAfter();
						}
						if($(".order-adress-list").length>0){
							location.reload();
						}
					}
				},callValidFailed:function(error){
					if(error.businessErrAttachs[0][0].code=='typeMismatch'){
						jsErrAlert(error.errMsg||'');
					}else{
						jsErrAlert(error.businessErrAttachs[0][0].defaultMessage);
					}
					$.dm.unblock(target);
				},callError:function(textStatus, errorThrown, error){
					jsErrAlert(error.errMsg||'');
					$.dm.unblock(target);
				}
			});
			
		}
	}

	//新增保存
	function add() {
		if($("#addressform").valid()){
			var target = $(".pop_up_button");
			$.dm.block(target);//开始区域锁定
			defaultFlag();
			$('#telephone').val($('#telephone1').val() + "-" + $('#telephone2').val() + "-" + $('#telephone3').val());
			$('#provinceName').val($('#province').find("option:selected").text());
			$('#cityName').val($('#city').find("option:selected").text());
			$('#areaName').val($('#region').find("option:selected").text());
			$('#countryName').val($('#country').find("option:selected").text());
			var telephopeVal = '';
			if($('#telephone1').val()!=''){
				telephopeVal = $('#telephone1').val();
			}
			if($('#telephone2').val()!=''){
				if(telephopeVal!=''){
					telephopeVal += "-"+$('#telephone2').val();
				}else{
					telephopeVal = $('#telephone2').val();
				}
				
			}
			if($('#telephone3').val()!=''){
				if(telephopeVal!=''){
					telephopeVal += "-"+$('#telephone3').val();
				}else{
					telephopeVal = $('#telephone3').val();
				}
			}
			$('#telephone').val(telephopeVal);
			var fm = $('#addressform').serialize();
			callService('/member/addAddress.ajax', {}, 
			{data:fm,
				callSuccess:function(data){
					if (data) {
						$.dm.unblock(target);//区域解锁
						$(".cx2").fadeOut();
						if($(".order-adress-list").length>0){
							location.reload();
						}
						if($(".Shipping-address").length>0){
							saveAfter();
						}
					} 
				},callValidFailed:function(error){
					if(error.businessErrAttachs[0][0].code=='typeMismatch'){
						jsErrAlert(error.errMsg||'');
					}else{
						jsErrAlert(error.businessErrAttachs[0][0].defaultMessage);
					}
					$.dm.unblock(target);
				},callError:function(textStatus, errorThrown, error){
					jsErrAlert(error.errMsg||'');
					$.dm.unblock(target);
				}
			});
		}
	}
	
	//保存(通过memberId判断是新增还是修改)
	function save() {
		//if($("#addressform").valid()){
	 		var memberId = $('#memberId').val();
	 		if (memberId == '') {
	 			add();
	 		} else {
	 			edit();
	 		}
 		//}
	}

	function setDefault(id, memberId) {
		callService('/member/updateDefaultAddress.ajax', {id:id,memberId : memberId}, 
		{
			callSuccess:function(data){
				jsAlert("设置默认地址成功！");
			}
		});
	}
	
	//处理默认地址
	function defaultFlag(){
		if($("#defaultFlag").is(':checked')){
				$("#defaultFlag").val('1');
		}else{
			$("#defaultFlag").val('0');
		}
	}
	

