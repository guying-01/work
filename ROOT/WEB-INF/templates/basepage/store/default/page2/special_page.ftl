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
    <link rel="stylesheet" href="${resources}/basepage/store/default/list_pages/css/list_pages.css">
    <!--二级页共通样式-->
    <link rel="stylesheet" href="${resources}/basepage/store/default/common_css/praBus.css" type="text/css">
    <script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
    <#--<script type="text/javascript" src="${resources}/basepage/store/default/level_pages/js/fflv2_js/lv2_dynamics.js"></script>-->
    <script src="${resources}/basepage/store/default/level_pages/js/special_page/special_page.js" type="text/javascript"></script>
    <script src="${ctx}/resources/js/lib/jquery/jquery.md5.js"></script>
    <!--此处是动态数据绑定函数-->
</head>

<body>
<div id="pageInfo_ww" lv1_id="${level1}" lv1_name="${name1}" currentPageId="${level2}" currentPageName="${name2}" style="display:none"></div>
<!--页面信息-->
<@praBus.render />
<!--此处是头部开始-->
<div class="top">
    <div class="ff_list_search_box">
    <@searchBox.render />
    </div>
<@header_bar.render "本地小船海鲜",""/>
<#--导入header_top-->
</div>

    <#--<@top.render />-->
    <#--导入header_top-->

 <div class="container-gy">
   <div class="banner-gy">
   </div>
   <div class="button-gy">
       <a href="/page2/307_00000000000008857_gic.jhtml?name2=本地小船海鲜&level1=307_00000000000000237_gic&name1=海鲜类&type=seafood-history"></a>
       <a href="/page2/307_00000000000008857_gic.jhtml?name2=本地小船海鲜&level1=307_00000000000000237_gic&name1=海鲜类&type=smallSeafood"></a>
   </div>
     <div class="navigation-gy">

     </div>
     <div class="navigation-content">
         <div class="everySelect">
             <div class="title">

             </div>
         </div>
         <div class="everySelect">
             <div class="title">

             </div>
         </div>
         <div class="everySelect">
             <div class="title">

             </div>
         </div>
         <div class="everySelect">
             <div class="title">

             </div>
         </div>
     </div>
     <div class="content-bottom">
          <div class="time"></div>
     </div>
 <#-----------------------------------------------------------------大连湾码头---------------------------------------------------------------------------------->
     <div class="goods-content-gy">
          <div class="goods-title-gy">
              大连湾码头
          </div>
         <div class="goods-content">
             <div class="guangbo-f1-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                   <div class="boxTitle">
                       本日鲜品
                   </div>
                 <div class="boxContent-f1-xianpin boxContent"></div>
              </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f1-zhenpin boxContent"></div>
             </div>
         </div>
     </div>

<#-----------------------------------------------------------------------旅顺码头---------------------------------------------------------------------------->
     <div class="goods-content-gy">
         <div class="goods-title-gy">
             旅顺码头
         </div>
         <div class="goods-content">
             <div class="guangbo-f2-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                 <div class="boxTitle">
                     本日鲜品
                 </div>
                 <div class="boxContent-f2-xianpin boxContent"></div>
             </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f2-zhenpin boxContent"></div>
             </div>
         </div>
     </div>
 <#-----------------------------------------------------------------------老虎滩码头---------------------------------------------------------------------------->
     <div class="goods-content-gy">
         <div class="goods-title-gy">
             老虎滩码头
         </div>
         <div class="goods-content">
             <div class="guangbo-f3-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                 <div class="boxTitle">
                     本日鲜品
                 </div>
                 <div class="boxContent-f3-xianpin boxContent"></div>
             </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f3-zhenpin boxContent"></div>
             </div>
         </div>
     </div>
 <#-----------------------------------------------------------------------瓦房店码头---------------------------------------------------------------------------->
     <div class="goods-content-gy">
         <div class="goods-title-gy">
             瓦房店码头
         </div>
         <div class="goods-content">
             <div class="guangbo-f4-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                 <div class="boxTitle">
                     本日鲜品
                 </div>
                 <div class="boxContent-f4-xianpin boxContent"></div>
             </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f4-zhenpin boxContent"></div>
             </div>
         </div>
     </div>
 <#-----------------------------------------------------------------------长海县码头---------------------------------------------------------------------------->
     <div class="goods-content-gy">
         <div class="goods-title-gy">
             长海县码头
         </div>
         <div class="goods-content">
             <div class="guangbo-f5-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                 <div class="boxTitle">
                     本日鲜品
                 </div>
                 <div class="boxContent-f5-xianpin boxContent"></div>
             </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f5-zhenpin boxContent"></div>
             </div>
         </div>
     </div>
 <#-----------------------------------------------------------------------东港码头---------------------------------------------------------------------------->
     <div class="goods-content-gy">
         <div class="goods-title-gy">
             东港码头
         </div>
         <div class="goods-content">
             <div class="guangbo-f6-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                 <div class="boxTitle">
                     本日鲜品
                 </div>
                 <div class="boxContent-f6-xianpin boxContent"></div>
             </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f6-zhenpin boxContent"></div>
             </div>
         </div>
     </div>
 <#-----------------------------------------------------------------------杏树屯码头---------------------------------------------------------------------------->
     <div class="goods-content-gy">
         <div class="goods-title-gy">
             杏树屯码头
         </div>
         <div class="goods-content">
             <div class="guangbo-f7-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                 <div class="boxTitle">
                     本日鲜品
                 </div>
                 <div class="boxContent-f7-xianpin boxContent"></div>
             </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f7-zhenpin boxContent"></div>
             </div>
         </div>
     </div>
 <#-----------------------------------------------------------------------皮口码头---------------------------------------------------------------------------->
     <div class="goods-content-gy">
         <div class="goods-title-gy">
             皮口码头
         </div>
         <div class="goods-content">
             <div class="guangbo-f8-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                 <div class="boxTitle">
                     本日鲜品
                 </div>
                 <div class="boxContent-f8-xianpin boxContent"></div>
             </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f8-zhenpin boxContent"></div>
             </div>
         </div>
     </div>
 <#-----------------------------------------------------------------------庄河码头---------------------------------------------------------------------------->
     <div class="goods-content-gy">
         <div class="goods-title-gy">
             庄河码头
         </div>
         <div class="goods-content">
             <div class="guangbo-f9-gy guangbo-gy">
             </div>
             <div class="every-goodsBox">
                 <div class="boxTitle">
                     本日鲜品
                 </div>
                 <div class="boxContent-f9-xianpin boxContent"></div>
             </div>

             <div class="every-goodsBox">
                 <div class="boxTitle">
                     珍品拍卖
                 </div>
                 <div class="boxContent-f9-zhenpin boxContent"></div>
             </div>
         </div>
     </div>

     <div class="zhao"></div>
     <div class="table">
     </div>

 </div>

