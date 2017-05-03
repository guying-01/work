/** 商品销售记录js */
var param;
$(function(){
	param = {goodsId:$("#goods_carriage_goodsId").val()};
	//销售记录获取 by geshuo 20151123
	var jiedian=$("[dm-type='goodsRecord']");
	//请求参数
	var params = {
					goodsId:$("#goods_carriage_goodsId").val()
				};
	/*获取销售记录总数*/
	callService("/gd/findGoodsTransactionCount.ajax",params,{callSuccess:function(data){
		if(data.success){
			jiedian.html("销售记录（<span dm-info='goods-sale-count-base'>"+data.result+"</span>）");
		} else {
			//错误处理
			jsAlert("获取销售记录数量失败!");
		}
	}})
	
	var clickNum=0;
	jiedian.click(function(){
		$('#currentPage').val('1');
		createEvaluate(1);/*显示销售记录列表数据*/
	});
	
});

/**显示销售记录列表数据 by geshuo 20151123*/
function createEvaluate(currentPage){
	param.start=(currentPage-1) * $("#rows").val();
	param.length=$("#rows").val();
	callService("/gd/findGoodsTransaction.ajax",param,{
		
		callSuccess:function(data)
		{	
			if(data.data.recordsTotal!=0){
				$('#sellHistory').show();
				$('#JKDiva_2').find($('.detail-null')).hide();
				var html=$("#score_tl").html();
				var handlebarsObject=Handlebars.compile(html);
				var str=handlebarsObject(data.data.data);
				$("#transaction_table").html(str);
				$('#transaction_table').pager(data.data , {
					rows : [5, 10, 25 , 50],
					searchMethod : 'createEvaluate',
					drawAfter : function(){
						$('.paging_full_numbers').parent().css('width', '600px');
						$("#datatable_length").css("float","left");
					}
				});
			}else{
				$('#sellHistory').hide();
				$('#JKDiva_2').find($('.detail-null')).show();
			}
		}
	});
}

/*	//展现的TABLE数据
var review_table=$(
		'<table width="960" border="0" cellspacing="0" cellpadding="0" class="table-line m-t-10">'+
		'<tr><th width="180" scope="col">买家</th>'+
		'<th width="180" scope="col">拍下单价</th>'+
		'<th width="180" scope="col">购买数量</th>'+
		'<th width="200" scope="col">付款时间</th>'+
		'<th scope="col">款式</th></tr></table>'
);

callService("/gd/findGoodsTransaction.ajax",param,{
	callSuccess:function(data)
	{	
		self.html("");
		self.append(status);
		if(data.data.length=0){
			self.append(review_table);
			return ;
		}
		console.log(data.data.data);
		var htmls ='';
		for(var i=0;i<data.data.data.length;i++){
			var name=data.data.data[i].memberAccount;
			if(name!=null&&name!=undefined)
			name="**"+name.substr(1,name.length-4)+"**";
			if(name==null||name=="null")
			name="(匿名)";
			htmls+='<tr>';
			htmls+='<td><p>'+name+'</p><p><img src="/resources/img/common/ico4.png" width="61" height="16" /></p></td>';
			htmls+='<td>￥'+data.data.data[i].itemPrice+'</td>';
			htmls+='<td>'+data.data.data[i].itemAmount+'</td>';
			htmls+='<td>'+data.data.data[i].createDate+'</td>';
			htmls+='<td>'+data.data.data[i].itemName+'</td><tr>';
		}
		var input=$('<input type="hidden" name="orderStatus" value="0">');
		input.attr("value",data.status);
		self.append('<input type="hidden" id="rows" value="10">');
		//向表格添加数据
		review_table.append(htmls);
		self.append(review_table);
		self.append(input);
		//载入查询状态条件
		status.find("input[value='"+data.status+"']").attr("checked",true);
		$(review_table).pager(data.data , {
			searchMethod : 'createEvaluate',
			drawAfter : function(){
				$('.bottom').find($('td')).first().remove();
				$('.bottom').find($('div')).css({'text-align': 'center', 'float': ''});
			}
		});
	}
});*/