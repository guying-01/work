<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<#assign tel=((memberDetailInfoForm.lrMobile)!'') />
<#assign mail=((memberDetailInfoForm.mailAddress)!'') />
<div class="content-right">
	 <div class="member-list-tab" >
      <h2 class="member-tit modify" onclick="javascript :history.go(-1);"> <a href="javascript:void(0);"></a><i>&nbsp;</i>找回登录密码</h2>
      <div class="progress_four progress_A">
			  <div class="coverColor_B"></div>
				<p class="progress_textA progress_four_A" >输入用户名</p>
				<p class="progress_textB progress_four_B font-color-b">验证身份</p>
				<p class="progress_textC progress_four_C">设置新密码</p>
				<p class="progress_textD progress_four_D">完成</p>
      </div>

	    <div class="orderdedetail">
	      <div class="information-line-gy">
	       <span class="linespan">验证方式：</span>
	        <select name="authType" class="" id="loginverify" onchange="changeAuthType()">
	          <#list dictionaryList as dic>
	               <#if dic.code == authType!'${getConstant("dictionary.DIC_AUTH_TYPE_000")!""}'>
	                     <option value="${dic.code!''}" selected="selected">${dic.name!''}</option>
	               <#else>
	                     <option value="${dic.code!''}">${dic.name!''}</option>
	               </#if>
	          </#list>
	        </select>
	      </div>
	      <div class="verify">
	      <#if (showDiv?index_of('${getConstant("dictionary.DIC_AUTH_TYPE_000")!""}')>-1)>
	        <div class="phone-verify" id="phone-verify">
	        <form id="mobile_form" action="${ctx}/forget/checkAuth.jhtml" method="post" >
	        	<input type="hidden" id="mobile_authType" name="authType" value="${getConstant('dictionary.DIC_AUTH_TYPE_000')}" />


	          <div class="information-line-gy"><span class="linespan">手机号码：</span>
	            <p class="telPhone"><#if tel?length==11>${tel?substring(0,3)}****${tel?substring(tel?length-4)}</#if></p>
	          </div>
<!-- 	          <div class="information-note">若当前号码收不到校验短信（如手机丢失或号码停用等），请 <a href="javascript:void(0);" class="font-color-c">提交申请单</a> 由平台客服人员帮助处理 </div> -->
	          <div class="information-line-wyr information-line-gy findMyPassWord"><span class="linespan">验证码：</span>

	            <input type="text" id="mobile_authCode" name="authCode" class="input-g" value="" />
				  <div class="wrap-g">
                      <a href="javascript:void(0);" id="send_msg" class="send-msg-gy">免费获取短信验证码</a>
				  </div>
	            <em></em><p id="send_failed" style="display:none;font-size: 0.25rem;text-align: center">发送失败，请重试</p>
	            <p id="send_timeout" style="display:none;font-size: 0.25rem;text-align: center">请等待一分钟后发送您的请求</p></div>
	          <div class="information-note cx2 m-t-5" id="message_info"> 验证码已发出，请注意查收短信，如果没有收到，您可以在<strong class="font-color-b" id="second"> 60 </strong>秒后要求系统重新发送 </div>
	          <div  class="bottom-button" >
	          <!-- <a href="${ctx}/forget/init.jhtml" class="big-button-orange prev_step left" >上一步</a> -->
	          <a href="javascript:void(0);"  class="big-button">下一步</a>
	          </div>
	          </form>
	        </div>
	       </#if>
	       <#if (showDiv?index_of('${getConstant("dictionary.DIC_AUTH_TYPE_100")!""}')>-1)>
	        <div class="email-verify" id="email-verify">
	          <div class="information-line"><span class="linespan width100">您的邮箱：</span>
	            <P><#if (mail?length>0)><#assign local=mail?index_of("@") /><#if (local>-1)><#if (local>3)><#assign a=3 /><#assign b=local-a /><#else><#assign a=1 /><#assign b=local-1 /></#if>${mail?substring(0,a)}<#list 1..b as c>*</#list>${mail?substring(local)}</#if></#if></P>
	          </div>
<!-- 	          <div class="information-note"> 若当前邮箱收不到验证邮件（如邮箱长期不使用已被注销等），请 <a href="javascript:void(0);" class=" font-color-c">提交申请单</a> 由平台客服人员帮助处理</div> -->
	          <a href="javascript:void(0);" class=" small-button cx3 m-t-10" id="send_mail" style=" margin-left:110px;">发送验证邮件</a>
	          <div class="information-note m-t-10 cx4" id="mail_info">邮件已发送到您的邮箱，请按邮件中的提示操作，完成身份验证。<!--<a href="javascript:void(0);" class="font-color-c">立即查收邮件</a> --></div>
	        </div>
	        </#if>
	        <#if (showDiv?index_of('${getConstant("dictionary.DIC_AUTH_TYPE_200")!""}')>-1)>
	        <div class="answear-verify" id="answear-verify">
	        <form id="action_form" action="${ctx}/forget/checkAuth.jhtml" method="post" >
	        <input type="hidden" name="authType" value="${getConstant('dictionary.DIC_AUTH_TYPE_200')}" />
	          <div class="information-line-gy"><span class="linespan">问题一：</span>
	            <select name="ppCode0">
	            <#if pwProtectList?exists>
	              <#list pwProtectList as list>
	              <option value="${list.code!''}">${list.name!''}</option>
	              </#list>
	            </#if>
	            </select>
	          </div>
	           <div class="information-line-gy"><span class="linespan">问题一答案： </span>
	            <input type="text" name="ppAnswer0" class="input-g" value="" placeholder="请输入答案" maxlength="30"/>
	          </div>
	          <div class="information-line-gy"><span class="linespan">问题二： </span>
	            <select name="ppCode1">
	              <#if pwProtectList?exists>
	              <#list pwProtectList as list>
	              <option value="${list.code!''}">${list.name!''}</option>
	              </#list>
	            </#if>
	            </select>
	          </div>
	          <div class="information-line-gy"><span class="linespan">问题二答案： </span>
	            <input type="text" name="ppAnswer1" class="input-g" value="" placeholder="请输入答案" maxlength="30"/>
	          </div>
	          <div class="information-line-gy"><span class="linespan">问题三： </span>
	            <select name="ppCode2">
	              <#if pwProtectList?exists>
	              <#list pwProtectList as list>
	              <option value="${list.code!''}">${list.name!''}</option>
	              </#list>
	            </#if>
	            </select>
	          </div>
	          <div class="information-line-gy"><span class="linespan">问题三答案： </span>
	            <input type="text" name="ppAnswer2" class="input-g" value="" placeholder="请输入答案" maxlength="30"/>
	          </div>
	          <div style="text-align: center">
	          	<em></em>
	          </div>
	          <div  class="bottom-button p-t-40">
	          <!-- <a href="${ctx}/forget/init.jhtml" class="big-button-orange prev_step left" >上一步</a> -->
	          <a href="javascript:void(0);" class="big-button"  >下一步</a>
	          </div>
				<div class="fill-gy" style="height: 0.87rem;"></div>
			</form>
	        </div>
	        </#if>
	      </div>
	    </div>
	  </div>
	</div>

</#escape>
</#macro>
