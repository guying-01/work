<#include "/common/common_var_definds.ftl" />
<#macro render data>
<style>
    .returnIndex:active{
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    }
</style>
<div class="wrapper p-t-40 textalign-m" style="width: 100%;box-sizing:border-box;background: url('${resources}/img/common/error405.png') no-repeat center center;background-size: contain;height: 100%">
</div>
<a class="errorBack" style="position: absolute;left: 0.2rem;top: 0.2rem;width: 0.35rem;height: 0.5rem;background: url('${resources}/img/member/goBack.png') no-repeat center center;background-size: contain;" onclick="window.history.go(-1)"></a>
<a class="returnIndex" style="position: absolute;top: 5.5rem;width: 100%;height: 2rem" href="/"></a>
</#macro>