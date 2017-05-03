<#--店铺首页-->
<#include "/common/common_var_definds.ftl" />
<#include "/basepage/store/default/hb_templates/store_hb_templates.ftl" />
<#import "/basepage/store/default/common/zizhi_slider.ftl" as zizhi/>
<#import "/basepage/store/default/common/dangan_slider.ftl" as dangan/>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>饭饭1080°直采平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if(deviceWidth > 768) {
            deviceWidth = 768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#--<#import "/basepage/store/default/common/common_footer_no_tab.ftl" as footerNoTab/>-->
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#import "/basepage/seller/seller_header_search.ftl" as sellerSearch/>
<@link.render />
    <!--导入共通样式-->
<@script.render />
    <!--导入共通脚本-->
    <link rel="stylesheet" href="${resources}/basepage/store/default/category_navigation/css/category.css" type="text/css">
    <script src="${resources}/basepage/seller/js/store_common_head_load.js"></script>
</head>

<body>
<#import "/basepage/store/default/about_pages/common_about_header.ftl" as header/>
<@header.render />
<div class="nav" style="border-bottom: 0.01rem solid #707271;">
    网站导航
    <a class="goBack" onclick="javascript :history.go(-1);"></a>
</div>
<div class="title">
    <div class="black"></div>
    <div class="name">网上营销工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/promotion/cheap.jhtml">巨便宜商城</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">365主题活动</a></li>
        <#--<li><a href="" style="cursor: default;">最新产品</a></li>-->
        <#--<li><a href="" style="cursor:default;">良心品质</a></li>-->
        <li><a href="/others/comingSoon_2th.jhtml">优惠券</a></li>
        <li><a href="/promotion/clear.jhtml">清仓甩卖</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭饭网博会</a></li>
        <li><a href="/promotion/discount.jhtml">打折</a></li>
        <#--<li><a href="" style="cursor:default;">抽奖</a></li>-->
        <li><a href="/others/comingSoon_2th.jhtml">买就赠</a></li>
        <#--<li><a href="/promotion/remaibangdan.jhtml">热卖榜单</a></li>-->
    </ul>
    <ul class="ul">

        <#--<li><a href="" style="cursor:default;">口碑甄选</a></li>-->
        <#--<li><a href="" style="cursor:default;">特色专供</a></li>-->
        <li><a href="/promotion/seckill.jhtml">秒杀</a></li>
        <li><a href="/promotion/pie.jhtml">天上掉馅饼</a></li>
        <#--<li><a href="" style="cursor:default;">相关推荐</a></li>-->
        <#--<li><a href="" style="cursor:default;">畅销榜</a></li>-->
        <#--<li><a href="" style="cursor:default;">饭饭力荐</a></li>-->
            <li><a href="/promotion/freeSamples.jhtml">免费试吃</a></li>

            <li><a href="/promotion/berserk.jhtml">疯抢晚八点</a></li>
            <li><a href="/others/comingSoon_2th.jhtml">新奇特怪</a></li>
            <li><a href="/promotion/daily_burst.jhtml">每日爆款</a></li>
            <#--<li><a href="" style="cursor:default;">打折</a></li>-->
            <li><a href="/others/comingSoon_2th.jhtml">积分</a></li>
    </ul>
</div>

<div class="title">    <div class="black"></div>
    <div class="name">线下推广工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">各种展会</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">产品推介会</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">团定会</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">代理采购</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">招标交易</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">中小规模采购会</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">新菜试吃会</a></li>

    </ul>
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">研讨会</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">新品品鉴会</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">现货挂牌</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">竞价拍卖</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">撮合交易</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">中远期货交易</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">集采交易</a></li>
    </ul>
</div>

<div class="title">
    <div class="black"></div>
    <div class="name">软性工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">企业新闻报道</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">专家随机检测</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">微视频</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">馋嘴猴搜搜集</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">舌尖上的情人</a></li>

    </ul>
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">产品摄影展</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">人品老板</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">产品基地游</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">乡土故事</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭饭头条</a></li>
    </ul>

</div>

<div class="title">
    <div class="black"></div>
    <div class="name">金融工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">饭饭自由贷</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭饭信用贷</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭饭白条</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">对接银行</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭饭小金库</a></li>

    </ul>
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">饭饭货易贷</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭饭保理贷</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭小贷</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">保证金理财宝</a></li>
    </ul>

</div>


<div class="title">
    <div class="black"></div>
    <div class="name">服务工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/fsst/contact/contact_com.jhtml">饭饭举报中心</a></li>
        <#--<li><a href="" style="cursor:default;">退货管理</a></li>-->
        <li><a href="/others/comingSoon_4th.jhtml">行业培训基地</a></li>
        <li><a href="/others/comingSoon_4th.jhtml">商机无限</a></li>
        <li><a href="/others/comingSoon_4th.jhtml">行业人才库</a></li>
        <li><a href="/fsst/contact/contact_com.jhtml" style="cursor:default;">赤甲红护卫队</a></li>

    </ul>
    <ul class="ul">
        <li><a href="/fsst/contact/contact_com.jhtml" style="cursor:default;">饭饭申诉中心</a></li>
        <li><a href="/fsst/contact/contact_com.jhtml" style="cursor:default;">赤甲红天使队</a></li>
        <li><a href="/others/comingSoon_4th.jhtml">行业增值服务</a></li>
        <#--<li><a href="" style="cursor:default;">饭饭发言</a></li>-->
        <li><a href="/others/comingSoon_4th.jhtml">饭饭社区</a></li>
        <li><a href="/others/comingSoon_3th.jhtml">地面活动</a></li>
    </ul>
</div>

<div class="title">
    <div class="black"></div>
    <div class="name">影响力工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">各种排行榜</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">测评团</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">质检团</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">评论团</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">地面见面会</a></li>

    </ul>
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">会员俱乐部</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">智囊团</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">监督团</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">你问我答</a></li>
    </ul>

</div>

<div class="title">
    <div class="black"></div>
    <div class="name">电子推广工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">食材速递周刊</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">电子期刊</a></li>
    </ul>
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">餐饮人碰碰乐微信平台</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">餐饮老板微信平台</a></li>
    </ul>

</div>

<div class="title">
    <div class="black"></div>
    <div class="name">流量工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">私人订制</a></li>
        <li><a href="/promotion/remaibangdan.jhtml">热卖榜单</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">天天晒单</a></li>
    </ul>
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">飞上云霄</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭饭淘</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">分享有礼</a></li>
    </ul>

</div>


<div class="title">
    <div class="black"></div>
    <div class="name">数据工具</div>
</div>
<div class="box">
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">饭饭指数</a></li>
        <li><a href="/others/comingSoon_2th.jhtml">饭饭报表</a></li>
    </ul>
    <ul class="ul">
        <li><a href="/others/comingSoon_2th.jhtml">生意参谋</a></li>
    </ul>

</div>


<@footer.render />
</body>
</html>
<script type="text/javascript">
    $('.box:first ul li a').on('click', function () {
        localStorage.pageNum='';
        localStorage.scrollTop=''
    })
</script>