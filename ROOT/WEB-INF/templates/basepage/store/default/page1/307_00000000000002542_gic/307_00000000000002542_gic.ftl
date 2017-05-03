<#--一级类目页:燃料类 ID:307_00000000000002542_gic-->
<#include "/common/common_var_definds.ftl" />
<#include "/basepage/store/default/hb_templates/lv1_hb_templates.ftl" />
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_praise_business.ftl" as praBus/>
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="author" content="m.fan1080.com">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <title>饭饭1080°直采平台</title>
<@link.render />    <!--导入共通样式-->
<@script.render />  <!--导入共通脚本-->
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
    <link rel="stylesheet" href="${resources}/basepage/store/default/level_pages/css/fflv1_css/fflv1_css.css" type="text/css"><!--模板共通样式-->
    <script type="text/javascript" src="${resources}/basepage/store/default/level_pages/js/fflv1_js/lv1_dynamics.js"></script><!--此处是动态数据绑定函数-->
    <link rel="stylesheet" href="${resources}/basepage/store/default/common_css/praBus.css" type="text/css">
<script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="pageInfo_ww" currentPageId="${level1}" currentPageName="${name1}" currentPageRes="${resources}"></div><!--页面信息-->
<@praBus.render />
<!--此处是头部开始-->
<!--此处是头部开始-->
<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "燃料类",""/>
<#--导入header_top-->
</div>
<!--此处是头部结束-->

<!--中部开始-->
<div class="brand_main_box chandi_main_box">
<#--    <div class="title">酒店专业装修</div>-->
    <div class="category_list">
        <ul class="my_clear">
            <li>液体</li>
            <li>气体</li>
            <li>木炭</li>
            <li>固体</li>
        </ul>
    </div>
    <div>
        <div class="item_list"><#--液体-->
            <ul class="pd">
                <li class="item">
                    <a href="/fsst/101_00000000000000497_str/top.jhtml">
                        <div class="brand_name">奇惠能源</div>
                        <div class="in_box my_clear">
                            <img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/fuel/fuel_qihuinengyuan.jpg">
                            <div>业务领域：天然气、液化气、生物油、醇基燃油、锅炉油。</div>
                        </div>
                        <p>进入商铺</p>
                    </a>
                </li>
                <li class="item">
                    <a href="/fsst/101_00000000000000435_str/top.jhtml">
                        <div class="brand_name">雅圣兴清洁能源</div>
                        <div class="in_box my_clear">
                            <img src="${resources}/basepage/store/default/level_pages/img/fflv1_img/service/service_yashengxing.jpg">
                            <div class="long">业务领域：雅圣兴燃料、雅圣兴电子灶、甲醇燃料锅炉等。</div>
                        </div>
                        <p>进入商铺</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="item_list"><#--气体-->
            <ul class="pd">
            </ul>
        </div>
        <div class="item_list"><#--木炭-->
            <ul class="pd">
            </ul>
        </div>
        <div class="item_list"><#--固体-->
            <ul class="pd">
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        var url=window.location.href;
        var num=url.split("#tab");
        if(num.length==1){
            $(".category_list li").eq(0).addClass("on").siblings().removeClass("on");
            $(".item_list").eq(0).show();
        }
        else {
            $(".category_list li").eq(num[1]).addClass("on").siblings().removeClass("on");
            $(".item_list").eq(num[1]).show();
        }
        $(".category_list li").each(function () {
            $(this).click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                $(".item_list").eq($(this).index()).show().siblings().hide();
            })
        })
    })
</script>
<!--中部结束-->
<@footer.render />    <!--导入footer-->
<@scrollTop.render />
</body>
</html>
