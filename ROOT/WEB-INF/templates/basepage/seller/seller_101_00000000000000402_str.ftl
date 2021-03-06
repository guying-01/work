<#--店铺首页-->
	<#include "/common/common_var_definds.ftl" />
	<#include "/basepage/store/default/hb_templates/store_hb_templates.ftl" />
	<#import "/basepage/store/default/common/zizhi_slider.ftl" as zizhi/>
	<#import "/basepage/store/default/common/dangan_slider.ftl" as dangan/>
	<!DOCTYPE html>
	<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>饭饭1080°直采平台</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<script type="text/javascript">
			var deviceWidth = document.documentElement.clientWidth;
			if(deviceWidth > 768) {
				deviceWidth = 768;
			}
			document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
		</script>
		<#import "/basepage/store/default/common/common_link.ftl" as link/>
		<#import "/basepage/store/default/common/common_script.ftl" as script/>
		<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
		<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
		<#import "/basepage/store/default/common/common_footer.ftl" as footerNoTab/>
		<#import "/basepage/seller/seller_header_search.ftl" as sellerSearch/>
		<@link.render />
		<!--导入共通样式-->
		<@script.render />
		<!--导入共通脚本-->
		<link rel="stylesheet" href="${resources}/basepage/seller/css/store.css" type="text/css">
		<script src="${resources}/basepage/seller/js/store_common_head_load.js"></script>
        <script src="${resources}/basepage/seller/js/staticStore.js"></script>
		<script src="${resources}/basepage/seller/js/store_dynamics.js"></script>
		<script src="${resources}/basepage/seller/js/sp_getAboutImg.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<body>
		<div id="pageInfo" store_id="${storeId!''}" store_template_code="${storeTemplateCode!''}" page_id="${storeTemplateCode!''}" style="display: none"></div>
		<!--此处是头部开始-->
		<div class="top"><@header_bar.render "商铺",""/></div>
		<!--此处是头部结束-->
		<!--网页头部&导航开始-->
		<div id="sp_hd_1"></div>
		<div id="sp_hd_2"></div>
		<@sellerSearch.render />
		<div id="ff_tab_box">
			<div class="ff_tab_content">
				<div class="ff-tab-title">
					<img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /> <span>商家介绍</span>
				</div>
				<div class="ff-tab-con-detail">
                        <p>益馐农业是现代化农业企业，企业以“走绿色道路，创生态文明”为经营理念，全面致力于绿色生产资料开发、绿色生产基地建设、绿色农业科技研发、绿色营销网络拓展。打造成为以种植、养殖、农产品深加工到社区连锁专卖、单位配送、批发网络、出口创汇的独树一帜、自成品牌的“绿色生态产业链”，益馐农业将不断开拓创新中国现代农业企业规划化、品牌化之路。</p>
                        <p>益馐农业是一家集种植、技术、销售为一条龙现代化生态农业有限公司，同时与中国科学院东北地理与农业生态研究所达成长期战略技术合作。公司生产基地位于黑龙江省五常市，五常是我国著名的水稻种植区，有“贡米之乡”的美誉，公司选用珍稀水稻品种，精耕细作，开创了五常大米的精品典范；采取企业自有基地种植以及“企业+稻农”的订单种植方式，建有1200公顷水稻种植基地，统一种子、统一育苗、统一肥料、统一管理，整个种植过程由公司的水稻种植专家及中国科学院东北地理与农业生态研究所特聘农业专家进行全程指导与监控，以确保水稻品种纯正、品质优良。依托五常市丰富的农副产品资源，公司另有40公顷木耳种植基地，55公顷林蛙养殖基地，70公顷林下参种植基地。公司自创建以来，在市、县领导和有关部门的支持下，发展步伐加快，在促进农（副）产品流通、推进农业产业化经营、带动农民增收等方面，发挥了积极作用。</p>
				</div>
			</div>
			<div class="ff_tab_content only_book_content_zizhi">
				<div class="ff-tab-title">
					<img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /><span>商家资质</span> 
				</div>
				<div class="ff-tab-con-detail">
					<@zizhi.render />
				</div>
			</div>
			<div class="ff_tab_content">
				<div class="ff-tab-title">
					<img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /> <span>商家活动</span>

				</div>
				<div class="ff-tab-con-detail">敬请期待</div>
			</div>
		</div>
		<@footerNoTab.render />
	</body>

	</html>