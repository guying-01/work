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
                    <div>
                        <p>朝阳瑞得生物科技工程有限公司坐落在辽宁西部朝阳市，占地五十亩。是2010年3月投资1.4亿元新建的农产品深、精加工的高科技民营企业。是一家瞄准国内外高端市场，提供农作物高提纯环保绿色保健美容产品的新兴产业，主要生产葡萄籽油、万寿菊提取物、葡萄籽提取物、辣椒红素等系列高端保健美容产品，年产能力630吨。企业具有进出口经营资格。</p>
                        <p>进入21世纪，尊重生命，崇尚健康已成为人们推崇的观念，改善生命质量已成为人们不可或缺的生存行为。朝阳瑞得生产的农作物高提纯产品就是为了满足社会对高端绿色保健美容产品的需求。"让生命更健康，让生活更多彩"是朝阳瑞得生物工程有限公司创建和发展的终极目标！</p>
                        <p>为了生产出高端、高品质的产品，朝阳瑞得在建厂之初就本着高起点，高标准的理念，引进了国内最先进的生产设备和生产工艺，旨在依托高等院校科研部门的科技成果把企业建成农作物高端产品的提纯基地。　企业所在的朝阳市，和内蒙古、河北省相连，是东北西部连接内蒙和中原的重要交通枢纽，交通十分便利。有"锦朝高速"直连"京沈高速"，还有穿城而过"京四高速"和101国道，铁路直通沈阳和北京。规划中的"京沈高铁"即将动工，届时将使朝阳到沈阳和北京的时间缩短至一个小时和一个半小时左右。朝阳民航的班机也在朝阳和北京之间往来穿梭。朝阳的地理位置，不仅可以有效的利用三省充沛的农作物资源，也给商务活动提供了便利的条件。</p>
                        <p>朝阳，古称"龙城"，又有"三燕古都"之称。是有着丰厚文化和历史底蕴的旅游城市。市区有辽代双塔，有举世闻名的"世界古生物化石宝库"，朝阳是"中华龙鸟"的诞生地；还是著名的"牛河梁红山文化玉龙猪"的诞生地。</p>
                        <p>欢迎您到朝阳做客，欢迎您使用朝阳瑞得的产品。</p>
                    </div>
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