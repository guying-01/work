<#include "/common/common_var_definds.ftl" />
<#macro render>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.dataTables.js"></script>
<script>
	
//采购单打印
function orderTotalPrintFunction(data,win){	
		var htmllast="";
		for(var m = 0;m < data.list.length;m++){
			//读取html文件
		   	$.ajax({url:"/resources/files/totalOrder.html",datatype:'html',  cache:false, async:false, "success":function(htmlobj){
			   	$('#totalOrderDiv').html(htmlobj);   
			   	var fieldData = data.list[m];
			   	var listData=fieldData.detailList;					   	   	
			   	
			   	var total=Math.ceil((listData.length+8)/30);
			   	var yu=(listData.length+8)/30;
			   	   	
			   	for(var i = 0;i < 13;i++){				   		
			   		var fieldTag="a"+i;
			   		var $item = $('[tag="'+ fieldTag +'"]');
					var content = $item.html();
					var tempStr = "<!--[[[" + fieldTag +"]]]-->";
					content = content.replace(tempStr, getTagSorting(fieldTag,fieldData));
					$item.html(content); 
			   	}
			   	
			   	var table17 = $('[tag="a17"]');
			   	var table16 = $('[tag="a16"]');				   	
			   	
		   		var $item15_0 = $('[tag="a15_detail"]');
				var $templateItem = $item15_0.clone();//单品空行模板
				var pageno=1;
			   	for(var i = 0;i < listData.length;i++){		
			   		var itemInfo = listData[i];					   		
			   		if(i<24){
				   		if(i == 0){
							var firstItemContent = $item15_0.html();
							$item15_0.html(replaceItemSupply(firstItemContent,itemInfo));
						} else {
							var $newItem = $templateItem.clone();//新的单品行
							var newItemContent = $newItem.html();
							$newItem.html(replaceItemSupply(newItemContent,itemInfo));
							var $lastItem = $('[tag="a15_sum"]'); 
							$lastItem.before($newItem);
						}
						if(i==23 || (i==listData.length-1 && listData.length>20)){
							var table17temp=table17.clone();
							var pagtemp=table17temp.html();
							pagtemp=table17temp.html(pagtemp.replace("<!--[[[a17_1]]]-->",(pageno+"/"+total)));							
							table17temp.attr("class","PageNext");
							table17.before(table17temp);
						}
					}
					else{
						if((i-24)%30==0){
							pageno++;
							var table16temp = table16.clone();
							var length=((i+30)<listData.length)?(i+30):listData.length;
							for(var j=i;j<length;j++){
								var itemInfo = listData[j];
								var $newItem = $templateItem.clone();//新的单品行
								var newItemContent = $newItem.html();
								$newItem.html(replaceItemSupply(newItemContent,itemInfo));									
								table16temp.append($newItem);
							}
		   					table16temp.attr("style","");			   					
							table17.before(table16temp);	
							//页码 分页
							if(pageno==total){
								
							}else{
								var table17temp=table17.clone();
								var pagtemp=table17temp.html();
								pagtemp=table17temp.html(pagtemp.replace("<!--[[[a17_1]]]-->",(pageno+"/"+total)));		
								table17temp.attr("class","PageNext");
								table17.before(table17temp);
							}					
						}
					}
		   		}
		   		table17.html(table17.html().replace("<!--[[[a17_1]]]-->",(total+"/"+total)));	
		   		if(m!=data.list.length-1){
		   			$('#foot4').attr("class","PageNext property");	
		   		}
		   		htmllast+=$('#totalOrderDiv').html();  
			}})
		}
		
		/* 弹出打印窗口 */
	   	var printContent =htmllast;

		win.document.write(printContent);
		win.print();
}
    
    
/**
 * 获取字段的值  by 
 */
var getTagSorting = function(tag,order){
	switch(tag){
		case 'a0':
			return "采购单"+"("+order.sortingListNo+")";
		case 'a1':
			return order.storehouseName+"("+order.storehouseAdd+")";
		case 'a2':
			return order.storehouseLineName;
		case 'a3':
			return order.positionNumber;
		case 'a4':
			return order.buyerName+"("+order.passportNo+")";
		//case 'a5':
		//	return order.contactName;
		//case 'a6':
		//	return order.mobile;
		case 'a5':
			return "饭饭客服";
		case 'a6':
			return order.fanMobile;
		case 'a7':
			return order.tradeAttr2;
		case 'a8':
			return order.buyerLocation;
		case 'a9':
			var mineDate = new Date(order.tradeAttr1.replace(/-/g,"/"));
			var tempDate=mineDate.getFullYear()+"年"+(mineDate.getMonth()+1)+"月"+mineDate.getDate()+"日 "+((mineDate.getHours() >= 12) ? "下午 " : "上午 " )
			return tempDate;
		case 'a10':
			return order.goodsMoneyStr;			
		case 'a11':
			return order.fanMobile;
		case 'a12':
			return order.fanUrl;
	}
}

    /** 商品列表内容替换 */
    var replaceItemSupply = function(content,itemInfo){
        var sortingListDetailNo = itemInfo.sortingListDetailNo?itemInfo.sortingListDetailNo:"";
    	content = content.replace("<!--[[[a15_0]]]-->",sortingListDetailNo);  	
    	var supplierCode = itemInfo.supplierCode?itemInfo.supplierCode:"";
    	content = content.replace("<!--[[[a15_1]]]-->",supplierCode);    	
    	var storeName = itemInfo.storeName?itemInfo.storeName:"";
    	content = content.replace("<!--[[[a15_2]]]-->",storeName);	
    	var totalOrderId = itemInfo.totalOrderId?itemInfo.totalOrderId:"";
    	content = content.replace("<!--[[[a15_3]]]-->",totalOrderId);
    	var orderId = itemInfo.orderId?itemInfo.orderId:"";
       	content = content.replace("<!--[[[a15_4]]]-->",orderId);
    	var itemId = itemInfo.itemId?itemInfo.itemId:"";
    	content = content.replace("<!--[[[a15_5]]]-->",itemId);
    	var itemName = itemInfo.itemName?itemInfo.itemName:"";
    	content = content.replace("<!--[[[a15_6]]]-->",itemName);
    	var itemSpec = itemInfo.itemSpec?itemInfo.itemSpec:"";
    	content = content.replace("<!--[[[a15_7]]]-->",itemSpec);
    	var itemAmount = itemInfo.itemAmount?itemInfo.itemAmount:"";
    	content = content.replace("<!--[[[a15_8]]]-->",itemAmount);
    	var itemPrice = itemInfo.itemPrice?itemInfo.itemPrice.toFixed(2):"";
    	content = content.replace("<!--[[[a15_9]]]-->",itemPrice);
    	var itemMoney = itemInfo.itemMoney?itemInfo.itemMoney.toFixed(2):"";
    	content = content.replace("<!--[[[a15_10]]]-->",itemMoney);
    	return content;
    }
</script>
</#macro>
