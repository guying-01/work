<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<#assign tel=((memberDetailInfoForm.lrMobile)!'') />
<#assign mail=((memberDetailInfoForm.buyerEmail)!'') />
    <div class="member-list-tab" style="padding-bottom: 1rem">
      <#import "field_member_"+pageUrl+".ftl" as pageUrl />
      <@pageUrl.render data?? />
      <div class="orderdedetail">
        <div class="information-line"><span class="linespan typeRej">验证方式：</span>
          <select name=""  id="loginverify" onchange="changeAuthType()">
            <#list dictionaryList as dic>
	               <#if dic.code == authType!"${getConstant('dictionary.DIC_AUTH_TYPE_000')!''}">
	                     <option value="${dic.code!''}" selected="selected">${dic.name!''}</option>
	               <#else>
	                     <option value="${dic.code!''}">${dic.name!''}</option>
	               </#if>
	          </#list>
          </select>
        </div>
        <div class="verify">
        <#-------------------------------------------------手机验证------------------------------------------------>
        <#if (showDiv?index_of("${getConstant('dictionary.DIC_AUTH_TYPE_000')!''}")>-1)>
          <div class="phone-verify" id="phone-verify">
          <form id="mobile_form"  method="post" >
          <input id="mobile_pageUrl" type="hidden" name="pageUrl" />
	        <input id="mobile_authType" type="hidden" name="authType" />
	        <input type="hidden" name="mobile" id="mobile" value="${(memberDetailInfoForm.lrMobile)!''}"/>
            <div class="information-line phoneNum"><span class="linespan" style="width: 1.3rem;">手机号码：</span>
              <P class="userPhoneNum"><#if tel?length==11>${tel?substring(0,3)}****${tel?substring(tel?length-4)}</#if></P>
            </div>
            <div class="information-line-gy"><span class="linespan" >验证码：</span>
              <input type="text" class="input-g" value="" id="mobile_authCode" name="authCode"/>
				<div class="wrap-g">
                    <a href="javascript:void(0);" class="send-msg-gy" id="send_msg" >免费获取短信验证码</a>
				</div>
              <p id="send_failed" style="display:none">发送失败，请重试</p>
	            <p id="send_timeout" style="display:none ;margin-top: 0.1rem;">请等待一分钟后发送您的请求</p> </div>
            <div class="information-note cx2 m-t-5" id="message_info" > 验证码已发出，请注意查收短信，如果没有收到，您可以在<strong class="font-color-b" id="second"> 60 </strong>秒后要求系统重新发送。 </div>
            <div  class="bottom-button p-t-40" ><a href="javascript:void(0);" class="big-button" id="next_step" >下一步</a></div>
            </form> 
          </div>
           </#if>
          <#----------------------------------------------邮箱验证------------------------------------------------>
          <#if (showDiv?index_of("${getConstant('dictionary.DIC_AUTH_TYPE_100')!''}")>-1)>
          <div class="email-verify" id="email-verify">
            <div class="information-line-gy"><span class="linespan width100">您的邮箱：</span>
              <P><#if (mail?length>0)><#assign local=mail?index_of("@") /><#if (local>-1)><#if (local>3)><#assign a=3 /><#assign b=local-a /><#else><#assign a=1 /><#assign b=local-1 /></#if>${mail?substring(0,a)}<#list 1..b as c>*</#list>${mail?substring(local)}</#if></#if></P>
            </div>
            <a href="javascript:void(0);" class=" small-button cx3 m-t-10" style=" margin-left:110px;" id="send_mail">发送验证邮件</a>
            <div class="information-note m-t-10 cx4" id="mail_info">邮件已发送到您的邮箱，请按邮件中的提示操作，完成身份验证。
           </div>
          </div>
          </#if>
          <#---------------------------------------------密保问题验证------------------------------------------------>
          <#if (showDiv?index_of("${getConstant('dictionary.DIC_AUTH_TYPE_200')!''}")>-1)>
          <div class="answear-verify" id="answear-verify">
	        <form id="action_form" method="post" >
	        <input type="hidden" name="pageUrl" />
	        <input type="hidden" name="authType" />
	          <div class="information-line-gy"><span class="linespan">问题一：</span>
	            <input type="hidden" name="ppCode0" value="
	               <#if pwProtectList?exists>
		              <#list pwProtectList as list>
		              <#if memberPwProtectForms ?? && memberPwProtectForms?size gt 0>
		              <#list memberPwProtectForms as protect>
		              	<#if list.code == protect.ppCode && protect.ppNo ==0 >${(list.code)!''}</#if>
		              </#list>
	              	  </#if>
		              </#list>
		            </#if>
	            ">
	            <span class="linespan" style="padding-left: 0;width:auto">
	            	<#if pwProtectList?exists>
		              <#list pwProtectList as list>
		              <#if memberPwProtectForms ?? && memberPwProtectForms?size gt 0>
		              <#list memberPwProtectForms as protect>
		              	<#if list.code == protect.ppCode && protect.ppNo ==0 >${(list.name)!''}</#if>
		              </#list>
	              	  </#if>
		              </#list>
		            </#if>
	            </span>
	          </div>
	          <div class="information-line-gy"><span class="linespan">问题一答案： </span>
	            <input type="text" name="ppAnswer0" class="input-g" value="" placeholder="请输入答案" maxlength="30" onchange="errorMessageShowHide()" style="display: inline-block"/>
	          </div>
	          <div class="information-line-gy"><span class="linespan">问题二： </span>
               <input type="hidden" name="ppCode1" value="
	               <#if pwProtectList?exists>
		              <#list pwProtectList as list>
		              <#if memberPwProtectForms ?? && memberPwProtectForms?size gt 0>
		              <#list memberPwProtectForms as protect>
		              	<#if list.code == protect.ppCode && protect.ppNo ==1 >${(list.code)!''}</#if>
		              </#list>
	              	  </#if>
		              </#list>
		            </#if>
	            ">
	            <span class="linespan" style="padding-left: 0;width:auto">
	            	<#if pwProtectList?exists>
		              <#list pwProtectList as list>
		              <#if memberPwProtectForms ?? && memberPwProtectForms?size gt 0>
		              <#list memberPwProtectForms as protect>
		              	<#if list.code == protect.ppCode && protect.ppNo ==1 >${(list.name)!''}</#if>
		              </#list>
	              	  </#if>
		              </#list>
		            </#if>
	            </span>
	          </div>
	          <div class="information-line-gy"><span class="linespan">问题二答案： </span>
	            <input type="text" name="ppAnswer1" class="input-g" value="" placeholder="请输入答案" maxlength="30" onchange="errorMessageShowHide()" style="display: inline-block"/>
			  </div>
	          <div class="information-line-gy"><span class="linespan">问题三： </span>
               <input type="hidden" name="ppCode2" value="
	               <#if pwProtectList?exists>
		              <#list pwProtectList as list>
		              <#if memberPwProtectForms ?? && memberPwProtectForms?size gt 0>
		              <#list memberPwProtectForms as protect>
		              	<#if list.code == protect.ppCode && protect.ppNo ==2 >${(list.code)!''}</#if>
		              </#list>
	              	  </#if>
		              </#list>
		            </#if>
	            ">
	            <span class="linespan" style="padding-left: 0;width:auto">
	            	<#if pwProtectList?exists>
		              <#list pwProtectList as list>
		              <#if memberPwProtectForms ?? && memberPwProtectForms?size gt 0>
		              <#list memberPwProtectForms as protect>
		              	<#if list.code == protect.ppCode && protect.ppNo ==2 >${(list.name)!''}</#if>
		              </#list>
	              	  </#if>
		              </#list>
		            </#if>
	            </span>
	          </div>
	          <div class="information-line-gy"><span class="linespan">问题三答案： </span>
	            <input type="text" name="ppAnswer2" class="input-g" value="" placeholder="请输入答案" maxlength="30" onchange="errorMessageShowHide()" style="display: inline-block"/>
	          </div>
	          <div class="bottom-button" id="errorMessage">
	          	<p><em style="padding-left:8px;color:red;"></em></p>
	          </div>
	          <div  class="bottom-button p-t-40">
			  		<a href="javascript:void(0);" class="big-button" id="mibao_next_step" >下一步</a>
			  </div>
	          </form>
	        </div>
          </#if>
        </div>
      </div>
    </div>
    
</#escape>	
</#macro>