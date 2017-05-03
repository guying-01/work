<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#--引入左边个人信息导航栏-->
<#macro render data>
<#escape x as x?html>
<form action="${ctx}/member/updatePassword.jhtml" id="passwordsForm" name="passwordsForm" method="post">
<input type="hidden" name="token" value="${(token)!''}"/>
<input type="hidden" id="userCode" name="userCode" value="${(user.userCode)!''}"/>
<input id="pwStrength" name="pwStrength" type="hidden" value="1"/>
    <div class="member-list-tab" >
        <h2 class="member-tit modify"> <a href="javascript:void(0);" onclick="javascript :history.go(-1);"></a><i>&nbsp;</i>修改登录密码</h2>
      <div class="progress_three progress_B">
          <div class="coverColor"></div>
        <p class="progress_textA">验证身份</p>
        <p class="progress_textB font-color-b">重置密码</p>
        <p class="progress_textC">完成</p>
      </div>
      <div class=" note-password">登录密码由6-16位字符，支持字母、数字及'_'组合。为了您的账号安全，密码不可与账户名称相同。</div>
      <div class="orderdedetail orderDetail-gy">
        <input id="input_idForupdatePasswords" name="idForupdatePasswords" value="${(user.id)!''}" type="hidden">
        <div class="information-line-gy"><span class="linespan">当前密码：</span>
            <input name="passwordsShow" id="passwordsShow" type="password" class="input-g changePwdText" placeholder="请输入当前登录密码" onchange="validCurrentPwd()" maxlength="16" />
        <input name="passwords" id="passwords" type="hidden"/>
        </div>
        <div class="information-line-gy"><span class="linespan">新密码：</span>
          <input id="newPasswordsShow" name="newPasswordsShow" onKeyUp="pwdStrongCheck(this.value)" type="password" class="input-g changePwdText" placeholder="请输入新的登录密码" />
          <input name="newPasswords" id="newPasswords" type="hidden"/>
          <div class="bg_red" style="display:none;" id="pwdStren4" >密码强度：强</div>
          <div class="bg_yellow" id="pwdStren3" style="display:none;">密码强度：中</div>
          <div class="bg_green" id="pwdStren2" style="display:none;">密码强度：弱</div>

        </div>
        <div class="information-line-gy"><span class="linespan">确认密码：</span>
          <input type="password" class="input-g changePwdText" value="" id="twoPasswordsShow" name="twoPasswordsShow" maxlength="16"  placeholder="再次输入新密码"/>
          <input name="twoPasswords" id="twoPasswords" type="hidden"/>
        </div>
        <div  class="bottom-button p-t-40"><a href="javascript:void(0);" class="big-button" onClick="savePasswords()" >下一步</a></div>
      </div>
    </div>
    
<div class="clear"></div>
</form>
</#escape>
</#macro>