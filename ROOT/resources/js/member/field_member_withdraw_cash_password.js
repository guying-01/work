/**
 * Created by Administrator on 2017/3/13.
 */
var isSendSmsVerificationCode = false;

$(document).ready(function(){
    checkMemberCouldWithdraoCash();
    hideMobile4Center();
    initValidator();
    bindButtonEvent();
});

function checkMemberCouldWithdraoCash(){
    callService("/memberWithdrawCash/checkMemberCouldWithdraoCash.ajax",{},{async:true ,
        callSuccess:function(resultJson){
            if(!resultJson.success){
                jsErrAlert(resultJson.message, {
                    callback:function(){
                        $.dm.jumpTo("/member/index.jhtml", {}, {'method' : 'post'});
                    }
                });
            }
        },
        callError:function(textStatus, errorThrown, error){
            jsErrAlert("验证账户状态失败", {
                callback:function(){
                    $.dm.jumpTo("/member/index.jhtml", {}, {'method' : 'post'});
                }
            });
        }
    });
}

function hideMobile4Center(){
    var mobile = $("#mobile").val();
    $("#showMobile").html(mobile.substr(0, 3) + '****' + mobile.substr(7));
}

function initValidator(){
    jQuery.validator.addMethod("passwordCheck", function(value, element) {
        var isPassed = jQuery.validator.prototype.optional(element) || /^[a-zA-Z0-9_]{6,16}$/.test(value);
        if(!isPassed){
            return false;
        }

        var userCode = $("#userCode").val();
        if(userCode == value){
            return false;
        }

        return true;
    }, "密码由6-16位字符组成，支持字母、数字及'_'组合且不可与账户名称相同");

    jQuery.validator.addMethod("passwordVerifyCheck", function(value, element) {
        var password = $("#password").val();
        if(password != value){
            return false;
        }
        return true;
    }, "两次输入的密码不相同");

    jQuery.validator.addMethod("verificationCodeCheck", function(value, element) {
        var isPassed = false;
        var mobile = $("#mobile").val();
        callService("/memberWithdrawCash/checkVerificationCodeForPassword.ajax",{mobile:mobile,verificationCode:value},{async : false,
            callSuccess:function(resultJson){
                if(resultJson.success){
                    isPassed = true;
                } else {
                    isPassed = false;
                }
            },
            callError:function(textStatus, errorThrown, error){
                isPassed = false;
            }
        });
        return isPassed;
    }, "<div class='label-g'>验证码错误或超过有效时间</div>");
};

function bindButtonEvent(){
    $("#sendSmsVerificationCodeBtn").bind("click", function(){
        sendSmsVerificationCode();
    });

    $("#submitBtn").bind("click", function(){
        $("#memberWithdrawCashPassword").val($.md5($("#password").val()));
        submitForm();
    });
}

function submitForm(){
    if($("#submitForm").valid()){
        var params = {};
        params.mobile = $("#mobile").val();
        params.verificationCode = $("#verificationCode").val();
        params.password = $("#memberWithdrawCashPassword").val();

        callService("/memberWithdrawCash/modifyMemberWithdrawCashPassword.ajax",params,{async : false,
            callSuccess:function(resultJson){
                if(resultJson.success){
                    jsAlert("提现密码设置成功", {
                        callback:function(){
                            $.dm.jumpTo("/member/index.jhtml", {}, {'method' : 'post'});
                        }
                    });
                } else {
                    jsErrAlert(resultJson.message);
                }
            },
            callError:function(textStatus, errorThrown, error){
              jsErrAlert("保存提现密码失败");
            }
        });
    }
}

function sendSmsVerificationCode(){
    if(isSendSmsVerificationCode){
        return;
    }

    isSendSmsVerificationCode = true;

    showSendSmsAgainCountdownDiv();
    countdownSendSmsAgain();

    var mobile = $("#mobile").val();
    callService("/memberWithdrawCash/sendSmsVerificationCodeForPassword.ajax",{mobile:mobile},{async : false,
        callSuccess:function(resultJson){
            if(resultJson.success){
                isSendSmsVerificationCode = false;
            } else {
                jsErrAlert(resultJson.message);
                isSendSmsVerificationCode = false;
                hideSendSmsAgainCountdownDiv();
            }
        },
        callError:function(textStatus, errorThrown, error){
          jsErrAlert("验证码短信发送失败，请重新发送验证码短信");
          hideSendSmsAgainCountdownDiv();
          isSendSmsVerificationCode = false;
        }
    });
}

function showSendSmsAgainCountdownDiv(){
    $("#sendSmsVerificationCodeBtn").removeClass('small-button');
    $("#sendSmsVerificationCodeBtn").addClass('small-button-greay');
    $("#sendSmsVerificationCodeBtn").unbind("click");
    $("#sendSmsAgainCountdownDiv").show();
}

function hideSendSmsAgainCountdownDiv(){
    $("#sendSmsAgainCountdownDiv").hide();
    $("#sendSmsVerificationCodeBtn").bind("click",function(){
        sendSmsVerificationCode();
    });
    $("#sendSmsVerificationCodeBtn").removeClass('small-button-greay');
    $("#sendSmsVerificationCodeBtn").addClass('small-button');
}

function countdownSendSmsAgain(){
    $("#sendSmsAgainCountdownSecond").html('60');
    var interval = setInterval(function(){
        var second = $.trim($("#sendSmsAgainCountdownSecond").html());
        if(second < 1) {
            hideSendSmsAgainCountdownDiv();
            clearInterval(interval);
        }
        $("#sendSmsAgainCountdownSecond").html(--second);
    },1000);
}