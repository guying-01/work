<#include "/common/common_var_definds.ftl" />
<#macro render data>
	<#escape x as x?html>
    <style>
        .small-button {
            margin-left: 0.1rem;
        }
        .information-line {
            overflow: hidden;
            padding: 0.1rem 0;
        }

        .information-line input {
            width: 48%;
            display: inline-block;
        }
        #submitForm {
            background: #fff;
            padding-top: 0.1rem;
        }
        .linespan {
            width: 25%;
            font-size: 0.25rem;
            line-height: 0.55rem;
            padding-left: 0.2rem;
            text-align: right;
            display: inline-block;
        }
        .linespan em {
            color: red;
            padding-right: 0.03rem;
        }
        .bottom-button {
            overflow: hidden;
            background: #fff;
        }
        .big-button {
            float: left;
            margin-left: 2.3rem;
            margin-top: 0.2rem;
        }
        #showMobile {
            padding-left: 0.1rem;
            font-size: 0.22rem;
        }

        input{
            font-size: 0.22rem;
        }
        #sendSmsAgainCountdownDiv {
            display: block;
            padding-left: 2rem;
            line-height: 0.5rem;
            font-size: 0.22rem;
        }
        .member-tit {
            background: #fff;
            overflow: hidden;
        }
        .label-g{
            margin-left: 29%;
        }
        .member-tit i {
            background: url("${resources}/img/member/goBack.png") no-repeat center center;
            display: inline-block;
            width: 5%;
            height: 100%;
            float: left;
            background-size: contain;
            margin: 0;
            padding: 0;
            margin-left: 0.2rem;
        }
        .member-tit span {
            text-align: center;
            display: inline-block;
            width: 83%;
            height: 100%;
            float: left;
            font-size: 0.25rem;
        }
        .msg {
            display: block;
            width: 80%;
            margin: 0 auto;
            font-size: 0.22rem;
        }
    </style>
    <h2 class="member-tit">
      <i onClick="javascript :history.back(-1);"></i><span>提现密码</span>
    </h2>
    <input id="mobile" name="mobile" type="hidden" value="${lrMobile!''}"/>
    <input id="userCode" name="userCode" type="hidden" value="${memberForm.userCode!''}"/>

    
    <form action="/gdb_sellercash/modifySellerCashAccountPassword.jhtml" id="submitForm" method="post">
      <div class="information-into">
        <div class="information-line">
          <span class="linespan">手机号码：</span>
          <span id="showMobile"></span>
          <a href="javascript:void(0);" id="sendSmsVerificationCodeBtn" class="small-button" >发送验证码</a>
          <span id="sendSmsAgainCountdownDiv" style="display:none">
            <span id="sendSmsAgainCountdownSecond"></span>秒后可再次发送验证码短信
          </span>
        </div>
        <div class="information-line">
          <span class="linespan"><em>*</em>验证码：</span>
          <input id="verificationCode" name="verificationCode" type="text" class="text_A  required" minlength="6" maxlength="6" onkeyup="this.value=this.value.replace(/\s/gi,'')" placeholder="请输入验证码" verificationCodeCheck="true"/>
        </div>
        <div class="information-line">
          <span class="linespan"><em>*</em>新密码：</span>
          <input id="password" name="password" type="password" class="text_A  required" minlength="6" maxlength="16" onkeyup="this.value=this.value.replace(/\s/gi,'')" passwordCheck="true", placeholder="请输入密码" />
          <input id="memberWithdrawCashPassword" name="memberWithdrawCashPassword" type="hidden"/>
        </div>
        <div class="information-line">
          <span style="color:red" class="msg">密码由6-16位字符组成，支持字母、数字及'_'组合且不可与账户名称相同</span>
        </div>
        <div class="information-line">
          <span class="linespan"><em>*</em>再次输入：</span>
          <input id="passwordVerify" name="passwordVerify" type="password" class="text_A  required" minlength="6" maxlength="16" onkeyup="this.value=this.value.replace(/\s/gi,'')" passwordCheck="true", placeholder="请再次输入密码" passwordVerifyCheck="true"/>
        </div>
      </div>
    </form>
    <div class="bottom-button">
      <a href="javascript:void(0);" id="submitBtn" class="big-button" >确定</a>
    </div>
	</#escape>
</#macro> 