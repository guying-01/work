<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_topbanner.ftl" as topBanner/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<@link.render />
<!--导入共通样式-->
<@script.render />
<!--导入共通脚本-->
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="${resources}/basepage/store/default/promotion/css/pie.css" />
        <link rel="stylesheet" href="${resources}/basepage/store/default/promotion/css/promotion_hb.css?v2017042601">
        <script src="${resources}/basepage/store/default/promotion/js/pie.js" type="text/javascript"></script>
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
		<!--此处是头部开始-->
        <div class="top">
            <div class="ff_list_search_box">
            <@searchBox.render />
            </div>
        <@header_bar.render "天上掉馅饼",""/>
        <#--导入header_top-->
        </div>
		<!--此处是头部结束-->
         <div class="banner"></div>
            <div class="container-gy">
                <div class="time"></div>
                 <div class="title">
                       饭饭送鸿运
                 </div>
                <div class="rangeAds"></div>
                <div class="time"></div>
                <div class="title">
                    今日行大运
                </div>
                <div class="titleSelect">
                    <span>中奖商品</span>
                    <span>中奖商家</span>
                </div>
                <div class="winningBox">
                    <div class="winningGoods">
                        <div class="everyAds" style="width: 100%">
                            <a href="javascript:void(0);"></a>
                            <div class="itemPic">
                                <img src="" alt="">
                            </div>
                            <div class="itemName">
                            </div>
                            <div class="itemDescription">
                            </div>
                            <div class="itemNum">
                                鸿运数量：99份
                            </div>
                            <div class="wrap">
                                <div class="itemPrice">
                                    <span>原价：</span><span style="text-decoration: line-through;">¥99.99</span>
                                </div>
                                <div class="buy">
                                    了解详情
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="winningStore">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                        <div class="showMore">
                            <div class="iconMore"></div>
                            <div class="word">点击查看更多&gt&gt</div>
                        </div>
                    </div>
                </div>


                <div class="winningBox" style="padding-top: 0.2rem">
                    <div class="winningGoods">
                        <div class="everyAds" style="width: 100%">
                            <a href="javascript:void(0);"></a>
                            <div class="itemPic">
                                <img src="" alt="">
                            </div>
                            <div class="itemName">
                            </div>
                            <div class="itemDescription">
                            </div>
                            <div class="itemNum">
                                鸿运数量：99份
                            </div>
                            <div class="wrap">
                                <div class="itemPrice">
                                    <span>原价：</span><span style="text-decoration: line-through;">¥99.99</span>
                                </div>
                                <div class="buy">
                                    了解详情
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="winningStore">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                        <div class="showMore">
                            <div class="iconMore"></div>
                            <div class="word">点击查看更多&gt&gt</div>
                        </div>
                    </div>
                </div>
            </div>
		<!-----------------------此处为footer（楼层以下）-------------------->
		<@footer.render />
		<!--导入footer-->
		<!--此处为底部结束（楼层以下）-->
		<div class="f_returnTop" title="返回顶部"></div>
	</body>

</html>
<script type="text/x-handlebars-template" id="rangeAds">
    {{#each this}}
       <div class="everyAds">
           <a href="/fsgd/{{adsInfo.goodsId}}.jhtml"></a>

           <div class="itemPic">
               <img src="{{itemInfoList.0.itemPictureList.0.bigPicturePath}}" alt="">
           </div>
           <div class="itemName">
                         {{goods.name}}
           </div>
           <div class="itemDescription">
                        {{goods.description}}
           </div>
           <div class="itemNum">
                         鸿运数量：{{itemInfoList.0.localStock}}份
           </div>
           <div class="wrap">
               <div class="itemPrice">
                   <span>原价：</span><span style="text-decoration: line-through;">¥{{searchInfo.data.dataList.0.item_saleprice}}</span>
               </div>
               <div class="buy">
                   了解详情
               </div>
           </div>

       </div>
    {{/each}}
</script>
