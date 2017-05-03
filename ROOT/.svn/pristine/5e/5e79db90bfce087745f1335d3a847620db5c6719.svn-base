<#include "/common/common_var_definds.ftl" />
<#macro render data>
    <#escape x as x?html>
    <style>
        .active-minute{
            line-height: 25px;
        }
    </style>
        <#assign promotion_miaosha = '4' />
        <div class="banner"> <a href="javascript:void(0)" class="sliderBtn prev"></a> <a href="javascript:void(0)" class="sliderBtn next"></a>
            <ul class="min-banner">
                <#list picList as picList>
                    <li style=" background:url(${picList!''}) no-repeat center;">
                        <#--<a href="javascript:void(0);"></a>-->
                    </li>
                </#list>
            </ul>
            <div style="width:1200px; position: absolute ; bottom:0; left:50%; margin-left:-600px;">
                <ul class="banner_num">
                <#list picList as picList>
                    <li class="btnListOn"></li>
                </#list>
                </ul>
            </div>
        </div>

        <div class="wrapper" id="content">
        <#list typeList  as tList>
        <div class="clear" id="cont${tList.id!''}" name="promotiondisplay" data_promotionType="${tList.id}">
            <#if (tList.id == 4)>
            <h2 class="active-tit" id="miaoshaimg"><img src="${resources}/img/active/tit${tList.id!''}.png"></h2>
