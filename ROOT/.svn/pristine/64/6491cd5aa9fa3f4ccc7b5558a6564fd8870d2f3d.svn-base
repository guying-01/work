<#include "/common/common_var_definds.ftl" />
<#macro render data>
	<#escape x as x?html>
	<style>
		.member-tits {
			height: 0.8rem;
            background: #fff;
            border-bottom: 1px solid #bbb;
		}
        .member-tits i {
            display: inline-block;
            height: 0.8rem;
            width: 7%;
			float: left;
			background: url("${resources}/img/member/goBack.png") no-repeat center center;
			background-size: contain;
            margin-left: 0.1rem;
		}
        .member-tits span {
            line-height: 0.8rem;
            display: inline-block;
            float: left;
            font-size: 0.3rem;
            text-align: center;
            width: 80%;
		}
		.in_box div{
			font-size: 0.24rem;
		}
        .in_box span {
			font-size: 0.24rem;
		}
	</style>
    <h2 class="member-tits">
        <i onClick="javascript :history.back(-1);"></i><span>充值</span>
    </h2>
		<div class="bk_manage_main">
         <span style="font-size: 0.25rem;padding-left: 0.3rem;">您的账户信息：</span>
		<div class="balance_box" style="padding: 0.3rem 0.55rem 0.1rem;font-size: 0.25rem;">余额：<span>￥${(balance.balance)!''}</span></div>
		<div class="bk_mes_box" style="font-size: 0.24rem">
		<div class="in_box">
			<div><span class="mes_title">交易账户名：</span>${(tranAccName.tranAccName)!''}</div>
			<div><span class="mes_bk_name">开户银行网点名称：</span>${(bankBranchesName.bankBranchesName)!''}</div>
			<div class="acc_box" style="padding: 0;">交易账号：<span class="acc_nub">${(account.account)!''}</span></div>
					<div class="bt_box" style="width: 100%;">
						<a class="btn btn-primary" href="http://www.cgbchina.com.cn/"><i class="fa fa-save"style="margin-right: 0.2rem;"></i> 确定</a>
                    	<a href="javascript:history.go(-1);"  class="btn btn-primary" style="margin-right: 1.3rem;"><i class="fa fa-reply"></i> 取消</a>
                    </div>
			</div>
			</div>
			</div>
	</#escape>
</#macro> 