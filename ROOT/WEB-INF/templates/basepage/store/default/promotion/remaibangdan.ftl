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
		<!--二级页共通样式-->
        <link rel="stylesheet" href="${resources}/basepage/store/default/promotion/css/remaibangdan.css" type="text/css">
        <link rel="stylesheet" href="${resources}/basepage/store/default/promotion/css/promotion_hb.css" type="text/css">
        <script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
        <script src="${resources}/basepage/store/default/promotion/js/remaibangdan.js" type="text/javascript" charset="utf-8"></script>
		<!--此处是动态数据绑定函数-->
	</head>
  <body>
  <div class="top">
      <div class="ff_list_search_box">
      <@searchBox.render />
      </div>
  <@header_bar.render "热卖榜单",""/>
  <#--导入header_top-->
  </div>
	<@scrollTop.render />
    <div class="banner">
      <div class="title"></div>
    </div>
	<div class="titleList">
		<div class="firstList">
            <span onclick="request('307_00000000000000237_gic')">海鲜类</span>
            <span onclick="request('307_00000000000002491_gic')">蔬菜类</span>
            <span onclick="request('307_00000000000003559_gic')">肉禽类</span>
            <span class="more">更多</span>
        </div>

		<ul>
			<li class="clicked" onclick="select(this)" lv1="307_00000000000000237_gic"><a href="javascript:void(0);">海鲜类</a></li>
            <li onclick="select(this)" lv1="307_00000000000002491_gic"><a href="javascript:void(0);">蔬菜类</a></li>
            <li onclick="select(this)" lv1="307_00000000000003559_gic"><a href="javascript:void(0);">肉禽类</a></li>
            <li onclick="select(this)" lv1="307_00000000000004244_gic"><a href="javascript:void(0);">米面粮油</a></li>
            <li onclick="select(this)" lv1="307_00000000000005153_gic"><a href="javascript:void(0);">水果类</a></li>
            <li onclick="select(this)" lv1="307_00000000000004784_gic"><a href="javascript:void(0);">豆蛋奶等</a></li>
            <li onclick="select(this)" lv1="307_00000000000002298_gic"><a href="javascript:void(0);">调料类</a></li>
            <li onclick="select(this)" lv1="307_00000000000001644_gic"><a href="javascript:void(0);">干货类</a></li>
            <li onclick="select(this)" lv1="307_00000000000000997_gic"><a href="javascript:void(0);">熟食类</a></li>
            <li onclick="select(this)" lv1="307_00000000000000691_gic"><a href="javascript:void(0);">腌腊制品</a></li>
            <li onclick="select(this)" lv1="307_00000000000000249_gic"><a href="javascript:void(0);">速冻食品</a></li>
            <li onclick="select(this)" lv1="307_00000000000002668_gic"><a href="javascript:void(0);">菌类野味</a></li>
            <li onclick="select(this)" lv1="307_00000000000003171_gic"><a href="javascript:void(0);">滋补药膳</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">合成素食</a></li>
            <li onclick="select(this)" lv1="307_00000000000003675_gic"><a href="javascript:void(0);">淡水产品</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">活禽畜类</a></li>
            <li onclick="select(this)" lv1="307_00000000000004203_gic"><a href="javascript:void(0);">酒水饮料</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">副食小食</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">火爆菜</a></li>
            <li lv1="307_00000000000000374_gic"><a href="/page1/307_00000000000000374_gic.jhtml?name1=产地直供">产地直供</a></li>
            <li onclick="select(this)" lv1="307_00000000000000379_gic"><a href="javascript:void(0);">品牌厂家</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">农家院供</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">全国特产</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">服饰花卉</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">土杂五金</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">厨房设备</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">餐具等</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">鱼缸制冷</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">回收类</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">燃料类</a></li>
            <li onclick="select(this)" lv1="307_00000000000002606_gic"><a href="javascript:void(0);">维修保养</a></li>
            <li onclick="select(this)" lv1="307_00000000000002618_gic"><a href="javascript:void(0);">酒店用品</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">办公设备</a></li>
            <li onclick="select(this)" lv1="307_00000000000000236_gic"><a href="javascript:void(0);">酒店装修</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">信息化</a></li>
            <li onclick="select(this)" lv1=""><a href="javascript:void(0);">形象宣传</a></li>
            <li onclick="select(this)" lv1="307_00000000000009135_gic"><a href="javascript:void(0);">跨境产品</a></li>
		</ul>
	</div>
    <div class="goodsList">

    </div>

    <@footer.render />


  <script>
          $('.titleList .more').click(function () {
          	if ($('.titleList ul').css('display') == 'none') {
                $('.titleList ul').fadeIn();
			}else {
                $('.titleList ul').fadeOut();
			}
          });
          $('.titleList ul li').click(function () {
			  $(this).addClass('clicked').siblings().removeClass('clicked');
              $('.titleList ul').fadeOut()
          })
  </script>
  </body>
  </html>
