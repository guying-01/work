$(function(){
			searcBrowseHistory();
		});
		
		function searcBrowseHistory(){

			callService('/member/findBrowseHistory.ajax', '',{
				async : false,
				callSuccess:function(result){
					if(!result){
						return;
					}
					var goodsIds=[];
					var reultsList = new Array();
					var ids = new Array();
					for(var item in result){
						ids.push(result[item].goodsId);
					}
					var requestData={"ids":ids};
					var url ="/gd/findGoodsInfoByIds.ajax";
					// 想后台服务获取数据
					callService(url, requestData, {callSuccess:function(goodsList){

						var resultMap = {};
						for(var i=0;i<goodsList.length;i++){
							var goodsPicturePath = goodsList[i].sgItemPictureFormList[0].smallPicturePath;
//							var goodsInfo=goodsList[i].goodsBasicInfo;
							var goodsId = goodsList[i].id;
							var goodsName = goodsList[i].name;
							var marketMinPrice = goodsList[i].minMarketPrice;
							var saleMinPrice = goodsList[i].minSalesPrice;
							var goodsInfo = {};
							goodsInfo.goodsId=new Object();
							goodsInfo.goodsName=new Object();
							goodsInfo.marketMinPrice=new Object();
							goodsInfo.saleMinPrice=new Object();
							goodsInfo.goodsPicturePath=new Object();
							goodsInfo.goodsId = goodsId;
							goodsInfo.goodsName = goodsName;
							goodsInfo.marketMinPrice = marketMinPrice;
							goodsInfo.saleMinPrice = saleMinPrice;
							goodsInfo.goodsPicturePath = goodsPicturePath;
							var tempDate = result[i].createDate.split(" ")[0].split("-");
							//根据日期整理商品
							if(i!=0){
								var prev = i-1;
//								var prevGoods = goodsList[prev].goodsBasicInfo;
								var tempDate2 = result[prev].createDate.split(" ")[0].split("-");
								var prevGoodsDay = tempDate2[2];
								//若商品日期=上一个商品的日期，则放入同一个resultMap中
								if(tempDate[2]==prevGoodsDay){
									resultMap.data.push(goodsInfo);
								}else{
									reultsList.push(resultMap);
									resultMap = {};
									resultMap.dataStr=tempDate[0]+"."+tempDate[1];
									resultMap.data=new Array();
									resultMap.day =tempDate[2];
									resultMap.data.push(goodsInfo);
								}	
							}else{//第一个商品，直接放入resultMap中
								var tempDate = result[i].createDate.split(" ")[0].split("-");
								resultMap.dataStr=tempDate[0]+"."+tempDate[1];
								resultMap.data=new Array();
								resultMap.day =tempDate[2];
								resultMap.data.push(goodsInfo);
							}
						}

						//将最后一件商品放入reultsList中
						reultsList.push(resultMap);
						var countDay = reultsList.length;
						if(countDay>3){
							reultsList=reultsList.slice(0,3)
						}
						handlesbars("hbBrowseHistory", "browseHistory", reultsList);//模板加载完成后
//移动端部分开始


						f_img($(".goodspic"),$(".footprint ul li"),"0.6rem")
						var monthArr=reultsList[0].dataStr.split(".")
						var month=format(monthArr[1])
						var day=reultsList[0].day
						var num=reultsList.length
						var percent=1/num*100
						var screenWidth=$("body").width()
						var dataHeight=$(".footprintDate").height()
						var dataArr=[]
						//全部隐藏，默认显示最近一天内容
						$(".footprint ul li").hide()
						dataClick(month,day,0)

						$(".footprintDate").width(screenWidth/num)
						$(".footprintDate").each(function (i) {
						$(this).css({"top":"0","left":screenWidth/num*i})
							var text=$(this).children("strong").html()
							var month=$(this).children("p").html()
							var dataArr=month.split(".")
							if(dataArr[1].charAt(0)=="0"){
								dataArr[1]=dataArr[1].slice(1)
							}
							$(this).children("p").html(dataArr[1]+"月")
							$(this).children("strong").html(text+"日")
						})
						$(".footprintDate").on("click",function(){
							var month=$(this).children("p").html().slice(0,-1)
							var day=$(this).children("strong").html().slice(0,-1)
							var num=$(this).closest("ul").index()
							dataClick(month,day,num)

						})

						function dataClick(month,day,num){
							$(".footprint ul li").hide()
							$(".footprintDate").each(function () {
								$(this).children("strong").css("color","")
								$(this).children("p").css("color","")


							})
                             // 获得需要显示的元素对应下标
						    var dataLength=0
							for(var g=0;g<num;g++){
								dataLength=dataLength+reultsList[g].data.length
							}
							//max是每一天的最后一个，dataLength是每一天的第一个
							max=dataLength+reultsList[num].data.length
							for(var g=dataLength;g<max;g++){
								$(".footprint ul li").eq(g).show()
							}
							$(".footprintDate").eq(num).children("strong").css("color","#c91622")
							$(".footprintDate").eq(num).children("p").css("color","#c91622")
							$(".footprint ul li").eq(dataLength).css("marginTop",dataHeight)
							$(".footprint ul li").eq(max-1).css("borderBottom","1px solid #666")


						}
//移动端部分结束
						//向下滑动页面时，日期保持在左上显示

						//$('.footprint h3 u').css({'background':'url(/resources/img/common/ico01.png) no-repeat -266px -160px'})
                        //var footprintUL = countDay;
                        //$(window).scroll(function() {
					     //   for (i = 0; i <= footprintUL; i++) {
					     //       var ulHeightnPre = $('.footprint ul').eq(i - 1).offset().top;
						//		if(i==1){if (($(window).scrollTop()) >= (ulHeightnPre)) {
					     //           $('.footprintDate').eq(i-1).addClass('footprintDateFix')
						//			$('.footprintDate').eq(i-2).removeClass('footprintDateFix')
					     //       }else{
					     //           $('.footprintDate').eq(i-1).removeClass('footprintDateFix')
					     //       };}else{  if (($(document).scrollTop()) >= (ulHeightnPre-50)) {
					     //           $('.footprintDate').eq(i-1).addClass('footprintDateFix')
						//			$('.footprintDate').eq(i-2).removeClass('footprintDateFix')
					     //       } else {
					     //           $('.footprintDate').eq(i-1).removeClass('footprintDateFix')
					     //       };}
					     //
						//		if(footprintUL==1){
						//
						//			if (($(window).scrollTop()) >= 300) {
					     //           $('.footprintDate').addClass('footprintDateFix')
						//
					     //       } else {
					     //           $('.footprintDate').removeClass('footprintDateFix')
					     //       };
						//			}
                        //
					     //   }
                        //
                        //})
					
					}});
				
			
				}
			});

		}
		
		/**
		 * Handlebars通用方法
		 * 
		 * @param scriptId
		 * @param areaId
		 * @param data
		 */
		function handlesbars(scriptId,areaId,data){
			console.info(data);
			var html = $("#"+scriptId+"").html();
			var template = Handlebars.compile(html);    //预编译模板
			var strHtml=template(data);                 //匹配json内容
			$('#'+areaId+'').html(strHtml);             //输入模板
		}
			function f_img(pic,box,left) {
				//图片居中方法
				var sh=pic.height();
				var lh=box.outerHeight();
				var num=(lh-sh)/2;
				pic.css({"top":num,"left":left});
			}

			function format(num){
				if(num.charAt(0)=="0"){
					num=num.slice(1)
				}
				return num
			}
