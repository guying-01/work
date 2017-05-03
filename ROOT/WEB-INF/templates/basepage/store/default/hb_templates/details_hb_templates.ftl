﻿<!--商品详情页面的Handlebars模板-->

<!--放大镜部分模板  id="Magnifier"-->
<script type="text/x-handlebars-template" id="Magnifier">
    <div class="MagnifierMain">
        <img class="MagTargetImg">
    </div>
    <span class="spe_leftBtn">&lt;</span>
    <span class="spe_rightBtn">&gt;</span>
    <div class="spec-items">
        <ul>
            {{#each this}}
            {{#each this}}
            <li><img src={{url}}></li>
            {{/each}}
            {{/each}}
        </ul>
    </div>
</script>

<!--此处是商品信息模板开始 id="details_goodsInfo"-->
<script type="text/x-handlebars-template" id="details_goodsInfo">
    <div class="jcm_1">
        <p class="p1">${data.name!""}</p>
        <p class="p2">${data.description!""}</p>
    <#--<p class="p1">进口冰鲜三文鱼中段500g 日韩刺身料理生鱼片净肉</p>-->
    <#--<p class="p2">当天现切 新鲜发货 默认不切片不带皮 需要的请联系客服或自行订单备注</p>-->
    </div>
    <div class="activity">
        <div class="activity_title"></div>
        <div class="activity_time">
            <span class="d_span"></span>天<span class="h_span"></span>小时<span class="m_span"></span>分<span class="s_span"></span>秒 后结束 请尽快购
        </div>
    </div>
    <div class="jcm_2">
        <ul>
            <li class="mli1">
                <p class="p3">市场价:<s>{{showPrice marketPriceList_min marketPriceList_max}}</s></p>
                <p class="p4">饭饭价:<span>{{showPrice salesPriceList_min salesPriceList_max}}</span></p>
            </li>
            <li class="mli2">
                <p class="p5">累计销售</p>
                <p class="p6">{{goodsTransactionCount}}</p>
            </li>
            <li class="mli3">
                <p class="p7">累计评价</p>
                <p class="p8">{{goodsScoreNum}}</p>
            </li>
        </ul>
    </div>
    <#if data.goodsStatus?? && '10' == data.goodsStatus>
    <div class="jcm_3">
        <span style="display: block;min-width: 50px;font-size: 14px;margin-right:10px;float: left;">配送至</span>
        <a href="javascript:void(0);" style="float: left;">
            <select style="width:135px; height: 22px;">
            <#--<option value="">请登录</option>-->
            <option value="">${buyerDistrict!""}</option>
            <#--<option value="">食国列传</option>-->
            </select>
        </a>
    <#--<span class="prompt_span">此区域无法配送</span>-->
        <p style="text-indent: 60px;padding-top: 10px;clear: left;overflow: hidden;white-space: nowrap;text-overflow: ellipsis" title="由 {{storeName}} 发货,并提供售后服务">由 {{storeName}} 发货,并提供售后服务</p>
    </div>
    <div class="jcm_4">

        <#--{{#eachAttrKey attrKeyList}}-->
        <#--<div name="{{id}}">-->
            <#--<div style="min-width: 50px;margin-right: 10px;font-size: 14px;float: left;height:30px;line-height:30px;">{{name}}</div>-->
            <#--<ul name="{{id}}">-->
                <#--{{#eachAttrValue ../attrValueList index}}-->
                <#--<li><a>{{this}}</a></li>-->
                <#--{{/eachAttrValue}}-->
            <#--</ul>-->
        <#--</div>-->
        <#--{{/eachAttrKey}}-->
    </div>
    <div class="jcm_5">
        <span style="float: left;min-width: 50px;font-size: 14px;margin-right: 10px;height:23px;line-height:23px;">数量</span>
        <button class="jbtn5">-</button>
        <input type="text" name="" id="j_ipt1" value="1"/>
        <button class="jbtn6">+</button>
        <span style="margin-left:10px;color:#999;">库存：{{localStock}} 件</span>
    </div>
    <div class="jcm_6">
        <#if lockStatus?? && lockStatus !=0>
            <a class="jbtn3">立即购买</a>
            <a class="jbtn4"><img src="${resources}/basepage/store/default/details_pages/img/shopcar_shoucang.png">加入购物车</a>
        <#else >
            <a class="jbtn3" permission="canBuy">立即购买</a>
            <a class="jbtn4" permission="canBuy"><img src="${resources}/basepage/store/default/details_pages/img/shopcar_shoucang.png">加入购物车</a>
        </#if>
    </div>
    <#else>
    <div style="width: 100%;font-size: 20px; height: 237px;line-height: 237px;text-align: center;">
        该商品已下架
    </div>
    </#if>
</script>

<!--此处是商铺信息模板开始 id="details_storeInfo"-->
<script type="text/x-handlebars-template" id="details_storeInfo">
    <#--<div class="lv">商铺等级LV:<span>10</span>{{supplierType}}</div>-->
    <div class="lv">商铺等级LV:{{storeScore}}</div>
    <#--<div class="storeN">-->
    <#--<span>{{storeName}}</span>-->
    <#--</div>-->
    <div class="storeF">
    <#--<div><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin={{qq}}&amp;site=qq&amp;menu=yes"><img src="${resources}/basepage/store/default/details_pages/img/qq.png"><span>商铺客服</span></a></div>-->
    <#--<div><img src="${resources}/basepage/store/default/details_pages/img/gongyingshang.png"><span>联系供应商</span></div>-->
        <p>商家：<span class="not_weight">{{storeName}}</span></p>
        <p><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin={{qq}}&amp;site=qq&amp;menu=yes"><img src="${resources}/basepage/store/default/details_pages/img/qq.png"><span>联系客服</span></a></p>
    <#--<p class="storeF_center_p"><img src="${resources}/basepage/store/default/details_pages/img/dianhua.png"><span class="tel_02">{{contactMobel}}</span></p>-->
    </div>
    <div class="store_miaoshu">
        <ul>
            <li>
                <p>描述</p>
                <p><span>{{storeScore}}</span></p>
            </li>
            <li>
                <p>服务</p>
                <p><span>{{storeServiceCredit}}</span></p>
            </li>
            <li style="border-right:none;">
                <p>价格</p>
                <p><span>{{storePriceCredit}}</span></p>
            </li>
        </ul>
    </div>
    <div class="sellerBtn">
        <a href="/fsst/${storeId!"#"}/top.jhtml"><img src="${resources}/basepage/store/default/details_pages/img/xiaofangzi.png"><span>进入商铺</span></a>
        <a class="favStore"><img src="${resources}/basepage/store/default/details_pages/img/xiaoxingxing.png"><span>收藏商铺</span></a>
    </div>
</script>

<!--此处是商铺信息模板开始 id="details_goodsScore"-->
<script type="text/x-handlebars-template" id="details_goodsScore">
    <div id="shopPic3">
        <div class="shopPic3_top">
            <div class="shopPic3_top_titleD">商品评价</div>
            <div>
                <ul>
                    <li class="default_red_li">全部评论(<span class="default_red_li">38132</span>)</li>
                    <li>好评(<span>35765</span>)</li>
                    <li>中评(<span>1527</span>)</li>
                    <li>差评(<span>840</span>)</li>
                </ul>
            </div>
        </div>
        {{#each this.list}}
        <div class="shopPic3_mid">
            <div class="shopPic3_mid_l">
                <div class="shopPic3_mid_l_tu">
                    <img src="{{memberPic}}"/>
                </div>
                <div class="shopPic3_mid_l_T">
                    {{memberName}}<br/>
                    {{memberGradeRank}}
                </div>
            </div>
            <div class="shopPic3_mid_r">
                {{#eachContent this.list}}
                <div class={{className}}>
                    <div class="shopPic3_mid_r1">
                        <span>{{prefix}}</span>{{content}}
                    </div>
                    <div class="shopPic3_mid_r2">
                        <!--预览图区开始-->
                        {{#if picList}}
                        <ul class="xq_comment_preview">
                            <!--最多9张-->
                            {{#each picList}}
                            <li>
                                <img src="${resources}/basepage/store/default/details_pages/img/jiayu_img/huazimo/huazimo_item_01.jpg">
                            </li>
                            {{/each}}
                        </ul>
                        {{/if}}
                        <!--预览图区结束-->
                        <!--大图区开始-->
                        <div class="xq_big_preview">
                            <p class="xq_t">
                                <a class="slide_up" href="javascript:void(0);">收起</a>
                            </p>
                            <div class="big_img_box">
                                <div class="box_wh table_cell">
                                    <img src="">
                                </div>
                                <!--切换按钮-->
                                <span class="xq_prev"><b>&lt;</b></span>
                                <span class="xq_next"><b>&gt;</b></span>
                            </div>
                        </div>
                        <!--大图区结束-->
                    </div>
                    <div class="shopPic3_mid_r3">
                        {{createDate}}
                    </div>
                </div><#--首次评论-->
                {{/eachContent}}

            </div>
            <div class="star_box">
                <div class="star_bg"></div>
                <ul class="com_star">
                    {{#listStar score}}{{/listStar}}
                </ul>
            </div>
        </div>
        <div class="shopPic3_buttom">
        </div>
    </div>
    {{/each}}
    <div id="pageNumberRight">
        <div id="pageNumberRightWrap">
			<span id="amountTotal">
				共{{allPages recordsTotal}}页
			</span>
            <ul>
                {{showPages recordsTotal}}
            </ul>
            <div id="turnToPage">
                到第<input id="selectPage_text" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>页
                <input id="selectPage_confirm" type="button" value="确定"/>
            </div>
        </div>
    </div>
</script>



<script type="text/x-handlebars-template" id="details_goodsInfo">
    <div class="jcm_1">
        <p class="p1" title="${data.name!''}">${data.name!""}</p>
        <p class="p2" title="${data.description!''}">${data.description!''}</p>
    <#--<p class="p1">进口冰鲜三文鱼中段500g 日韩刺身料理生鱼片净肉</p>-->
    <#--<p class="p2">当天现切 新鲜发货 默认不切片不带皮 需要的请联系客服或自行订单备注</p>-->
    </div>
    <#if data.promotionItemForm??>
    <div class="activity">
        <div class="activity_title">${data.promotionItemForm.promotionName!""}</div>
        <div class="activity_time">
        <#-- 此处通过下载 -->
        </div>
    </div>
    </#if>
    <div class="jcm_2">
        <ul>
            <li class="mli1">
            <#if data.promotionItemForm??>
                <p class="p3">饭饭单价:<s>{{showPrice unitePriceList_min unitePriceList_max}}</s></p>
                <p class="p4">饭饭标准规格价:<span>{{showPrice salesPriceList_min salesPriceList_max}}</span></p>
                <p class="p9">活动价:<span>{{showPrice promotionPriceList_min promotionPriceList_max}}</span></p>
            <#else>
                <p class="p3">市场单价:<s>{{showPrice marketPriceList_min marketPriceList_max}}</s></p>
                <p class="p4">饭饭单价:<span>{{showPrice unitePriceList_min unitePriceList_max}}</span></p>
                <p class="p9">饭饭标准规格价:<span>{{showPrice salesPriceList_min salesPriceList_max}}</span></p>
            </#if>
                <div class="p10"><span>送达时间:</span>
                    <div class="deliverTime" style="background-position:{{#deliverTime preparePicType}}{{/deliverTime}}"></div>
                </div>
            </li>
        <#--<li class="mli2">-->
        <#--<p class="p7">累计评价</p>-->
        <#--<p class="p8">{{goodsScoreNum}}</p>-->
        <#--<p class="p5">累计销售</p>-->
        <#--<p class="p6">{{goodsTransactionCount}}</p>-->
        <#--</li>-->
        </ul>
    </div>
    <#if data.goodsStatus?? && '10' == data.goodsStatus>
    <div class="jcm_3">
        <span style="display: block;min-width: 50px;font-size: 14px;margin-right:10px;float: left;">配送至</span>
        <a href="javascript:void(0);" style="float: left;">
            <select style="width:135px; height: 22px;">
            <#--<option value="">请登录</option>-->
                <option value="">${buyerDistrict!""}</option>
            <#--<option value="">食国列传</option>-->
            </select>
        </a>
    <#--<span class="prompt_span">此区域无法配送</span>-->
        <p style="text-indent: 60px;padding-top: 10px;clear: left;overflow: hidden;white-space: nowrap;text-overflow: ellipsis" title="由 {{storeName}} 发货,并提供售后服务">由 {{storeName}} 发货,并提供售后服务</p>
    </div>
    <div class="jcm_4">

        {{#eachAttrKey attrKeyList}}
        <div name="{{id}}">
            <div style="min-width: 49px;margin-right: 10px;font-size: 14px;float: left;height:30px;line-height:30px;">{{name}}</div>
            <ul name="{{id}}">
                {{#eachAttrValue ../attrValueList index}}
                <li><a>{{this}}</a></li>
                {{/eachAttrValue}}
            </ul>
        </div>
        {{/eachAttrKey}}
    </div>
    <div class="jcm_5">
        <span style="float: left;min-width: 50px;font-size: 14px;margin-right: 10px;height:23px;line-height:23px;">数量</span>
        <button class="jbtn5">-</button>
        <input type="text" name="" id="j_ipt1" value="1"/>
        <button class="jbtn6">+</button>
        <span style="margin-left:10px;color:#999;">库存：{{localStock}} 件</span>
    </div>
    <div class="jcm_6">
        <#if lockStatus?? && lockStatus !=0>
            <a class="jbtn3">立即购买</a>
            <a class="jbtn4"><img src="${resources}/basepage/store/default/details_pages/img/shopcar_shoucang.png">加入购物车</a>
        <#else>
            <#if data.promotionItemForm??>
                <#if data.promotionItemForm.promotionOn!false>
                    <a class="jbtn3" permission="canBuy" style="margin-left: 140px;">立即购买</a>
                <#else>
                    <a class="jbtn3" style="margin-left: 140px;">立即购买</a>
                </#if>
            <#else>
                <a class="jbtn3" permission="canBuy">立即购买</a>
                <a class="jbtn4" permission="canBuy"><img src="${resources}/basepage/store/default/details_pages/img/shopcar_shoucang.png">加入购物车</a>
            </#if>
        </#if>
    </div>
    <#else>
    <div style="font-size: 14px;margin-top: 10px;color: #c91622;margin-left: 10px;font-weight: bold;">
        此商品已下架
    </div>
    </#if>
</script>
