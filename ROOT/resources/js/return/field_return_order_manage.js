$('document').ready(function() {
	var state = window.location.href.split('#')[1];
	if (state == 'tab2') {
		getReturnData({returnState:'20',length:10},1);
		$('#member-list-gy li').eq(2).addClass('on').siblings().removeClass('on');
	}else {
		getReturnData({returnState:'',length:10},1);
	}
	 getOrderState()
});

function  getOrderState(){
	$("#member-list-gy ul li").on('click', function () {    //点击事件获得当前对应的退换货状态
		var index=$(this).index()
		switch (index){
			case 0: $("#returnState").val('');
				break
			case 1: $("#returnState").val('00');
				break
			case 2: $("#returnState").val('20');
				break
		}
		getReturnData({returnState:$("#returnState").val(),length:10},'gy')
	})
    $(".small-button").on('click', function () {          //绑定查找按钮点击事件
		var param={};
		param.startDate=$("#startDate").val();
		param.endDate=$("#endDate").val();
		param.returnState=$("#returnState").val();
		param.length=10;
		param.start=0;
		param.goodsName=$("#goodsName").val()
		getReturnData(param,'gy')
	})

}
var totalDataArr=[];
function getReturnData(obj,flag){
	flag=flag||'true'
	var url='/return/findReturnOrderListByPage.ajax?';
	$.ajax({
		type:'post',
		url:url,
		data:obj,
		success:function(data){
			var maxNum=data.recordsTotal;
			var data=data.data;
			if(flag=='gy'){                             //点击查找后的数据,主要目的是防止多次点击查找按钮后会一直增加相同的数据
				totalDataArr=data
			}
			else{                                      //只是切换选项卡的数据
				totalDataArr=totalDataArr.concat(data)
			}

			Handlebars.registerHelper({
			state:function(i,j) {
				if (i == '10' && j == '00') {
					return '退货中';
				} else if (i == '10' && j == '20') {
					return '退货完成';
				} else if (i == '20' && j == '00') {
					return '换货中';
				} else if (i == '20' && j == '20') {
					return '换货完成';
				}
			},
			returnPrice:function (i,j,x,y){
					if(x=='20'&&y=='00'||x=='20'&&y=='20'){
						return '¥0.00'
					}
				    else{

						return '¥'+(i*j).toFixed(2)
					}

			},debug: function (i) {
					console.log(i)
			},noData:function(data,opt){
					var dataL=data.length;
					if (dataL==0){
						return opt.fn(this)
					}
					else{
						return opt.inverse(this)
					}
			},orderMore:function(i){

					var htmlStr='<div class="orderMore" onclick="orderMore()">加载更多</div>'
					if(i.length==0){
						return
					}
					else if(i.length<maxNum){
						return new Handlebars.SafeString(htmlStr)
					}
					else{
						return new Handlebars.SafeString('<div class="noMore-gy">没有更多了</div>')
					}
			},totalPrice: function (i,j) {
					return (i*j).toFixed(2);
				}
			})
			console.log(totalDataArr)
			var template=Handlebars.compile($('#returnContentTemplate').html())
			var templateHtml=template(totalDataArr);
			$("#returnContent").html(templateHtml);
		}
	})

}
var startL=0;
function orderMore(){
	startL+=10;
	var state=$("#returnState").val();
	var param={};
	param.startDate=$("#startDate").val();
	param.endDate=$("#endDate").val();
	param.returnState=$("#returnState").val();
	param.returnState=state;
	param.length=10;
	param.start=startL;
	getReturnData(param)
}

