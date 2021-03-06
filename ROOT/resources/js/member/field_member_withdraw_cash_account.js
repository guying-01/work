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
    initDataTable();
    // initAreaSelect('', 'bankProvince','86', null);
    // initBankSelect();
    $('.oper-btn a').click(function () {
        $(this).hide();
    })
    $('#cancelBtn').click(function () {
        if ($('.cashAccountBox').length == 0) {
            $('.oper-btn a').show();
        }
    })
});

function initAreaSelect(areaSourceId, areaInitId, parentId, initValue, bankCode){
  if(parentId == null || parentId == undefined){
    parentId = $("#"+areaSourceId).find("option:selected").attr("areaId");
　　}
  
  callService("/memberWithdrawCash/findAreaByParentId.ajax", {"parentId":parentId}, {
    callSuccess : function(resultJson) {
      if (resultJson.success) {
        var areaList = resultJson.result;
        var html="<option value='' areaId='' bankCode='' selected dm-container='select2'>请选择</option>";
        for(var i=0; i<areaList.length; i++){
          html+='<option value="'+areaList[i].name+'" areaId="'+areaList[i].id+'" bankCode="'+areaList[i].bankCode+'">'+areaList[i].name+'</option>';
        }
        $("#" + areaInitId).html(html);
        if(initValue != null && initValue != undefined){
            $("#" + areaInitId).val(initValue);
            initBankBubBranchSelect(bankCode);
        }
      } else {
        jsErrAlert(resultJson.message);
      }
    },
    callError : function(textStatus, errorThrown, error) {
      jsErrAlert("获取区域信息失败");
    }
  });
}
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

function hideMobile4Center(){
    var mobile = $("#mobile").val();
    $("#showMobile").html(mobile.substr(0, 3) + '****' + mobile.substr(7));
}

function bindButton(){
    $("#addMemberWithDrawCashAccountBtn").bind('click', function() {
        showAddMemberWithDrawCashAccount();
    });

    $("#sendSmsVerificationCodeBtn").bind('click', function() {
        sendSmsVerificationCode();
    });

    $("#submitBtn").bind('click', function() {
        saveMemberWithDrawCashAccount();
    });

    $("#cancelBtn").bind('click', function() {
        hideAddMemberWithDrawCashAccount();
        clearEditForm();
    });
}

