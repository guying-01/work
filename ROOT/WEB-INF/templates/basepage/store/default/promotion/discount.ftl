<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_topbanner.ftl" as topBanner/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<@link.render />
<!--导入共通样式-->
<@script.render />
<#include "/basepage/store/default/hb_templates/promotion_hb_templates.ftl" />
<!--导入共通脚本-->
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="${resources}/basepage/store/default/promotion/css/discount.css" />
    <link rel="stylesheet" type="text/css" href="${resources}/basepage/store/default/promotion/css/promotion_hb.css?v2017042601" />
    <script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
    <script src="${resources}/basepage/store/default/promotion/js/discount.js" type="text/javascript" charset="utf-8"></script>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if(deviceWidth > 768) {
            deviceWidth = 768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>

</head>

<body>
<input type="hidden" requestNum="04" id="promotion-common">
<@scrollTop.render />
<!--此处是头部开始-->
<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "打折",""/>
<#--导入header_top-->
</div>
<!--此处是头部结束-->
<div class="discount_top">
</div>
<div class="promotion-common-content">


</div>
<!-----------------------此处为footer（楼层以下）-------------------->
<@footer.render />
<!--导入footer-->
<!--此处为底部结束（楼层以下）-->
<div class="f_returnTop" title="返回顶部"></div>
</body>

</html>
