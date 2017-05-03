<#include "/common/common_var_definds.ftl" />
<#macro render data>
    <#escape x as x?html>
    <div class="member-tit modify" onclick="window.history.go(-1)" style="border-bottom: 0.03rem solid #e1e1e1">
        <g></g>
       关联采购商
    </div>
    <div class="member-tit title-g">主账号</div>
    <div class="main-account common-style" style="margin-bottom: 0.2rem"></div>
    <#--主账号模板加载-->
    <div class="member-tit title-g" style="border-top: 0.01rem solid #e1e1e1">子账号</div>
    <div class="son-account common-style" style="margin-bottom: 0.2rem;"></div>
    <#--子账号模板加载-->
    <div class="accountFill" style="height: 0.75rem"></div>
<script type="text/x-handlebars-template" id="main-account">

    {{#each this}}
    <div class="information-line-gy"><span>采购商主账号</span><span>{{headUserCode}}</span></div>
    <div class="information-line-gy"><span>采购商店名</span><span>{{headBuyerName}}</span></div>
    <div class="information-line-gy"><span>采购商身份码</span><span>{{headPassportNo}}</span></div>
    <div class="information-line-gy"><span>账号类型</span><span>{{headMemberType}}</span></div>
    <div class="information-line-gy"><span>接货人</span><span>{{masterPorterName}}</span></div>
    <div class="information-line-gy"><span>接货人电话</span><span>{{masterPorterMobile}}</span></div>
    <div class="information-line-gy"><span>店内电话</span><span>{{masterPorterTelephone}}</span></div>
    <div class="information-line-gy"><span>地址</span><span>{{address}}</span></div>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="son-account">
    {{#each this}}
    <div class="information-line-gy"><span>采购商子账号</span><span>{{branchUserCode}}</span></div>
    <div class="information-line-gy"><span>采购商店名</span><span>{{branchBuyerName}}</span></div>
    <div class="information-line-gy"><span>采购商身份码</span><span>{{branchPassportNo}}</span></div>
    <div class="information-line-gy"><span>账号类型</span><span>{{branchMemberType}}</span></div>
    <div class="information-line-gy"><span>接货人</span><span>{{masterPorterName}}</span></div>
    <div class="information-line-gy"><span>接货人电话</span><span>{{masterPorterMobile}}</span></div>
    <div class="information-line-gy"><span>店内电话</span><span>{{masterPorterTelephone}}</span></div>
    <div class="information-line-gy" style="border-bottom: none"><span>地址</span><span>{{address}}</span></div>
    <div class="red-line"></div>
    {{/each}}
</script>
    </#escape>
</#macro> 