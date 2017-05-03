<#include "/common/common_var_definds.ftl" />
<#macro render>
<script src="${resources}/js/lib/date/laydate.js"></script>
<script src="${resources}/js/common/img_operation.js"></script>

<script type="text/javascript"> 
	$(function() {
		searchScoreList(1,true);
	});
	var totalDataArr=[];
	//点击搜索按钮调用的查询方法
	function searchScoreList(currentPage,flag){
		var flag = flag;
		if(flag){
			
		}else{
			currentPage = 1;
		}
//		$("tr").remove(".newadd");
//		$("tr").remove(".loading");
//		$("#scoreData").append("<tr class='loading'><td colspan='5' style='text-align: center;'>数据加载中。。。</td></tr>");
		var param = {};
		param.goodsName = $("#goodsName").val();
		param.storeName = $("#storeName").val();
		param.startDate = $("#startDate").val();
		param.endDate = $("#endDate").val();
		param.start = (currentPage-1) * 10;
		param.length = 10;

		
		callService('${ctx}/score/findScoreList.ajax',param,{
			callSuccess:function(result){
				var maxNum=result.recordsTotal;
				if(currentPage * param.length >result.recordsTotal){
					$("#loadmore").text("没有更多啦~");
					$("#loadmore").css({
						'background':'#f5f5f5',
						'color':'#000'
					})
				}
				if(result.data.length>0){
				
					//比较上一个orderId是不是和当前的orderId相等
			         Handlebars.registerHelper("compare",function(orderId,opt){
						var index = opt.data.index;
						var dataSrc = opt.data.root;
						if(index == 0 || orderId != dataSrc[index-1].orderId){
				             return opt.fn(this);
						}
			         });
			         
					 //判断当前评价的履历类型是评价还是回复
			         Handlebars.registerHelper("isScore",function(scoreState,opt){
						if(scoreState == '00' || scoreState == '20'){
				            return opt.fn(this);
						}else{
							return opt.inverse(this);
						}
			         });
				
					 //判断当前评价是否是追平
			         Handlebars.registerHelper("isNotReScore",function(scoreState,opt){
						if(scoreState == '00'){
				            return opt.fn(this);
						}else{
							return opt.inverse(this);
						}
			         });
				
					 //判断当前评价是否需要追平
			         Handlebars.registerHelper("isNeedRescore",function(historyList,opt){
						for(var i = 0; i < historyList.length; i++){
							if(historyList[i].scoreState == '${getConstant('dictionary.SCORE_STATE_20')}'){
								return opt.inverse(this);
							}
						}
						return opt.fn(this);
			         });
					Handlebars.registerHelper('orderMore',function(i){
						console.log(i.length)
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
					})
                    Handlebars.registerHelper('debug',function(i){
                        console.log(i)

                    })
                    if(flag){
                        totalDataArr=totalDataArr.concat(result.data)
                    }else{
                        totalDataArr=result.data
                    }
					// handlebars模板
					var scoreListTmp = Handlebars.compile($('#scoreList-tl').html());
					// 装载数据
					var scoreListHtml = scoreListTmp(totalDataArr)
					// 插入基础html
                    $('#scoreData').html(scoreListHtml);
					$("#scoreData .goods-item").last().css({'padding-bottom':'0.2rem','border-bottom':'0.03rem solid #e7e7e7'})   //让最后一个元素有下边框


					
				}else{
					var str ='<div class="no_score_mes">'+ '暂无评价！'+'</div>'
					$('#scoreData').html(str);
				}
			}
	});
	}
	

	function hasSecondScore(scoreList){
		var result = false;
		for(var i = 0; i < scoreList.length; i++){
			if(scoreList[i].scoreState == '${getConstant('dictionary.SCORE_STATE_20')}'){
				result = true;
				break;
			}
		}
		return result;
	}
	
	function addScore(orderId){
		callService("/score/checkSecondScore.ajax", 
			{ orderId : orderId},
			{async:false,callSuccess:function(data) {
				if(data) {
					$.dm.jumpTo("/score/toSecondScore.jhtml",{orderId:orderId},{target:"_blank"})
				} else {
					jsErrAlert("您已经提交过二次评价！");
				}
			}
		});		
	}
	
	function bigimg(obj){
		var url = $(obj).parent().parent().children("img").attr("src");
		$(".bigimg_up").children().children().append("<img src='"+url+"' width='800' height='800'>")
		$(".bigimg_up").fadeIn();
	}
		
	//跳转到订单详情页面
	function toOrderDetail(orderId){
		var url = "${ctx}/order/toOrderDetail.jhtml";
		$.dm.jumpTo(url,{orderId:orderId},{target:"_blank"});
	}
	//加载更多
    var currentPage = 1;
    function  orderMore(){
		currentPage++
        searchScoreList(currentPage,true)
	}
</script>
</#macro>