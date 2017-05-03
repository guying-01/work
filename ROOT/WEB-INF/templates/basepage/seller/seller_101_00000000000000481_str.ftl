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
            <p>
                大连三岛食品有限公司是调味品、调味料等产品专业生产加工的公司，拥有完整、科学的质量管理体系。大连三岛食品有限公司的诚信、实力和产品质量获得业界的认可。
            </p>
            <p>
                干旱酷暑，是天地对我的考验。当芳草凋零，繁木枯萎。我，却可以面对强风。与大自然的搏击中，我顽强成长。这就是我，楠木树。困苦磨难，是命运对我的考验。在磨难中有人倒下。我却要一如既往，开拓与繁荣一直伴我左右，要让世人所瞩目。这就是我，拥有楠木树精神的大连三岛食品。
            </p>
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