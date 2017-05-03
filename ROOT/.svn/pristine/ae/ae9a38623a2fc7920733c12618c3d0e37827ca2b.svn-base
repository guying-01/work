<#include "/common/common_var_definds.ftl" /> <#macro render data>
<#escape x as x?html>
<div class="pop_up cx2" id="shopCarSucc">
	<div class="pop_noteB">
		<a href="javascript:void(0);" class="shut"><img
			src="${resources}/img/common/shutC.png" width="13" height="12"></a>
		<div class="pop_noteB-con">
			<i><img src="${resources}/img/common/popico1.png" width="32"
				height="33"></i><span class="font16">成功加入购物车~~</span>
		</div>
	</div>
</div>

<div class="pop_up" style="display: none;" id="login_popUp">
	<form id="loginForm" method="post"
		onkeydown="if(event.keyCode==13)$('#btnSubmit').click();">
		<div class="login">
			<div class="login-radius"></div>
			<a href="javascript:void(0);" class="loginShut shut"><img
				src="${resources}/img/goods/login-shut1.png" onclick="loginshut()"
				onmouseover="this.src='${resources}/img/goods/login-shut2.png'"
				onmouseout="this.src='${resources}/img/goods/login-shut1.png'"></a>
			<h2>
				<a href="###">注册账户</a> <!-- hideregisterlink-->账号登录
			</h2>
			<div class="loginStyleA loginStyleA-ico1">
				<input id="userName" name="userName" type="text" placeholder="用户名">
				<label class="loginError clear" style="display: none; color: red;"
					id="usere"><u></u><i></i>用户名不能为空</label> <label
					class="loginError clear" style="display: none; color: red;"
					id="usere_2"><u></u><i></i>用户名和密码不匹配</label>
                <label
                        class="loginError clear" style="display: none; color: red;"
                        id="usere_3"><u></u><i></i>用户已锁定</label>
			</div>
			<div class="loginStyleA loginStyleA-ico2">
				 <input
					id="password" name="password" type="password" placeholder="密码">
				<label class="loginError clear" style="display: none; color: red;"
					id="pwde"><u></u><i></i>密码不能为空</label>
			</div>
			<#if ((loginErrorTimes!0)>3) >
			<div class="width300 loginStyleA-ico3 m-a" style="height: 40px;">
				<div class="loginStyleA width110 left  m-0">
					<input id="captcha" name="captcha" type="text" placeholder="验证码"
						class=" width100 m-a p-l-10" /> <label class="loginError clear"
						style="display: none; color: red;" id="captchaWrong"><u></u><i></i>您的验证码错误</label>

				</div>
				<img src="/kaptcha" class="left m-l-10" width="90" height="35"
					id="img_captcha" /> <a class="left m-l-10 m-t-10"
					onclick="javascript:refreshCaptcha('');">看不清换一张</a>
			</div>
			</#if>
			<div class="loginStyleA-bot">
				<!--<input name="" type="checkbox" value="">
       <p class="left">下次自动登录</p> -->
				<P class="right">
					<a href="/forget/init.jhtml">忘记密码</a>
				</P>
			</div>
			<a href="javascript:void(0);" class="loginStyleA-bt" id="btnSubmit">登&nbsp;&nbsp;录</a>
		</div>
	</form>
</div>
<script type="text/x-handlebars-template" id="captcha-tl">
			<div class="width300 loginStyleA-ico3 m-a" style="height: 40px;">
				<div class="loginStyleA width110 left  m-0">
					<input id="captcha" name="captcha" type="text" placeholder="验证码"
						class=" width100 m-a p-l-10" /> <label class="loginError clear"
						style="display: none;color: red;" id="captchaWrong"><u></u><i></i>您的验证码错误</label>

				</div>
				<img src="/kaptcha" class="left m-l-10" width="90" height="35"
					id="img_captcha" /> <a class="left m-l-10 m-t-10"
					onclick="javascript:refreshCaptcha('');">看不清换一张</a>
			</div>
</script>
<script src="${resources}/js/goods/other.js"></script>
<script src="${resources}/js/goods/goods.js"></script>
<script src="${resources}/js/goods/lib.js"></script>
<script src="${resources}/js/goods/163css.js"></script>
</#escape> </#macro>
