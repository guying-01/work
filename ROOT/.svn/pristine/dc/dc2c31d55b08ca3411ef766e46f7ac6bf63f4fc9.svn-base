// JavaScript Document
$(document).ready(function () {
	// 计算初始运费,给区域变化绑定运费计算
	showProvince();
	//显示发货地
	senderMemo();
	// 点击加减配送数时
	// 在文件 field_goods_scripts.ftl的93~96行调用
})

/**
 * 设置运费参数后从后台算出运费，并显示在页面 by geshuo 20151125
 */
function calcCarriage(){
	// 设置计算运费的参数
	setCarriageParam();
	// 从后台得到运费
	getCarriage();
}


/**
 * 设置运费计算所需参数
 */
function setCarriageParam(){
	// 设置运送区域，运送区域不在本处设置，在区域选择时设置
	var $_carriageCount = $("#goods_carriage_carriageCount");
	// 设置运输数量
	$_carriageCount.val($("#numbox").val());
}
/**
 * 计算运费
 */
function getCarriage(){
	// 商品id
	var goodsId = $("#goods_carriage_goodsId").val();
	// 区域id
	var carriageareaId = $("#goods_carriage_areaId").val();
	// 运送数量
	var carriageCount = $("#goods_carriage_carriageCount").val();
	// 运费价格对象
	var $_carriagePrice = $("#goods_carriage_carriagePrice");
	// 计算参数
	var param = {
				"goodsId":goodsId,
				"areaId":carriageareaId,
				"carriageCount":carriageCount
				};
	/*获取运费 by geshuo*/
	callService('/gd/calcGoodsCarriage.ajax',
			param,
			{
				callSuccess:function(data){
					if(data["resultFlg"] == true){
						// 如果运费计算成功，在页面显示计算的运费
						if(data["data"]==0){
							$_carriagePrice.html("卖家承担运费");
						}else{
							$_carriagePrice.html("运费 ￥"+data["data"]);
						}
					}else{
						// 没有查询到内容
						console.log("没有查询到内容   data: "+data["data"]);
					}
				}
			});
}

/**
 * 显示省份
 */
function showProvince(){
	var url = "/area/getAreaInfo.ajax";
	var param = {grade:1, parentId:'86'};
	callService(url,param,
			{callSuccess:function(data){
				var defaultAddress = data.defaultAddress;
				var data = data.areaList;
				// 默认是北京
				var provinceId = "110000";
				var provinceName = "北京";
				if(defaultAddress){
					provinceId = defaultAddress.provinceId;
					provinceName = defaultAddress.provinceName;
				}
				var provinceHtml = "";
				// 将省份显示
				for(var key in data){
					var province = data[key];
					provinceHtml += '<p><a href="javascript:void(0);" dm-actor="area-province"';
					provinceHtml += ' dm-data="'+province["id"]+'"';
					provinceHtml += ' dm-grade="'+province["grade"]+'"';
					provinceHtml += ' dm-parentId="'+province["parentId"]+'"';
					// 将第一个省份用作选定的省份
					if(provinceId == province["id"]){
						provinceHtml += ' class="adress-list-selected"';
						provinceId = province["id"];
						provinceName = province["name"];
					}
					provinceHtml += ' >';
					provinceHtml += province["name"];
					provinceHtml += ' </a></p>';
				}
				// 将省份显示
				$("#carriage-area_province").html(provinceHtml);
				// 显示当前省份对应的城市
				showCitiesOfProvice(provinceId,provinceName);
				
				// 给每个省份添加click响应事件
				$("#carriage-area_province [dm-actor='area-province']").bind("click",clickProvince);
			}});
}

/**
 * 点击省份时显示当前省份的城市
 */
function clickProvince(){
	var provinceId = $(this).attr("dm-data");
	var provinceName = $(this).html();
	$("#carriage-area_province").children().children().removeClass();
	$(this).addClass("adress-list-selected");
	// 显示当前省份对应的城市
	showCitiesOfProvice(provinceId,provinceName);
	
}


/**
 * 显示特定省份的城市
 * provinceId 省份id，当前城市所在的省份的id
 * provinceName 省份名称，当前城市所在的省份的名称
 */
function showCitiesOfProvice(provinceId,provinceName){
	// 获取城市
	var param = {grade:2, parentId:provinceId};
	var url = '/area/getAreaInfo.ajax';
	// 显示城市
	callService(url,param,
			{callSuccess:function(data){
				var defaultAddress = data.defaultAddress;
				var data = data.areaList;
				var cityCount = 0;
				var cityHtml = "";
				// 默认北京市
				var cityAreaId = "110100";
				var cityName = "北京";
				if(defaultAddress && (provinceName==defaultAddress.provinceName)){
					//省份默认编码
					cityAreaId = defaultAddress.cityId;
					cityName = defaultAddress.cityName;
					provinceId = defaultAddress.provinceId;
					provinceName = defaultAddress.provinceName;
				}
				// 将省份显示
				for(var key in data){
					var city = data[key];
					cityHtml += '<p style="width:auto;"><a href="javascript:void(0);" style="white-space:nowrap; table-layout:auto;" dm-actor="area-city"';
					cityHtml += ' dm-data="'+city["id"]+'"';
					cityHtml += ' dm-grade="'+city["grade"]+'"';
					cityHtml += ' dm-parentId="'+city["parentId"]+'"';
					cityHtml += ' dm-province="'+provinceName+'"';
					// 将第一个省份用作选定的省份
					if(cityCount == 0){
						//判断默认
						if(defaultAddress && (provinceName==defaultAddress.provinceName)){
						}else{
							cityHtml += ' class="adress-list-selected"';
							cityAreaId = city["id"];
							cityName = city["name"];
						}
					}
					cityHtml += ' >';
					cityHtml += city["name"];
					cityHtml += '</a></p>';
					// 每增加一个省，增加一个计数
					cityCount++;
				}
				// 将省份对应的城市显示
				$("#carriage-area_city").html(cityHtml);
				// 设置初始化配送区域id
				$("#goods_carriage_areaId").val(cityAreaId);
				// 将选中的区域显示在页面上
				if(provinceName.substring(0,2)==cityName.substring(0,2)&&provinceName.substring(0,2)!="吉林"){
					$("#goods_carriage_areaName").html(provinceName);
				}else{
				$("#goods_carriage_areaName").html(provinceName+cityName);
				}
				// 计算初始配送运费
				calcCarriage();
				
				// 给每个城市添加click响应事件
				$("#carriage-area_city [dm-actor='area-city']").bind("click",clickCity);
				$("#carriage-area_hot [dm-actor='area-city']").bind("click",clickHotCity);
				
				// 如果选中的城市id不再热点
				var $_hot_cities = $("#carriage-area_hot").children().children();
				$_hot_cities.each(function(i){
					try{
						var cityId = city["id"];
						var item = $(this);
						var hot_city_id = item.attr("dm-data");
						if(hot_city_id == cityId){
							item.addClass("adress-list-selected");
						}else{
							item.removeClass("adress-list-selected");
						}
					}catch(ex){console.info(ex);}
				});
			}});
}

