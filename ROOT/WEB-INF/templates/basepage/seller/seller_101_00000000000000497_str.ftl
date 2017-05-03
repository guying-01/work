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
                大连奇惠生物开发有限公司是经工商注册的合法企业，公司有一支优秀的团队，拥有专业的业务人员20人左右。一直以不衰的业绩在同行之中名列榜首。公司目前拥有高科技人才八十多名，环境优越的写字楼办公场地一千一百多平方，颇具规模的生产场地包括生物醇油炉芯灶芯炉头灶头生产厂、生物醇油成品灶具及甲醇燃烧机厂、生物醇油以及生物汽油和生物柴油的成品油生产场地占地面积共计十多亩地，自主研发的有：生物醇油技术、甲醇汽油技术、甲醇柴油技术，同时我们自主生产的有生物醇油各类灶具炉具，生物醇油各类灶芯炉芯灶头炉头、生物醇油专用燃烧机、甲醇燃烧机、甲醇燃烧器、生物醇油车用甲醇控制器等一系列产品。在全国同行当具有相当大的竞争实力，每年吸引大量的内外地客户前来考察合作，大连奇惠生物开发有限公司 辽宁省劳动就业创业中心授予诚信单位、优秀创业模范单位等诸多荣誉，回首过去，我们一步一个脚印成就了今天的大连奇惠生物开发有限公司，遥望未来，对于所有新老客户，我们争取做到：您需要的产品，我们都有；您需要的技术，我们也有；您满意的质量，我们继续做精；您期待的产品，我们继续研究。精诚合作，共创双赢，将是我们始终不变的宗旨！
            </p>
            <p>
                我公司具有先进完善的管理体系,产品不断的更新换代,打出自己品牌的同时并且是其他国营企业及大中型企业的独家代理商,并加入国际联网,使所有的产品和质量再上一个新台阶,产销服务一条龙, 并为经济困难的客户提供比较方便的销售渠道和比较实惠的原料生产地,真诚为客户是我公司的宗旨。对每位用户电脑微机存档，如质量服务有不满意的地方,可随时向经理部、技术部、服务部反应,产品始终保持质量、产量、销量第一,连年被评为先进企业和消费者信得过单位。
            </p>
            <p>
                我公司严把产品质量关，每种产品从销售、售后层层把关，赢得广大客户的支持与信赖，销售量与日俱增，同时也取得了国内同行中极高的知名度,总公司设有网络部、设备部、话务部、销售部、开发部等十个部门。
            </p>
            <p>
                公司秉承求真务实、自主创新、服务市场、共创双赢的战略目标，以经销商为中心，以市场为导向，实行扶上马、送一程的优惠政策，诚邀广大的有志之士诚信合作，共同发展！
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