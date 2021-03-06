<#include "/common/common_var_definds.ftl" />
<#macro render data>
<style>
    .returnIndex:active{
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    }
</style>
<div class=" textalign-m" style="width: 100%;margin 0 auto;background: url('${resources}/img/common/error-msg-500.jpg') no-repeat center center;background-size: cover;height: 100%">
    <div class="textalign-m">
        <#if error??>
            <#if error.errMsg??>
                <div class="errorPage">
                <p>${error.errMsg!""}</p>
                </div>
            <#else>
                <div class="errorPage">
                    <p>非常抱歉！<br>这个页面没有站稳</p>
                </div>
            </#if>
        <#else>
            <div class="errorPage">
                <p>非常抱歉！<br>这个页面没有站稳</p>
            </div>
        </#if>
    </div>
</div>
<a class="errorBack" style="position: absolute;left: 0.2rem;top: 0.2rem;width: 0.35rem;height: 0.5rem;background: url('${resources}/img/member/goBack.png') no-repeat center center;background-size: contain;" onclick="window.history.go(-1)"></a>
<a class="returnIndex" href="/"></a>
</#macro>