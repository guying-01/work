<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render data>
<#escape x as x?html>
<form id="updatePwdProtectForm" name="updatePwdProtectForm" method='post' action="${ctx}/member/toUpdatePwdProtectInfoEnd.jhtml">
	<input type="hidden" name="token" value="${(token)!''}"/>
    <div class="member-list-tab" >
        <h2 class="member-tit modify"> <a href="javascript:void(0);" onclick="javascript :history.go(-1);"></a><i>&nbsp;</i>设置密保问题</h2>
      <div class="progress_three progress_B">
          <div class="coverColor"></div>
        <p class="progress_textA">验证身份</p>
        <p class="progress_textB font-color-b">设置密保问题</p>
        <p class="progress_textC">完成</p>
      </div>
      <div class=" note-password">请您设置便于记忆且不容易被他人获取的密保问题及答案，并定期重新设置，避免遗忘。不要向他人透露您的密保问题及答案。</div>
      <div class="orderdedetail">
        <div class="information-line-gy"><span class="linespan">问题一：</span>
          <select name="ppCode0"  id="question1" style="margin-left: 0;vertical-align: middle;">
		          <#if questions?exists>
		             <#list questions as dic>
		             	<option value="${dic.code!''}">${dic.name!''}</option>
		             </#list>
		          </#if>
		  </select>
        </div>
        <div class="information-line-gy"><span class="linespan">问题一答案： </span>
          <input type="text" name="ppAnswer0" class="input-g changeQusText" value="" placeholder="1-30个字符" maxlength="30" minlength="6"/>
          <label class="errorwrong" id="ppAnswer0Tip" ><div class="label-g" style="display:none;">请设置问题一答案</div> </label>
          <label class="errorwrong" id="minlength0Check"> <div class="label-g" style="display:none;">请输入字数大于1个</div> </label>
        </div>
        <div class="information-line-gy"><span class="linespan">问题二： </span>
          <select name="ppCode1"  id="question2" style="margin-left: 0;vertical-align: middle;">
		        <#if questions?exists>
		             <#list questions as dic>
		             	<option value="${dic.code!''}">${dic.name!''}</option>
		             </#list>
		        </#if>
		  </select>
        </div>
        <div class="information-line-gy"><span class="linespan">问题二答案： </span>
          <input type="text" name="ppAnswer1" class="input-g changeQusText" value="" placeholder="1-30个字符" maxlength="30"/>
          <label class="errorwrong" id="ppAnswer1Tip"><div class="label-g" style="display:none;">请设置问题二答案</div>  </label>
                  <label class="errorwrong" id="minlength1Check"><div class="label-g" style="display:none;">请输入字数大于1个</div></label>
        </div>
        <div class="information-line-gy"><span class="linespan">问题三： </span>
          <select name="ppCode2"  id="question3" style="margin-left: 0;vertical-align: middle;">
		        <#if questions?exists>
		             <#list questions as dic>
		             	<option value="${dic.code!''}">${dic.name!''}</option>
		             </#list>
		        </#if>
		  </select>
        </div>
        <div class="information-line-gy"><span class="linespan">问题三答案： </span>
          <input type="text" name="ppAnswer2" class="input-g changeQusText" value="" placeholder="1-30个字符" maxlength="30"/>
          <label class="errorwrong" id="ppAnswer2Tip"><div class="label-g" style="display:none;">请设置问题三答案</div>  </label>
                  <label class="errorwrong" id="minlength2Check"><div class="label-g" style="display:none;">请输入字数大于1个</div>  </label>
        </div>
        <div  class="bottom-button p-t-40"><a href="javascript:void(0);" class="big-button" onClick="saveProStep()" >下一步</a></div>
         <div class="checkAuthFill"></div>
      </div>
    </div>
</form>   
</#escape>
</#macro>