<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<div class="card">
  <div class="wrapper cardFailure">
    <div class="cardFailure-con">
      <h2>领取失败了T_T</h2>
	    <#if errMsg??>
      		<h2>${errMsg!''}</h2>
     	</#if>
     	<#if storeId??>
    		<a href="/fsst/${storeId!''}/top.jhtml" class="card-bta" >进入店铺</a></div>
    	</#if>
  </div>
</div>
</#escape>
</#macro>