<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#macro render data>
    <#escape x as x?html>
    <style>
        div.assets b {
            line-height: 63px;
            overflow: inherit;
            font-weight: 700;
            font-size: 35px;
            max-width: inherit;
        }
        body {
            background: #fff;
        }
        .ff_header_bar{
            border-top:0;
            border-bottom: 1px solid #dcdcdc;
        }
    </style>
    <div class="top">
        <@header_bar.render "我的饭饭",""/>
    <#--导入header_top-->
    </div>
    <div class="user_total">
        <div class="user">
            <div class="member-header">
                <div class="pic_user">
                    <#if memberPictureForm.bigIconPath??>
                        <img id="userHeaderImg" src="${memberPictureForm.bigIconPath!""}" width="112" height="112"/>
                    <#else>
                        <img id="userHeaderImg" src="${resources}/img/common/user.jpg" width="112" height="112"/>
                    </#if>
                </div>
                <#--<a href="javascript:void(0);" onclick="$.dm.jumpTo('/member/toUpdateMemberDetail.jhtml',{memImg:'updateHeaderImg'})"></a>-->
                <a href="/member/toUpdateMemberDetail.jhtml" style="cursor: pointer"></a>
                <a class="personCenter" href="/member/toUpdateMemberDetail.jhtml">采购商资料</a>
            </div>
            <div class="user_desc">
                <div class="user-name">${(user.userCode)!''}</div>
                <div class="balance_box">

                    <#if Session.user.memberTypeSpecial?? && Session.user.memberTypeSpecial>
                    <#elseif Session.user.memberType?? && (Session.user.memberType =="member_branch" || Session.user.memberType =="member_servant"|| Session.user.memberType =="member_separate")>
                    <#else >
                        <#if bankName??>
                            <span class="bk_name">${(bankName.bankName)!''}:</span>
                        </#if>
                        <a onclick="selectbalance(this)">点击查看余额</a>
                    </#if>
                </div>
                <div class="user-information">
                    <P class="left">账户安全：</P>
                    <b><#if (userSafe<=50)>低
                    <#elseif (userSafe<=75)>中
                    <#else>高
                    </#if></b>
                <#--<div class="loading">
                  <p style="width:${(userSafe)!'0'}%"></p>
                </div>-->
                    <a href="/member/toUpdateSecurityInfo.jhtml"
                       style="line-height: 0.1rem; text-decoration: none;"><span class="safe_setting">安全设置</span>
                    </a>
                    <#if Session.user.memberType?? && (Session.user.memberType=="member_head" || Session.user.memberType=="member_master")>
                        <a class="rel_memmber" href="/memberType/toMemberList.jhtml">关联采购商</a>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    <#--<div class="assets">-->
    <#--<h2 class="member-tit"><i></i>我的资产</h2>-->
    <#--<div class="assets-con m-t-5"><img src="${resources}/img/member/quan.png" width="45" height="21"><b id="memberCoupon">${(couponCount?c)!0}</b><span>张</span></div>-->
    <#--<div class="assets-con"><img src="${resources}/img/member/fen.png" width="45" height="21"><b title="${(userInfo.points)?string(',###')}">${(userInfo.points)?string(',###')}</b><span>分</span></div>-->
    <#--</div>-->
        <#if Session.user.memberType ?? && Session.user.memberType == "member_separate"><#--分采分送主账号-->
        <#else>
    <div class="member-tab">
        <h2 class="member-tit member-tit-reset">交易提醒</h2>
        <ul class="tabT dealTab">
            <li>
                <a onclick="jumping(1,'00')">
                    <i></i>
                   <#-- <u id="u1">0</u>-->

                    <span style="padding-top: 0.1rem">待付款</span>

                </a>
            </li>
            <li class="dealTab02">
                <a onclick="jumping(2,'1020')">
                    <i class="noSend"></i>
                <#--    <u id="u2">0</u>-->

                    <span style="padding-top: 0.1rem">处理中</span>

                </a>
            </li>
            <li>
                <a onclick="jumping(3,'1000')">
                    <i class="noAccept"></i>
                   <#-- <u id="u4">0</u>-->

                    <span style="padding-top: 0.1rem">待评价</span>

                </a>
            </li>
            <!--<li><i class="complete"></i><span><a onclick="jumping()">已完成</a></span><u id="u3">0</u></li>-->
        </ul>

    </div>
        </#if>

        <#if Session.user.memberType ?? && (Session.user.memberType == "member_head"|| Session.user.memberType == "member_separate")><#--分采分送主张号-->
        <div class="member-tab member-tab2">
            <ul class="tabT mobiletabT allOrderList">
            <#if Session.user.memberType ?? && Session.user.memberType == "member_separate"><#--分采分送主张号-->
                <li class="on"><a href="/memberType/toMemberList.jhtml"><i class="myOrder"></i><span>关联采购商</span></a></li>
                <li><a href="/order/toOrderListPrivilege.jhtml"><i></i><span>所有采购单</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SHIPPED')}',1)"><a href="/fav/toList.jhtml"><i class="collection"></i><span>我的收藏</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_PAYED')}',2)"><a href="/member/toBrowseHistory.jhtml"><i class="history"></i><span>浏览历史</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SCORE_NO')}',3)">
                    <a href="javascript:;" onclick="clearLocalIndex()">
                        <i class="manage"></i><span>消息</span>
                    </a>
                </li>
            <#else>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_INPAY')}',0)" class="on"><a onclick="jumping(0,'')"><i class="myOrder"></i><span>我的采购单</span></a></li>
                <li><a href="/order/toOrderListPrivilege.jhtml"><i></i><span>所有采购单</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SHIPPED')}',1)"><a href="/order/toStoreHouse.jhtml"><i class="wareHome"> </i><span>我的仓库</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SHIPPED')}',1)"><a
                        href="/fav/toList.jhtml"><i class="collection"></i><span>我的收藏</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_PAYED')}',2)"><a
                        href="/member/toBrowseHistory.jhtml"><i class="history"></i><span>浏览历史</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SCORE_NO')}',3)"
                    id="message-gy"><a href="/notify/notifyList.jhtml" onclick="clearLocalIndex()"><span>消息</span></a>
                </li>
            </#if>

            </ul>
        </div>

        <#else>
        <div class="member-tab member-tab2">
            <ul class="tabT mobiletabT">
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_INPAY')}',0)" class="on"><a
                        onclick="jumping(0,'')"><i class="myOrder"></i><span>我的采购单</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SHIPPED')}',1)"><a
                        href="/order/toStoreHouse.jhtml"><i class="wareHome"> </i><span>我的仓库</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SHIPPED')}',1)"><a
                        href="/fav/toList.jhtml"><i class="collection"></i><span>我的收藏</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_PAYED')}',2)"><a
                        href="/member/toBrowseHistory.jhtml"><i class="history"></i><span>浏览历史</span></a></li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SCORE_NO')}',3)">
                    <a href="javascript:;" onclick="clearLocalIndex()">
                        <i class="manage"></i><span>消息</span>
                    </a>
                </li>
            </ul>
        </div>
        </#if>

        <#if Session.user.memberTypeSpecial?? && Session.user.memberTypeSpecial>
        <#elseif Session.user.memberType?? && (Session.user.memberType =="member_branch" || Session.user.memberType =="member_servant" || Session.user.memberType=="member_separate")>
        <#else >
        <div class="member-tab member-tab-bank member-tab-bank1 bank_box">
            <h2 class="member-tit member-tit-reset">银行账户管理</h2>
            <div class="bank-all">
                <ul class="tabT tabT-left">
                    <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_INPAY')}',0)"
                        class="on">
                        <a onclick="changeDetail()">
                            <i class="changeBank"></i>
                            <span>变动明细</span>
                        </a>
                    </li>
                    <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SHIPPED')}',1)">
                        <a onclick="withDrawAccount(1);">
                            <i class="getBank"></i>
                            <span>提现</span>
                            </a>
                    </li>
                    <li>
                        <a onclick="recharge()">
                            <i class="rechange"></i>
                            <span>充值</span>
                        </a>
                    </li>
                </ul>
                <ul class="tabT tabT-right">
                    <li><i class="settingPwd"></i><span onclick="withDrawAccount(2);">提现密码设置</span></li>
                    <li style="border: 0;"><i class="settingUser"></i><span onclick="withDrawAccount(3);">提现账号设置</span>
                    </li>
                </ul>
            </div>
        </div>
        </#if>

    <div class="member-tab member-tab-bank member-tab-bank1 bank_box">
        <h2 class="member-tit member-tit-reset">客户服务</h2>
        <div class="serverManage">
            <ul class="tabT">
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_INPAY')}',0)" class="on">
                    <a href="/score/toScoreList.jhtml">
                        <i class="scoreM"></i>
                        <span class="scoreMs">评价管理</span>
                    </a>
                </li>
                <li onclick="JavaScript:searchOrder('${getConstant('dictionary.ORDER_STATES_SHIPPED')}',1)">
                    <a href="/return/toReturnOrderList.jhtml">
                        <i class="backGm"></i>
                        <span class="backGs">退换货管理</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>


    <a href="/logout.jhtml" class="bt_logout">退出登录</a>
    <form action="${ctx}/order/toPayFromMember.jhtml" id="toPayForm" name="toPayForm" method="post">
        <input type="hidden" id="orderId" name="orderIds" value=""/>
    </form>
    <div style="height: 0.87rem;"></div>
    <script id="hbInpay" type="text/x-handlebars-template">
        <div class="member-order-list">
            {{#each this}}
            {{#isContinue @index}}
            <div class="member-order">
                <div class="order-img">{{#checkCount orderCount}}{{/checkCount}}<a href="javascript:void(0);"
                                                                                   onclick="toOrderDetail('{{order.id}}')"><img
                        src="{{orderDetailVo.itemSmallPicturePath}}" width="430" height="430"></a></div>
                <a href="javascript:void(0);" onclick="toOrderDetail('{{order.id}}')" class="order-detail">查看订单详情</a>
                <div class="member-order-info"><span>订单编号：</span>
                    <p title="{{order.id}}">{{order.orderIdShort}}
                    </p>
                </div>
                <div class="member-order-info"><span>下单时间：</span>
                    <p>{{order.orderDate}}&nbsp;{{order.orderTime}}</p>
                </div>
                <div class="member-order-info"><span>数量：</span>
                    <p>{{orderCount}}件</p>
                </div>
                {{#btName order}}{{/btName}}
                <strong class="order-price"><b>￥</b>{{order.payMoneyText}}</strong></div>
            <input type='hidden' id='orderId{{@index}}' value='{{order.id}}'/>
            {{/isContinue}}
            {{/each}}
        </div>
    </script>

    <script id="hbBrowseHistory" type="text/x-handlebars-template">
        <div class="member-footprint-con-box">
            <h2 class="member-tit"><a href="/member/toBrowseHistory.jhtml">查看更多</a> <i></i>浏览历史</h2>
            <div class="member-footprint-con">
                {{#each this}}
                <ul>
                    <h3><u></u>
                        <p>{{dataStr}}</p>
                    </h3>
                    {{#each data}}
                    <li><a href="/fsgd/{{goodsId}}.jhtml"><img dm-actor="browse-history-item-pic" dm-data="{{goodsId}}"
                                                               src="{{smallPicturePath}}" width="430" height="430">
                        <p style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" title="{{goodsName}}">
                            {{goodsName}}</p></a> <b>￥</b>{{salesMinPrice}}
                    </li>
                    {{/each}}
                    <p class="clear"></p>
                </ul>
                {{/each}}
            </div>
        </div>

    </script>

    <script id="hbGdFav" type="text/x-handlebars-template">
        <ul>
            {{#each this}}
            <li><a href="/fsgd/{{goodsId}}.jhtml"><img src="{{goodsPic}}" width="400" height="400"></a>
                <h3><a href="/fsgd/{{goodsId}}.jhtml" title="{{goodsName}}">{{goodsName}}</a></h3>
                <p><strong><b>￥</b>{{salesPrice}}</strong><u>￥{{marketPrice}}</u></p>
            </li>
            {{/each}}
        </ul>
    </script>
    <script id="hbGrade" type="text/x-handlebars-template">
        <P class="left">用户等级：</P>
        <div class="user-load-pop"><img src="${resources}/img/common/v{{userGrade}}.png" width="20" height="20"
                                        class="left">
            <div class="user-load">
                <h3>累计消费（元）</h3>
                <div class="user-load-con">
                    <div class="load-ofc">{{expendMoney}}<i></i></div>
                    <span class="load-Tl">{{beforeMoney}}</span><span class="load-Tr">{{lastMoney}}</span>
                    <span class="load-Bl">{{showGrade}}</span><span class="load-Br">{{lastUserGrade}}</span>
                    <div class="loading">
                        <p style="width:{{numval}}%"></p>
                    </div>
                </div>
            </div>

        </div>
    </script>

    <script id="hbNullA_mes" type="text/x-handlebars-template">
        <div class="nullA" style="margin-top:5%"><img src="${resources}/img/member/{{image}}" width="51" height="43"
                                                      class="left m-t-10">
            <div class="left">
                <P>{{message}}</P>
                <P>去 <a href="/index.jhtml">随便逛逛</a>吧，看看有没有喜欢的~</P>
            </div>
        </div>
    </script>
    <script id="hbNullB" type="text/x-handlebars-template">
        <h2 class="member-tit"><a href="/member/toBrowseHistory.jhtml">查看更多</a> <i></i>浏览历史</h2>
        <div class="nullB" style="margin-top:50%"><img src="${resources}/img/member/null3.png" width="30" height="50">
            <P>你什么都没有看过呢~赶紧去逛两圈吧~</P>
        </div>
    </script>

    <script id="hotGoods" type="text/x-handlebars-template">
        {{#each this}}
        <li>
            <a href="/gd/{{id}}.jhtml"><img src="{{bigPicturePath}}" width="400" height="400"></a>
            <h3><a href="/gd/{{id}}.jhtml">{{name}}</a></h3>
            <p><strong><b>￥</b>{{salesMinPrice}}</strong><u>￥{{salesMaxPrice}}</u></p>
        </li>
        {{/each}}
    </script>


    <script>
        function selectbalance(context) {
            var url = "/member/selectbalance.ajax";
            callService(url, {}, {
                async: true,
                callSuccess: function (data) {

                    if (data !== "") {
                        $(context).text("余额:￥" + data + "");
                    } else {
                        jsAlert("您暂未开通饭饭平台广发资金保障账户");
                    }
                }
            });

        }
    </script>

    <script>
        function recharge() {
            var url = "/member/recharge.ajax";
            callService(url, {}, {
                async: true,
                callSuccess: function (data) {
                    if (data == "0") {

                        window.location.href = "/member/recharges.jhtml";

                    } else {
                        jsAlert("您暂未开通饭饭平台广发资金保障账户");
                    }
                }
            });
        }
    </script>

    <#--获取未读消息数量-->
    <script type="text/javascript">
        $(function () {
            var messageNum = 0;
            var url = "/notify/findThreeNotifyNum.ajax";
            $.ajax({
                url: url,
                type: 'post',
                async: true,
                success: function (data) {
                    messageNum = data.content;
                    if (messageNum > 99) {
                        messageNum = 99 + '+'
                    }
                    $("#message-gy span").html('消息(' + messageNum + ')')
                }
            })
        })
    </script>

    <#--初始化本地存储下标-->
    <script type="text/javascript">
        function clearLocalIndex() {
            var url = '/notify/notifyList.jhtml';
            window.location.href = url;
            localStorage.index = 0;
        }

    </script>
    </#escape>
</#macro>
