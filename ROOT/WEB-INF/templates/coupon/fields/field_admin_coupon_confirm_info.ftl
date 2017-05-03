<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<div class="card">
  <div class="wrapper cardConfirm">
    <div class="cardConfirm-con">
      <h2>亲！确定领取${strDenomination!''}元代金券么～～</h2>
    <a href="javascript:void(0);" onclick="doGetcouponConfirm('${couponId!''}');" class="card-bta">点击领取</a></div>
  </div>
</div>
</#escape>
</#macro>