<!--用户登录界面开始-->
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
                </div>
                <!--以下label标签验证用，暂时隐藏了-->
                <label class="loginError loginclear" id="usere_1">用户名不能为空</label>
                <label class="loginError loginclear" id="usere_2">用户名和密码不匹配</label>
                <label class="loginError loginclear" id="usere_3">用户已锁定</label>
                <div class="loginStyleA loginStyleA-ico2">
                    <input id="password" name="password" type="password" placeholder="密码">
                </div>
                <!--以下label标签验证用，暂时隐藏了-->
                <label class="loginError loginclear" id="pwde">密码不能为空</label>
                <a href="javascript:void(0);" class="loginStyleA-bt" id="btnSubmit">登<span class="login-space"></span>录</a>
                <div class="loginStyleA-bot">
                    <a href="/forget/init.jhtml" class="forgetPSW">忘记密码</a>
                </div>
            </div>
        </div>
    </form>
</div>

<!--用户登录界面结束-->
<!-----------------------此处为footer（楼层以下）-------------------->
<@footer.render />
<!--导入footer-->
<@scrollTop.render />
</body>

</html>

<script type="text/x-handlebars-template" id="boxContent">
    {{#each this}}
    <div class="every-goods">
        <div class="every-goods-pic">
            <img src="{{itemInfoList.0.itemPictureList.0.bigPicturePath}}" alt="" index="{{index}}" adsInfo="{{adsInfo.advertId}}">
        </div>
        <div class="goods-price">
            {{goods.name}}
        </div>
    </div>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="table">
    
    <div class="tablePic">
        <img src="{{itemInfoList.0.itemPictureList.0.bigPicturePath}}" alt="">
    </div>
    <div class="collectBox">
       <div class="collect">
           加入购物车
       </div>
    </div>
    <div class="table-g">
        <div>
            <span>品名</span>
            <span class="w75">{{goods.name}}</span>
        </div>
        <div>
            <span>码头</span>
            <span class="w75">大连湾码头</span>
        </div>
        <div>
            <span>本日单价</span>
            <span>¥{{itemInfoList.0.salesPrice}}</span>
            <span>销售规格</span>
            <span>{{itemInfoList.[0].attrValue1}}</span>
        </div>
        <div>
            <span>上岸时间</span>
            <span>12:00</span>
            <span>送达时间</span>
            <span><img src="{{deliverTime searchInfo.data.dataList.[0].prepare_goods_day searchInfo.data.dataList.[0].prepare_goods_time}}" style="width: 0.8rem;height: 0.4rem;margin-top: 0.04rem;" alt=""></span>
        </div>
        <div>
            <span>产品描述</span>
            <span class="w75">{{goods.description}}</span>
        </div>
        <div>
            <span>供应区域</span>
            <span>全市</span>
            <span>商品等级</span>
            <span>{{itemInfoList.0.goodsLevelName}}</span>
        </div>
    </div>
</script>

<script type="text/x-handlebars-template" id="navigation-content">
    {{#each this}}
    <a href='/FSgoodsSearch.jhtml?level1=307_00000000000000237_gic&name1=海鲜类&level2=307_00000000000008857_gic&name2=本地小船海鲜&level3={{id}}&name3={{name}}'>
      <div class="everySelect">
        <div class="title">
              {{name}}
        </div>
      </div>
    </a>
    {{/each}}

</script>