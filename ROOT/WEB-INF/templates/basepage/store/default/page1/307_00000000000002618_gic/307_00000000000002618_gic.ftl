<#--一级类目页:酒店客房用品 ID:307_00000000000002618_gic-->
<#include "/common/common_var_definds.ftl" />
<#include "/basepage/store/default/hb_templates/lv1_hb_templates.ftl" />
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_praise_business.ftl" as praBus/>
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="author" content="m.fan1080.com">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <title>饭饭1080°直采平台</title>
<@link.render />    <!--导入共通样式-->
<@script.render />  <!--导入共通脚本-->
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
    <link rel="stylesheet" href="${resources}/basepage/store/default/level_pages/css/fflv1_css/fflv1_css.css" type="text/css"><!--模板共通样式-->
    <script type="text/javascript" src="${resources}/basepage/store/default/level_pages/js/fflv1_js/lv1_dynamics.js"></script><!--此处是动态数据绑定函数-->
     <link rel="stylesheet" href="${resources}/basepage/store/default/common_css/praBus.css" type="text/css">
<script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="pageInfo_ww" currentPageId="${level1}" currentPageName="${name1}" currentPageRes="${resources}"></div><!--页面信息-->
<@praBus.render />
<!--此处是头部开始-->
<div class="top">
<@top.render />    <#--导入header_top-->
    <div class="top_banner">
        <img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_${level1}_banner.jpg">
    <@searchBox.render />    <#--导入search_box-->
    </div>
</div>
<!--此处是头部结束-->

