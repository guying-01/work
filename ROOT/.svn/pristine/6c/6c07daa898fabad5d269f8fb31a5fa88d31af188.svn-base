<#include "/common/common_var_definds.ftl" />
<#macro render data>
 <div class="wrapper p-t-40"  style="width:960px;">
	<div class="progress_three progress_A" id="divDian">
	    <p class="progress_textA font-color-b width200">商家提交申请（包含邮寄）</p>
	    <p class="progress_textB">审核</p>
	    <p class="progress_textC">结果反馈</p>
	 </div>
	  <div class="progress_time">  
 		 <p class="progress_textA">${time!''}</p>
    	<p class="progress_textB">5个工作日</p>
    	<p class="progress_textC">2个工作日</p>
    </div>
	  
	<#if claim?exists>
	<script>
	$(document).ready(function(){
		$("#divDian").attr("class","progress_three progress_B")
	})
	</script>
	<div class="web-note" id="" >
      <h2>您提交的申请已开始受理，约5个工作日后可查询结果。</h2>
      <p> 受理时间：${claim!''}</p>
    </div>
     <#else>
      <div class="web-note">
	      <h2>入驻申请已成功提交！请尽快邮寄相关资质。</h2>
	      <p> 您可以登陆本账户查询进度，或关注短信了解进度。</p>
	    </div>
	 </#if>
	 
	  
  </div>

</#macro>