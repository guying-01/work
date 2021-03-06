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
	    <#--<#include "/basepage/store/default/hb_templates/promotion_hb_templates.ftl">-->
        <!--导入共通脚本-->
		<#--<link rel="stylesheet" href="${resources}/basepage/store/default/level_pages/css/fflv2_css/fflv2_css.css" type="text/css">-->
		<!--二级页共通样式-->
        <link rel="stylesheet" type="text/css" href="${resources}/basepage/store/default/promotion/css/promotion_hb.css?v2017042601" />
		<script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
        <script src="${resources}/basepage/store/default/promotion/js/strangeThing.js" type="text/javascript" charset="utf-8"></script>
        <!--此处是动态数据绑定函数-->
	</head>
  <body>
  <div class="top">
      <div class="ff_list_search_box">
      <@searchBox.render />
      </div>
  <@header_bar.render "新奇特怪",""/>
  <#--导入header_top-->
  </div>
	<@scrollTop.render />
    <div class="strangeThing">
    <div class="banner">
      <div class="title"></div>
    </div>
    <div class="active_top"></div>
    <div class="active_con_mid activity01">
	</div>
	</div>


	<@footer.render />
  </body>
  </html>
    <script type="text/x-handlebars-template" id="template_goods">
        <div class="promotion-hb-fill"></div>
        {{#each this}}
        <div class="contentRight-List">
            <div class="contentRight-List-Left">
                <a href="/fsgd/{{goodsInfo.id}}.jhtml?fromPage=promotion"  class="item_pic" title="{{goodsInfo.name}}">
                    <div class="contentRight-List-img">
                        <img class="lazy" src="{{adsInfo.advertPic}}" alt="{{goodsInfo.name}}"/>
                        <div class="see-details">查看详情</div>

                </a>

            </div>
        </div>
        <a  href="/fsgd/{{goodsInfo.id}}.jhtml?lv3Id=${level3!''}">
            <div class="contentRight-List-Right">
                <table cellspacing="0" cellpadding="0" class="contentRight-List-Right-table">
                    <tr>
                        <td class="goodsDecoration">品名</td>
                        <td class="goodsDecoration2" title="{{goods.name}}">{{goods.name}}</td>
                    </tr>
                    <tr>
                        <td class="goodsDecoration">生产企业</td>
                        <td class="goodsDecoration2" title="{{goods.manufacturer}}">{{goods.storeName}}</td>
                    </tr>
                    <tr>
                        <td class="goodsDecoration">饭饭单价</td>
                        <td class="goodsDecoration1" title="{{itemInfoList.[0].salesPrice}}">¥{{itemInfoList.0.salesPrice}}</td>
                        <td class="goodsDecoration">规格</td>
                        <td class="goodsDecoration1" title="{{itemInfoList.[0].attrValue1}}">{{itemInfoList.[0].attrValue1}}</td>
                    </tr>
                    <tr>
                        <td class="goodsDecoration">产地</td>
                        <td class="goodsDecoration1" title="{{goods.placeOfProduction}}">{{goods.placeOfProduction}}</td>
                        <td class="goodsDecoration">送达时间</td>
                        <td class="goodsDecoration1">
                            <img style="width: 0.8rem;height: 0.4rem;margin-top: 0.04rem;" src="{{deliverTime itemInfoList.[0].prepareGoodsDay  itemInfoList.[0].prepareGoodsTime}}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="goodsDecoration">本日活动</td>
                        <td class="goodsDecoration2" title="{{promotion}}"><img src="/resources//basepage/store/default/about_pages/img/m_4.png" alt="" style="width: 0.4rem;margin-top: 0.03rem"></td>
                    </tr>
                    <tr>
                        <td class="goodsDecoration">产品描述</td>
                        <td class="goodsDecoration2" title="{{goodsInfo.description}}">{{goods.description}}</td>
                    </tr>

                    <tr>
                        <td class="goodsDecoration">供应区域</td>
                        <td class="goodsDecoration1" title="">全国</td>
                        <td class="goodsDecoration">商品等级</td>
                        <td class="goodsDecoration1" title="{{itemInfoList.0.goodsLevelName}}">{{itemInfoList.0.goodsLevelName}}</td>
                    </tr>
                </table>
            </div>
        </a>
        </div>
        {{/each}}
        <div id="noData" style="width: 350px;	height: 60px;margin: 0 auto;padding:50px 0;display:none">
    </script>