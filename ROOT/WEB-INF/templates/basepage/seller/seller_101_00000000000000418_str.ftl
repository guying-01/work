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
                赞品堂成立于2000年，注册资金600万元,坐落在举世闻名的人间仙境—大连，是集海珍品繁育、养殖、海洋生物食品研发、生产、销售、服务为一体的高新技术企业。
            </p>
            <p>
                公司现有员工60余人，其中，专业技术人员22人。公司成立以来，先后与中国农业大学、中国海洋大学、山东大学、烟台大学、黄海水产研究所等著名高校及科研机构建立了长期技术合作关系，并拥有多名由中科院院士、教授、博士、硕士组成的专家技术团队。2010年，公司斥巨资新建标准化食品加工厂，引进目前国内最先进的海参生产、检验、化验设备30多台套，制定了严格的生产、质控规程，取得了干制水产品及水产品深加工品生产许可双认证。
            </p>
            <p>
                公司以大连海域野生、鲜活刺海参为原料，以先进的生物工程技术为依托，对渤海刺海参进行了系统分析研究。自主研发、生产：淡干海参、冻干海参、珍味即食海参、速冻即食海参、冻干海参皇、冻干海参肠、即食海参皇、速溶海参汤包、休闲海产食品、其他海鲜（鲍鱼、海带、干贝、金钩海米）等十大系列近百款产品，实现了科研成果向生产力的快速转化。
            </p>
            <p>
                公司年生产能力为：干海参5万斤、冻干海参1万斤、珍味即食海参2万斤、速冻即食海参10万斤、速溶海参汤包30万块。
            </p>
            <p>
                展望未来，赞品堂将继续秉承“信义行天下，品质铸辉煌”的经营理念，充分利用人间仙境—大连海域得天独厚的海参资源，以专利技术为手段，为大众的健康事业做出新的贡献。
            </p>
            <p>拥抱海洋，关爱健康，</p>
            <p>创造卓越品质，共享喜悦人生！</p>
            <p>取上古之奇珍，福泽华夏！</p>
            <p>创造卓越品质，共享喜悦人生！</p>
            <p>崛起于黄海之滨，打造海参行业旗舰品牌！</p>
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