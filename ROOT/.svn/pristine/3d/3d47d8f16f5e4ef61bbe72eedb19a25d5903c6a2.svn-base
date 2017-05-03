<#include "../../common/common_var_definds.ftl" />
<#macro render data>
    <#escape x as x?html>
    <div class="member-list-tab p-t-40">
        <div class="progress_five progress_B">
            <p class="progress_textA font-color-b">采购商提交订单</p>

            <p class="progress_textB font-color-b">基因检测进行中</p>

            <p class="progress_textC font-color-b">基因检测报告已发出</p>

            <p class="progress_textD progress_text">订单已完成</p>

            <p class="progress_textE">采购商评价交易</p>
        </div>
        <form id="gene_send_bakc_form" method="post" action="${ctx}/order/confirmSendBack.jhtml">
            <div class="payment-page">
                <#if orderMap['orderForm']??>
                    <h2 class="member-tit"><i>&nbsp;</i>确认服务信息</h2>

                    <div class="orderdedetail">
                        <ul class="order-information">
                            <input id="orderId" name="orderId" type="hidden" value="${orderMap['orderForm'].id!''}" />
                            <li>订单编号：${orderMap['orderForm'].id!''}</li>
                            <li>下单时间：${orderMap['orderForm'].orderDate?string('yyyy-MM-dd HH:mm:ss')}</li>
                            <li>支付单号：${(orderDetailMap['tradeSerialNumber'])!''}</li>
                            <li>付款时间：
                                <#if orderDetailMap['orderForm']??>
                                    <#if orderDetailMap['orderForm'].tradeAsynNotifyTime??>
                                    ${orderDetailMap['orderForm'].tradeAsynNotifyTime!?string('yyyy-MM-dd HH:mm:ss')}
                                    </#if>
                                </#if>
                            </li>
                            <li></li>
                            <li class="float-no" style="word-break:break-all">
                                收货信息：
                                <#if orderMap['defaultReturnAdress']??>
                                ${(orderMap['defaultReturnAdress'].countryName)!''}
                                ${(orderMap['defaultReturnAdress'].provinceName)!''}
                                ${(orderMap['defaultReturnAdress'].cityName)!''}
                                ${(orderMap['defaultReturnAdress'].areaName)!''}
                                ${(orderMap['defaultReturnAdress'].address)!''}，
                                    邮编：${(orderMap['defaultReturnAdress'].postcode)!''} ，
                                ${(orderMap['defaultReturnAdress'].consignee)!''}(收)，
                                ${(orderMap['defaultReturnAdress'].mobile)!''}
                                    <#if orderMap['defaultReturnAdress'].telephone??>
                                        ，${orderMap['defaultReturnAdress'].telephone}
                                    </#if>
                                <input type="hidden" name="returnAddressId" value="${(orderMap['defaultReturnAdress'].id)}" id="seller_return_address_id" />
                                </#if>
                            </li>
                            <li class="float-no" style="word-break:break-all">
                                采购商信息：${orderMap['orderForm'].memberAccount!''}</li>
                            <li class="float-no" style="word-break:break-all">
                                采购商留言：${(orderMap['orderForm'].memo)!''}</li>
                            <li class="float-no">商品清单：</li>
                            <div class="anclose-button">
                                <p></p>
                            </div>
                        </ul>
                    </div>
                    <#if orderDetailMap['orderDetailFormList']??>
                        <div class="goodslist">
                            <div class="table-tit">
                                <span class="width400">服务名称</span>
                                <span>单价（元）</span>
                                <span>数量</span>
                                <span>小计（元）</span>
                            </div>
                            <div class="order-tab m-t-10">
                                <#list orderDetailMap['orderDetailFormList'] as orderDetailForm>
                                    <div class="table-produce" id="div_${orderDetailForm.id!''}">
                                        <p class="textalign-l width400" style="word-break:break-all">
                                    <span class="p-l-10"><a href="${ctx}/gd/${orderDetailForm.goodsId}.jhtml"><img
                                            src="${orderDetailForm.itemSmallPicturePath!''}"/></a></span>
                                            <a href="${ctx}/gd/${orderDetailForm.goodsId}.jhtml"
                                               class="left">${orderDetailForm.goodsName!''}</a>
                                        </p>

                                        <p>${orderDetailForm.itemPrice?string("0.00")}</p>

                                        <p>${orderDetailForm.itemAmount}</p>

                                        <p>${(orderDetailForm.itemAmount * orderDetailForm.itemPrice)?string("0.00")}</p>
                                    </div>
                                </#list>
                            </div>
                        </div>
                    </#if>
                    <h2 class="member-tit"><i>&nbsp;</i>选择物流服务</h2>
					<div class="order-information">
                    <div>
                        <div class="shipping_info_div">
                            <div class="table-tit">
                                <span style="width:30%">物流公司名称</span>
                                <span style="width:30%">运单编号</span>
                                <span style="width:40%">备注</span>
                            </div>
                            <div class="order-tab m-t-10">
                                <div class="table-produce" id="send_back_shipping_info">
                                    <p style="width:30%;word-break:break-all">
                                        系统预制：
                                        <select id="shippingCompany" name="shippingCompanyCode">
                                            <#list shippingCommpayList as shippingCompany>
                                                <option value="${(shippingCompany.id)!''}">${(shippingCompany.name)!''}</option>
                                            </#list>
                                        </select>
                                        <input type="hidden" name="shippingCompanyName" value=""
                                               id="send_back_shiiping_company_name"/>
                                    </p>
                                    <p style="width:30%;align:center;"><input type="text" name="shippingNum" id="shipping_bill_id" class="input_text" value=""/></p>

                                    <p style="width:40%;align:center;"><input type="text" name="shippingMemo" id="shipping_memo" class="input_text" value=""/></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="bottom-button p-t-20">
                        <a href="javascript:void(0);" onclick="confirmGeneSendBack();" class="big-button">确认回寄样品</a>
                        <a href="javascript:void(0);" onclick="cancelSendBack();" class="big-button">取消</a>
                    </div>
                    <div class="clear"></div>
                </#if>
            </div>
        </form>
    </div>
    </#escape>
</#macro>