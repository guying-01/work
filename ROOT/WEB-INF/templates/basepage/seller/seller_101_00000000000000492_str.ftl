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
                酒阿网官方旗舰店与全球知名酒庄建立了多年的战略合作伙伴关系，公司已有对外贸易进出口资质，拥有澳洲百年历史的长腿袋鼠和大耳朵考拉等自有品牌，原瓶原装进口的全球货源保证葡萄酒的品质，我公司秉承“重合同守信用”原则，为每一位客户服务。
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