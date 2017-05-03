<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<div class="card">
  <div class="wrapper cardSuccess">
    <div class="cardSuccess-con">
      <h2>恭喜您领取成功～</h2>
      <#if couponForm??>
	      <p>优惠券类型：${couponForm.couponTypeName!''}</p>
	      <P>面额：<span class="font-color-c">${couponForm.denomination!''}元</span></P>
	      <#if couponForm.userCondition ='${getConstant("activity.COUPON_YSERCONDITION_10")!""}'>
	      	<P>使用门槛：满足${couponForm.money}元使用</P>
	      <#else>
	      	<P>使用门槛：无条件</P>
	      </#if>
	      <P>使用时间：<span class="font-color-c">${couponForm.startDate!?string('yyyy.MM.dd')}-${couponForm.endDate!?string('yyyy.MM.dd')}</span></P>
      </#if>
    <a href="javascript:void(0);" class="card-btb" onclick="doSearchCoupon();">查看优惠券</a> </div>
  </div>
</div>
</#escape>
</#macro>