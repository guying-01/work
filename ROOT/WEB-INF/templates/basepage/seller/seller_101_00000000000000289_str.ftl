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
					<p>沈阳燕京啤酒有限公司成立于2005年，是由北京燕京啤酒集团公司按照现代化啤酒生产企业标准兴建的啤酒生产企业。公司位于辽宁省沈阳市沈北新区，占地面积210亩，总投资6亿元、生产能力20万千升。</p>
                        <p>燕京啤酒一直以卓越的品质，清爽的口感，秉承“以情做人，以诚做事，以信经商”的经营理念，先后成为人民大会堂国宴特供酒、中国驰名商标、中国名牌产品，北京奥运会赞助商，中国探月工程官方合作伙伴，中国三大啤酒品牌之一，商标商誉价值达288.18亿。</p>
                        <p>“好水酿好酒”。沈阳燕京啤酒有限公司所有产品用水，均采自150米以下的大清宝泉之水。其厂区就座落于著名的棋盘山风景区脚下，周围共有九十九座山，九十九个泉眼，是大清龙脉所在地，与著名的莲花泉、仲官泉、王岗泉相连，泉水清澈透明、甘甜爽口，富含人体所需的微量元素铁、锌、硒、钴等，得天独厚的天然资源正是燕京啤酒优良品质的绝对保障。</p>
                        <p>经过10年的市场开拓，沈阳燕京啤酒有限公司产品已经覆盖到了辽宁、吉林、黑龙江的各地区，且深受广大消费者青睐。</p>
                        <p>努力拼搏、与时俱进。沈阳燕京啤酒有限公司将大力发扬“尽心尽力的奉献精神，艰苦奋斗的创业精神，敢打硬仗的拼搏精神，顾全大局的协作精神，为企业分忧的主人翁精神”，把“以全优的质量取信于民，以独特的风味取悦于民，以诚挚的态度服务于民”的质量宗旨落到实处。努力为中国民族啤酒工业做出更大贡献！</p>
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