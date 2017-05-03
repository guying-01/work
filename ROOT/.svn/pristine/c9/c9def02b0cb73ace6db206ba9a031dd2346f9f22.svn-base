<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<div class="wrapper p-t-40"  style="width:960px;">
 <div class="progress_three progress_C">
	    <p class="progress_textA font-color-b width200">商家提交申请（包含邮寄）</p>
	    <p class="progress_textB">审核</p>
	    <p class="progress_textC">结果反馈</p>
	  </div>
  <div class="progress_time">  
 		 <p class="progress_textA">${time!''}</p>
    <p class="progress_textB">5个工作日</p>
    <p class="progress_textC">2个工作日</p>
    </div>
			<div class="content-right"  id="div6">
				    <div class="web-note">
				      <h2>审核未通过。 </h2>
				       <p> <a  href="${ctx}/sai/afreshApply.jhtml" > 修改申请 </a> </p>
				      <p>原因：
				       <#if storeInfoForm?exists>
				      	 ${storeInfoForm.jionMessage!''}
				       </#if>
				      </p>
				    </div>
			</div>
			</div>
</#escape>
</#macro>