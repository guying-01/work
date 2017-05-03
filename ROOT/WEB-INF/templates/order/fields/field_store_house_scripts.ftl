<#include "/common/common_var_definds.ftl" /> <#macro render>
<script type="text/javascript" src="${resources}/js/common/tab.js"></script>
<script type="text/javascript" src="${resources}/js/common/hideshow.js"></script>
<script type="text/javascript" src="${resources}/js/lib/date/laydate.js"></script>
<script type="text/javascript" src="${resources}/js/lib/date/date.js"></script>
<#--<script type="text/javascript"-->
        <#--src="${resources}/js/shopcart/bottomGoods.js"></script>-->
<script type="text/javascript"
	src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script type="text/javascript">
    var MEMBER_HEAD="member_head";
    var MEMBER_BRANCH="member_branch";
    var MEMBER_MASTER="member_master";
    var MEMBER_SERVANT="member_servant";
    var MEMBER_SEPARATE="member_separate";
	var MEMBER_DISTRIBUTION="member_distribution";
    var PREVILAGE = "previlage";
    var pageNum=1;
$(function(){
		searchOrder(1);	
		HbPayDefault();
    $(document).on('click','.orderNum',function(){
        var orderId=$(this).attr('order-id');
        addToShopCart(orderId)
    })
    $('.tab-item1').addClass('on')
	});
	
	   /** 点击"加入购物车" comment by sunbao 20161014 */
  function addToShopCart(totalOrderId,el) {
    
        // 设置购物车参数
        var requestParams = {
        
              totalOrderId:totalOrderId
           // storeId : storeId,// 店铺id
           // storeName : storeName,
           // goodsId : $("#data_goodsId").val(),// 商品id
           // itemId : selectItem.id,// 单品id
           // amount : $('#numbox').val(),// 数量
           // goodsName : $('[dm-info="goods-detail-name"]').attr('title'),
           // itemName : selectItem.name,
           // pic : $('#spec-list').find('img').attr('src')
        };
        var url = dm_ctx + '/sc/addScByStoreHouse.ajax';
        callService(url, requestParams, {
            callSuccess : function(data) {
                var goods_mes="";
                for(var key in data){
                    if(data[key].success){
                            goods_mes+="<div>"+"商品 "+"<a style='color: #ee0000'>" +key +"</a>"+"  加入购物车成功"+"</div>";
                    }
                    else{
                        goods_mes+="<div>"+"<a style='color: #ee0000'>" + data[key].message +"</a>" + "</div>";
                    }
                }
                jsAlert(goods_mes);
                            already_login();
                var $area = $(".detail_button");
                $.dm.block($area);
                if ($actor.attr('dm-actor') == 'dm-add2shpcart') {
                    // 动画
                    // playScAni(selectItem);
                    refreshTool();
                    $("#shopCarSucc").fadeIn();
                    $("#shopCarSucc").fadeOut(1000);
                    $.dm.unblock($area);
                }
            }
        });
    }

    //默认第一次进入订单列表页时所有订单
    function HbPayDefault(){
        var payUrl = "";
        if(${getConstant('constant.PAYMENT_TYPE')}=="0"){
            payUrl = "${ctx}/order/toPayFromOrder.jhtml";
        }else if(${getConstant('constant.PAYMENT_TYPE')}=="1"){
            payUrl = "${ctx}/order/toPayFromOrderB2C.jhtml";
        }
        var str="";
        str = str +'<form action='+payUrl+' id="toPayForm" name="toPayForm" method="post">';
        str = str+'<input type="hidden" id="orderIds" name="orderIds" value="" />';
        str = str+'<input type="hidden" id="money" name="money" value="" />';
        str = str+$("#allselect").html(str);
    };;



    //按条件查询订单
    var totalDataArr=[]
    function searchOrder(page) {
        var returnOrderState;
        var returnType;
        var orderState = $("#orderState").val();
        $("#currentPage").val(page);
        $("#noData").hide();
        $("#allselect").hide();
        $("tr").remove(".newadd");
        $("tr").remove(".loading");
        $("#orderData").after("<tr class='loading'><td colspan='8' style='color: #333333; font-size: 1.2em;'>处理中...</td></tr>");
        callService("${ctx}/order/findOrderList.ajax",
                { "startDate": '',
                    "endDate": '',
                    "orderState": '',
                    "goodsName": '',
                    "length": 10,
                    "pageNumber": page,
                    "promotionNotShow": true
                },
                {"async" : false,callSuccess:function(datas) {
                    var data = datas['paginationMapResponse'].data;
                    totalDataArr=totalDataArr.concat(data)
                    recordsTotal = datas.paginationMapResponse.recordsTotal;
	        	    maxPageNum = Math.ceil(recordsTotal/10);
                    if(page==1){
                        if(data.length==0){
                            $(".orderMore").hide();
                            $("#noData").show();
                        }
                        else{
                            $(".orderMore").show();
                            $("#noData").hide();
                            if(data.length<10){
                                $(".orderMore").text("没有更多了").addClass("nomore").attr("onclick","");
                            }
                            else{
                                $(".orderMore").text("加载更多").removeClass("nomore").attr("onclick","orderMore()");
                            }
                        }
                    }     //这里是初始化进入
                    else{
                        if(page < maxPageNum){
                            $(".orderMore").text("加载更多").removeClass("nomore").attr("onclick","orderMore()");
                        }
                        else{
                            $(".orderMore").text("没有更多了").addClass("nomore").attr("onclick","");
                        }
                    }      //这里是加载更多进入

                    /*$('#dt').find($('tr')).not($('#orderData')).remove();*/
                    $("#dt_box").html("");/*由于结构变化，更改订单容器为 $("#dt_box")*/
					if(datas != "") {
                        var str = "";
                        var orderMemberType = datas['memberType'];
                        /*新增转回数据格式 2016-10-11 by kuban*/
                        function count(o){
                            var t = typeof o;
                            if(t == 'string'){
                                return o.length;
                            }else if(t == 'object'){
                                var n = 0;
                                for(var i in o){
                                    n++;
                                }
                                return n;
                            }
                            return false;
                        }
                        /*用于计算对象的个数*/
                        function return_data(opt) {
                            var newdata={};
                            var group_data=opt.data._parent.root;
                            var group_data_len=count(group_data);
                            var num=0;
                            for(var j=0;j<group_data_len;j++){
                                var len=count(group_data[j]);
                                for(var k=0;k<len;k++){
                                    var obj_a={};
                                    var now_data=group_data[j];
                                    obj_a[num]=now_data[k];
                                    newdata=jQuery.extend(newdata,obj_a);
                                    num++;
                                }
                            }
							return newdata;

                        }
                        /*转回数据格式结束*/
                        if(data.length > 0) {
							for(var i = 0; i < data.length; i++){
								var order = data[i];
								//getStoreNameByStoreId(order.storeId,);
								/*var group_data=group_fn;*/
								var detailList = order.orderDetailVoList;
								for(var j = 0; j < detailList.length; j++) {
								/*$(".caigoudan").eq(j).html("采购单号："+order.totalOrderId);*/
									var orderDetail = detailList[j];
									orderDetail.rowSpan = detailList.length;
									if(orderDetail.itemPrice != null){
										orderDetail.itemPrice = orderDetail.itemPrice.toFixed(2);
									}
									if(j == 0){
										orderDetail.hasSpan = '1';
									}else{
										orderDetail.hasSpan = null;
									}
									
									//组合商品
									if(order.combinationItemIdList!=null){
										
										
										for(var k=0;k<order.combinationItemIdList.length;k++){
											var combinationItemId = order.combinationItemIdList[k];
											for(var z=0;z<combinationItemId.length;z++){
												if(orderDetail.shopcartGroupId==combinationItemId[z].shopcartGroupId){
														orderDetail.isCombination="1";
														if(orderDetail.itemId==combinationItemId[z].masterItemId){
															orderDetail.size = combinationItemId.length;
														}
												}
											}
											
										}
									}
                                    var goodsName=orderDetail.goodsName;
                                    var itemName=orderDetail.itemName;
                                    var lgoodName=goodsName.length;
                                    var litem=itemName.length;
                                    itemName=itemName.substring(parseInt(lgoodName),parseInt(litem));
                                    orderDetail.itemName=itemName;
                                    }
							}
							// '售后'字段的处理
							Handlebars.registerHelper('saleAfter', function(detailIndex, opt){
								
								/*var order = opt.data._parent.root[opt.data._parent.index];*/
                                var order_data=return_data(opt);
                                var order = order_data[opt.data._parent.index];
								var htmlStr = '';
								var returnOrderState = order.returnOrderFormList[detailIndex].stateId ;
								var returnType = order.returnOrderFormList[detailIndex].returnType;
								var orderDetail = order.orderDetailVoList[detailIndex];
								var canRefund = order.canRefund;
								if(order.orderState != ${getConstant('dictionary.ORDER_STATES_INPAY')}){
									if(returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_00')}){
										htmlStr = '<span>' + datas['dictionaryReturnStateMap'][returnOrderState].name+'</span>';
									}else if(returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_10')}){
										htmlStr = '<span>' + datas['returnGoodsState'][returnOrderState].name+'</span>';
									}
									// 售中判断是否显示退款/退货按钮
									if(isShowReturnButtonByOrderState(order,orderDetail)) {
									    // 通过退款/货单状态来判断是否显示、显示申请或修改按钮
										var checkResult = isShowReturnByReturnOrder(order.returnOrderFormList[detailIndex],order.orderDetailVoList[detailIndex],order.orderState,order.shippingMoney,canRefund);
										if(order.returnOrderFormList[detailIndex].isReturnAmount==0){
										if(checkResult != null){
											if(checkResult == 0){
												htmlStr += '<br/><a href="javascript:applyRefund(\''+order.id+'\',\''+order.orderDetailVoList[detailIndex].id+'\',0)" class=" font-color-c">申请退款/退货</a>';
											}else{
												htmlStr += '<br/><a href="javascript:applyRefund(\''+order.id+'\',\''+order.orderDetailVoList[detailIndex].id+'\',1)" class=" font-color-c">修改退款/退货</a>';
											}
										}
										}
										// 查看退款/退货详情按钮
										if(order.returnOrderFormList[detailIndex].id != null){
											if(returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_00')}){
												<!--退款状态-->
												htmlStr += '<br/><a href="javascript:toReturnOrderDetail(\''+order.returnOrderFormList[detailIndex].id+'\')" class=" font-color-c">查看退款详情</a>';
											}else if(returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_10')}){
												<!--退货状态-->
												htmlStr += '<br/><a href="javascript:toReturnOrderDetail(\''+order.returnOrderFormList[detailIndex].id+'\')" class=" font-color-c">查看退货详情</a>';
											}
										}
										//售后判断是否显示退款/退货按钮
									}else if(isShowSaleAfterButton(order,orderDetail)){
									   // 通过退款/货单状态来判断是否显示、显示申请或修改按钮
										var checkResult = isShowReturnByReturnOrder(order.returnOrderFormList[detailIndex],order.orderDetailVoList[detailIndex],order.orderState,order.shippingMoney,canRefund);
										if(order.returnOrderFormList[detailIndex].isReturnAmount==0){
										if(checkResult != null){
											if(checkResult == 0){
												htmlStr += '<br/><a href="javascript:applyRefund(\''+order.id+'\',\''+order.orderDetailVoList[detailIndex].id+'\',0)" class=" font-color-c">申请售后</a>';
											}else{
												htmlStr += '<br/><a href="javascript:applyRefund(\''+order.id+'\',\''+order.orderDetailVoList[detailIndex].id+'\',1)" class=" font-color-c">修改售后</a>';
											}
										}
										}
										// 查看退款/退货详情按钮
										if(order.returnOrderFormList[detailIndex].id != null){
											if(returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_00')}){
												<!--退款状态-->
												htmlStr += '<br/><a href="javascript:toReturnOrderDetail(\''+order.returnOrderFormList[detailIndex].id+'\')" class=" font-color-c">查看退款详情</a>';
											}else if(returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_10')}){
												<!--退货状态-->
												htmlStr += '<br/><a href="javascript:toReturnOrderDetail(\''+order.returnOrderFormList[detailIndex].id+'\')" class=" font-color-c">查看退货详情</a>';
											}
										}
									}
								}
								return new Handlebars.SafeString(htmlStr);
							});

							// '订单实付'字段的处理
							Handlebars.registerHelper('orderPay', function(totalOrderId,opt){

								/*var order = opt.data._parent.root[opt.data._parent.index];*/
								/*分组后订单选择重新处理开始  2016-10-11  by kuban*/
								var order_data=return_data(opt);
								var gp_dt={};
								var gp_num=0;
                                for(var i=0;i<count(order_data);i++){
                                    if(order_data[i].totalOrderId==totalOrderId){
                                        var A={};
                                        A[gp_num]=order_data[i];
                                        gp_dt=jQuery.extend(gp_dt,A);
                                        gp_num++;
                                    }
                                }
                                var order = gp_dt[opt.data._parent.index];
                                /*分组后订单选择重新处理结束*/
								// 订单价格
								var payMoney = (order.payMoney).toFixed(2);
								// 活动
								//var promotionStr = '';
								// 优惠券
							  // var soCouponTrackStr = '';
							    //积分
							  //  var soPointsTrackStr = '';
							    // 优惠券明细
							   // var soCouponTrack = order.soCouponTrackList;
							    // 积分明细
							   // var soPointsTrack = order.soPointsTrack;
							    //活动明细
							   // var soPromotionTrackList = order.soPromotionTrackVoList;
							   // var activitySale = order.activitySale;
							   // if(activitySale!=0){
							   // 	promotionStr ="<p>活动: -"+activitySale.toFixed(2)+"</p>";
							   // }
							   // var activityCouponType = datas['activityCouponTypeMap'];
							   // if(soCouponTrack.length > 0) {
								//	for(var q = 0; q < soCouponTrack.length; q++) {
								//		soCouponTrackStr +="<p>"+activityCouponType[soCouponTrack[q].couponSender].name+": -"+(soCouponTrack[q].discountAmount).toFixed(2)+"</p>";
								//	}
								//}
								//if(soPointsTrack!=null){
								//	soPointsTrackStr ="<p>积分: -"+(soPointsTrack.discountAmount).toFixed(2)+"</p>";
								//}
								var html = '<p>' + payMoney + '</p>';
								//html += promotionStr+soCouponTrackStr+soPointsTrackStr;
								var flag = 0;
								//if(soPromotionTrackList.length > 0) {
									//for(var k = 0; k < soPromotionTrackList.length; k++) {
										//if(soPromotionTrackList[k].ruleType=='5'){
											//flag = 1;
										//}
									//}
								//}
								
								//if(flag==1){
								//	html += '<p>（免运费）</p>'
								//}else{
									//if(order.shippingMoney == 0){
							    		//html += '<p>（免运费）</p>'
									//} else {					
										//html += "（含运费：" + order.shippingMoney.toFixed(2)+"）";
									//}
								//}
								
								return new Handlebars.SafeString(html);
							});
							
							// '订单状态'字段的处理
							Handlebars.registerHelper('orderState', function(totalOrderId,opt){
								/*var order = opt.data._parent.root[opt.data._parent.index];*/
                                /*var order_data=return_data(opt);
                                var order = order_data[opt.data._parent.index];*/
                                /*分组后订单选择重新处理开始  2016-10-11  by kuban*/
                                var order_data=return_data(opt);
                                var gp_dt={};
                                var gp_num=0;
                                for(var i=0;i<count(order_data);i++){
                                    if(order_data[i].totalOrderId==totalOrderId){
                                        var A={};
                                        A[gp_num]=order_data[i];
                                        gp_dt=jQuery.extend(gp_dt,A);
                                        gp_num++;
                                    }
                                }
                                var order = gp_dt[opt.data._parent.index];
                                /*分组后订单选择重新处理结束*/
								var htmlStr = datas['dictionaryMap'][order.orderState].name;
								htmlStr += '<br><a class="font-color-c" href="javascript:toOrderDetail(\''+ order.id +'\')">查看订单详情</a>';
								return new Handlebars.SafeString(htmlStr);
							});
							// '操作'字段的处理
							Handlebars.registerHelper('orderDone', function(totalOrderId,opt){
								/*var index = opt.data._parent.index;
								var order = opt.data._parent.root[index];*/
                                /*var order_data=return_data(opt);
                                var order = order_data[opt.data._parent.index];*/
                                /*分组后订单选择重新处理开始  2016-10-11  by kuban*/
                                var order_data=return_data(opt);
                                var gp_dt={};
                                var gp_num=0;
                                for(var i=0;i<count(order_data);i++){
                                    if(order_data[i].totalOrderId==totalOrderId){
                                        var A={};
                                        A[gp_num]=order_data[i];
                                        gp_dt=jQuery.extend(gp_dt,A);
                                        gp_num++;
                                    }
                                }
                                var order = gp_dt[opt.data._parent.index];
                                /*分组后订单选择重新处理结束*/
								var firstSendTime = order.firstSendTime;
								var htmlStr = '';
								switch(order.orderState){
									// 未支付 （待付款）
									case '${getConstant('dictionary.ORDER_STATES_INPAY')}':
										/*htmlStr = '<a class="font-color-c" style="cursor: pointer;" onclick="orderPayment(\''+ order.id +'\',\''+ order.payMoney +'\')">立即付款</a>';*/
										htmlStr += '<br><a href="javascript:void()" onclick="toCancelOrder(\''+ order.id +'\')" class="font-color-c">取消订单</a>';
										break;
									// 已发货 （待确认）
									/*case '${getConstant('dictionary.ORDER_STATES_SHIPPED')}':
										htmlStr += '<a class="font-color-c" href="javascript:toConfirmReceive(\''+ order.id +'\')">确认收货</a>';
										htmlStr += '<br><a class="font-color-c" href="javascript:toShippingMessage(\''+ order.id +'\');">查看物流</a>';
										htmlStr += '<br><a href="javascript:void(0);" onclick="extendReceive(\''+ order.id +'\')" class="font-color-c">延长收货时间</a></td></tr>';
										break;*/
									// 已收货 （待评价）
									case '${getConstant('dictionary.ORDER_STATES_RECEIPTED')}':
										htmlStr = '<a href="javascript:toScore(\''+ order.id +'\');" class="font-color-c">评价交易</a>';
										break;
									// 交易完成 （已评价）
									case '${getConstant('dictionary.ORDER_STATES_COMPLETE')}':
										if(!order.hasSecondScored){
											htmlStr = "<a href='javascript:checkSecondScore(\""+order.id+"\")' class='font-color-c'>追加评价</a>";}
										break;
									case '${getConstant('dictionary.ORDER_STATUS_IN_CHECK')}':
										serviceStatus = order.serviceStatus;
										if(serviceStatus == ${getConstant('dictionary.ORDER.SERVICE_STATUS.FIRST_SEND')}){
                                            htmlStr = "<a href='javascript:toSendBack(\""+order.id+"\")' class='font-color-c'>回寄</a>"
										}
										/*else if(serviceStatus == ${getConstant('dictionary.ORDER.SERVICE_STATUS.CLOSE')}){
											if(firstSendTime){
                                                htmlStr += '<a class="font-color-c" href="javascript:toConfirmReceive(\'' + order.id + '\')">确认收货</a>';
                                                htmlStr += '<br><a class="font-color-c" href="javascript:toShippingMessage(\'' + order.id + '\');">查看物流</a>';
                                                htmlStr += '<br><a href="javascript:void(0);" onclick="extendReceive(\'' + order.id + '\')" class="font-color-c">延长收货时间</a></td></tr>';
											}
										}*/
										break;
									case '${getConstant('dictionary.ORDER_STATUS_SEND_CHECK_REPORT')}' :
                                        serviceStatus = order.serviceStatus;
                                        if(serviceStatus == ${getConstant('dictionary.ORDER.SERVICE_STATUS.SECOND_SEND')}) {
                                            htmlStr += '<a class="font-color-c" href="javascript:toConfirmReceive(\'' + order.id + '\')">确认收货</a>';
                                            htmlStr += '<br><a class="font-color-c" href="javascript:toShippingMessage(\'' + order.id + '\');">查看物流</a>';
                                            htmlStr += '<br><a href="javascript:void(0);" onclick="extendReceive(\'' + order.id + '\')" class="font-color-c">延长收货时间</a></td></tr>';
                                        }
                                        break;
                                     case '${getConstant('dictionary.ORDER_STATES_PAYED ')}':
										/*htmlStr = '<a class="font-color-c" style="cursor: pointer;" onclick="remindShipping(\''+ order.id +'\')">提醒发货</a>';*/
										htmlStr = '<span class="table_bgA" >待验收</span>';
										break;
								}
								return new Handlebars.SafeString(htmlStr);
							});
                            /*'订单总数'字段的处理  2016-10-11 by kuban*/
                            Handlebars.registerHelper('total_order_num', function(totalOrderId,opt){
                                var order_data=return_data(opt);
                                var group_id=totalOrderId;
                                var order_num=0;
                                for(var i=0;i<count(order_data);i++){
                                    if(order_data[i].totalOrderId==group_id){
                                        order_num++;
                                    }
                                }
                                return order_num;
                            });
                            /*'商品总数'字段的处理*/
                            Handlebars.registerHelper('total_goods_num', function(totalOrderId,opt){
                                var order_data=return_data(opt);
                                var group_id=totalOrderId;
                                var goods_num=0;
                                for(var i=0;i<count(order_data);i++){
                                    if(order_data[i].totalOrderId==group_id){
                                        goods_num+=count(order_data[i].orderDetailVoList);
                                    }
                                }
                                return goods_num;
                            });
                            /*'总计'字段的处理*/
                            Handlebars.registerHelper('total_price_num', function(totalOrderId,opt){
                                var order_data=return_data(opt);
                                var group_id=totalOrderId;
                                var group_price=0;
                                for(var i=0;i<count(order_data);i++){
                                    if(order_data[i].totalOrderId==group_id){
                                        group_price+=order_data[i].goodsMoney;
                                    }
                                }
                                return group_price.toFixed(2);
                            });
							/*'放入购物车'按钮处理*/
                            Handlebars.registerHelper('shopcar_now', function(totalOrderId,opt){
                                var order_data=return_data(opt);
                                var group_id=totalOrderId;
                                var shopcar_bt="";
                                var group_price=0;
                                var lastTotalOrderId='';
                                for(var i=0;i<count(order_data);i++){
                                    if(order_data[i].totalOrderId==group_id){
                                        if(lastTotalOrderId === group_id){
                                            continue;
                                        }else{
                                            lastTotalOrderId = group_id;
                                        }
                                        /*if(order_data[i].orderState=="00"){
                                             group_price+=order_data[i].goodsMoney
                                        	shopcar_bt="<a href='javascript:void(0)'"+" onclick='orderPayment("+group_id+" ,"+group_price+")' class='big-button cx1'>立即支付</a>"
										}*/
                                        var odMemberType='';
                                        if(order_data[i].odMemberType ===MEMBER_HEAD){
                                            odMemberType = "分采集付主账号";
                                        }else if(order_data[i].odMemberType ===MEMBER_BRANCH){
                                            odMemberType = "分采集付子账号";
                                        }else if(order_data[i].odMemberType ===MEMBER_MASTER){
                                            odMemberType = "集采分送主账号";
                                        }else if(order_data[i].odMemberType ===MEMBER_SERVANT){
                                            odMemberType = "集采分送子账号";
                                        }else if(order_data[i].odMemberType ===MEMBER_SEPARATE){
                                            odMemberType = "分采分付主账号";
                                        }else if(order_data[i].odMemberType ===MEMBER_DISTRIBUTION){
                                            odMemberType = "分采分付子账号";
                                        }
                                         if(orderMemberType== MEMBER_MASTER){
                                            shopcar_bt += '<span class="od_storeName od_info">采购商店名：'+order_data[i].odBuyerName+'</span>&nbsp;&nbsp;<span class="od_passportNo od_info">采购商身份码：'+order_data[i].odPassportNo+'</span>&nbsp;&nbsp;<span class="od_memberType od_info">采购商账号类别：'+odMemberType+'</span>';
										}
										if(orderMemberType!= MEMBER_SERVANT || orderMemberType!= MEMBER_SEPARATE){
                                            if(order_data[i].orderDetailVoList[0].tradeAttr1){

                                            }else{
                                                shopcar_bt+="<a href='javascript:void(0)'"+" onclick='addToShopCart("+group_id+",$(this))' class='big-button cx1' dm-actor='dm-add2shpcart'>加入购物车</a>"
											}

										}
                                    }
                                }
                                return new Handlebars.SafeString(shopcar_bt);
                            });
							/*新增订单组数据处理  开始  2016-10-10 by kuban*/
							var group_fn=(function(data) {
								var all_data=data;
								var group_data={};
								var totalOrderId=[];
								var data_len=all_data.length;
								for(var i=0;i<data_len;i++){
									totalOrderId[i]=all_data[i].totalOrderId;
								}
                                var outputArray = [];
                                for (var i = 0; i < data_len; i++)
                                {
                                    if ((jQuery.inArray(totalOrderId[i], outputArray)) == -1)
                                    {
                                        outputArray.push(totalOrderId[i]);
                                    }
                                }
								var group_len=outputArray.length;
								var num;
								for(var j=0;j<group_len;j++){
									var n=0;
									var group_data_output={};
                                    group_data_output.group={};
									for(var k=0;k<data_len;k++){
                                    	if(all_data[k].totalOrderId==outputArray[j]){
											num=k;
											var g_obj=n;
											var a={};
                                            a[g_obj]=all_data[num];
                                            group_data_output.group=jQuery.extend(group_data_output.group,a);
                                            n++;
										}
									}
									var group=j;
									var A={};
									A[group]=group_data_output.group;
                                    group_data=jQuery.extend(group_data,A);

                                }
                                return group_data;
                            })(totalDataArr);
                            /*新增订单组数据处理  结束*/
							// handlebars模板
							var orderListTmp = Handlebars.compile($('#orderList-tl').html());
							// 装载数据
							/*var orderListHtml = orderListTmp(data);*/
                            var orderListHtml = orderListTmp(group_fn);
							// 插入基础html
							$("#dt_box").html(orderListHtml);
                            /*if(orderListHtml){
                                $(".orderMore").show();
                            }*/
							$("#currentPage").val(data[0].pageNumber);
							$("tr").remove(".loading");
							$("#allselect").show();
							$('#dt_box').pager(datas.paginationMapResponse , {
								searchMethod : 'searchOrder',
								drawAfter : function(){
									$('.paging_full_numbers').parent().css('width', '600px');
									$('.dataTables_info').css('margin-left', '15px');
                                    $('.dataTables_info').css('margin-top', '-10px');
                                    $('.dataTables_length').css('margin-top','-8px');
								}
							});
						} else {
							$("#currentPage").val(1);
							$("tr").remove(".newadd");
							$("tr").remove(".loading");
							$("#allselect").hide();
//							$("#noData").show();
							$('#noData').pager(datas.paginationMapResponse , {
								searchMethod : 'searchOrder',
								drawAfter : function(){
									$('.paging_full_numbers').parent().css('width', '600px');
									$('.dataTables_info').css('margin-left', '15px');
                                    $('.dataTables_info').css('margin-top', '-10px');
									$('.dataTables_length').css('margin-top','-8px');
								}
							});		
						}
					}
				}}
		);
	}
	
	// 通过订单状态判断是否显示申请退款或退货按钮
	function isShowReturnButtonByOrderState(order,orderDetail){
		var result = false;
		var orderFlow = order.orderFlow;
		//如果是普通流程订单
		if(orderFlow == ${getConstant('dictionary.ORDER.ORDER_FLOW.NORMAL_FLOW')}){
			// 已支付，已发货  ，交易关闭，纠纷中状态下
			if(order.orderState == ${getConstant('dictionary.ORDER_STATES_PAYED')}
				|| order.orderState == ${getConstant('dictionary.ORDER_STATES_SHIPPED')}
				|| order.orderState == ${getConstant('dictionary.ORDER_STATES_IN_THE_DISPUTE')}) {
				result = true;
			}
		//如果是 基因检测订单
		}else if(orderFlow == ${getConstant('dictionary.ORDER.ORDER_FLOW.GENE_CHECK')}){
			//获取商品的分类
			var goodsClassify = orderDetail.goodsClassify;
			//如果是普通商品
			if(goodsClassify == ${getConstant('dictionary.GOODS.GOODS_CLASSIFY.NORMAL')}){
				//检测服务进行中 报告已发出 纠纷中状态下和卖家以发货 可以退款
				if(order.orderState == ${getConstant('dictionary.ORDER_STATUS_IN_CHECK')}
					|| order.orderState == ${getConstant('dictionary.ORDER_STATUS_SEND_CHECK_REPORT')}
					|| order.orderState == ${getConstant('dictionary.ORDER_STATES_IN_THE_DISPUTE')}
					|| order.orderState == ${getConstant('dictionary.ORDER_STATES_SHIPPED')}){
					result = true;
				} 
			}else if(goodsClassify == ${getConstant('dictionary.GOODS.GOODS_CLASSIFY.GENE')}){
                //检测服务进行中 报告已发出 纠纷中状态下 可以退款
                if(order.orderState == ${getConstant('dictionary.ORDER_STATUS_IN_CHECK')}
                        || order.orderState == ${getConstant('dictionary.ORDER_STATUS_SEND_CHECK_REPORT')}
                        || order.orderState == ${getConstant('dictionary.ORDER_STATES_IN_THE_DISPUTE')}){
                    result = true;
                }
            }
		}
		return result;
	}
	// 通过订单状态判断是否显示申请退款或退货按钮
	function isShowSaleAfterButton(order,orderDetail) {
        var result = false;
        //获取订单流程
        var orderFlow = order.orderFlow;
        //获取商品分类
        var　goodsClassify = orderDetail.goodsClassify;
		//如果是正常流程
		if(orderFlow == ${getConstant('dictionary.ORDER.ORDER_FLOW.NORMAL_FLOW')}
			||goodsClassify == ${getConstant('dictionary.GOODS.GOODS_CLASSIFY.NORMAL')}) {
			//如果订单状态为已收货或已完成
            if (order.orderState == ${getConstant('dictionary.ORDER_STATES_RECEIPTED')}||
                    order.orderState == ${getConstant('dictionary.ORDER_STATES_COMPLETE')}) {
                // 是否超过15天来判断是否显示申请退款或退货按钮
                var requestUrl = "${ctx}/order/isShowReturn.ajax";
                callService(
                        requestUrl,
                        {"orderId": order.id, "orderState": order.orderState},
                        {
                            async: false,
                            callSuccess: function (isShow) {
                                result = isShow;
                            }
                        }
                );
            }
        }
		return result;
	}
	// 通过退款/货单状态来判断是否显示、显示增加或修改按钮，null:不显示，0:增加，1:修改
	function isShowReturnByReturnOrder(returnOrder,orderDetail,orderState,shippingMoney,canRefund){
		var result = null;
		var returnOrderState = returnOrder.stateId;
        var goodsClassify = orderDetail.goodsClassify;
        //订单状态是交易关闭时或退款金额=单品金额×数量时，不应显示链接！
        if(orderState != ${getConstant('dictionary.ORDER_STATES_CLOSED')} ) {
            if(returnOrder.id == null){
                result = 0;
            }else{
                if(returnOrder.returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_00')}){
                    if (returnOrderState == ${getConstant('dictionary.RETURN_MONEY_STATE_40')} ){
                        var returnMoney = parseInt(returnOrder.returnMoney);
                        var itemPriceTotal = parseInt(orderDetail.itemPrice * orderDetail.itemAmount+shippingMoney);
                        if(returnMoney < itemPriceTotal){
                            result = 0;
                        }
                    }else if(returnOrderState == ${getConstant('dictionary.RETURN_MONEY_STATE_50')}){
                        result = 0;
                    }
                }
                if(returnOrder.returnType == ${getConstant('dictionary.RETURN_ORDER_TYPE_10')} ){
                    if (returnOrderState == ${getConstant('dictionary.RETURN_GOODS_STATE_60')}) {
                        var returnMoney = parseInt(returnOrder.returnMoney);
                        var itemPriceTotal = parseInt(orderDetail.itemPrice * orderDetail.itemAmount+shippingMoney);
                        if(returnMoney < itemPriceTotal){
                            result = 0;
                        }
                    }else if(returnOrderState == ${getConstant('dictionary.RETURN_GOODS_STATE_70')}){
                        result = 0;
                    }
                }
                // 状态为等待卖家处理或卖家拒绝退货/款时可以进行
                if(returnOrderState == ${getConstant('dictionary.RETURN_MONEY_STATE_00')}
                        || returnOrderState == ${getConstant('dictionary.RETURN_MONEY_STATE_10')}){
                    result = 1;
                }else if(returnOrderState == ${getConstant('dictionary.RETURN_GOODS_STATE_00')}
                        || returnOrderState == ${getConstant('dictionary.RETURN_GOODS_STATE_10')}){
                    result = 1;
                }
            }
        }
        if(goodsClassify == ${getConstant('dictionary.GOODS.GOODS_CLASSIFY.GENE')}
                &&canRefund == ${getConstant('dictionary.ORDER.CAN_REFUND.NO')}){
            result = null;
        }
        return result;
    }

    //取消订单
    function toCancelOrder(orderId) {
        jsConfirm("确定要取消订单吗?",{callback:function(result){
            if(result){
                var requestUrl = "${ctx}/order/doCancelOrder.ajax";
                callService(
                        requestUrl,
                        { "id": orderId},
                        {
                            callSuccess:function(data){
                                if(data == true) {
                                    searchOrder(pageNum);
                                }
                            }
                        }
                );
            }
        }});
    }

    //订单合并支付
    function megerPayment(str,payType) {
        var orderIds = "";
        //将传入的数字转换成字符串
        str = str + "";
        if(str != "") {
            orderIds = $("#orderId" + str).val();
        }
        var checkedObj = $("input[name='checkboxGroup']:checked");
        if(checkedObj.length > 0) {
            checkedObj.each(function(){
                orderIds += this.value + ",";
            });
            orderIds = orderIds.substring(0, orderIds.length - 1);
        }
        if(payType == 0){
            if(orderIds != "") {
                var order = orderIds.split(',');
                if(order.length == 1){
                    jsErrAlert("请至少选择二个以上的订单进行支付");
                    return;
                }
                if(!checkOnSale(orderIds)){
                    jsErrAlert("您购买的商品已经下架");
                    return false;
                }
                $("#orderIds").val(orderIds);
                $("#toPayForm").submit();
            } else {
                jsErrAlert("请至少选择二个以上的订单进行支付");
            }
        }else{
            if(!checkOnSale(orderIds)){
                jsErrAlert("您购买的商品已经下架");
                return false;
            }
            $("#orderIds").val(orderIds);
            $("#toPayForm").submit();
        }
    }

    //单笔订单支付
    function orderPayment(orderId,money){
        if(!checkOnSale(orderId)){
            jsErrAlert("您购买的商品已经下架");
            return false;
        }
        $("#orderIds").val(orderId);
        $("#money").val(money);
        $("#toPayForm").submit();
    }

    //校验订单中的商品是否在售
    function checkOnSale(orderIds){
        var result = false;
        var requestUrl = "${ctx}/order/checkOnSale.ajax";
        callService(
                requestUrl,
                { orderIds : orderIds},
                {
                    async : false,
                    callSuccess:function(data){
                        result = data;
                    }
                }
        );
        return result;
    }

    //初始化确认延长收货时间
    function extendReceive(orderId){
        var requestUrl = "${ctx}/order/checkExtendReceive.ajax";
        callService(
                requestUrl,
                { orderId : orderId},
                {
                    callSuccess:function(data){
                        if(data){
                            $(".cx4").fadeIn();
                            $("#strid").val(orderId);
                        }
                    }
                }
        );
    }
    //确认延长收货时间
    function saveExtendReceive(){
        jsConfirm("确定延长收货时间吗?",{callback:function(result){
            if(result){
                $.dm.block($(".pop_up_button"));
                var orderId = $("#strid").val();
                var code = $('#sel').val();
                var requestUrl = "${ctx}/order/saveExtendReceive.ajax";
                callService(
                        requestUrl,
                        {
                            orderId : orderId,
                            code : code
                        },
                        {
                            callSuccess:function(data){
                                if(data) {
                                    jsAlert("延长收货时间成功！");
                                    $.dm.unblock($(".pop_up_button"));
                                    clo();
                                    searchOrder($("#currentPage").val());
                                } else {
                                    jsErrAlert("延长收货时间失败！");
                                    $.dm.unblock($(".pop_up_button"));
                                }
                            }
                        });
            }
        }});
    }

    function clo(){
        $(".cx4").fadeOut();
    }

    //订单全选
    function allSeclect(obj) {
        if(obj.checked == true) {
            $(":checkbox").each(function(){
                if(this.disabled != true) {
                    this.checked = true;
                }
            });
        } else {
            $(":checkbox").each(function(){
                this.checked = false;
            });
        }
    }

    //订单单选
    function childrenSeclect(chk) {
        if($(chk).is(':checked')){
            var chkCount = $("input[name='checkboxGroup']").length;
            var chkedCount = $("input[name='checkboxGroup']").filter(":checked").length;
            $("#parentCheckbox").prop("checked",chkCount==chkedCount);
        }else{
            $("#parentCheckbox").prop('checked',"");
        }
    }

    function checkSecondScore(orderId){
        callService("${ctx}/score/checkSecondScore.ajax",
                { orderId : orderId},
                {callSuccess:function(data) {
                    if(data) {
                        $.dm.jumpTo("${ctx}/score/toSecondScore.jhtml",{orderId:orderId},{target:"_blank"})
                    } else {
                        jsErrAlert("您已经提交过二次评价！");
                    }
                }
                });
    }

    //通过订单订单详情id查询此商品是否已申请退款(已关闭、已完成除外)，已申请过则修改，未申请则新增
    function applyRefund(orderId,orderDetailId,type,shopcartGroupId){
        var url = "${ctx}/return/findApplyRefund.ajax";
        callService(
                url,
                {"orderDetailId":orderDetailId},
                {
                    dataType:'json',
                    callSuccess:function(returnResult){
                        if(returnResult!=null && returnResult!=''){
                            toUrl="${ctx}/return/returnEditApplyRefundFromOrder.jhtml";
                            var params={
                                returnOrderId:returnResult.id
                            };
                            if(type==0){
                                jsConfirm("该商品已申请退款/退货确定要进行修改吗?",{callback:function(result){
                                    if(result){
                                        $.dm.jumpTo(toUrl, params);
                                    }
                                }
                                });
                            }else if(type==1) {
                                $.dm.jumpTo(toUrl, params);
                            }

                        }else{
                            toUrl="${ctx}/return/applyRefund.jhtml";
                            var params={
                                orderId:orderId,orderDetailId:orderDetailId
                            };
                            $.dm.jumpTo(toUrl, params);
                        }
                    }
                }
        );
    }

    //跳转到订单详情页面
    function toOrderDetail(orderId){
        var url = "${ctx}/order/toOrderDetail.jhtml";
        $.dm.jumpTo(url,{orderId:orderId},{target:"_blank"});
    }

    //跳转到确认发货页面
    function toConfirmReceive(orderId){
        var url='${ctx}/order/toConfirmReceive.ajax';
        var params={
            orderId:orderId
        };
        $.dm.jumpTo(url, params);
    }

    //跳转到评价页面
    function toScore(id){
        var url='${ctx}/score/toScore.jhtml';
        var params={orderId:id};
        $.dm.jumpTo(url, params);
    }
    //跳转到查看物流动态页面
    function toShippingMessage(orderId){
        var url='${ctx}/shipping/toShipping.jhtml';
        var params={orderId:orderId};
        $.dm.jumpTo(url, params,{target:"_blank"});
    }
    //跳转到查看退款详情页面
    function toReturnOrderDetail(returnOrderId){
        var url = "${ctx}/return/toReturnOrderDetail.jhtml";
        var opt={method:'post', target:'_blank'};
        var params={
            returnOrderId:returnOrderId
        };
        $.dm.jumpTo(url, params,opt);
    }

    function toSendBack(orderId){
        var url='${ctx}/order/toGeneSendBack.jhtml';
        var params={orderId:orderId};
        $.dm.jumpTo(url, params);
    }
    function remindShipping(orderId) {
        var url = "/order/remindShipping.ajax";
        callService(url, {
            "orderId" : orderId
        }, {
            callSuccess : function(result) {
                if(result == true){
                    jsAlert("消息发送成功！");
                }else {
                    jsAlert("消息一天只能发送一次！");
                }
            }
        })
    }
    //移动端部分开始
    var flag=true;

	$(".goods:last").css("marginBottom","0.7rem");
    function editBtn(){
        //编辑按钮开始
        if(flag){
            $(".select").animate({"bottom":"0.87rem"},"slow", function () {
                flag=false
            });
            $('.all').html('完成');
			$(".selectOrderBtn").show();
            $(".circle-g").show()
        }
        else{
            $(".select").animate({"bottom":0},"slow", function () {
                flag=true
            });
            $('.all').html('编辑');
            $(".selectOrderBtn").hide();
            $(".circle-g").hide()

        }
        //编辑按钮结束
    }
    //移动端我的仓库采购订单整体选择开始
    var maxNum=0;
    function orderBoxSelect(i,j){
        j.stopPropagation()
        var a=$(i).closest(".orderNum").parent(".dd_box_t").children(".orderBox").children(".everyOrder").children(".circle-g");
        $(i).toggleClass("checked");
        a.toggleClass("checked");
        $(i).each(function(){
            if($(this).hasClass('checked')){
                maxNum++
            }
        })
        if(maxNum==$('.selectOrderBtn').length){
          $('.selectBox').addClass("checked")
        }
        else{
            $('.selectBox').removeClass("checked")
        }
    }
    //移动端我的仓库采购订单整体选择结束

    //移动端我的仓库加入购物车开始
