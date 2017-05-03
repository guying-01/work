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
                大连金百味集团有限公司成立于2004年8月，是以金百味食品有限公司为主体，包括金百味面业有限公司、金柏德塑料彩印有限公司组成的集团公司。集团坐落于大连市甘井子区辛寨子工业园，占地面积5万余平方米，建筑面积3万余平方米，现有员工近千人。集团成立至今，先后引进德国、日本、韩国先进设备和技术工艺，累计投资超2亿元人民币，经过不断的完善和升级改造，已成为现代化综合性食品加工企业。经营范围涉及肉类食品、海产食品、罐头食品、休闲食品、保鲜湿面、包装物料制造及软包装彩色印刷等，产品不仅行销全国，而且远销至美国、欧洲、俄罗斯、澳大利亚、日本、韩国、香港等国家和地区。
            </p>
            <p>
                在集团董事长郑兴先生的领导下，金百味人的努力付出，不仅打响了金百味的品牌，更在消费者心中树立起良好的口碑，得到社会各界的一致认可，短短几年，公司先后被评为市级“农业产业化龙头企业”、“中国中小企业创新500强”、“年度创新工作先进单位”等荣誉称号。金百味的产品也曾多次被评为“大连市名牌产品”、“辽宁省名牌产品”、“中国轻工商品创新产品银奖”等荣誉称号，金百味商标更是连续多年荣获“大连市著名商标”、“辽宁省著名商标”荣誉称号。2013年，金百味集团工会被中华全国总工会授予“模范职工之家”荣誉称号。
            </p>
            <p>
                金百味自建立那天起，就有着远大的目标，立志要创百年基业。我们将持续秉承“品质、创新、诚信”的经营“质”道，并怀着与生俱来的激情，以超常规的思维创意，超常规的行动速度，为企业注入核心生命力。实现社会责任、客户利益、企业声誉、员工价值的最大化、最优化。
            </p>
            <p>
                我们热忱欢迎国内外朋友来公司考察、交流、合作、共赢，共同创建美好的明天！
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