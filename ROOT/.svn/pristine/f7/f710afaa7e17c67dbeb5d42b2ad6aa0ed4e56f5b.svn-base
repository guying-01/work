<#include "/common/common_var_definds.ftl" />
<!DOCTYPE html>
<html>

<head>
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
    <link rel="stylesheet" href="${resources}/basepage/store/default/promotion/css/clear.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${resources}/basepage/store/default/promotion/css/promotion_hb.css?v2017042601" />
    <script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
    <script src="${resources}/basepage/store/default/promotion/js/clear.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if(deviceWidth > 768) {
            deviceWidth = 768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
  <!--此处是动态数据绑定函数-->
</head>
<body>
<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "清仓甩卖",""/>
<#--导入header_top-->
</div>
  <input type="hidden" requestNum="05" id="promotion-common">
  <@scrollTop.render />
  <div class="banner">
    <div class="clear_top"></div>
  </div>
  <div class="promotion-common-content">
  </div>

  <@footer.render />
</body>
</html>
