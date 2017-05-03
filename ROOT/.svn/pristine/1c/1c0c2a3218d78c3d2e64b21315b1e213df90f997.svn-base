<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render data>
<#escape x as x?html>
<div class="member-list-tab" >
  <h2 class="member-tit"> <i>&nbsp;</i>绑定手机</h2>
  <div class="progress_three progress_C">
    <p class="progress_textA">验证身份</p>
    <p class="progress_textB">验证手机号码</p>
    <p class="progress_textC font-color-b">完成</p>
  </div>
  <div class="web-note m-a no-border">
    <h2>您的手机${(phone)}绑定成功</h2>
    <P>您可以<a href="${ctx}/member/toUpdateSecurityInfo.jhtml" class="font-color-c"> 返回安全设置 </a> 或 <a href="${ctx}/index.jhtml" class="font-color-c">前往商城首页</a></P>
  </div>
  <p>&nbsp;</p>
</div>    
</#escape>
</#macro>