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
<#--<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>-->
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_member_footer.ftl" as footerTab/>
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<@link.render />
    <!--导入共通样式-->
<@script.render />
<#include "/basepage/store/default/hb_templates/promotion_hb_templates.ftl" />

    <!--导入共通脚本-->
    <!--此处是动态数据绑定函数-->
    <style>
        .promotion_box div{width: 100%;border-bottom: 1px solid #dcdcdc;}
        .promotion_box div img{width: 100%;}
        .ff_list_search_box {
            height: 0.73rem;
            position: relative;
            border-bottom: 1px solid #dcdcdc;
        }
        .ff_header_bar{
            border-top:0;
            border-bottom: 1px solid #999;
        }
    </style>
</head>
<body>
<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "饭饭活动专区",""/>
<#--导入header_top-->
</div>
<@scrollTop.render />
<div class="promotion_box">
    <a href="/promotion/daily_burst.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/daily_burst.jpg"></div>
    </a>
    <a href="/promotion/cheap.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/cheap.jpg"></div>
    </a>
    <a href="/promotion/clear.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/clear.jpg"></div>
    </a>
    <a href="/promotion/discount.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/discount.jpg"></div>
    </a>
    <a href="/promotion/freeSamples.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/freeSamples.jpg"></div>
    </a>
    <a href="/promotion/pie.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/pie.jpg"></div>
    </a>
    <a href="/promotion/berserk.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/berserk.jpg"></div>
    </a>
    <a href="/promotion/seckill.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/seckill.jpg"></div>
    </a>
    <a href="/promotion/remaibangdan.jhtml">
        <div class="go_daily_burst"><img src="${resources}/basepage/store/default/promotion/img/promotion_index/remaibangdan.jpg"></div>
    </a>
</div>

<@footerTab.render />
</body>
</html>
<script type="text/javascript">
    $('.promotion_box a').on('click', function () {
        localStorage.pageNum='';
        localStorage.scrollTop=''
    })
</script>