<#--                <ul class="tabT active-tab seckillTitle">
                    <li onClick="JavaScript:ChangeDiv('0','JKDiva_',6)" class="on title0" >
                        <P class="active-time">0:00 <span class="active-title">开始抢购</P>
                        <P class="active-minute"style="display:none">倒计时<span class="active-timer"></span></P>
                    </li>
                    <li onClick="JavaScript:ChangeDiv('1','JKDiva_',6)" class="title1" >
                    <P class="active-time">4:00 <span class="active-title">开始抢购</P>
                    <P class="active-minute" style="display:none">倒计时<span class="active-timer"></span></P>
                    </li>
                    <li onClick="JavaScript:ChangeDiv('2','JKDiva_',6)" class="title2">
                        <P class="active-time">08:00 <span class="active-title">开始抢购</P>
                        <P class="active-minute" style="display:none">倒计时<span class="active-timer"></span></P>
                        </li>
                    <li onClick="JavaScript:ChangeDiv('3','JKDiva_',6)" class="title3">
                        <P class="active-time">12:00 <span class="active-title">开始抢购</P>
                        <P class="active-minute" style="display:none">倒计时<span class="active-timer"></span></P>
                        </li>
                    <li onClick="JavaScript:ChangeDiv('4','JKDiva_',6)" class="title4">
                        <P class="active-time">16:00 <span class="active-title">开始抢购</P>
                        <P class="active-minute" style="display:none">倒计时<span class="active-timer"></span></P>
                        </li>
                    <li onClick="JavaScript:ChangeDiv('5','JKDiva_',6)" class="title5">
                        <P class="active-time">20:00 <span class="active-title">开始抢购</P>
                        <P class="active-minute" style="display:none">倒计时<span class="active-timer"></span></P>
                        </li>
                </ul>-->
                <!--<ul class="tabT active-tab seckillTitle">
                    <li onClick="JavaScript:ChangeDiv('0','JKDiva_',6)" class="on title0" >
                        <P class="active-time">0:00 <span class="active-title">开始抢购</P>
                        <P class="right" style="line-height: 20px"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}&&time=1">更多 >></a></P>
                    </li>
                    <li onClick="JavaScript:ChangeDiv('1','JKDiva_',6)" class="title1" >
                        <P class="active-time">4:00 <span class="active-title">开始抢购</P>
                        <P class="right" style="line-height: 20px"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}&&time=2">更多 >></a></P>
                    </li>
                    <li onClick="JavaScript:ChangeDiv('2','JKDiva_',6)" class="title2">
                        <P class="active-time">08:00 <span class="active-title">开始抢购</P>
                        <P class="right" style="line-height: 20px"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}&&time=3">更多 >></a></P>
                    </li>
                    <li onClick="JavaScript:ChangeDiv('3','JKDiva_',6)" class="title3">
                        <P class="active-time">12:00 <span class="active-title">开始抢购</P>
                        <P class="right" style="line-height: 20px"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}&&time=4">更多 >></a></P>
                    </li>
                    <li onClick="JavaScript:ChangeDiv('4','JKDiva_',6)" class="title4">
                        <P class="active-time">16:00 <span class="active-title">开始抢购</P>
                        <P class="right" style="line-height: 20px"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}&&time=5">更多 >></a></P>
                    </li>
                    <li onClick="JavaScript:ChangeDiv('5','JKDiva_',6)" class="title5">
                        <P class="active-time">20:00 <span class="active-title">开始抢购</P>
                        <P class="right" style="line-height: 20px"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}&&time=6">更多 >></a></P>
                    </li>
                </ul>-->
                <ul class="tabT active-tab seckillTitle">
                <#list showList as showList>
                    <li onClick="JavaScript:ChangeTab('${showList.id!''}','JKDiva_')" class="title5">
                        <P class="active-time" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${showList.promotionTitleShort!''}">${showList.promotionTitleShort!''}</P>
                        <P class="right" style="line-height: 20px"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}&&promotionId=${showList.id!''}">更多 >></a></P>
                    </li>
                </#list>
               </ul>
            <#list showList as showList>
            <div id="JKDiva_${showList.id}" style="display:none" name="spikePurchase" promotionId="${showList.id}">
                <ul class="s-prod-four" id="zhekouIdDiv">
                <#if (showList.promotionGoodShowFormList??)>
                        <#list showList.promotionGoodShowFormList as val>
                            <#if (val_index <=12)>
                            <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                                <div class="prod-sale promotionTimer" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-nowTime="${val.now!''}" data-timer></div>
                                <div class="prod-text">
                                    <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                    <p class="price"><strong>￥</strong> ${val.field0!''}</p>
                                    <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                                </div>
                                <div class="prod-shop background01"><a href="/st/{{val.storeId}}/index.jhtml" target="_blank"><a href="/st/${val.storeId!''}/index.jhtml" target="_blank" style="font-size: 13px;">${val.storeName!''} </a>
                                    <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                                </div>
                            </li>
                            </#if>
                        </#list>
                </#if>
                </ul>
                </div>
                </#list>
            <!--
            <div id="JKDiva_0" style="display:block">
                <ul class="s-prod-four" id="zhekouIdDiv">
                <#if (tList.promotionGoodList1??)>
                        <#list tList.promotionGoodList1 as val>
                            <#if (val_index <=12)>
                            <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                                <div class="prod-sale promotionTimer" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-timer></div>
                                <div class="prod-text">
                                    <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                    <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                    <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                                </div>
                                <div class="prod-shop background01"><a href="/st/{{val.storeId}}/index.jhtml" target="_blank"><a href="/st/${val.storeId!''}/index.jhtml" target="_blank" style="font-size: 13px;">${val.storeName!''} </a>
                                    <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                                </div>
                            </li>
                            </#if>
                        </#list>
                </#if>
                </ul>
                </div>
            	<div id="JKDiva_1" style="display:none">
                <ul class="s-prod-four" id="zhekouIdDiv">
                <#if (tList.promotionGoodList2??)>
                    <#list tList.promotionGoodList2 as val>
                        <#if (val_index <=12)>
                        <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                            <div class="prod-sale promotionTimer" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-timer></div>
                            <div class="prod-text">
                                <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                            </div>
                            <div class="prod-shop background01"><a href="/st/${val.storeId!''}/index.jhtml" target="_blank"style="font-size: 13px;">${val.storeName!''} </a>
                                <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                            </div>
                        </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
                </div>
            <div id="JKDiva_2" style="display:none">
                <ul class="s-prod-four" id="zhekouIdDiv">
                <#if (tList.promotionGoodList3??)>
                    <#list tList.promotionGoodList3 as val>
                        <#if (val_index <=12)>
                        <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                            <div class="prod-sale promotionTimer" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-timer></div>
                            <div class="prod-text">
                                <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                            </div>
                            <div class="prod-shop background01"><a href="/st/${val.storeId!''}/index.jhtml" target="_blank"style="font-size: 13px;">${val.storeName!''} </a>
                                <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                            </div>
                        </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
                </div>
            <div id="JKDiva_3" style="display:none">
                <ul class="s-prod-four" id="zhekouIdDiv">
                <#if (tList.promotionGoodList4??)>
                    <#list tList.promotionGoodList4 as val>
                        <#if (val_index <=12)>
                        <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                            <div class="prod-sale promotionTimer" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-timer></div>
                            <div class="prod-text">
                                <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                            </div>
                            <div class="prod-shop background01"><a href="/st/${val.storeId!''}/index.jhtml" target="_blank"style="font-size: 13px;">${val.storeName!''} </a>
                                <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                            </div>
                        </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
                </div>
            <div id="JKDiva_4" style="display:none">
                <ul class="s-prod-four" id="zhekouIdDiv">
                <#if (tList.promotionGoodList5??)>
                    <#list tList.promotionGoodList5 as val>
                        <#if (val_index <=12)>
                        <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                            <div class="prod-sale promotionTimer" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-timer></div>
                            <div class="prod-text">
                                <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                            </div>
                            <div class="prod-shop background01"><a href="/st/${val.storeId!''}/index.jhtml" target="_blank"style="font-size: 13px;">${val.storeName!''} </a>
                                <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                            </div>
                        </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
                </div>
            <div id="JKDiva_5" style="display:none">
                <ul class="s-prod-four" id="zhekouIdDiv">
                <#if (tList.promotionGoodList6??)>
                    <#list tList.promotionGoodList6 as val>
                        <#if (val_index <=12)>
                        <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                            <div class="prod-sale promotionTimer" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" data-timer></div>
                            <div class="prod-text">
                                <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                            </div>
                            <div class="prod-shop background01"><a href="/st/${val.storeId!''}/index.jhtml" target="_blank"style="font-size: 13px;">${val.storeName!''} </a>
                                <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                            </div>
                        </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
                </div>-->
            <#else>
                <#if (tList.id == 1)>
                <h2 class="active-tit" id="zhekouimg"><img src="${resources}/img/active/tit${tList.id!''}.png"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}">更多 >></a></h2>
                <#elseif (tList.id == 2)>
                    <h2 class="active-tit" id="manjianimg"><img src="${resources}/img/active/tit${tList.id!''}.png"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}">更多 >></a></h2>
                <#elseif (tList.id == 3)>
                    <h2 class="active-tit" id="zhuheimg"><img src="${resources}/img/active/tit${tList.id!''}.png"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}">更多 >></a></h2>
                <#elseif (tList.id == 5)>
                    <h2 class="active-tit" id="baoyouimg"><img src="${resources}/img/active/tit${tList.id!''}.png"><a href="/activity/toMoreList.jhtml?modal=${tList.id!''}">更多 >></a></h2>
                </#if>
                    <ul class="s-prod-four" id="zhekouIdDiv">
                    <#if (tList.spPromotionGoodsShowVoList??)>
                        <#list tList.spPromotionGoodsShowVoList as val>
                            <li> <a  href="/gd/${val.goodId!''}.jhtml" class="prod-img"><img src="${val.goodPicture!''}"></a>
                                <div class="prod-sale" data-startTime="${val.field2!''}" data-endTime="${val.field3!''}" >${val.promotionTitle!''}</div>
                                <div class="prod-text">
                                    <h3><a href="/gd/${val.goodId!''}.jhtml"> ${val.goodName!''} </a></h3>
                                    <p class="price"><strong>￥</strong> ${val.salesPrice!''}</p>
                                    <p class="price-u"><u>￥${val.marketPrice!''}</u> <span>${val.salesNum!''}件已售</span></p>
                                </div>
                                <div class="prod-shop background01"><a href="/fsst/${val.storeId!''}/top.jhtml" target="_blank"style="font-size: 13px;">${val.storeName!''} </a>
                                    <img style="height: 25px;width: 25px;" src="${resources}/img/common/store${val.storeGrade!''}.png" >
                                </div>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </#if>
            </div>
        </#list>
         </div>

    <script id="timer" type="text/x-handlebars-template">
                <span class="hour">{{hour}}</span>:
                <span class="mini">{{mini}}</span>:
                <span class="sec">{{sec}}</span>
    </script>

<script>

    var width=$(".banner_num").first().css("width");
    var num=$(".banner_num").children().length;
    var sumWidth=width*num;
    $(".banner_num").css("width",sumWidth);
</script>

	</#escape> 
</#macro>