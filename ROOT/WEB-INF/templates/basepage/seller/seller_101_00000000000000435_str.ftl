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
<#import "/basepage/store/default/common/common_footer.ftl" as footerNoTab/>
<#import "/basepage/seller/seller_header_search.ftl" as sellerSearch/>
<@link.render />
    <!--导入共通样式-->
<@script.render />
    <!--导入共通脚本-->
    <link rel="stylesheet" href="${resources}/basepage/seller/css/store.css" type="text/css">
    <script src="${resources}/basepage/seller/js/store_common_head_load.js"></script>
    <script src="${resources}/basepage/seller/js/staticStore.js"></script>
    <script src="${resources}/basepage/seller/js/store_dynamics.js"></script>
    <script src="${resources}/basepage/seller/js/sp_getAboutImg.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<div id="pageInfo" store_id="${storeId!''}" store_template_code="${storeTemplateCode!''}" page_id="${storeTemplateCode!''}" style="display: none"></div>
<!--此处是头部开始-->
<div class="top"><@header_bar.render "商铺",""/></div>
<!--此处是头部结束-->
<!--网页头部&导航开始-->
<div id="sp_hd_1"></div>
<div id="sp_hd_2"></div>
<@sellerSearch.render />
<div id="ff_tab_box">
    <div class="ff_tab_content">
        <div class="ff-tab-title">
            <img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /> <span>商家介绍</span>
        </div>
        <div class="ff-tab-con-detail">
                <p>公司简介：大连市雅圣兴清洁能源有限公司是一家专业从事经销清洁能源的企业。公司位于大连市甘井子区，业务遍及大连市所有地区。</p>
                <p>批准经营范围：本公司已得到大连市政府相关部门的批准，易燃液体及国内一般贸易批发与零售，为依法设立的新能源企业。</p>
                <p>公司经营理念：秉承“为用户着想、与用户互利创新理念、永续经营、创造最佳服务的经营理念”。</p>
                <p>工作目标：以“质量第一、客户满意”为我们的工作目标，并作为我们永远不变的经销政策；以爱护环境健康、实惠客户利益等设备责任为己任；把“诚信、负责、创新、互利”作为雅圣兴人不断的追求和目标。</p>
                <p>服务宗旨：用服务与真诚来换取你的信任和支持，为用户节约经营成本，互惠互利，共创双赢！</p>
                <p>产品优点：公司经营的雅圣兴燃料系统产品被国家知识产权局授予国家专利产品。该产品无色、无味、无污染、无残夜、燃烧完全、燃烧可控、节能环保、安全可靠，得到缓解保护局颁布排放污染物许可，雅圣兴燃料经济实惠可广泛应用于工厂、食堂、餐饮等众多领域，深受广大用户的喜爱和欢迎。</p>
                <p>行业标准：雅圣兴燃料为危险化学品，必须获得危险化学品经营许可、危险化学品道路运输许可证和工商行政批准，否则会因经营而影响用的正常生产与经营。</p>
                <p>寄语：我公司愿与广大朋友竭诚协作，携手共创美好的明天。</p>
        </div>
    </div>
    <div class="ff_tab_content only_book_content_zizhi">
        <div class="ff-tab-title">
            <img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /><span>商家资质</span>
        </div>
        <div class="ff-tab-con-detail">
        <@zizhi.render />
        </div>
    </div>
    <div class="ff_tab_content">
        <div class="ff-tab-title">
            <img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /> <span>商家活动</span>

        </div>
        <div class="ff-tab-con-detail">敬请期待</div>
    </div>
</div>
<@footerNoTab.render />
</body>

</html>