<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_member_footer.ftl" as footer/>
<#import "/basepage/store/default/common/common_footer_no_tab.ftl" as footer_no_tab/>
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <title>饭饭1080°直采平台</title>
<@link.render />    <!--导入共通样式-->
<@script.render />  <!--导入共通脚本-->


    <link rel="stylesheet" href="${resources}/basepage/store/default/details_pages/css/swiper3.4.0.min.css"
          type="text/css">
    <link rel="stylesheet" type="text/css" href="${resources}/css/common/lib.css"/>
    <link rel="stylesheet" href="${resources}/basepage/store/default/details_pages/css/details_pages.css?v20170428"
          type="text/css">
    <script src="${resources}/basepage/store/default/common_js/jquery.md5.js"></script>
<#--<script type="text/javascript" src="${resources}/basepage/store/default/shop_templates/js/common/common_head_load.js"></script>-->
    <script type="text/javascript" src="${resources}/js/common/browse_history.js"></script>
    <script src="${resources}/basepage/store/default/details_pages/js/details_dynamics.js?20170428" type="text/javascript"></script>
    <script src="${resources}/basepage/store/default/details_pages/js/swiper3.4.0.min.js"></script>
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if (deviceWidth > 768) {
            deviceWidth = 768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
</head>
<body>
<@scrollTop.render />
<#--<div id="pageInfo" goodsId="${id}" goodsName="${data.name!""}" store_id="${storeId!""}" store_name="${storeName!""}" store_template_code="${storeTemplateCode!""}" lv3_id="${data.ctgId3!''}" style="display: none"></div><!--页面信息&ndash;&gt;-->
<div id="pageInfo" goodsId="${id}" goodsName="${data.name!""}" store_id="${storeId!""}" store_name="${storeName!""}"
     store_template_code="${storeTemplateCode!""}" lv3_id="${data.ctgId3!''}" from_page="${fromPage!''}"
     begin_time="<#if data.promotionItemForm??>${data.promotionItemForm.promotionBeginDateL!''}</#if>"
     end_time="<#if data.promotionItemForm??>${data.promotionItemForm.promotionEndDateL!''}</#if>"
     now_time="<#if data.promotionItemForm??>${data.promotionItemForm.promotionNowDateL!''}</#if>"
     promotion_flag="<#if data.promotionItemForm??>true<#else>false</#if>" style="display: none"></div><!--页面信息-->
<input type="hidden" id="getGoodsNum" value="1">
<!--此处是头部开始-->

<!--此处是头部结束-->

<!--图片路径统统放在resources下面的webpages文件夹里面-->
<#--<img src=${resources}/basepage/store/default/level_pages/img/ff_details_img/favicon.ico" />-->
<#--<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "商品详情",""/>
&lt;#&ndash;导入header_top&ndash;&gt;
</div>-->
<div class="j_pInR">
    <div class="detailsFill" style="height: 0.8rem"></div>
    <div class="table_a">
        <i class="back" onclick="getBackSetStatu()"></i>
        <i class="back" onclick="window.history.go(-1)">返回</i>
        <div class="tabs">
            <a class="j_pInR_table1 j_pInR_table on">
                商品
            </a>
            <a class="j_pInR_table2 j_pInR_table">
                详情
            </a>
            <a class="j_pInR_table3 j_pInR_table">
                评价
            </a>
            <#--<div>
            <#if lockStatus?? && lockStatus !=0>
                <a class="float_right_a fixed_btn_buy">立即购买</a>
                <a class="float_right_a fixed_btn_shoppingcar" style="right: 0;background: grey;">加入购物车</a>
            <#else>
                <a class="float_right_a fixed_btn_buy" permission="canBuy">立即购买</a>
                <a class="float_right_a fixed_btn_shoppingcar" permission="canBuy"
                   style="right: 0;background: #ff8b0e;">加入购物车</a>
            </#if>
            </div>-->
            <div class="clear" style="clear :both"></div>
        </div>
        <a class="goShophome" href="/fsst/${storeId!"#"}/top.jhtml">
            进入商铺
        </a>
        <div class="clear" style="clear :both"></div>
    </div>

    <div class="choosed">

    </div>

    <div id="tabla_01">
        <div class="j_content_t">
            <div class="scroll_box">
                <a href="/index.jhtml#${data.ctgId1!''}" class="bread_nav_frist border">&nbsp;${data.ctgName1!''} ▶&nbsp;</a>
                <span>&nbsp;&gt;&nbsp;</span>
                <a href="/FSgoodsSearch.jhtml?level1=${data.ctgId1!''}&name1=${data.ctgName1!''}&level2=${data.ctgId2!''}&name2=${data.ctgName2!''}" class="bread_nav_frist border">${data.ctgName2!''} ▶</a>
                <span>&nbsp;&gt;&nbsp;</span>
                <a href="/FSgoodsSearch.jhtml?level1=${data.ctgId1!''}&name1=${data.ctgName1!''}&level2=${data.ctgId2!''}&name2=${data.ctgName2!''}&level3=${data.ctgId3!''}&name3=${data.ctgName3!''}" class="bread_nav_frist border">${data.ctgName3!''} ▶</a>
            </div>
        </div>
        <div class="goodsInfo"></div>            <#----------------------------------goodsInfo模板---------------------------------------------->
        <div class="fixedBottom"></div>
        <div class="division"></div>
        <div class="evaluate"></div>
        <div class="division"></div>
        <div class="store">
            <div class="main"></div>
        </div>
    <#-- <div class="division"></div>
     <div class="recommond">
       <div class="main">
         <span class="common_title">推荐搭配</span>
         <dl class="detail_${data.ctgId3!''}_tuijiandapei_01">
           <dt><a class="pic" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="name">敬请期待</a></dd>
           <dd><a href="####" class="detail">敬请期待</a></dd>
           <dd><b>￥999.00</b></dd>
         </dl>
         <dl class="detail_${data.ctgId3!''}_tuijiandapei_02">
           <dt><a class="pic" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="name">敬请期待</a></dd>
           <dd><a href="####" class="detail">敬请期待</a></dd>
           <dd><b>￥999.00</b></dd>
         </dl>
         <dl class="detail_${data.ctgId3!''}_tuijiandapei_03">
           <dt><a class="pic" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="name">敬请期待</a></dd>
           <dd><a href="####" class="detail">敬请期待</a></dd>
           <dd><b class="price">￥999.00</b></dd>
         </dl>
         <div style="clear: both"></div>
       </div>
     </div>
     <div class="division"></div>
     <div class="leader_like">
       <div class="main">
         <span class="common_title">店长推荐</span>
         <dl class="detail_${storeId!''}_dianzahngtuijian_01">
           <dt><a class="j_pInL_topTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_pInL_topP">敬请期待</a></dd>
           <dd><b class="j_pInL_topS">￥999.00</b></dd>
         </dl>
         <dl class="detail_${storeId!''}_dianzahngtuijian_02">
           <dt><a class="j_pInL_topTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_pInL_topP">敬请期待</a></dd>
           <dd><b class="j_pInL_topS">￥999.00</b></dd>
         </dl>
         <dl class="detail_${storeId!''}_dianzahngtuijian_03">
           <dt><a class="j_pInL_topTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_pInL_topP">敬请期待</a></dd>
           <dd><b class="j_pInL_topS">￥999.00</b></dd>
         </dl>
         <div style="clear: both"></div>
       </div>
     </div>
     <div class="division"></div>
     <div class="same_goods">
       <div class="main">
         <span class="common_title">同类商品</span>
         <dl class="detail_${data.ctgId3!''}_tongleishangpin_01">
           <dt><a class="j_pInL_buttomTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_pInL_buttomP">敬请期待</a></dd>
           <dd><b class="j_pInL_buttomS">￥999.00</b></dd>
         </dl>
         <dl class="detail_${data.ctgId3!''}_tongleishangpin_02">
           <dt><a class="j_pInL_buttomTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_pInL_buttomP">敬请期待</a></dd>
           <dd><b class="j_pInL_buttomS">￥999.00</b></dd>
         </dl>
         <dl class="detail_${data.ctgId3!''}_tongleishangpin_03">
           <dt><a class="j_pInL_buttomTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_pInL_buttomP">敬请期待</a></dd>
           <dd><b class="j_pInL_buttomS">￥999.00</b></dd>
         </dl>
         <div style="clear: both"></div>
       </div>
     </div>
     <div class="division"></div>
     <div class="guess_like">
       <div class="main">
         <span class="common_title">猜你喜欢</span>
         <dl class="detail_${data.ctgId3!''}_cainixihuan_01">
           <dt><a class="j_youlikeTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_youlikeP">敬请期待</a></dd>
           <dd><b class="j_youlikeS">￥999.00</b></dd>
         </dl>
         <dl class="detail_${data.ctgId3!''}_cainixihuan_02">
           <dt><a class="j_youlikeTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_youlikeP">敬请期待</a></dd>
           <dd><b class="j_youlikeS">￥999.00</b></dd>
         </dl>
         <dl class="detail_${data.ctgId3!''}_cainixihuan_03">
           <dt><a class="j_youlikeTu" href="####"><img src="${resources}/basepage/store/default/details_pages/img/jm_top2.jpg"/></a></dt>
           <dd><a href="####" class="j_youlikeP">敬请期待</a></dd>
           <dd><b class="j_youlikeS">￥999.00</b></dd>
         </dl>
         <div style="clear: both"></div>
       </div>
     </div>
     <div class="division"></div>-->
        <div class="division"></div>
        <div class="look_detail">
            <span>查看全部详情</span><i></i>
        </div>
        <div class="division"></div>
    </div>

    <div style="display: none" id="tabla_02">
        <div class="fixedBottom"></div>
        <div>
            <div class="good-attribute my_ff">
                <ul>
                <#if data.otherAttrFormList??>
                    <#list data.otherAttrFormList as attrs>
                        <#if attrs.value != "">
                            <li><strong>${attrs.attrDicName!""}：</strong>&nbsp;${attrs.value!""}</li>
                        </#if>
                    </#list>
                </#if>
                    <div class="clear"></div>
                </ul>
            </div>
        </div>
        <div id="introduction_box"></div>
    <#--${data.sgGoodsInfoChannelForm.introduction}-->
    </div>

    <div style="display: none" id="tabla_03">
        <div class="fixedBottom"></div>
        <div class="evaluateNum"></div>
        <div class="all_evaluate"></div>
        <div class="zhao"></div>
    </div>


</div>

</div>

<#--<div id="shoppingContentFoot">-->
<#--<div id="pageNumberWrap"></div>-->
<#--<div id="pageNumberLeft"></div>-->


<#--</div>-->

</div>

<!--用户登录界面开始-->
<div class="bgBlack" style="display: none;"></div>
<div class="" id="login_popUp">
    <form id="loginForm" method="post" onkeydown="if(event.keyCode==13){$('#btnSubmit').click();}">
        <div class="loginBg">
            <div class="login">
                <div class="login_i"><img src="${resources}/basepage/store/default/common_img/login_i.png"></div>
                <div class="loginTitle">饭饭1080°直采平台</div>
                <a href="javascript:void(0);" class="loginShut shut"></a>
                <h2>账号登录</h2>
                <div class="loginStyleA loginStyleA-ico1">
                    <input id="userName" name="userName" type="text" placeholder="用户名">
                    <!--以下label标签验证用，暂时隐藏了-->
                    <label class="loginError loginclear" id="usere_1">用户名不能为空</label>
                    <label class="loginError loginclear" id="usere_2">用户名和密码不匹配</label>
                    <label class="loginError loginclear" id="usere_3">用户已锁定</label>
                </div>
                <div class="loginStyleA loginStyleA-ico2">
                    <input id="password" name="password" type="password" placeholder="密码">
                    <!--以下label标签验证用，暂时隐藏了-->
                    <label class="loginError loginclear" id="pwde">密码不能为空</label>
                </div>
                <a href="javascript:void(0);" class="loginStyleA-bt" id="btnSubmit">登<span class="login-space"></span>录</a>
                <div class="loginStyleA-bot">
                    <a href="/forget/init.jhtml" class="forgetPSW">忘记密码</a>
                </div>
            </div>
        </div>
    </form>
</div>

<!--用户登录界面结束-->


<!-----------------------此处为footer（楼层以下）-------------------->
<@footer_no_tab.render />
<@footer.render />    <!--导入footer-->
<!--此处为底部结束（楼层以下）-->
<!--底部结束-->
<div class="f_returnTop" title="返回顶部"></div>

<#--模版部分-->
<script type="text/x-handlebars-template" id="details_goodsInfo">
    <div class="goodsPic">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                {{#each goodsList}}
                {{#each itemPictureList}}
                <div class="swiper-slide">
                    <img src="{{bigPicturePath}}"/>
                </div>
                {{/each}}
                {{/each}}
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <#-------------------------------------------------------判断是否参与活动开始------------------------------------------------------------------------------->
    <div class="desc">
        <span style="width: 100%;padding: 0.1rem 0.2rem;box-sizing: border-box">${data.name!""}</span>
        <span style="width: 100%;padding: 0.1rem 0.2rem;box-sizing: border-box"
              class="goodsFormat">${data.description!""}</span>
    <#if data.promotionItemForm??>
        <div class="price" style="width: 100%;padding: 0.1rem 0.2rem;box-sizing: border-box">
            <div>
                <span style="font-size: 0.25rem;line-height: normal;float: left">市场单价:<b class="lowpP"
                                                                                         style="text-decoration: line-through;float: none">{{showPrice marketPriceList_min marketPriceList_max}}</b></span>
                <span style="font-size: 0.25rem;line-height: normal;float: left;padding-left: 0.2rem;">饭饭单价:<b
                        class="lowpP" style="text-decoration: line-through;float: none">{{showPrice unitePriceList_min unitePriceList_max}}</b></span>
                <div class="clear"></div>
            </div>
            <div>
                <span class="lowFp" style="font-size: 0.25rem;line-height: normal;color: black">活动单价: <b class="lowP"
                                                                                                         style="font-size: 0.25rem;color: black">{{showPrice promotionUnitPriceList_min promotionUnitPriceList_max}}</b></span>
                <span class="marketP" style="font-size: 0.27rem!important;color: #c91622">活动价: <b class="hightP"
                                                                                                  style="text-decoration: none;font-size: 0.27rem;color: #c91622">{{showPrice  promotionPriceList_min promotionPriceList_max}}</b></span>
                <span class="arriveT"><span style="display: inline-block;font-size: 0.22rem;line-height: inherit;vertical-align: middle;">送达时间:</span>
                    <b class="arriveTm"> <img src="{{deliverTime this.goodsList.[0].prepareGoodsDay this.goodsList.[0].prepareGoodsTime}}" /></b></span>
                <div class="clear"></div>
            </div>
        </div>
        <div class="activity">
            <div class="activity_title">${data.promotionItemForm.promotionName!""}</div>
            <div class="activity_time">
            <#-- 此处通过下载 -->
            </div>
        </div>
    <#else>
        <div class="price">
            <div style="margin-bottom: 0.1rem;">
                <span class="marketP">市场单价: <b class="hightP">{{showPrice marketPriceList_min marketPriceList_max}}</b></span>

                <div class="clear"></div>
            </div>
            <div>
                <span style="font-size: 0.23rem;line-height: normal;margin-bottom:0.1rem">饭饭单价：<b class="lowpP"
                                                                                                  style="float: none">{{showPrice unitePriceList_min unitePriceList_max}}</b></span>
                <span class="lowFp">饭饭标准规格价: <b
                        class="lowP">{{showPrice salesPriceList_min salesPriceList_max}}</b></span>
                <span class="arriveT"><span
                        style="display: inline-block;font-size: 0.22rem;line-height: inherit;vertical-align: middle;">送达时间:</span><b
                        class="arriveTm"> <img src="{{deliverTime this.goodsList.[0].prepareGoodsDay this.goodsList.[0].prepareGoodsTime}}" /></b></span>
                <div class="clear"></div>
            </div>
        </div>
    </#if>
    </div>
    <#-------------------------------------------------------判断是否参与活动结束------------------------------------------------------------------------------->


    <#-------------------------------------------------------配送至分割线开始-------------------------------------------------------------------------------->
    <#if data.goodsStatus?? && '10' == data.goodsStatus>
    <div class="aRchoose">

    <#-------------------------------------------------------判断库存数量开始------------------------------------------------------------------------------->

        <#if data.localStock?? && data.localStock !=0>
            {{#if attrKeyList.attrDicName1}}
            <span class="aRchooseN aRchooseN_pd">
                请选择
                  {{#each attrKeyList}}
                     "{{this}}"
                  {{/each}}
               </span>
            <span class="aRchooseNum"></span>
            {{else}}
            <span class="arc">已选择</span>
            <span class="aRchooseN"></span>
            <span class="aRchooseNum">"默认数量"：1</span>
            {{/if}}
            <b id="toChoose"></b>
        <#else>
            <span class="aRchooseNum noCount">库存不足</span>
        </#if>

    </div>
    <div class="division"></div>
    <#-------------------------------------------------------判断库存数量结束------------------------------------------------------------------------------->
    <div class="sendTo">
        <span style="font-size: 0.25rem;">配送至</span>
        <a href="javascript:void(0);">
            <select style="display: inline-block;width: 3rem;">
                <#if buyerDistrict??>
                    <option value="">${buyerDistrict!""}</option>
                <#else>
                    <option value="">登录后可查看</option>
                </#if>
            </select>
        </a>
        <p style="text-indent: 0.4rem;padding-top: 0.2rem;clear: left;font-size: 0.25rem"
           title="由 {{storeName}} 发货,并提供售后服务">由 {{storeName}} 发货,并提供售后服务</p>
    </div>
    <#-------------------------------------------------------配送至分割线结束-------------------------------------------------------------------------------->
    <#else>
    <div style="font-size: 0.25rem;color: #c91622;font-weight: bold;text-align: center">
    <#--此商品已下架-->
    </div>
    </#if>
</script>

<script type="text/x-handlebars-template" id="fixedBottom">
    <#if data.goodsStatus?? && '10' == data.goodsStatus>
    <div class="dt_toolbar">
        <ul>
            <li><a href="/fsst/${storeId!""}/contact.jhtml"></a></li>
            <li><a href="javascript:;" class="addFav"></a></li>
            <li class="goCart"><a href="javascript:;"></a></li>
        </ul>
        <#if lockStatus?? && lockStatus !=0>
            <span class="buyNow jbtn3">立即购买</span>
            <span class="addCart">加入购物车</span>
        <#else>
            <#if data.promotionItemForm??>
                <#if data.promotionItemForm.promotionOn!false>
                    <span class="buyNow jbtn3 big_bt" permission="canBuy" buyflag="true" proflag="1">立即购买</span>
                <#else>
                    <span class="buyNow jbtn big_bt" proflag="1">立即购买</span>
                </#if>
            <#else>
            <#-------------------------------------------------新增库存判断------------------------------------------------------------------------->
                <#if data.localStock?? && data.localStock !=0>
                    <span class="buyNow jbtn3" buyflag="true" permission="canBuy">立即购买</span>
                    <span class="addCart" buyflag="true" permission="canBuy">加入购物车</span>
                <#else>
                    <span class="buyNow jbtn3">立即购买</span>
                    <span class="addCart" style="border-right: 0.01rem solid #fff">加入购物车</span>
                </#if>
            </#if>
            <span class="makeTure" permission="canBuy" style="display:none">确认</span>
            <div style="clear:both"></div>
        </#if>
    </div>
    <#else>

    <div class="dt_toolbar">
        <ul>
            <li><a href="/fsst/${storeId!""}/contact.jhtml"></a></li>
            <li><a href="javascript:;" class="addFav"></a></li>
            <li class="goCart"><a href="javascript:;"></a></li>
        </ul>
        <span class="buyNow jbtn3">立即购买</span>
        <span class="addCart" style="border-right: 0.01rem solid #fff" permission="canBuy">加入购物车</span>
        <span class="makeTure" style="display:none" permission="canBuy">确认</span>
        <div style="clear:both"></div>
    </div>
    <div style="font-size: 0.25rem;padding:0.2rem 0;color: #c91622;font-weight: bold;text-align: center">
        此商品已下架
    </div>
    </#if>


</script>

<script type="text/x-handlebars-template" id="details_storeInfo">

    <span class="shopName">{{storeName}}<span
            class="level_pic">{{#storeLevel supplierTypeCode}}{{/storeLevel}}</span></span>
    <ul>
        <li>描述<b>{{storeScore}}</b></li>
        <li>服务<b>{{storeServiceCredit}}</b></li>
        <li class="last">价格<b>{{storePriceCredit}}</b></li>
        <div style="clear:both"></div>
    </ul>
    <div class="storeOpt">
        <div class="enterStore">
            <a href="/fsst/${storeId!"#"}/top.jhtml" class="enter"><i></i><span>进入商铺</span></a>
        </div>
        <div class="enterStore">
            <a class="collection"><i></i><span>收藏商铺</span></a>
        </div>
    </div>
</script>


<script type="text/x-handlebars-template" id="choosed_goods">
    {{#each data}}
    <span>已选</span>
    <span class="shopName">{{storeName}}</span>
    {{/each}}
</script>
<#-----------------------------------------------------初始进入默认取两条好评开始----------------------------------------------------------------------------------------->
<script type="text/x-handlebars-template" id="evaluate">
    <span class="evaluate_num">全部评价<b>({{this.0.score_num}})</b></span>
    {{#each this}}
    <div class="each_evaluate">
        <div class="main">
            <div class="evaluate_top">
                <div class="evaluate_pic">
                    <img src="{{memberPic}}"/>
                </div>
                <span class="evaluate_buyer">{{memberName}}</span>
            </div>
            <div class="evaluate_star">
                <div class="star_bg"></div>
                <ul class="com_star">
                    {{#listStar this.score}}{{/listStar}}
                </ul>
            </div>
            <span class="evaluate_content">{{content this.historyList}}</span>
        <#--<span class="evaluate_time">{{evaluateTime this.createDate}}</span>-->
        </div>
    </div>
    {{/each}}
</script>
<#-----------------------------------------------------初始进入默认取两条好评结束----------------------------------------------------------------------------------------->



<#-----------------------------------------------------点击全部评论后显示所有评价开始----------------------------------------------------------------------------------------->
<script type="text/x-handlebars-template" id="evaluateNum">
    <span class="evaluate_num">
      <div class="checked">全部<b id="totalScore">({{showScoreNum this.0.score_num}})</b></div>
      <div>好评<b>({{showScoreNum this.0.score_good}})</b></div>
      <div>中评<b>({{showScoreNum this.0.score_middle}})</b></div>
      <div>差评<b>({{showScoreNum this.0.score_bad}})</b></div>
  </span>
</script>

<script type="text/x-handlebars-template" id="all_evaluate">

    {{#each this}}
    <div class="each_evaluate">
        <div class="main">
            <div class="evaluate_top">
                <div class="evaluate_pic">
                    <img src="{{memberPic}}"/>
                </div>
                <span class="evaluate_buyer">{{memberName}}</span>
            </div>
            <div class="evaluate_star">
                <div class="star_bg"></div>
                <ul class="com_star">
                    {{#listStar this.score}}{{/listStar}}
                </ul>
            </div>
        <#--<span class="evaluate_time">{{evaluateTime this.createDate}}</span>-->
            <span class="evaluate_content">{{content this.historyList}}</span>
        </div>
    </div>
    {{/each}}
    <a class="loadMore" id="evaluate_0">加载更多</a>

</script>
<#-----------------------------------------------------点击全部评论后显示所有评价结束----------------------------------------------------------------------------------------->



<#-----------------------------------------------------隐藏部分选择规格开始----------------------------------------------------------------------------------------->

<script type="text/x-handlebars-template" id="choosed">
    <div class="jcm_4">
        <div class="choosedGoods">
            <div class="choosePic">
                <img src="{{goodsList.[0].itemPictureList.[0].bigPicturePath}}"/>
            </div>
            <div class="tip">
            <#if data.promotionItemForm??>
            <#--<#if data.promotionItemForm.promotionOn!false>-->
                <b class="price">{{showPrice promotionPriceList_min promotionPriceList_max}}</b>
            <#--<#else>
                <b class="price">{{showPrice salesPriceList_min salesPriceList_max}}</b>
            </#if>-->
            <#else>
                <b class="price">{{showPrice salesPriceList_min salesPriceList_max}}</b>
            </#if>
                <span>库存{{localStock}}件</span>
                {{#if attrKeyList.attrDicName1}}
                <span class="aRchooseN aRchooseN_pd">
                请选择
                  {{#each attrKeyList}}
                     "{{this}}"
                  {{/each}}
               </span>
                <span class="aRchooseNum"></span>
                {{else}}
                <span class="arc"></span>
                <span class="aRchooseN"></span>
                <span class="aRchooseNum">"默认数量"：1</span>
                {{/if}}
            </div>
            <div style="clear: both"></div>
        </div>
        <a href="javascript:void(0);" class="guigeShut shut"></a>

        <div class="jcm_5">
            {{#eachAttrKey attrKeyList}}
            <div name="{{id}}" class="ggli" style="overflow: hidden;padding-top: 0.1rem;">
                <div class="guigeName">{{name}}&nbsp;:</div>
                <ul name="{{id}}">
                    {{#eachAttrValue ../attrValueList index}}
                    <li><a>{{this}}</a></li>
                    {{/eachAttrValue}}
                </ul>
            </div>
            {{/eachAttrKey}}
            <div class="goodsnum">
                <span>购买数量</span>
                <button class="jbtn5">-</button>
                <input type="text" name="" id="j_ipt1" value="1"/>
                <button class="jbtn6">+</button>
            </div>

        </div>
    </div>
</script>
<#-----------------------------------------------------隐藏部分选择规格结束----------------------------------------------------------------------------------------->


<#-------------------------------------------------此处是活动计时模板开始 id="details_activityTime"--------------------------------------->
<script type="text/x-handlebars-template" id="details_activityTime">
    <span class="d_span">{{day}}</span>天<span class="h_span">{{hour}}</span>小时<span class="m_span">{{minute}}</span>分
    <span class="s_span">{{second}}</span>秒
</script>

</body>
</html>