<!--中部开始-->
<div class="middle classification_lv1">
    <!--<div class="classification_lv1_top_img"></div>-->
    <div class="middle_inbox">
        <!--中间部分上导航开始-->
        <#--<div class="mid_nav my_clear">
            <ul>
                <li><a class="active">${name1}</a></li>
                <li><a>打折</a></li>
                <li><a>满减</a></li>
                <li><a>秒杀</a></li>
                <li><a>抽奖</a></li>
                <li class="ff_koubei"><a>饭饭口碑库</a></li>
            </ul>
        </div>-->
        <!--中间部分上导航结束-->
    <#--二级类目开始-->
        <div class="secound_category_list my_clear ctg_${level1}">
        <#--secound_category_list模板动态加载数据-->
        </div>
    <#--二级类目结束-->
    <#--天上掉馅饼-热卖榜单-新奇特怪推荐开始-->
        <div class="recommend_box my_clear">
            <div class="hot"><a href="/promotion/remaibangdan.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/hotsale.jpg"></a></div>
            <div class="free"><a href="/promotion/pie.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/free.jpg"></a></div>
            <div class="creazy"><a href="/promotion/berserk.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/creazy.jpg"></a></div>
            <div class="new"><a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/newness.jpg"></a></div>
            <div class="t_365"><a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/page1_365.jpg"></a></div>
            <div class="sales"><a href="/promotion/clear.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/clear.jpg"></a></div>
            <div class="top"><a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/page1_top.jpg"></a></div>
        </div>
    <#--天上掉馅饼-热卖榜单-新奇特怪推荐结束-->
    <#--8icon开始-->
        <div class="e_icon_box my_clear">
            <ul>
                <li><a href="/others/comingSoon_2th.jhtml"><div class="e_icon_1"></div><p>自由贷</p></a></li>
                <li><a href="/others/comingSoon_2th.jhtml"><div class="e_icon_2"></div><p>信用贷</p></a></li>
                <li><a href="/others/comingSoon_2th.jhtml"><div class="e_icon_3"></div><p>贸易贷</p></a></li>
                <li><a href="/others/comingSoon_2th.jhtml"><div class="e_icon_4"></div><p>保理贷</p></a></li>
                <li><a href="/others/comingSoon_2th.jhtml"><div class="e_icon_5"></div><p>白条</p></a></li>
                <li><a href="/others/comingSoon_2th.jhtml"><div class="e_icon_6"></div><p>饭小贷</p></a></li>
                <li><a href="/others/comingSoon_2th.jhtml"><div class="e_icon_7"></div><p>理财宝</p></a></li>
                <li><a href="/others/comingSoon_2th.jhtml"><div class="e_icon_8"></div><p>小金库</p></a></li>
            </ul>
        </div>
    <#--8icon结束-->
        <!--猜你喜欢开始-->
        <div class="maylike_box">
            <h4 class="page1_title"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/heart.png">猜你喜欢</h4>
            <div class="maylike my_clear">
                <div>
                    <a class="level_${level1}_cainixihuan_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/page1_maylike.jpg"></a>
                    <div><a><div></div><p></p></a></div>
                </div>
                <div>
                    <a class="level_${level1}_cainixihuan_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/page1_maylike.jpg"></a>
                    <div><a><div></div><p></p></a></div>
                </div>
                <div>
                    <a class="level_${level1}_cainixihuan_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/page1_maylike.jpg"></a>
                    <div><a><div></div><p></p></a></div>
                </div>
            </div>
        </div>
        <!--猜你喜欢结束-->
        <!--订阅商机开始-->
        <div class="opportunity_box">
            <h4 class="page1_title"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/book.png">订阅商机</h4>
            <div class="opportunity my_clear">
                <div class="op_1">
                    <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/opportunity_1.jpg"></a>
                    <div class="op_txt">
                        <p>食材</p>
                        <p>速递</p>
                        <p>周刊</p>
                    </div>
                </div>
                <div class="op_2">
                    <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/opportunity_2.jpg"></a>
                    <div class="op_txt">
                        <p>行业</p>
                        <p>咨询</p>
                        <p>电子期刊</p>
                    </div>
                </div>
                <div class="op_3">
                    <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/opportunity_3.jpg"></a>
                    <div class="op_txt">
                        <p>餐饮人</p>
                        <p>碰碰乐</p>
                        <p>微信平台</p>
                    </div>
                </div>
                <div class="op_4">
                    <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/opportunity_4.jpg"></a>
                    <div class="op_txt">
                        <p>餐饮</p>
                        <p>老板</p>
                        <p>微信平台</p>
                    </div>
                </div>
            </div>
        </div>
        <!--订阅商机结束-->
        <!--新品推荐开始-->
        <div class="new_box">
            <h4 class="page1_title">new!新品推荐</h4>
            <div class="new my_clear">
                <div>
                    <a class="level_${level1}_xinpintuijian_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/page1_maylike.jpg"></a>
                    <div><a><div></div><p></p></a></div>
                </div>
                <div>
                    <a class="level_${level1}_xinpintuijian_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/page1_maylike.jpg"></a>
                    <div><a><div></div><p></p></a></div>
                </div>
                <div>
                    <a class="level_${level1}_xinpintuijian_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/page1_maylike.jpg"></a>
                    <div><a><div></div><p></p></a></div>
                </div>
            </div>
        </div>
        <!--新品推荐结束-->
        <!--饭饭那些事开始-->
        <div class="story_box">
            <h4  class="page1_title"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/bowl.png">饭饭那些事儿</h4>
            <div class="story my_clear">
                <div>
                    <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/ff_story01.jpg">
                        <p>企业新闻报道</p></a>
                </div>
                <div>
                    <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/ff_story02.jpg">
                        <p>产品摄影展</p></a>
                </div>
                <div>
                     <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/ff_story03.jpg">
                        <p>专家随机检测</p></a>
                </div>
            </div>
            <div class="story my_clear">
                <div>
                     <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/ff_story04.jpg">
                        <p>人品老板</p></a>
                </div>
                <div>
                     <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/ff_story05.jpg">
                        <p>产品基地游</p></a>
                </div>
                <div>
                     <a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/ff_story06.jpg">
                        <p>乡土故事</p></a>
                </div>
            </div>
        </div>
        <!--饭饭那些事结束-->
        <!--缤纷多彩开始-->
        <div class="colorful_box">
            <h4 class="page1_title"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/flower.png">缤纷多彩</h4>
            <div class="colorful my_clear">
                <div class="c_1"><a href="/promotion/cheap.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/c_01.jpg" ></a></div><#--巨便宜-->
                <div class="c_2"><a href="/promotion/freeSamples.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/c_02.jpg" ></a></div><#--免费试吃-->
                <div class="c_3"><a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/c_03.jpg" ></a></div><#--舌尖上的情人-->
                <div class="c_4"><a href="/others/comingSoon_3th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/c_04.jpg" ></a></div><#--馋嘴猴-->
                <div class="c_5"><a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/c_05.jpg" ></a></div><#--优惠券-->
                <div class="c_6"><a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/c_06.jpg" ></a></div><#--微视频-->
                <div class="c_7"><a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/c_07.jpg" ></a></div><#--买就赠-->
                <div class="c_8"><a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/c_08.jpg" ></a></div><#--饭饭网博会-->
            </div>
        </div>
        <!--缤纷多彩结束-->
        <!--展会开始-->
        <div class="mall_box">
        <a href="/others/comingSoon_4th.jhtml" class="m_1">中小规模采购会</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_2">产品推介会</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_3">中远期货交易</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_4">新菜试吃会</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_5">展会</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_6">研讨会</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_7">新品品鉴会</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_8">团定会</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_9">现货挂牌</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_10">代理采购</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_11">竞价拍卖</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_12">集采交易</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_13">招标交易</a>
        <a href="/others/comingSoon_4th.jhtml" class="m_14">撮合交易</a>
        </div>
        <!--展会结束-->
        <!--客房清洁用品开始-->
        <div class="fl_box fl_1">
            <p class="fl_title">1F 客房清洁用品</p>
            <div class="my_clear">
                <a class="level_${level1}_f1_03 item1"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl1_ads01.jpg"></a>
                <a class="level_${level1}_f1_05 item2"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl1_ads02.jpg"></a>
                <a class="level_${level1}_f1_06 item3"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl1_ads03.jpg"></a>
            </div>
            <div class="brand my_clear">
                <a class="level_${level1}_f1_bottom_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
                <a class="level_${level1}_f1_bottom_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_2.jpg"></a>
                <a class="level_${level1}_f1_bottom_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
            </div>
        </div>
        <!--客房清洁用品结束-->
    <#--客房餐饮用品开始-->
        <div class="fl_box fl_2">
            <p class="fl_title">2F 客房餐饮用品</p>
            <div class="my_clear">
                <div class="left">
                    <a class="level_${level1}_f2_banner1_01 item1"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl2_ads01.jpg"></a>
                    <a class="level_${level1}_f2_banner1_02 item2"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl2_ads02.jpg"></a>
                </div>
                <div class="right">
                    <a class="level_${level1}_f2_03 item3"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl2_ads03.jpg"></a>
                </div>
            </div>
            <div class="brand my_clear">
                <a class="level_${level1}_f2_bottom_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
                <a class="level_${level1}_f2_bottom_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_2.jpg"></a>
                <a class="level_${level1}_f2_bottom_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
            </div>
        </div>
    <#--客房餐饮用品结束-->
    <#--客房家具床上用品开始-->
        <div class="fl_box fl_3">
            <p class="fl_title">3F 客房家具床上用品</p>
            <div class="my_clear">
                <a class="level_${level1}_f3_03 item1"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads02.jpg"></a>
                <a class="level_${level1}_f3_04 item2"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads03.jpg"></a>
                <a class="level_${level1}_f3_banner_01 item3"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads01.jpg"></a>
            </div>
            <div class="brand my_clear">
                <a class="level_${level1}_f3_bottom_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
                <a class="level_${level1}_f3_bottom_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_2.jpg"></a>
                <a class="level_${level1}_f3_bottom_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
            </div>
        </div>
    <#--客房家具床上用品结束-->
    <#--客房一次性用品开始-->
        <div class="fl_box fl_4">
            <p class="fl_title">4F 客房一次性用品</p>
            <div class="my_clear">
                <a class="level_${level1}_f4_03 item1"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads03.jpg"></a>
                <a class="level_${level1}_f4_04 item2"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads02.jpg"></a>
                <a class="level_${level1}_f4_banner_01 item3"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads01.jpg"></a>
            </div>
            <div class="brand my_clear">
                <a class="level_${level1}_f4_bottom_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
                <a class="level_${level1}_f4_bottom_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_2.jpg"></a>
                <a class="level_${level1}_f4_bottom_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
            </div>
        </div>
    <#--客房一次性用品结束-->
    <#--客房卫浴用品开始-->
        <div class="fl_box fl_5">
            <p class="fl_title">5F 客房卫浴用品</p>
            <div class="my_clear">
                <a class="level_${level1}_f5_03 item1"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads03.jpg"></a>
                <a class="level_${level1}_f5_04 item2"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads02.jpg"></a>
                <a class="level_${level1}_f5_banner_01 item3"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads01.jpg"></a>
            </div>
            <div class="brand my_clear">
                <a class="level_${level1}_f5_bottom_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
                <a class="level_${level1}_f5_bottom_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_2.jpg"></a>
                <a class="level_${level1}_f5_bottom_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
            </div>
        </div>
    <#--客房卫浴用品结束-->
    <#--客房大堂用品开始-->
        <div class="fl_box fl_6">
            <p class="fl_title">6F 客房大堂用品</p>
            <div class="my_clear">
                <a class="level_${level1}_f6_banner1_01 item1"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads01.jpg"></a>
                <a class="level_${level1}_f6_01 item2"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads02.jpg"></a>
                <a class="level_${level1}_f6_02 item3"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads03.jpg"></a>
            </div>
            <div class="brand my_clear">
                <a class="level_${level1}_f6_bottom_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
                <a class="level_${level1}_f6_bottom_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_2.jpg"></a>
                <a class="level_${level1}_f6_bottom_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
            </div>
        </div>
    <#--客房大堂用品结束-->
    <#--客房电器用品开始-->
        <div class="fl_box fl_7">
            <p class="fl_title">7F 客房电器用品</p>
            <div class="my_clear">
                <a class="level_${level1}_f7_01 item1"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl7_ads.jpg"></a>
                <a class="level_${level1}_f7_02 item2"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl7_ads.jpg"></a>
                <a class="level_${level1}_f7_03 item3"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl7_ads.jpg"></a>
                <a class="level_${level1}_f7_04 item4"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl7_ads.jpg"></a>
            </div>
            <div class="brand my_clear">
                <a class="level_${level1}_f7_bottom_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
                <a class="level_${level1}_f7_bottom_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_2.jpg"></a>
                <a class="level_${level1}_f7_bottom_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
            </div>
        </div>
    <#--客房电器用品结束-->
    <#--客房灯饰用品开始-->
        <div class="fl_box fl_8">
            <p class="fl_title">8F 客房灯饰用品</p>
            <div class="my_clear">
                <a class="level_${level1}_f8_banner1_01 item1"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads01.jpg"></a>
                <a class="level_${level1}_f8_01 item2"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads02.jpg"></a>
                <a class="level_${level1}_f8_02 item3"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fl3_ads03.jpg"></a>
            </div>
            <div class="brand my_clear">
                <a class="level_${level1}_f8_bottom_01"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
                <a class="level_${level1}_f8_bottom_02"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_2.jpg"></a>
                <a class="level_${level1}_f8_bottom_03"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/p1_brand_1.jpg"></a>
            </div>
        </div>
    <#--客房灯饰用品结束-->
    <#--分享有礼-饭饭淘开始-->
        <div class="share_box">
            <div class="in_box">
                <div class="fftao">
                    <div class="title"></div>
                    <a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fftao_img.jpg"></a>
                </div>
                <div class="day_show">
                    <div class="title"></div>
                    <div class="comment">
                        <a class="item my_clear" href="/fsgd/bRYqLIfnZsPXYSN-aVNr4iWbnS95KyCOd1ykxZD_xes.jhtml">
                            <div class="it_img"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/haoping.jpg"></div>
                            <div class="it_txt">
                                <h4>通威水产</h4>
                                <p>非常快就到了，包装很严实！</p>
                            </div>
                        </a>
                        <a class="item my_clear" href="/fsgd/VcywU2I-3MUdplFejx1P5_rSiSOgMsok53dSuVOx5jE.jhtml">
                            <div class="it_img"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/haoping02.jpg"></div>
                            <div class="it_txt">
                                <h4>华捷水产</h4>
                                <p>东港的海鲜的品质不用置疑的，肯定是好呀。</p>
                            </div>
                        </a>
                        <a class="item my_clear" href="/fsgd/ymJkslJr1w5_2uRSMbc2AAS0EAPdjDxGq0ErASEb5E4.jhtml">
                            <div class="it_img"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/haoping03.jpg"></div>
                            <div class="it_txt">
                                <h4>早春生态</h4>
                                <p>非常好吃 下次还要继续购买</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="share">
                    <div class="title"></div>
                    <a href="/others/comingSoon_2th.jhtml"><img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/share_img.jpg"></a>
                </div>
            </div>
        <#--            <img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/share.jpg">-->

        </div>
    <#--分享有礼-饭饭淘结束-->
    <#--弹出框开始-->
        <div class="ff_goods_box">
            <div>
                <a>饭饭指数（排行榜）</a>
                <a>监督团</a>
            </div>
            <div>
                <a>会员俱乐部</a>
                <a>评论团</a>
            </div>
            <div>
                <a>评测团</a>
                <a>你问我答</a>
            </div>
            <div>
                <a>智囊团</a>
                <a>地面见面会</a>
            </div>
            <div>
                <a>质检团</a>
            </div>
        </div>
    <#--弹出框结束-->
    </div>
    <!-----------------------此处为footer（楼层以下）-------------------->
<@footer.render />    <!--导入footer-->
<@scrollTop.render />
</div>
<!--中部结束-->
</body>
</html>