function mobileAdd(){
    callService("${ctx}/order/findOrderList.ajax",
            { "startDate": $("#startDate").val(),
                "endDate": $("#endDate").val(),
                "orderState": $("#orderState").val(),
                "goodsName": $("#goodsName").val(),
                "length": $("#rows").val(),
                "pageNumber": pageNum
            },
            {"async" : false,callSuccess:function(datas) {
                var data=datas.paginationMapResponse.data;
                var totalOrderId=[];
                $(".selectOrderBtn").each(function () {
                    if($(this).hasClass('checked')){
                        var text=$(this).siblings(".caigoudan").html();
                        text=text.match(/[1-9]\d*|0/g)[0];
                        totalOrderId.push(text)
                    }
                })
            	for(var g=0;g<totalOrderId.length;g++){
                    addToShopCart(totalOrderId[g],$(this))
				}
                editBtn()
            }
            })
}
    //移动端我的仓库加入购物车结束

    //加入购物车修改开始
    function buyAgain(){

    }

    //加入购物车修改结束
    //	全选开始
   function allOrder(g){
       if($(g).hasClass('checked')){
           $(g).removeClass('checked')
           $(".selectOrderBtn").removeClass('checked')
           $(".circle-g").removeClass('checked')
       }
       else{
           $(g).addClass('checked')
           $(".selectOrderBtn").addClass('checked')
           $(".circle-g").addClass('checked')
       }

   }
    //	全选结束

//	加载更多开始
    var pageNum = 1;
	function orderMore(){
        pageNum++;
        searchOrder(pageNum)
    }

//加载更多结束
//点击单个订单号子元素收起开始
      function slide(i){
          $(i).siblings(".orderBox").toggle()
          $(i).children(".sanjiao").toggleClass("sanjiaotx")
      }
//点击单个订单号子元素收起结束

    function f_img(pic,box,left) {
        //图片居中方法
        var sh=pic.height();
        var lh=box.outerHeight();
        var num=(lh-sh)/2;
        pic.css({"top":num,"left":left});
    }
    //移动端部分结束
</script>
</#macro>