function initValidator(){
    jQuery.validator.addMethod("illegalAccountNameCheck", function(value, element) {
        return jQuery.validator.prototype.optional(element) || /^[\u4e00-\u9fa5a-zA-Z0-9\s]{1,25}$/.test(value);
    }, "只能由汉字,字母和数字组成,不能包含特殊字符,不能超过25个字符");

    jQuery.validator.addMethod("illegalBankAccountCheck", function(value, element) {
        return jQuery.validator.prototype.optional(element) || /^\d+$/.test(value);
    }, "只能16到19位数字组成");

    jQuery.validator.addMethod("illegalBankNameCheck", function(value, element) {
        return jQuery.validator.prototype.optional(element) || /^[\u4e00-\u9fa5a-zA-Z0-9\s]{1,100}$/.test(value);
    }, "只能由汉字,字母和数字组成,不能包含特殊字符,不能超过100个字符");

    jQuery.validator.addMethod("verificationCodeCheck", function(value, element) {
        var isPassed = false;
        var mobile = $("#mobile").val();
        callService("/memberWithdrawCash/checkVerificationCodeForAccount.ajax",{mobile:mobile,verificationCode:value},{async : false,
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

function initDataTable(){
    //dataTable = $("#memberWithDrawCashAccountListTable").DataTable({
    //    "stateSave": true,
    //    "ajax" : {
    //        "url" : "/memberWithdrawCash/findMemberWithdrawCashAccountListByPage.ajax?",
    //        "type" : "POST"
    //    },
    //    "columns" : [{
    //        "sClass" : "center",
    //        "mRender" : function(obj, type, rowData) {
    //            return rowData.baseBankName;
    //        }
    //    },{
    //        "sClass" : "center",
    //        "mRender" : function(obj, type, rowData) {
    //            return rowData.accountName;
    //        }
    //    },{
    //        "sClass" : "center",
    //        "mRender" : function(obj, type, rowData) {
    //            return rowData.bankAccount;
    //        }
    //    },{
    //        "sClass" : "center",
    //        "mRender" : function(obj, type, rowData) {
    //            return rowData.bankName;
    //        }
    //    },{
    //        "sClass" : "center",
    //        "mRender" : function(obj, type, rowData) {
    //            return rowData.bankProvince + '-' + rowData.bankCity;
    //        }
    //    },{
    //        "sClass" : "center",
    //        "mRender" : function(obj, type, rowData) {
    //            var editBtn = '<a class="font-color-b" href="javascript:editMemberWithDrawCashAccount(\''
    //                + rowData.id
    //                + '\');" class="btn btn-xs btn-primary m-2"><i class="fa fa-eye"></i> 修改</a>';
    //            var deleteBtn = '<a class="font-color-b" href="javascript:deleteMemberWithDrawCashAccount(\''
    //                + rowData.id + '\',\'' +rowData.bankAccount
    //                + '\');" class="btn btn-xs btn-primary m-2"><i class="fa fa-eye"></i> 删除</a>';
    //
    //
    //
    //            return editBtn + deleteBtn;
    //        }
    //    }
    //    ],
    //    "fnDrawCallback" : function() {
    //        $('.dataTables_info').css('margin-left', '15px');
    //        $('.dataTables_length').css('margin-left', '10px');
    //        $('.dataTables_length').css('margin-top', '10px');
    //    }
    //});
    var url = '/memberWithdrawCash/findMemberWithdrawCashAccountListByPage.ajax';
    var param = {
        start:0,
        length:10
    };
    $.ajax({
        type:'post',
        url:url,
        async: false,
        data:param,
        success:function(data){
            if (data.data.length == 0) {
                $('.oper-btn a').show();
            }
          var data=data.data;
          var tmp=Handlebars.compile($('#cashList-tl').html())
          var tmpdata=tmp(data);
          $("#accountData").html(tmpdata)

        }

    })
}

function hidePage(){
    $("div[class='bottom']").hide();
}

function dataTableDrawCallBack(){
    if(dataTable.context[0].aoData.length > 0){
        $("#addMemberWithDrawCashAccountBtn").hide();
    } else {
        $("#addMemberWithDrawCashAccountBtn").show();
    }
}

function hideAddMemberWithDrawCashAccount(){
    $("#editH2").hide();
    $("#editFormDiv").hide();
}

function showAddMemberWithDrawCashAccount(){
    $("#editH2").show();
    $("#editFormDiv").show();
}

function clearEditForm(){
    $("#id").val("");
    $("#baseBankName").val("");
    $("#accountName").val("");
    $("#bankAccount").val("");
    $("#bankName").val("");
    $("#bankProvince").val("");
    $("#bankCity").val("");
    $("#bankDistrict").val("");
    $("#verificationCode").val("");
    $("#password").val("");
    $('#addMemberWithDrawCashAccountBtn').show()
}

function sendSmsVerificationCode(){
    if(isSendSmsVerificationCode){
        return;
    }

    isSendSmsVerificationCode = true;

    showSendSmsAgainCountdownDiv();
    countdownSendSmsAgain();

    var mobile = $("#mobile").val();
    callService("/memberWithdrawCash/sendSmsVerificationCodeForAccount.ajax",{mobile:mobile},{async : false,
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

function addMemberWithDrawCashAccount(){
    clearEditForm();
    showAddMemberWithDrawCashAccount();

}

function editMemberWithDrawCashAccount(id){
    showAddMemberWithDrawCashAccount();
    callService("/memberWithdrawCash/findMemberWithdrawCashAccountById.ajax",{id:id},{async : false,
        callSuccess:function(resultJson){
            if(resultJson.success){
            	$("#id").val(id);
                $("#baseBankName").val(resultJson.result.baseBankName);
                showOrhideBankCode();
                $("#bankCode").val(resultJson.result.bankCode);
                $("#accountName").val(resultJson.result.accountName);
                $("#bankAccount").val(resultJson.result.bankAccount);
                $("#bankName").val(resultJson.result.bankName);
                $("#bankProvince").val(resultJson.result.bankProvince);
                initAreaSelect('bankProvince', 'bankCity', null, resultJson.result.bankCity,resultJson.result.bankName);
                $("#verificationCode").val("");
                $("#password").val("");
            } else {
                jsErrAlert(resultJson.message);
            }
        },
        callError:function(textStatus, errorThrown, error){
          jsErrAlert("获取账户信息失败");
        }
    });
}

var isBankSelectInited = false;
function initBankSelect(){
    callService("/memberWithdrawCash/findAllBasBankList.ajax", {}, {
      callSuccess : function(resultJson) {
        if (resultJson.success) {
          var bankList = resultJson.result;
          var html="<option value='' bankCode='' selected dm-container='select2'>请选择</option>";
          for(var i=0; i<bankList.length; i++){
            html+='<option value="'+bankList[i].name+'" bankCode="'+bankList[i].code+'">'+bankList[i].name+'</option>';
          }
          $("#baseBankName").html(html);
          isBankSelectInited = true;
        } else {
          jsErrAlert(resultJson.message);
        }
      },
      callError : function(textStatus, errorThrown, error) {
        jsErrAlert("获取银行信息失败");
      }
    });
}

function initBankCode(){
    var bankCode = $("#bankName").find("option:selected").attr("bankCode");
    $("#bankCode").val(bankCode);
}

function showOrhideBankCode(){
    var basebankName = $("#baseBankName").val();
    if('广发银行' == basebankName){
        $("#bankCodeDiv").hide();
    } else {
        $("#bankCodeDiv").show();
    }
}

function initBankBubBranchSelect(bankCode){
    var basebankCode = $("#baseBankName").find("option:selected").attr("bankCode");
    var cityBankCode = $("#bankCity").find("option:selected").attr("bankCode");

    if(basebankCode == '' || basebankCode ==null || basebankCode == undefined || cityBankCode == '' || cityBankCode == null || cityBankCode == undefined){
        var html="<option value='' selected dm-container='select2'>请选择</option>";
        $("#bankName").html(html);
        $("#bankCode").val('');
        return;
    }

    var code = basebankCode.substring(0,3) + cityBankCode;

    callService("/memberWithdrawCash/findBasBankSubBranchListByCode.ajax", {"code":code}, {
      callSuccess : function(resultJson) {
        if (resultJson.success) {
          var bankList = resultJson.result;
          var html="<option value='' selected dm-container='select2'>请选择</option>";
          for(var i=0; i<bankList.length; i++){
            html+='<option value="'+bankList[i].name+'" bankCode="'+bankList[i].code+'">'+bankList[i].name+'</option>';
          }
          $("#bankName").html(html);
          if(bankCode != null && bankCode != undefined){
            $("#bankName").val(bankCode);
          } else {
            $("#bankCode").val('');
          }
        } else {
          jsErrAlert(resultJson.message);
        }
      },
      callError : function(textStatus, errorThrown, error) {
        jsErrAlert("获取银行支行信息失败");
      }
    });
}
function saveMemberWithDrawCashAccount(){
	if($("#editForm").valid()){
        if($("#baseBankName").val() == ''){
            jsErrAlert("请选择银行名称");
            return;
        }

        if($("#bankProvince").val() == '' || $("#bankCity").val() == ''){
            jsErrAlert("请完整选择开户银行所在地");
            return;
        }

        if($("#bankName").val() == ''){
            jsErrAlert("请选择开户银行网点名称");
            return;
        }


        var params = {};
        params.id = $("#id").val();
        params.baseBankName = $("#baseBankName").val();
        params.accountName = $("#accountName").val();
        params.bankAccount = $("#bankAccount").val();
        params.bankName = $("#bankName").val();
        params.bankCode = $("#bankCode").val();
        params.bankProvince = $("#bankProvince").val();
        params.bankCity = $("#bankCity").val();
        params.password = $.md5($("#password").val());
        params.mobile = $("#mobile").val();
        params.verificationCode = $("#verificationCode").val();

        callService("/memberWithdrawCash/saveMemberWithdrawCashAccount.ajax",params,{async : false,
            callSuccess:function(resultJson){
                if(resultJson.success){
                    jsAlert("保存成功",{
                        callback:function(){
                            location.replace(location.href);
                        }
                    });
                } else {
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
                jsErrAlert("保存失败");
            }
        }); 
	}
}

function deleteMemberWithDrawCashAccount(id, bankAccount){
	jsConfirm("确定要删除提现账号【"+bankAccount+"】吗？",{
		callback:function (flag) {
			if(flag == true){
				callService("/memberWithdrawCash/deleteMemberWithdrawCashAccountById.ajax",{id:id},{async : false,
			        callSuccess:function(resultJson){
			            if(resultJson.success){
				 			jsAlert("删除成功",{
                                callback:function(){
                                    location.replace(location.href);
                                }
                            });
			            } else {
			                jsErrAlert(resultJson.message);
			            }
			        },
			        callError:function(textStatus, errorThrown, error){
			          jsErrAlert("删除失败");
			        }
			    });
			}
		}
	})	
}