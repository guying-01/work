<#include "/common/common_var_definds.ftl" />
<#macro render data>
    <#escape x as x?html>
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if (deviceWidth > 768) {
            deviceWidth = 768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
    <style>
        html,
        body {
            width: 100%;
            height: 100%;
            font-size: 0.22rem;
            font-family: "microsoft yahei";
            min-width: 300px;
            max-width: 768px;
            margin: 0 auto !important;
            background: #fff;
            /*	overflow-x: hidden;*/
        }

        .order-tab {
            border: none;
            border-bottom: 0.01rem solid #e1e1e1;
            overflow: hidden;
        }

        .line {
            width: 100%;
            border-top: 1px solid #dcdcdc;
        }

        .member-tit {
            height: 0.8rem;
            width: 100%;
            text-align: center;
            line-height: 0.8rem;
            padding: 0;
            border-bottom: 1px solid #e1e1e1;
            text-indent: 0.1rem;
        }

        .member-tit a {
            position: absolute;
            left: 0.2rem;
            width: 0.35rem;
            height: 0.5rem;
            background: url(/resources/img/order/submit_return.png) no-repeat center center;
            background-size: contain;
            text-indent: 0;
            top: 50%;
            margin-top: -0.25rem;
        }

        .member-tit span {
            font-size: 0.3rem;
        }

        .fenge {
            height: 0.1rem;
            background: #EEEEEE;
        }

        .order-info-tit {
            font-size: 0.24rem;
            height: 0.5rem;
            line-height: 0.5rem;
            font-weight: bold;
            text-align: center;
            background: #f8f8f8;
            letter-spacing: 0.03rem;
        }

        .orderdedetail h3 {
            overflow: hidden;
            word-wrap: break-word;
            line-height: 0.6rem;
            font-size: 0.26rem;
            height: 0.6rem;
        }

        .order-status p {
            height: auto;
            line-height: 0.4rem;
            margin-bottom: 0.1rem;
        }

        .order-status p span,
        .order-status p a {
            word-break: break-all;
            display: inline;
            float: none;
        }

        .orderdedetail {
            width: 100%;
            box-sizing: border-box;

        }

        .order-information {
            width: 100%;
            box-sizing: border-box;
        }

        .order-information li span {
            display: block;
            float: left;
            margin-right: 0.1rem;
            font-size: 0.24rem;
        }

        .order-info-con {
            width: 4rem;
            margin-right: 0;
            word-break: break-all;
            line-height: 0.36rem;
        }

        .float-no:after,
        .order-status p:after,
        .order-information li:after, .table-message:after {
            content: '.';
            display: block;
            clear: both;
            visibility: hidden;
            height: 0;
        }

        .goodslist {
            margin: 0;
            width: 100%;
        }

        .order-status {
            padding: 0.1rem 0.2rem;
        }

        .order-status p a {
            margin: 0 0.1rem;
            position: static;
            display: inline-block;
        }

        .bold {
            font-weight: bold;
        }

        .order-information li {
            float: none;
            width: 100%;
            box-sizing: border-box;
            padding: 0 0.2rem;
            line-height: 0.4rem;
            height: auto;
            min-height: auto;
        }

        .table-produce {
            display: block;
            box-sizing: border-box;
            padding: 0.1rem;
            overflow: hidden;
            height: auto;
        }

        .goods_pic {
            float: left;
            width: 1.7rem;
            height: 1.7rem;
        }

        .goods_pic img {
            width: 100%;
            height: 100%;
        }
        .goodsDetailMessage{
            float: right;
            overflow: hidden;
            width: 70%;
        }
        .goods_name {
            width: 100%;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .goods_guige{
            max-width: 3rem;
        }
        .goodsDetailMessage div{
            padding: 0.05rem;
        }

        .table-produce .price_num span {
            text-align: left;
            float: left;
            height: auto;
        }

        .time {
            padding: 0;
            height: 0.4rem;
        }

        .time i {
            display: inline-block;
            width: 0.24rem;
            height: 0.24rem;
            background: url(/resources/img/order/clock.png);
            background-size: 100%;
            float: left;
            margin-top: 0.02rem;
            margin-right: 0.1rem;
        }

        .order_submit_goods_info_bottom span {
            font-size: 0.2rem;
        }

        .time span {
            float: left;
            font-size: 0.2rem;
            height: 0.45rem;
            width: 0.45rem;
            display: block;
            margin-top: 0.1rem;
            margin-right: 0.5rem;
        }

        .time:after {
            content: '.';
            clear: both;
            visibility: hidden;
            height: 0;
            display: block;
        }

        .order-sum {
            margin: 0.05rem;
        }

        .order-sum ul li {
            text-align: right;
        }

        .order-sum ul li span,
        .order-sum ul li strong {
            display: inline;
        }

        .order-sum span {
            font-size: 0.24rem !important;
        }

        .order-sum strong {
            font-size: 0.26rem !important;
        }

        .table-message {
            width: 100%;
        }

        .payment-page {
            padding-bottom: 0;
        }
        .wrap img{
            float: right;
            height: 0.38rem;
        }
    </style>
    <div class="member-list-tab">
        <div class="payment-page">
            <h2 class="member-tit" dm-container="orderState" dm-value="${orderDetailMap['orderForm'].orderState!''}">
                <a href="/order/toOrderList.jhtml"></a>
                <span>订单详情</span>
            </h2>
<input type="hidden" id="memberType" value="${memberType!''}" />
            <input type="hidden" id="service_status" value="${orderDetailMap['orderForm'].serviceStatus!''}"/>
            <input type="hidden" id="restTime" value="${orderMap['restTime']!''}"/>
            <input type="hidden" id="tradeAttr1" value="${orderDetailMap['orderForm'].tradeAttr1!''}"/>
            <div class="orderdedetail" dm-actor="order-statae"></div>
        <#-- <h2 class="member-tit">
            <i>&nbsp;</i>物流信息
            </h2>

            <div class="wulua-content-right">
                <#if shippingBillFormList?? && shippingBillFormList?size gt 0>
                    <#list shippingBillFormList as shippingBillForm>
                        <#if shippingBillForm??>
                            <#if shippingBillForm.shippingType==g etConstant( 'dictionary.ORDER.SHIPPING.TYPE.NORMAL')>
                                <#if orderMap.orderForm.orderFlow==g etConstant( 'dictionary.ORDER.ORDER_FLOW.NORMAL_FLOW') ||(orderMap.orderForm.orderFlow==g etConstant( 'dictionary.ORDER.ORDER_FLOW.GENE_CHECK') &&orderMap.orderForm.serviceStatus==g etConstant( 'dictionary.ORDER.SERVICE_STATUS.CLOSE') && !orderMap.orderForm.firstSendTime?exists)>
                                    <ul>
                                        <li class="wulua-content-right-foc">
                                            物流类型:&nbsp;&nbsp;${shippingBillForm.shippingTypeName!''}</li>
                                        <#if shippingBillForm.billId??>
                                            <li class="wulua-content-right-foc">
                                                物流编号:&nbsp;&nbsp;${shippingBillForm.id!''}</li>
                                            <li class="wulua-content-right-foc">
                                                发货方式:&nbsp;&nbsp;${shippingBillForm.shippingWayName!''}</li>
                                            <li class="wulua-content-right-foc">
                                                物流公司:&nbsp;&nbsp;${shippingBillForm.companyName!''}</li>
                                            <li class="wulua-content-right-foc">
                                                运单编号:&nbsp;&nbsp;${shippingBillForm.billId!''}</li>
                                            <li class="wulua-content-right-foc">备注:&nbsp;&nbsp;${shippingBillForm.memo!''}</li>
                                            <li class="wulua-content-right-foc">物流跟踪：
                                                <a href="javascript:searchShippingInfo();">
                                                    &nbsp;${getConstant('constant.POM_SHIPPING_URL')}&nbsp;</a>
                                            </li>
                                            <#else>
                                                <li class="wulua-content-right-foc">
                                                    <h2>
                <i style="color: gray; margin: 0 0 0 200px">您的发货方式为<font
                    style="color: red">无需物流</font>，物流信息不存在！
                </i>
            </h2>
                                                </li>
                                        </#if>

                                    </ul>
                                </#if>
                                <#else>
                                    <ul>
                                        <li class="wulua-content-right-foc">
                                            物流类型:&nbsp;&nbsp;${shippingBillForm.shippingTypeName!''}</li>
                                        <#if shippingBillForm.billId??>
                                            <li class="wulua-content-right-foc">
                                                物流编号:&nbsp;&nbsp;${shippingBillForm.id!''}</li>
                                            <li class="wulua-content-right-foc">
                                                发货方式:&nbsp;&nbsp;${shippingBillForm.shippingWayName!''}</li>
                                            <li class="wulua-content-right-foc">
                                                物流公司:&nbsp;&nbsp;${shippingBillForm.companyName!''}</li>
                                            <li class="wulua-content-right-foc">
                                                运单编号:&nbsp;&nbsp;${shippingBillForm.billId!''}</li>
                                            <li class="wulua-content-right-foc">备注:&nbsp;&nbsp;${shippingBillForm.memo!''}</li>
                                            <li class="wulua-content-right-foc">物流跟踪：
                                                <a href="javascript:searchShippingInfo();">
                                                    &nbsp;${getConstant('constant.POM_SHIPPING_URL')}&nbsp;</a>
                                            </li>
                                            <#else>
                                                <li class="wulua-content-right-foc">
                                                    <h2>
                <i style="color: gray; margin: 0 0 0 200px">您的发货方式为<font
                    style="color: red">无需物流</font>，物流信息不存在！
                </i>
            </h2>
                                                </li>
                                        </#if>
                                    </ul>
                            </#if>
                        </#if>
                    </#list>
                    <div class="wulua-three">
                        <i>&nbsp;</i>物流详情请点击上述查询链接进行查询
                    </div>
                </#if>
            </div>
            -->
            <div class="fenge"></div>
            <!--<h2 class="member-tit">
    <i>&nbsp;</i>
</h2>-->
            <div class="line"></div>
            <p class="order-info-tit">订单信息</p>
            <div class="line"></div>
            <div class="orderdedetail">
                <ul class="order-information">
                    <input id="orderId" type="hidden" value="${orderMap['orderForm'].id!''}"/>
                    <li><span class="bold">采购单号：</span><span
                            class="order-info-con">${orderMap['orderForm'].totalOrderId!''}</span></li>
                    <li><span class="bold">订单编号：</span><span
                            class="order-info-con">${orderMap['orderForm'].id!''}</span></li>
                    <li><span class="bold">下单时间：</span><span
                            class="order-info-con">${orderMap['orderForm'].orderDate?string('yyyy-MM-dd HH:mm:ss')}</span>
                    </li>
                <#-- <li>确认时间：
                    <#if orderMap[ 'doneTime']??>
                        ${orderMap['doneTime']?string('yyyy-MM-dd HH:mm:ss')}</#if>
                    </li> -->
                <#-- CHANGE START BY geshuo 20151223:设置支付单号 -->
                <#-- <li>支付单号：${(orderDetailMap['paybillForm'].id)!''}</li>
                    <li>支付单号：${(orderDetailMap['tradeSerialNumber'])!''}</li>-->
                <#-- CHANGE START BY geshuo 20151223:设置支付单号 -->
                <#-- <li>付款时间：
                    <#if orderMap[ 'orderForm']??>
                        <#if orderMap[ 'orderForm'].tradeAsynNotifyTime??>
                            ${orderMap['orderForm'].tradeAsynNotifyTime!?string('yyyy-MM-dd HH:mm:ss')}
                        </#if>
                    </#if>
                    </li>

                    <li></li>
                    <li class="float-no">发票类型：
                        <#if orderMap[ 'orderForm']??>
                            <#if orderMap[ 'orderForm'].invoiceType?? && orderMap[ 'orderForm'].invoiceType=='1'>
                                个人
                                <#elseif orderMap[ 'orderForm'].invoiceType?? && orderMap[ 'orderForm'].invoiceType=='2'>
                                    单位
                            </#if>
                        </#if>
                    </li>
                    <li>发票抬头：
                        <#if orderMap[ 'orderForm']??>
                            <#if orderMap[ 'orderForm'].invoiceTittle??>
                                ${orderMap['orderForm'].invoiceTittle!''}
                            </#if>
                        </#if>
                    </li>
                    -->
                    <li class="float-no" style="word-break: break-all"><span
                            style="float: none;display: inline-block;width: 20%;" class="bold">收货信息：</span>
                        <#if orderMap[ 'shippingInfoForm']??><span class="order-info-con"
                                                                   style=" width: 76%;display: inline-block;float: right;">
                        ${(orderMap['shippingInfoForm'].countryName)!''}
                        ${(orderMap['shippingInfoForm'].provinceName)!''}
                        ${(orderMap['shippingInfoForm'].cityName)!''}
                        ${(orderMap['shippingInfoForm'].areaName)!''}${(orderMap['shippingInfoForm'].address)!''}，
                        <#--  邮编：${(orderMap['shippingInfoForm'].postCode)!''} ，-->
                        ${(orderMap['shippingInfoForm'].customer)!''}(收)，
                        ${(orderMap['shippingInfoForm'].mobile)!''} <#if
                        orderMap['shippingInfoForm'].telephone??> ， </#if>
                        ${(orderMap['shippingInfoForm'].telephone)!''} </#if></span>
                    </li>
                    <li class="float-no">
						  <span style="width: 20%;" class="bold">商家信息：
                          </span>
                          <span id="storeName" value="${orderMap['storeName']!''}" style="width: 76%;margin-right: 0">
                                 ${orderMap['storeName']!''}

                          </span>
                        <p style="float: left">
                            <span class="bold">
                          </span>

                    </p>
                    </li>
                    <li class="float-no">
                        <a href="javascript:QQtalk('1739073619');" class="" dm-actor="webim-store" dm-data="${orderMap['storeName']!''}" style="margin-top: 0.05rem;font-weight: 700">
                            联系客服：
                            <img src="/resources/basepage/store/default/common_img/consulting.gif" style="width: 0.3rem;height: 0.3rem;vertical-align: middle;"/>
                            </a>
                    </li>




                    <li class="float-no" style="word-break: break-all">
                        <span class="bold">采购商留言：</span>
                        <span class="order-info-con">${(orderMap['orderForm'].memo)!'无'}</span>
                    </li>
                <#-- <div class="float-no">
                    <p class="left">
                        匿名购买：
                        <#if orderMap[ 'orderForm'].isGoodsNameHide==1> <input type="checkbox" checked="checked" disabled="disabled" />
                            <#else>
                                <input type="checkbox" disabled="disabled" /> </#if>
                    </p>
</div>
-->
                <#-- <div class="anclose-button">
                    <p></p>
        </div>
        -->
                </ul>
            </div>
            <div class="fenge"></div>
            <div class="line"></div>
            <p class="order-info-tit">商品清单</p>
            <div class="goodslist" style="display: block;">
                <div class="order-tab test">
                    <#list orderDetailMap[ 'orderDetailFormList'] as orderDetailForm>
                        <div class="table-produce" id="div_${orderDetailForm.id!''}">
                            <div class="goods_pic">
                                <a href="${ctx}/fsgd/${orderDetailForm.goodsId}.jhtml">
                                    <img src="${orderDetailForm.itemSmallPicturePath!''}"/>
                                </a>
                            </div>
                            <div class="goodsDetailMessage">
                            <div class="goods_name">${orderDetailForm.goodsName!''}</div>
                                <div class=" ">单价：￥${orderDetailForm.itemPrice?string("0.00")}</div>
                                <div class="wrap" style="overflow: hidden">
                                    <div class="num" style="float: left;padding: 0">数量：${orderDetailForm.itemAmount}</div>
                                    <#switch orderDetailForm.prepareDatePicType!''>
                                        <#case 'prepare_date_pic_type_2_am'>
                                            <img src="/resources/basepage/store/default/common_img/deliver_time_01.png" >
                                            <#break>
                                        <#case 'prepare_date_pic_type_2_pm'>
                                            <img src="/resources/basepage/store/default/common_img/deliver_time_02.png" >
                                            <#break>
                                        <#case 'prepare_date_pic_type_3'>
                                            <img src="/resources/basepage/store/default/common_img/deliver_time_03.png" >
                                            <#break>
                                    </#switch>
                                </div>

                            <#if orderDetailForm.itemName==orderDetailForm.goodsName>
                                <div class="goods_guige">
                                    <a href="javascript:void(0);"
                                       title="${(orderDetailForm.itemName!'')?replace(orderDetailForm.goodsName!'','无','f')}">${(orderDetailForm.itemName!'')?replace(orderDetailForm.goodsName!'','','f')}</a>
                                </div>
                            <#else>
                                <div class="goods_guige">
                                    <a href="javascript:void(0)"
                                       title="${(orderDetailForm.itemName!'')?replace(orderDetailForm.goodsName!'','','f')}">${(orderDetailForm.itemName!'')?replace(orderDetailForm.goodsName!'','','f')}</a>
                                </div>
                            </#if>
                            </div>
                            <!--<p class="">
							${(orderDetailForm.prepareGoodsDay!'')} ${(orderDetailForm.prepareDatePicType!'')}
						</P>-->
                        <#-- <p class="" style="word-break: break-all">${orderDetailForm.promotionRule!'未参与促销'}</p> -->
                            <p style="display: none;">
                                总价：${(orderDetailForm.itemAmount * orderDetailForm.itemPrice)?string("0.00")}</p>
                        <#-- <p style="word-break: break-all;text-align:center">${orderDetailForm.returnAmount}</p> -->
                        </div>
                    </#list>
                </div>
            </div>
            <div class="table-message ">
                <div class="order-sum">
                    <ul>
                    <#-- 2016/10/11 sunbao <#if activitySale!=0>
                        <li><span>活动（元）：</span><strong id="psyf">-${activitySale?string("0.00")!}</strong></li>
                        </#if> -->
                        <#if couponList??>
                            <#list couponList as couponList>
                                <li>
                                    <span>${activityCouponTypeMap[couponList.couponSender].name}（元）：</span>
                                    <strong id="psyf">-${couponList.discountAmount?string("0.00")}</strong>
                                </li>
                            </#list>
                        </#if>
                    <#-- 2016/10/11 sunbao <#if pointsSale!=0>
                        <li>
                            <span>积分（元）：</span>
                            <strong id="psyf">${pointsSale?string("0.00")!}</strong>
                        </li>
                        </#if>
                        -->
                    <#-- <li>
                        <span>商品合计（元）：</span>
                        <strong>${orderDetailMap['orderForm'].goodsMoney?string("0.00")}</strong>
                        </li> -->
                    <#-- 2016/10/11 sunbao <li>
                        <span>配送运费（元）：</span>
                        <strong id="psyf">${orderDetailMap['orderForm'].shippingMoney?string("0.00")}</strong>
                        </li>

                        <li>
                            <span>优惠金额（元）：</span>
                            <strong class="font-color-d" id="ddsf" style="font-size:10px;"> ${((orderDetailMap['orderForm'].goodsMoney) + (orderDetailMap['orderForm'].shippingMoney) - (orderDetailMap['orderForm'].payMoney))?string("0.00")}</strong>
                        </li>
                        -->
                        <li>
                            <span>商品合计（元）：</span>
                            <strong class="font-color-d"
                                    id="ddsf"> ${(orderDetailMap['orderForm'].payMoney )?string("￥0.00")}</strong>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
            <div style="height: 0.87rem;"></div>
        </div>
        <!--<div class="bottom-button">
            <a href="/order/toOrderList.jhtml" class="big-button">返 回</a>
        </div>-->
    </div>

    <div class="pop_up cx4">
        <div class="pop_up_A pop_up_C">
            <h2>
                <a href="javascript:void(0);" class="shut"><img
                        src="${resources}/img/common/shutB.png"></a>延长收货时间
            </h2>

            <div class="pop_bg">
                <div class="pop_note">
						<span class="font14">您要将本次交易的确认收货时间延长 <input type="hidden"
                                                                     id="strid" value=""/> <select id="sel" name="code"
                                                                                                   class="m-l-10 m-r-10">
                            <option value="00">3</option>
                        </select> 天
				</span>
                </div>
                <div class="pop_up_button">
                    <a href="javascript:void(0);" class="small-button" onclick="saveExtendReceive();">确 定</a>
                    <a href="javascript:void(0);" class="small-button-greay m-l-20 shut" onclick="clo()">取 消</a>
                </div>
            </div>
        </div>
    </div>
    <#--<script type="text/x-handlebars-template">-->
    <#--function searchShippingInfo(){-->
    <#--var url='${getConstant(' constant.POM_SHIPPING_URL ')}';-->
    <#--var opt={method: 'post', target: '_blank'};-->
    <#--$.dm.jumpTo(url, {}, opt);-->
    <#--}-->
    <#--</script>-->
    <#------------------------------------订单状态的模板开始----------------------------------->
    <script id="ORDER_STATE_00-tl" type="text/x-handlebars-template">
        <div class="orderdedetail">

            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <#--<span>您可以</span>
                    <a href="javascript:toPay('${orderMap['orderForm'].id!''}')">立即付款</a>-->
                </p>
                <p>
                    <span>如果您在&nbsp;</span><span id="showRestTime1"
                                                 style="	color: red;">下单日{{time}}前&nbsp;</span><span>没有及时付款，请再次加入购物车重新下单购买</span>
                </p>
                <p>
                    {{#closeOrder tradeAttr1 ${orderMap['orderForm'].id}}}{{/closeOrder}}
                </p>
            </div>
        </div>
    </script>
    <script id="ORDER_STATE_10-tl" type="text/x-handlebars-template">
        <div class="orderdedetail">

            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <span>商家正在准备货物</span>
                </p>
            </div>
        </div>
    </script>
    <script id="ORDER_STATE_20-tl" type="text/x-handlebars-template">
        <div class="orderdedetail">

            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <span>如果您不想购买了，您可以联系客服退换货</span>
                </p>
            </div>
        </div>
    </script>
    <script id="ORDER_STATE_30-tl" type="text/x-handlebars-template">
        <div class="orderdedetail">

            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <span>如果商家违背交易承诺，您可以投诉商家进行维权</span>
                    <!-- <a href="javascript:void(0);">投诉商家</a>&nbsp;进行维权 -->
                </p>
            </div>
        </div>
    </script>
    <script id="ORDER_STATE_40-tl" type="text/x-handlebars-template">
        <div class="orderdedetail">

            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <span>如果商品存在问题，您需要申请退换货，请联系客服</span>
                    <a href="javascript:void(0);"><img src="/resources/img/common/consulting.png" width="24px"
                                                       height="22px" style="display:none;" dm-actor="webim-store"
                                                       dm-data=""/></a>
                </p>
            </div>
        </div>
    </script>
    <script id="ORDER_STATE_50-tl" type="text/x-handlebars-template">
        <div class="orderdedetail">

            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <span>如果商品存在问题，您需要申请售后，可以联系商家 {{sellerName}}</span>
                    <a href="javascript:QQtalk('1739073619');"><img src="/resources/img/common/consulting.gif" width="24px"
                                                       height="22px" style="display:none;" dm-actor="webim-store"
                                                       dm-data=""/></a>
                </p>

                <p>
                    <span>如果商家违背交易承诺，您需要投诉维权，您可以投诉商家</span>
                    <!--<a href="javascript:void(0);">投诉商家</a>&nbsp;进行维权-->
                </p>
            </div>
        </div>
    </script>
    <script id="ORDER_STATE_60-tl" type="text/x-handlebars-template">

        <div class="orderdedetail">

            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <span><i></i>退换货中请耐心等待，如需帮助请联系客服</span>
                    <a href="javascript:QQtalk('1739073619');" class="consulting" dm-actor="webim-store" style="margin-top: 2px"><i></i></a>
                </p>
            </div>
        </div>
    </script>
    <#--------基因检测流程新增开始--------->
    <script id="ORDER_STATE_70-tl" type="text/x-handlebars-template">
        <div class="orderdedetail">
            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <span>如果商家长时间不发货或您不想购买了，您可以在与商家协商后申请退款/退货</span>
                </p>
                {{#equals serviceStatus ${getConstant('dictionary.ORDER.SERVICE_STATUS.FIRST_SEND')}}}
                <p>
                    <span>如果您已经收到采购商发送的基因检测收集工具，你可以</span>
                    <a href="javascript:toSendBack('{{orderId}}');">回寄检测样本</a>
                </p>
                {{/equals}}
            </div>
        </div>
    </script>
    <script id="ORDER_STATE_80-tl" type="text/x-handlebars-template">
        <div class="orderdedetail">

            <div class="order-status">
                <p class="bold">订单状态:&nbsp;{{name}}</p>
                <p>
                    <span>如果您在&nbsp;</span><span id="showRestTime"></span><span>后没有确认收货，系统将自动确认收货</span>
                </p>
                <p>
                    <span>如果您已收到检测结果，且对服务满意，您可以</span>
                    <a href="javascript:void(0);" onclick="toConfirmReceive('${orderMap['orderForm'].id!}')">确认收货</a>&nbsp;打款给商家
                </p>

                <p>
                    <span>如果您还未收到货，请注意自动打款时间，您可以</span>
                    <a href="javascript:void(0)" onclick="extendReceive()">延长收货时间</a>
                    <span>&nbsp;或申请退款/退货</span>
                </p>
            </div>
        </div>
    </script>
    <#--------基因检测流程新增结束--------->
    <!-- 倒计时，开始 -->
    <script id="show-rest-time-tl" type="text/x-handlebars-template">
        <strong class="  font-color-b" id="date" dm-info="activity-rest-day" dm-data="{{goodsId}}">{{restDay}}&nbsp;天&nbsp;</strong>
        <strong class="  font-color-b" id="time" dm-info="activity-rest-hour" dm-data="{{goodsId}}">{{restHour}}&nbsp;小时&nbsp;</strong>
        <strong class="  font-color-b" id="time" dm-info="activity-rest-minute" dm-data="{{goodsId}}">{{restMinute}}&nbsp;分&nbsp;</strong>
        <strong class="  font-color-b" id="time" dm-info="activity-rest-second" dm-data="{{goodsId}}">{{restSecond}}&nbsp;秒</strong>
    </script>
    <!-- 倒计时，结束 -->
    <#------------------------------------订单状态的模板结束----------------------------------->
    </#escape>
</#macro>
