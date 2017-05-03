<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>饭饭1080°直采平台</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if(deviceWidth>768){
            deviceWidth=768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#import "/basepage/store/default/common/common_praise_business.ftl" as praBus/>
<@link.render />
    <!--导入共通样式-->
<@script.render />
<#include "/basepage/store/default/hb_templates/list_hb_templates.ftl" />
    <!--导入共通脚本-->
    <script type="text/javascript" src="${resources}/js/common/common.js"></script>
    <script type="text/javascript">
     var lv1_id = '${level1!""}';
    </script>
    <link rel="stylesheet" href="${resources}/basepage/store/default/promotion/css/newGoodsToday.css" type="text/css">
    <link rel="stylesheet" href="${resources}/basepage/store/default/list_pages/css/list_pages.css?v20170424" type="text/css">
    <#--<script src="${resources}/basepage/store/default/list_pages/js/list_dynamics.js"></script>-->
    <script src="${resources}/basepage/store/default/promotion/js/newGoodsToday.js"></script>
    <link rel="stylesheet" href="${resources}/basepage/store/default/common_css/praBus.css" type="text/css">
    <script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
    <script src="${resources}/basepage/store/default/common_js/jquery.md5.js"></script>
</head>
<!--<style type="text/css">
    #outDiv{
        position: relative;
    }
    #inDiv{
        position: absolute;
    }
</style>-->
<body>
<div id="pageInfo" lv1_id="${level1!" "}" lv1_name="${name1!" "}" lv2_id="${level2!" "}" lv2_name="${name2!" "}" lv3_id="${level3!" "}" lv3_name="${name3!" "}" currentPageRes="${resources!''}" isOrderByContractNo="${isOrderByContractNo!''}" style="display: none"></div>
<!--页面信息-->
<#--<div id="pageInfo_ww" lv1_id="${level1}" lv1_name="${name1}" lv2_id="${level2}" lv2_name="${name2}" lv3_id="${level3}" lv3_name="${name3}" currentPageRes="${resources}" style="display: none"></div>-->
    <!--页面信息&ndash;&gt;-->
<@praBus.render />
<!--此处是头部开始-->
<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "今日新上架",""/>
<#--导入header_top-->

</div>
<div class="banner"></div>
<!--此处是头部结束-->

<!--此处是类别开始-->
<#--<div class="nav_bread">
    <a href="/">首页</a><i></i>
    <a href="javascript:void(0)">今日新上架商品</a><i></i>
</div>-->
<!--此处是类别结束-->

<!--热卖推荐开始-->
<#--<div class="ff-list-section-title">今日推荐</div>
<a class="section-remai list_newGoods_remaituijian_01">
    <div href="" class="topAd-img item-pic" ><img src="/resources/basepage/store/default/list_pages/img/test1.jpg" /></div>
    <div class="item-info topAd-text">
        <div class="item-name ">敬请期待</div>
        <span class="item-price">￥999.99</span>
    </div>
</a>
<div class="line"></div>
<a class="section-remai list_newGoods_remaituijian_02">
    <div href="" class="topAd-img item-pic"><img src="/resources/basepage/store/default/list_pages/img/test1.jpg" /></div>
    <div class="item-info topAd-text">
        <div class="item-name">敬请期待</div>
        <span class="item-price">￥999.99</span>
    </div>
</a>
<div class="cuxiao-box">
    <div class="cuxiao-icon"></div>
    <div id="outDiv">
        <div id="inDiv">
            <ul>
                <li class="ellipsis list_${level3!" "}_cuxiaohuodong_01">促销活动: 1111咖啡大减价1111咖啡大减价1111咖啡大减价1111咖啡大减价</li>
                <li class="ellipsis list_${level3!" "}_cuxiaohuodong_02">促销活动: 2222咖啡大减价</li>
                <li class="ellipsis list_${level3!" "}_cuxiaohuodong_03">促销活动: 3333咖啡大减价</li>
            </ul>
        </div>
        <div id="helpDiv"></div>
    </div>
</div>
<div class="ff-list-section-title">品牌</div>
<ul class="brands">
    <li>
        <a href="####"><img src="/resources/basepage/store/default/list_pages/img/testlogo1.png" alt="" /></a>
    </li>
    <li>
        <a href="####"><img src="/resources/basepage/store/default/list_pages/img/testlogo1.png" alt="" /></a>
    </li>
    <li class="mr0">
        <a href="####"><img src="/resources/basepage/store/default/list_pages/img/testlogo1.png" alt="" /></a>
    </li>
    <li>
        <a href="####"><img src="/resources/basepage/store/default/list_pages/img/testlogo1.png" alt="" /></a>
    </li>
    <li>
        <a href="####"><img src="/resources/basepage/store/default/list_pages/img/testlogo1.png" alt="" /></a>
    </li>
    <li class="mr0">
        <a href="####"><img src="/resources/basepage/store/default/list_pages/img/testlogo1.png" alt="" /></a>
    </li>
</ul>

