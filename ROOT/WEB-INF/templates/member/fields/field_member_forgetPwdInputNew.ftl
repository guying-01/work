<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>

<div class="content-right">
<div class="member-list-tab" >
  		<h2 class="member-tit modify"><a href="javascript:void(0);" onclick="javascript :history.go(-1);"></a><i>&nbsp;</i>找回登录密码</h2>
      <div class="progress_four progress_C">
      <div class="coverColor_C"></div>
      <p class="progress_textA progress_four_A" >输入用户名</p>
      <p class="progress_textB progress_four_B">验证身份</p>
      <p class="progress_textC progress_four_C font-color-b">设置新密码</p>
      <p class="progress_textD progress_four_D">完成</p>
      </div>
       <div class=" note-password"> 登录密码由6-16位字符，支持字母、数字及'_'组合。为了您的账号安全，密码不可与账户名称相同。</div>
    <div class="orderdedetail">
      <form action="${ctx}/forget/updateForgetPassword.jhtml" id="forgetPwdForm" name="forgetPwdForm" method="post">
      <input id="pwStrength" name="pwStrength" type="hidden" value="1"/>
      <input id="token" name="token" type="hidden" value="${(token)!''}"/>
      <input id="id" name="id" value="${(id)!''}" type="hidden"/>
      <input id="userCode" name="userCode" value="${(userCode)!''}" type="hidden" />
       <div class="information-line-gy"><span class="linespan ">新密码：</span>
          <input id="newPassword1" name="newPassword1" type="password" class="input-g" onKeyUp="pwdStrongCheck(this.value)" placeholder="请输入新的登录密码" maxlength="16"/>
           <div id="pwdStren3" class="bg_red pwdStren123" style="display:none;">密码强度：强</div>
           <div id="pwdStren2" class="bg_yellow pwdStren123" style="display:none;">密码强度：中</div>
           <div id="pwdStren1" class="bg_green pwdStren123" style="display:none;">密码强度：弱</div>
          <input type="hidden" name="newPassword" id="newPassword"/>

        </div>
         <div class="information-line-gy"><span class="linespan">确认密码：</span>
          <input type="password" name="twoPassword" id="twoPassword" class="input-g" value="" placeholder="再次输入新密码" maxlength="16"/>
        </div>
        <div class="bottom-button p-t-40" >
        <a href="javascript:void(0)" onClick="updateForgetPwd()" class="big-button">下一步</a></div>
       </form>
      </div>
    </div>
	   </div>
     </div>
</#escape>
</#macro>
