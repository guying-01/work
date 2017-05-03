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
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<@link.render />
    <!--导入共通样式-->
<@script.render />
<#include "/basepage/store/default/hb_templates/promotion_hb_templates.ftl" />
    <!--导入共通脚本-->
    <link rel="stylesheet" href="${resources}/basepage/store/default/promotion/css/detail_burst.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${resources}/basepage/store/default/promotion/css/promotion_hb.css?v2017042601" />
    <script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
    <script src="${resources}/basepage/store/default/promotion/js/detail_burst.js" type="text/javascript" charset="utf-8"></script>
    <!--此处是动态数据绑定函数-->
</head>
<body>
<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "每日爆款",""/>
<#--导入header_top-->
</div>
<@scrollTop.render />
<input type="hidden" requestNum="07" id="promotion-common">
<div id="detail_burstWrap">
    <div class="bannerBox">
    </div>
    <div class="promotion-common-content">


    </div>

</div>
<@footer.render />
</body>
</html>
