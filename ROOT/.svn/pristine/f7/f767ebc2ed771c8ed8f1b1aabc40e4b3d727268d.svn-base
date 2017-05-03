<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
	<input type="hidden" id="orderId" value="${orderId!''}"/>
    <div class="member-list-tab p-t-20">
      <div class="web-note">
        <h2>您已成功完成本次交易，商家将立即收到您支付的货款</h2>
        <P> 
        	您可以
        	<a href="javascript:void(0);" onclick="toScore()" class="font-color-c"> 立即给商家评价</a>
            <a href="javascript:void(0);" onclick="toOrderDetail()" class="font-color-c"> 查看订单详情</a>
        </P>
        <p>如果商品存在问题，您需要申请售后，您可以联系商家 ${(sellerName)!''} <img src="${resources}/img/common/consulting.png"  dm-actor="webim-store" dm-data="${(sellerName)!''}"/></p>
        <p>如果商家违背交易承诺，您可以投诉商家进行维权</p><!--<a href="投诉管理.html" class="font-color-c"> 投诉卖家</a> 进行维权</p>-->
      </div>
      
    </div>
 </#escape> 
 </#macro>   