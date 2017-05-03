<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<div class="card">
  <div class="wrapper cardConfirm">
    <div class="cardConfirm-con">
      <#if couponMap??&&couponMap.issuerName??>
      <h2>亲！确定领取
      ${couponMap.issuerName!''}
   		   的
      ${couponMap.denomination!?string(",###.00")}
      元代金券么～～</h2>
       </#if>
      <a href="javascript:void(0);" class="card-bta" onclick="blockObj();$.dm.jumpTo('#',{couponId:'${couponId!""}'})">点击领取</a>
    </div>
  </div>
</div>
</#escape>
</#macro>