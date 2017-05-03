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
            <img src="/resources/basepage/seller/img/${storeId!''}/01.jpg" style="width: 100%;margin: auto;padding-bottom: 0.2rem;">
            <p>
                中国内蒙古盛德苒食品开发有限公司座落于传统小麦优质产区，河套平原的内蒙古巴彦淖尔市，公司创建于2002年，其占地面积16000平方米，固定资产8000万，流动资金2000万，现有员工102人，其中高中级面粉专业人员18人，为企业的进一步壮大奠定了坚实的基础。
            </p>
            <p>
                现公司旗下有盛德苒牌雪花粉和盛德苒牌富硒粉两大系列八种畅销产品。本公司是一家集面粉加工、研发、销售、仓储于一体的集团型企业。
            </p>
            <p>
                为满足市场需求，公司于2006年投资2000万引进意大利先进技术和流水线，现车间日产能力100吨，2015年10月公司又增加两条国际先进生产线，拥有原粮仓20座，配粉仓8座，日处理小麦260吨。公司3条生产线合计日产量220吨，努力成为行业中规模大、信誉高、质量好的专业粮食加工企业。
            </p>
            <p>
                近几年来，面对激烈的市场竞争，我厂积极实施“质量兴企，创新兴业”的战略，围绕市场搞加工，真正做到了客户需要什么，我们就生产什么的经营原则。生产的“盛德苒雪花粉”系列、“富硒粉”系列、远销国内大中城市，得到客户的高度评价，深受消费者的青睐。提炼高端产品，还原绿色食品是我们的使命 。公司开发的全麦粉和营养面粉正在审批当中，一旦生产不但推动了面粉行业的发展，而且也给客户带去了财富，更重要的是给消费者送上了无尽的健康。
            </p>
            <p>
                公司于二○○○年首批获得国家“QS食品质量安全生产许可证”多次被评为“诚实守信单位”、“重合同、守信誉”企业。“盛德苒”面粉在获得“中国著名品牌”、“国家放心面”的基础上，我们继续加大质量管理力度，将争创名牌产品作为提升企业知名度的重要工作，列入企业的发展战略。公司于2007年12年15年，先后三次斥巨资引进面粉检验设备，现已拥有验粉筛、醒发箱、全自动天平仪、白度仪、近红外仪、快速水份容重仪等一系列高级面粉检测设备。每一批面粉都要经过先检验(原粮）后生产再销售的环节，使面粉的出厂合格率达到了100%。
            </p>
            <p>
                公司本着“以质量开拓市场，以信誉赢得客户”的经营理念，创新产品供给，填补行业空白，引导健康饮食，挖掘河套麦稀缺价值，塑造盛德苒好面品牌。
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