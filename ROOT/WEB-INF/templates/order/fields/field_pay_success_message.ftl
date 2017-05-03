<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<style>
    body {
        min-width: 0;
    }
</style>
<div class="wrapper p-t-40">
<div class="payment-page payment-page-gy">
    <#if resultList??>
        <#list resultList as totalOrderList>
            <#if totalOrderList[0].payResult?? && totalOrderList[0].payResult == "1">
                <h1 class="payment-title">支付成功！我们会尽快为您发货！</h1>
                    <dl>
                        <dt>
                        <p>采购单<span>${totalOrderList[0].totalOrderId!''}</span></p>
                        <#--<p class="payment-content-right">店铺</p>-->
                        </dt>
                        <#list totalOrderList as item>
                            <dd>
                                <p>订单编号<span>${item.id!''}</span></p>
                                <p class="payment-content-right">${item.storeName!''}</p>
                            </dd>
                        </#list>
                        <dt>
                            <span style="font-weight: bold">合计金额：</span>
                            <span style="font-weight: bold" class="payment-price payment-content-right"><em>￥</em><span>${totalOrderList[0].totalOrderPayMoney!0}</span>元</span>
                        </dt>
                    </dl>
                <#--<div class="bank">-->
                    <#--<div class="bank_txta">采购单${totalOrderList[0].totalOrderId!''}支付成功！</div>-->
                    <#--<div class="bank_txtb">-->
                            <#--<#list totalOrderList as item>-->
                                <#--<p>订单编号:${item.id!''}&nbsp;&nbsp;商家店铺：${item.storeName!''}</p>-->
                            <#--</#list>-->
                        <#--<p>支付￥<span>${totalOrderList[0].totalOrderPayMoney!0}</span> </p>-->
                    <#--</div>-->
                <#--</div>-->
            <#elseif totalOrderList[0].payResult?? && totalOrderList[0].payResult == "2">
                <div class="bank" style="width: 100%;font-size: 0.24rem;margin: 0">
                    <div class="bank_txta" style="width: 100%;font-size: 0.35rem;padding: 0;margin: 0;height: auto;line-height: normal">采购单${totalOrderList[0].totalOrderId!''}支付失败！</div>
                    <div class="bank_txtb" style="width: auto;font-size: 0.26rem;line-height: normal"><p style="font-size: 0.26rem">请到<a href="/order/toStoreHouse.jhtml" style="color:#f88c0e;font-size:0.26rem">我的仓库</a>中重新支付</span> </p>
                    </div>
                </div>
            <#elseif totalOrderList[0].payResult?? && totalOrderList[0].payResult == "3">
                <div class="bank" style="width: 100%;font-size: 0.24rem;margin: 0">
                    <div class="bank_txta" style="width: 100%;font-size: 0.35rem;padding: 0;margin: 0;height: auto;line-height: normal">采购单${totalOrderList[0].totalOrderId!''}正在支付中！</div>
                    <div class="bank_txtb" style="width: auto;font-size: 0.26rem;line-height: normal"><p style="font-size: 0.26rem">请到<a href="/order/toOrderList.jhtml" style="color:#f88c0e;font-size:0.26rem">我的采购单</a> 获取最新支付状态</span> </p>
                    </div>
                </div>
            <#elseif totalOrderList[0].payResult?? && totalOrderList[0].payResult == "4">
                <div class="bank">
                    <div class="bank_txta">采购单${totalOrderList[0].totalOrderId!''}余额不足！</div>
                    <div class="bank_txtb"><p>请到<a href="${storepath!''}/order/toOrderList.jhtml" style="color:#f88c0e">我的采购单</a> 获取最新支付状态</span> </p>
                    </div>
                </div>
            <#else >
                <div class="bank" style="width: 100%;font-size: 0.24rem;margin: 0">
                    <div class="bank_txta" style="width: 100%;font-size: 0.35rem;padding: 0;margin: 0;height: auto;line-height: normal">采购单${totalOrderList[0].totalOrderId!''}支付失败！</div>
                    <div class="bank_txtb" style="width: auto;font-size: 0.26rem;line-height: normal"><p style="font-size: 0.26rem">请到<a href="/order/toStoreHouse.jhtml" style="color:#f88c0e;font-size:0.26rem">我的仓库</a>中重新支付</span> </p>
                    </div>
                </div>
            </#if>
        </#list>
        <div class="payment-total" style="text-align: center;font-size: 0.26rem;font-weight: 700">
            <p>合计支付：<em>￥</em><span>${allpay!0}</span>元</p>
        </div>
    </#if>
</div>
    <div class="bank" style="width: 100%;font-size: 0.24rem;margin: 0">
        <div class="bank_txtb" style="width: auto;font-size: 0.26rem;line-height: normal">
            <#--<p class="bor-t m-t-15">合计支付 ${allpay!0}元 </p>-->
            <p class="m-t-5" style="font-size: 0.3rem"><span id="timekeep" style="font-size: 0.3rem">6</span> 秒后将跳转到<strong style="color: #d01202;font-weight: 600;font-size: 0.32rem">我的采购单</strong></p>
        </div>
    </div>


	<div class="textalign-m p-t-20" style="overflow: hidden;width: 100%;text-align: center"> <a href="${ctx}/order/toOrderList.jhtml" class="big-button cx1 float-no">立即跳转</a></div>
</div>
</#escape>
</#macro>