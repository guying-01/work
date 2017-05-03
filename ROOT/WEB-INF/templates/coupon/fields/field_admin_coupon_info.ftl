<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<div class="card">
  <div class="wrapper cardReceive">
    <div class="cardReceive-con">
    <#if couponResultList??>
      <#list couponResultList as couponResult>
        <div class="card-con">
          <div class="card-con-bg card-con-bg${couponResult_index+1!''}">
            <div class="card-price">￥ <span>${couponResult.denomination!''}</span></div>
            <div class="card-text">
              <h2>优惠券</h2>
              <#if couponResult.userCondition='${getConstant("activity.COUPON_YSERCONDITION_10")!""}'>
              <P>满${couponResult.money!''}可用</P>
              </#if>
            </div>
          </div>
          <div class=" cardCondition">
            <p>每人限领${couponResult.limitQuantity!''}张</p>
            <p>有效期：${couponResult.startDate!?string('yyyy.MM.dd')}-${couponResult.endDate!?string('yyyy.MM.dd')}</p>
          </div>
          <#if couponResult.surplusQuantity?? && couponResult.surplusQuantity = '${getConstant("activity.ACTIVITY_SURPLUS_QUANTITY_0")!""}'>
          <p class="card-block">点击领取</p>
          <#else>
          <a href="javascript:void(0);" onclick="doGetcoupon('${couponResult.couponId}','${couponResult.denomination}');">点击领取</a>
          </#if>
        </div>
      </#list>
	</#if>
    </div>
  </div>
</#escape>
</#macro>