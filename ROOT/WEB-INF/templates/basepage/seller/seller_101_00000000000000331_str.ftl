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
                    <p>洛阳正大食品有限公司是正大集团于2012年在河南省洛阳市投资的现代化大型食品加工企业。公司位于河南洛阳工业园区秦岭西路18号，占地285亩，总投资10亿元。公司集生猪屠宰分割、肉食品精深加工（西式低温灌肠、调理制品、中式酱卤、腌腊制品等）、副产品综合利用、冷链物流、连锁专卖及科研开发为一体，可年屠宰生猪150万头，年加工调理产品3万吨，年生产熟肉制品10万吨。</p>
                    <p>公司屠宰、分割、冷藏、肉食品精深加工工艺技术和设备从日本、欧洲等国家和地区引进。公司按照国家级企业技术中心标准建设研发实验室和产品检测中心，并配备全自动病原微生物检测系统、氨基酸分析仪、自动定氮仪、全自动荧光酶标免疫测试系统等仪器，工艺技术及检测手段均达到国内领先、国际一流水平。</p>
                    <p>公司引进国际上最先进的管理系统，建立ISO9001质量管理、ISO22000（HACCP）食品安全管理、ISO14001环境管理以及ISO/IEC17025实验室等完善的管理体系。公司屠宰生猪来自集团自有养殖场，采用先进的检验检测仪器和检测手段在线快速逐头检验，并建立全过程可追溯的食品安全管理系统。严格的产品源头控制体系和专业化的质量管理体系建设，保证了洛阳正大食品从农场到餐桌的绿色、安全、健康。</p>
                    <p>洛阳正大食品有限公司秉承正大集团“利国、利民、利企业”的价值观、“绿色、安全、健康”的产品理念、“理解人、尊重人、依靠人、凝聚人、培养人”的人才观念，逐步将公司打造成企业文化具有凝聚力、员工待遇具有吸引力、内部管理具有号召力、产品质量具有竞争力，公司经营具有持续盈利能力的企业。</p>
                    <p>公司将以洛阳市为中心、立足河南、辐射全国、放眼世界，将优质、健康、美味的正大食品传递至千家万户，塑造中国一流的肉类加工品牌。</p>
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