<div class="ff-list-section-title">饭饭热卖</div>
<a class="section-ff-remai list_newGoods_fanfanremai_01">
    <div href="" class="item-pic fanfan-hotsales-img"><img src="/resources/basepage/store/default/list_pages/img/test1.jpg" /></div>
    <div class="item-info fanfan-hotsales-text">
        <div class="item-name">敬请期待</div>
        <span class="item-price fanfan-hotsales-price">￥999.99</span>
    </div>
</a>
<div class="line"></div>
<a class="section-ff-remai list_newGoods_fanfanremai_01">
    <div href="" class="item-pic fanfan-hotsales-img"><img src="/resources/basepage/store/default/list_pages/img/test1.jpg" /></div>
    <div class="item-info fanfan-hotsales-text">
        <div class="item-name">敬请期待</div>
        <span class="item-price fanfan-hotsales-price">￥999.99</span>
    </div>
</a>-->

<!--热卖推荐结束-->
<div class="line"></div>
<#--<div id="contentRight-nav">
    <div class="left">
        <a href="javascript:void(0)" class="sorting_foc btn_sort" name="search_sort_default"><i>综合</i></a>
        <a href="javascript:void(0)" class="btn_sort" name="search_sort_sales" order="desc"><i>销量</i><u class=""></u></a>
        <a href="javascript:void(0)" class="btn_sort" name="search_sort_price" order="desc"><i>价格</i><u class=""></u></a>
       &lt;#&ndash; <a href="javascript:void(0)" class="btn_sort" name="search_sort_popularity" order="desc"><i>人气</i><u class=""></u></a>&ndash;&gt;
        <a href="javascript:void(0)" class="btn_sort" name="search_sort_new" order="desc"><i>新品</i><u class=""></u></a>

    </div>
</div>
<div class="line"></div>-->
<div id="contentRight-ListWrap">
    <div id="contentRight-ListWrap-ads">
        <!--此处通过id="list_goodsList_ads"模板加载-->
    </div>
    <div id="contentRight-ListWrap-main">
        <!--此处通过id="list_goodsList_main"模板加载-->
    </div>
</div>
<div id="loadmore">点击加载更多</div>

<#--登录部分-->
<div class="bgBlack" style="display: none;"></div>
<div class="" id="login_popUp">
    <form id="loginForm" method="post" onkeydown="if(event.keyCode==13){$('#btnSubmit').click();}">
        <div class="loginBg">
            <div class="login">
                <div class="login_i"><img src="${resources}/basepage/store/default/common_img/login_i.png"></div>
                <div class="loginTitle">饭饭1080°直采平台</div>
                <a href="javascript:void(0);" class="loginShut shut"></a>
                <h2>账号登录</h2>
                <div class="loginStyleA loginStyleA-ico1">
                    <input id="userName" name="userName" type="text" placeholder="用户名">
                    <!--以下label标签验证用，暂时隐藏了-->
                    <label class="loginError loginclear" id="usere_1"><u></u><i></i>用户名不能为空</label>
                    <label class="loginError loginclear" id="usere_2"><u></u><i></i>用户名和密码不匹配</label>
                    <label class="loginError loginclear" id="usere_3"><u></u><i></i>用户已锁定</label>
                </div>
                <div class="loginStyleA loginStyleA-ico2">
                    <input id="password" name="password" type="password" placeholder="密码">
                    <!--以下label标签验证用，暂时隐藏了-->
                    <label class="loginError loginclear" id="pwde"><u></u><i></i>密码不能为空</label>
                </div>
                <a href="javascript:void(0);" class="loginStyleA-bt" id="btnSubmit">登<span class="login-space"></span>录</a>
                <div class="loginStyleA-bot">
                    <a href="/forget/init.jhtml" class="forgetPSW">忘记密码</a>
                </div>
            </div>
        </div>
    </form>
</div>

<!-----------------------此处为footer（楼层以下）-------------------->
<@footer.render />
<!--导入footer-->
<!--此处为底部结束（楼层以下）-->
</body>
<script type="text/javascript">
/*    $(function() {
        function $(eleStr) {
            switch(eleStr.substr(0, 1)) {
                case "#":
                    return document.getElementById(eleStr.substr(1));
                    break;
                case ".":
                    return document.getElementsByClassName(eleStr.substr(1));
                    break;
                case "_":
                    return document.getElementsByName(eleStr.substr(1));
                    break;
                default:
                    return document.getElementsByTagName(eleStr);
                    break;
            }
        }

        onload = function() {
            $("#helpDiv").innerHTML = $("#inDiv").innerHTML;

            var b =setInterval(function(){
                /!*clearInterval(b);*!/
                var a =setInterval(function() {
                    if($("#outDiv").scrollTop >= $("#helpDiv").offsetTop - $("#inDiv").offsetTop) {
                        $("#outDiv").scrollTop = 0;
                    }

                    var m_height=0.4*document.documentElement.clientWidth/6.4/20;
                    console.log(m_height);
                    $("#outDiv").scrollTop+=m_height;
                }, 20);
                setTimeout(function () {
                    clearInterval(a);
                },480);
            },3000)
        }

    })*/
</script>

</html>
