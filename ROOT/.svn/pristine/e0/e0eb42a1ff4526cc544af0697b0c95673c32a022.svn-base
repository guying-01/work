<#include "/common/common_var_definds.ftl" />
<#macro render data>
    <#escape x as x?html>
        <div class="wrapper" id="content">
            <div class="clear" id="cont${modal!''}">
                <h2 class="active-tit"><img src="${resources}/img/active/tit${modal!''}.png"></h2>
                <ul class="s-prod-four" id="zhekouIdDiv">
                <#list typeList as tList>
                    <#if (tList.id == 4)>
                        <#if (time==1)&&(tList.promotionGoodList1?size>0)>
                            <#assign promotion_miaosha = tList.promotionGoodList1 />
                        <#elseif (time==2)&&(tList.promotionGoodList2?size>0)>
                            <#assign promotion_miaosha = tList.promotionGoodList2 />
                        <#elseif (time==3)&&(tList.promotionGoodList3?size>0)>
                            <#assign promotion_miaosha = tList.promotionGoodList3 />
                        <#elseif (time==4)&&(tList.promotionGoodList4?size>0)>
                            <#assign promotion_miaosha = tList.promotionGoodList4 />
                        <#elseif (time==5)&&(tList.promotionGoodList5?size>0)>
                            <#assign promotion_miaosha = tList.promotionGoodList5 />
                        <#elseif (time==6)&&(tList.promotionGoodList6?size>0)>
                            <#assign promotion_miaosha = tList.promotionGoodList6 />
                        </#if>
                        <#if (promotion_miaosha??)>
                            <#list promotion_miaosha as val>
                                <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                                    <div class="prod-sale promotionTimer" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-nowTime="${val.now!''}"></div>
                                    <div class="prod-text">
                                        <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                        <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                        <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                                    </div>
                                    <div class="prod-shop background01"><a href="/fsst/${val.storeId!''}/top.jhtml" target="_blank" style="font-size: 13px;">${val.storeName!''} </a>
                                        <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                                    </div>
                                </li>
                            </#list>
                        </#if>
                    <#else>
                      <#if (tList.spPromotionGoodsShowVoList??)>
                            <#list tList.spPromotionGoodsShowVoList as val>
                                    <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                                        <div class="prod-sale" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-nowTime="${val.now!''}">${val.promotionTitle!''}</div>
                                        <div class="prod-text">
                                            <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                            <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                            <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                                        </div>
                                        <div class="prod-shop background01"><a href="/fsst/${val.storeId!''}/top.jhtml" target="_blank" style="font-size: 13px;">${val.storeName!''} </a>
                                            <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                                        </div>
                                    </li>
                            </#list>
                       </#if>
                    </#if>
                </#list>
                </ul>
            </div>
         </div>
	</#escape> 
</#macro>