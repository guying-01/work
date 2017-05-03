<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render data>
<#escape x as x?html>

    
<form id="isMobileForm" name="isMobileForm" action="${ctx}/member/updateMobileInfo.jhtml" method="POST">
<input type="hidden" name="token" id="token" value="${(token)!''}"/>
<input type="hidden" name="pageUrl" id="pageUrl" value="${(pageUrl)!''}"/>
    <div class="member-list-tab" >
        <h2 class="member-tit modify"> <a href="javascript:void(0);" onclick="javascript :history.go(-1);"></a><i>&nbsp;</i>绑定手机</h2>
     <div class="progress_three progress_B">
         <div class="coverColor"></div>
      <p class="progress_textA">验证身份</p>
      <p class="progress_textB font-color-b">验证手机号码</p>
      <p class="progress_textC">完成</p>
    </div>
     <div class="orderdedetail">
        <div class="information-line" style="padding: 0 0.5rem;"><span style="font-size: 0.22rem">
          绑定手机后，您可享受手机号码登录、手机找回密码、手机动态密码等服务。输入您要绑定的手机号码并点击免费获取短信验证码，系统将自动向该手机发送包含验证码的短信，请注意查收短信并及时提交验证码。 </span> </div>
        <div class="verify">
<#---->
          <div class="phone-verify" id="phone-verify" style="padding-bottom: 1.5rem">
            <div class="information-line-gy"><span class="linespan">手机号码：</span>
              <input type="text" class="input-g bindPhone" value="" id="mobile" name="mobile" maxlength="11" placeholder="请输入手机号码" style="font-size: 0.22rem"/>
            </div>
            <div class="information-line-gy"><span class="linespan">验证码：</span>
              <input type="text" class="input-g bindPhone" value="" name="authCode" />
                 <div class="wrap-g"><a href="javascript:void(0);" class="send-msg-gy" id="send_msg">免费获取短信验证码</a></div>
            </div>

            <div class="information-note cx2 m-t-5" id="timeshow">
            	验证码已发出，请注意查收短信，如果没有收到，您可以在<strong class="font-color-b" id="second"> 60 </strong>秒后要求系统重新发送 </div>
            <div  class="bottom-button p-t-40">
            <a href="javascript:void(0);" class="big-button" onClick="saveMobile()" >下一步</a>
            </div>
          </div>
<#----> 
          <div class="email-verify" id="email-verify">
            <div class="information-line-gy"><span class="linespan">您的邮箱：</span>
              <P>dlw***********@163.com</P>
            </div>
           
            <a href="javascript:void(0);" class=" small-button cx3" style=" margin-left:70px;">发送验证邮件</a>
            <div class="information-note m-t-10 cx4">邮件已发送到您的邮箱dlw***********@163.com，请按邮件中的提示操作，完成身份验证。</div>
          </div>
<#----> 
        </div>
      </div>      
      </div>
</form>    
    
</#escape>
</#macro>