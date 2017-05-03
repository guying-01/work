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
        <p>辽宁塔城陈醋酿造有限公司位于辽宁省喀左县大城子镇利州工业园区，创产于清代康熙八年（公元1669年），至今已有三百多年的历史。产品酸甜适口、醋香浓郁、久贮不腐以其独特风味与镇江香醋、山西老陈醋并称为我国三大名醋。</p>
                        <p>以“塔城”牌老陈醋为主的精制陈醋、喀左陈醋、姜醋、香味陈醋、蒜醋、白米醋、礼品醋、御宴贡醋、塔城老醋等十几个品种，其中六个品种分别获得省、部级优质产品奖，首届食品博览会银奖，辽宁省优质名牌食品奖，消费者信得过产品奖等殊荣，曾多次荣获“辽宁省名牌产品”、“辽宁省著名商标”等荣誉称号，2002年公司已通过了ISO9001国际质量体系认证，2005年列入辽宁省农业产业化重点龙头企业之一，2008年被国家质检总局授予中华人民共和国地理标志保护产品。目前“塔城”牌系列陈醋已形成调味、保健、醋酸饮料三大系列，50几个品种，产品鲜美醇厚、咸甜适口、酱香浓郁、营养丰富。“凌峰”牌系列白酒，口味纯正、绵甜爽净、回味悠长，装潢精致，是宴请宾朋、馈赠亲友的佳品。“塔城”牌系列产品已畅销十几个省、市、自治区，并远销日本、香港及东南亚等地。</p>
                        <p>2005年，为适应现代市场的需要，提高产品技术含量，香港中福国际投资集团有限公司注资5118.00万元对原厂进行扩建，总占地面积58600平方米，总建筑面积39800平方米，通过系列技术改造后，年生产能力陈醋30000吨，酱油20000吨，大酱1000吨，白酒1000吨。截止2015年底，职工人数120人，实现产值4，000万元，销售收入3,850万元，利税310万元。</p>
                        <p>把企业做强做大是我们的经营理念，为广大消费者提供放心满意的产品是我们的经营宗旨，创“中国名牌产品”是我们的经营目标。“酿优质醋酱油，造百姓放心酒，确保顾客满意，争创中国名牌”是我们的质量方针。</p>
                  

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
