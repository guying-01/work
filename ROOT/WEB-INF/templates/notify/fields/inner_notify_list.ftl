`<#-- 消息展示页面-->

<#include "/common/common_var_definds.ftl" />
<#macro render data>
    <#escape x as x?html>
    <style>
        .member-tit-gy i {
            background: url("${resources}/img/common/goBack.png") no-repeat center;
            background-size: contain;
            display: inline-block;
            width: 0.3rem;
            position: absolute;
            left: 0.2rem;
        }
    </style>
    <h2 class="member-tit member-tit-gy">
    <i onclick="history.go(-1)">&nbsp;</i>消息
    </h2>
    <div class="content-right">
        <div class="list">
            <ul class="tabT message-gy">
                <li onclick="changeBtnState('',this)" class="tab1"><span>所有消息</span></li>
                <li onclick="changeBtnState('00',this)" class="tab2"><span>交易动态</span></li>
                <li onclick="changeBtnState('20',this)" class="tab3"><span>评价动态</span></li>
                <li onclick="changeBtnState('30',this)" class="tab4"><span>退换货</span></li>
            </ul>
            <div class="function">
                <p><a href="javascript:void(0);"
                      id="allReadCode" class="small-button right" value="">全部标为已读</a><span class="left" style="font-size:0.28rem; line-height:0.8rem;padding-left: 0.2rem; padding-top: 0.1rem;
">当前未读消息共有 <span id="monthMsg3" class=''>0</span> 条</span>
                </p>
            </div>

        </div>
    </div>
    <div class="messageCenter"></div>
    <div id="noneOrder" style="line-height:80px; text-align:center; font-size:16px; display:none;">您现在暂无未读消息</div>
    <div class="messageFill"></div>
    <script id="messageCenter" type="text/x-handlebars-template">
        {{#each this}}
        <div class="message {{statu this}} " message-id={{id}} templateType={{templateType}}> {{messageContent this.message}}</div>
        {{/each}}
        {{assignMore}}
    </script>

    </#escape>
</#macro>