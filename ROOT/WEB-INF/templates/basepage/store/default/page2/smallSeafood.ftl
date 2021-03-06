<#--二级类目页-->
<#include "/common/common_var_definds.ftl" />
<!DOCTYPE html>
<html>

<head lang="en">
    <title>饭饭1080°直采平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if(deviceWidth>768){
            deviceWidth=768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>

<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#import "/basepage/store/default/common/common_praise_business.ftl" as praBus/>
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<@link.render />
    <!--导入共通样式-->
<@script.render />
    <!--导入共通脚本-->
    <link rel="stylesheet" href="${resources}/basepage/store/default/level_pages/css/fflv2_css/fflv2_css.css" type="text/css">
    <!--二级页共通样式-->
    <link rel="stylesheet" href="${resources}/basepage/store/default/common_css/praBus.css" type="text/css">
    <script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
<#--<script type="text/javascript" src="${resources}/basepage/store/default/level_pages/js/fflv2_js/lv2_dynamics.js"></script>-->
    <!--此处是动态数据绑定函数-->
</head>
<style>
    .article p{
        text-indent: 0.6rem;
        padding: 0.1rem;
        line-height: 0.35rem;
        font-size: 0.3rem;
        color: #565656;
    }
</style>
<body>
<div id="pageInfo_ww" lv1_id="${level1}" lv1_name="${name1}" currentPageId="${level2}" currentPageName="${name2}" style="display:none"></div>
<!--页面信息-->
<@praBus.render />
<!--此处是头部开始-->
<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "大连小海鲜",""/>
<#--导入header_top-->
</div>

<#--<@top.render />-->
<#--导入header_top-->

<#--<@searchBox.render />-->
<#--导入search_box-->

<div class="article" style="padding: 0.3rem;word-break: break-all">

    <div class="seafoodHistory-contain">
        <div class="boxTitle">
            大连小海鲜
        </div>
            <p>小海鲜是指，相较龙虾、螃蟹、鲍鱼、鱼翅等个头较大、价格较贵的海鲜原料，概念上个头较小、价格比较便宜的海鲜食材，如海瓜子、海带菜、海螺、各种贝类、虾、海杂鱼等等形体较小的海鲜，生活在海边的人，习惯上将它们成为“小海鲜”。小海鲜，营养丰富、口味鲜美、品种繁多、价格平易，是最受追捧的海鲜食材。</p>
            <p class="title">小海鲜蛋白质丰富</p>
            <p>小海鲜中一般都含有丰富的蛋白质，通常在10%--15%之间，而且是人体所需的优质蛋白质，易于人体消化吸收，小海鲜与其它畜肉类相比，碳水化合物含量较少，所含热量低，最受怕胖者欢迎。</p>
            <p class="title">小海鲜不饱和脂肪酸含量高</p>
            <p>小海鱼脂肪中高度不饱和脂肪酸EPA和DHA是人体必需的脂肪酸，具有重要的生理作用，人体不能自行合成，只能从海鱼和其它海产品中摄取。它们不但易消化吸收，而且不会导致胆固醇升高。EPA和DHA是新发现的人类必需营养素，除小海鲜和某些海产品外，在其它天然食物中存在不多。</p>
            <p class="title">小海鲜维生素和矿物质含量丰富</p>
            <p>小海鲜中富含人体所需的多种维生素和矿物质，特别是维生素E、维生素A及矿物质锌、铁、钾等，对人体的健康成长有非常重要的意义。小海鲜中含有的钙、磷、铁等微量元素比一般肉类高，还有丰富的其它矿物质，对维持人体正常的新陈代谢具有重要作用。</p>
            <p class="title">小海鲜脂肪含量低</p>
            <p>小海鲜中的脂肪含量一般在5%以下，且多为不饱和脂肪酸，有很好的降低胆固醇作用，还能降低血液粘稠度，预防和降低冠心病、糖尿病、动脉硬化的发生率。</p>
            <p class="title">小海鲜食用禁忌</p>
            <p>吃小海鲜时忌大量饮用啤酒，因为喝啤酒会产生大量尿酸，尿酸会沉淀在关节或软组织中，导致发炎，有诱发通风的危险。小海鲜还忌与柿子、葡萄、石榴、山楂等水果同食，因为海鲜中丰富的蛋白质会与水果中的鞣酸形成一种新物质，不易被人体吸收，也就降低了小海鲜的营养价值。</p>

    </div>
</div>

<!-----------------------此处为footer（楼层以下）-------------------->
<@footer.render />
<!--导入footer-->
<@scrollTop.render />
</body>

</html>