/**
 * 点击城市时的处理
 */
function clickCity(){
	
	// 设置城市id
	var cityId = $(this).attr("dm-data");
	
	// 如果选中的城市id不再热点
	// 选中地区时,选中一致的热点地区
	var $_hot_cities = $("#carriage-area_hot").children().children();
	$_hot_cities.each(function(i){
		try{
			var item = $(this);
			var hot_city_id = item.attr("dm-data");
			if(hot_city_id == cityId){
				item.addClass("adress-list-selected");
			}else{
				item.removeClass("adress-list-selected");
			}
		}catch(ex){console.info(ex);}
	});
	
	
	var oldCityId = $("#goods_carriage_areaId").val();
	if(oldCityId != cityId){
		$("#goods_carriage_areaId").val(cityId);
		// 运费区域变化，调用运费计算
		calcCarriage();
	}
	
	// 给当前选择的区域加选中样式
	$("#carriage-area_city").children().children().removeClass();
	$(this).addClass("adress-list-selected");
	
	// 将选中的区域显示在页面上
	var provinceName = $(this).attr("dm-province");
	var cityName = $(this).html();
	if(provinceName.substring(0,2)==cityName.substring(0,2)&&provinceName.substring(0,2)!="吉林"){
		$("#goods_carriage_areaName").html(provinceName);
	}else{
	$("#goods_carriage_areaName").html(provinceName+cityName);
	}
	// 关闭区域选择框
	$(".detail-adress-i").trigger("click");
}

/**
 * 点击热点城市时的处理
 */
function clickHotCity(){
	// 设置城市id
	var cityId = $(this).attr("dm-data");
	var oldCityId = $("#goods_carriage_areaId").val();
	if(oldCityId != cityId){
		$("#goods_carriage_areaId").val(cityId);
		// 运费区域变化，调用运费计算
		calcCarriage();
	}
	
	// 给当前选择的区域加选中样式
	$("#carriage-area_hot").children().children().removeClass();
	$(this).addClass("adress-list-selected");
	
	// 将选中的区域显示在页面上
	var provinceName = $(this).attr("dm-province");
	var cityName = $(this).html();
	if(provinceName.substring(0,2)==cityName.substring(0,2)&&provinceName.substring(0,2)!="吉林"){
		$("#goods_carriage_areaName").html(provinceName);
	}else{
		$("#goods_carriage_areaName").html(provinceName+cityName);
	}
	
	var provinceId = $(this).attr("dm-parentid");
	var $_provinces = $("#carriage-area_province").children().children();
	
	// 点击热点地区时,选择该热点地区所在的省份
	$_provinces.each(function(i){
		try{
			var item = $(this);
			var province_id = item.attr("dm-data");
			if(province_id == provinceId){
				item.addClass("adress-list-selected");
				//$(this).click();
			}else{
				item.removeClass("adress-list-selected");
			}
		}catch(ex){console.info(ex);}
	});
	// 点击热点地区时选中与该热点地区一致的运送地区
	var $_cities = $("#carriage-area_city").children().children();
	$_cities.each(function(i){
		try{
			var item = $(this);
			var city_id = item.attr("dm-data");
			if(city_id == cityId){
				item.addClass("adress-list-selected");
			}else{
				item.removeClass("adress-list-selected");
			}
		}catch(ex){console.info(ex);}
	});
	
	
	// 关闭区域选择框
	$(".detail-adress-i").trigger("click");
}

/**
 * 显示发货地
 * @author geshuo
 */
function senderMemo(){
	// 商品id
	var goodsId = $("#goods_carriage_goodsId").val();
	//发货地对象
	var $_senderMemo = $("#goods_carriage_Sender");
	var url = "/gd/findSenderMemo.ajax";
	// 计算参数
	var param = {"goodsId":goodsId};
	callService(url, param, {
		callSuccess : function(data) { // 调用后台服务
			if(data["resultFlg"] == true){
				// 如果成功，在页面显示
				if(data["data"].length >=4 ){
					var str1 = data["data"].substring(0,2);
					var str2 = data["data"].substring(2,4);
					if (str1==str2){
						$_senderMemo.html(str1);
					}else{
						$_senderMemo.html(data["data"]);
					}
				}else{
					$_senderMemo.html(data["data"]);
				}
			}else{
				// 没有查询到内容
				console.log("没有查询到内容   data: "+data["data"]);
			}
		}
	});
}