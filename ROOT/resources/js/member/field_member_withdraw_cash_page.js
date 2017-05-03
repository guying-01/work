/**
 * Created by Administrator on 2017/3/13.
 */
var isSendSmsVerificationCode = false;
var dataTable = null;
$('document').ready(function() {
    checkMemberCouldWithdraoCash();
    hideMobile4Center();
    initValidator();
    bindButton();
    changeCashAccount();
});

function checkMemberCouldWithdraoCash(){
    callService("/memberWithdrawCash/checkMemberCouldWithdraoCash.ajax",{},{async:true ,
        callSuccess:function(resultJson){
            if(resultJson.success){
                if(!resultJson.result.isSetupPassword){
                    jsErrAlert("您还没有设置提现密码", {
                        callback:function(){
                            $.dm.jumpTo("/memberWithdrawCash/toMemberWithdrawCashPassword.jhtml", {}, {'method' : 'post'});
                        }
                    });
                }
                if(!resultJson.result.isSetupAccount){
                    jsErrAlert("您还没有设置提现账户", {
                        callback:function(){
                            $.dm.jumpTo("/memberWithdrawCash/toMemberWithdrawCashAccount.jhtml", {}, {'method' : 'post'});
                        }
                    });
                }
            } else {
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

function formatCashAmount(cashAmount){
    cashAmount = cashAmount.replace(/^0{2,}/gi,'0');
    if(cashAmount.length > 1){
        if(cashAmount.substring(1,2) != "."){
            cashAmount = cashAmount.replace(/^0+/gi,'');
        }
    }
    return cashAmount;
}

function hideMobile4Center(){
    var mobile = $("#mobile").val();
    $("#showMobile").html(mobile.substr(0, 3) + '****' + mobile.substr(7));
}

function bindButton(){
    $("#smCashAccount").change(function() {
        changeCashAccount();
    });

    $("#sendSmsVerificationCodeBtn").bind('click', function() {
        sendSmsVerificationCode();
    });

    $("#submitBtn").bind('click', function() {
        memberWithdrawCash();
    });
}

function initValidator(){
    jQuery.validator.addMethod("cashAmountCheck", function(value, element) {
        if(!/^\d+(\.\d{1,2})?$/.test(value)){
            return false;
        }
        var accountBalance = parseFloat($("#accountBalance").val());
        var valueNum = parseFloat(value);
        if(accountBalance < valueNum || valueNum <= 0){
            return false;
        }
        return true;
    }, "只能填写数字（小数至多两位）,提现金额不能超过可用余额，不能为0元");

    jQuery.validator.addMethod("verificationCodeCheck", function(value, element) {
        var isPassed = false;
        var mobile = $("#mobile").val();
        callService("/memberWithdrawCash/checkVerificationCodeForWithDraw.ajax",{mobile:mobile,verificationCode:value},{async : false,
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

function changeCashAccount(){
    var account = $("#smCashAccount").find('option:selected').attr("account");
    $("#smCashAccountAccount").val(account);
}

function sendSmsVerificationCode(){
    if(isSendSmsVerificationCode){
        return;
    }

    isSendSmsVerificationCode = true;

    showSendSmsAgainCountdownDiv();
    countdownSendSmsAgain();

    var mobile = $("#mobile").val();
    callService("/memberWithdrawCash/sendSmsVerificationCodeForWithDraw.ajax",{mobile:mobile},{async : false,
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

var isMemberWithdrawCash = false;
function memberWithdrawCash(){
    if($("#editForm").valid() && !isMemberWithdrawCash){
        $.dm.block($('#editFormDiv'), {'message':'提现中，请稍后.....'});

        isMemberWithdrawCash = true;
        var params = {};
        params.smCashAccountId = $("#smCashAccount").val();
        params.smCashAccountAccount = $("#smCashAccountAccount").val();
        params.cashAmount = $("#cashAmount").val();
        params.password = $.md5($("#password").val());
        params.mobile = $("#mobile").val();
        params.verificationCode = $("#verificationCode").val();

        callService("/memberWithdrawCash/memberWithdrawCash.ajax",params,{
            callSuccess:function(resultJson){
                if(resultJson.success){
                    $.dm.unblock($('#editFormDiv'));
                    jsAlert("提现成功",{
                        callback:function(){
                            $.dm.jumpTo("/member/index.jhtml", {}, {'method' : 'post'});
                        }
                    });
                } else {
                    $.dm.unblock($('#editFormDiv'));
                    isMemberWithdrawCash = false;
                    jsErrAlert(resultJson.message,{
                        callback:function(){
                            if(resultJson.result == 1){
                                $.dm.jumpTo("/member/index.jhtml", {}, {'method' : 'post'});
                            }
                        }
                    });
                }
            },
            callError:function(textStatus, errorThrown, error){
                $.dm.unblock($('#editFormDiv'));
                isMemberWithdrawCash = false;
                jsErrAlert("提现失败");
            }
        });
    }
}