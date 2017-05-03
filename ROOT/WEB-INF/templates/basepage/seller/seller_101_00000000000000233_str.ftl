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
                            <p>
                                大连盛海天国际贸易有限公司主营六味地黄酒和盘锦大米。
                            </p>
                            <p>
                                六味地黄酒含20多种无机元素，蛋白质，维生素C，益肾，肺，心，肝，补5脏，益精髓，增强性功能，增气力，壮筋骨，每天喝一两，促进血液循环，提高免疫力，预防疾病，抗衰老，适量饮酒，延年益寿。
                            </p>
                            <p>
                                健康饮酒已成为当代消费者新的诉求，如何实现尽情享受饮酒乐趣的同时还能强身健体，一举两得已成为当今中国白酒新的产业突破点。今天，将白酒的口感和药酒的效用完美结合的功能性出现使之成为可能。申请中国发明专利的（六味寿牌）六味地黄酒是当今功能型白酒的典型代表。实现了白酒口感和药酒滋补的完美结合，是好喝又滋补的功能型白酒。（六味寿牌）六味地
                            </p>
                            <p>
                                黄酒在四川浓香型经典配方的基础上，利用现代科技手段巧妙融入了熟地黄，罗汉果等中药材，使白酒具备了保健功能，有效缓解了喝白酒对身体造成的伤害，同时又保持了传统浓香型白酒的香味和绵，柔口感创造出具有保健功能的白酒。有业内专家提出功能型白酒是中国白酒的科学发展方向，它给了中国白酒一个崭新的概念，那就是健康，养生，保健，文明，称它为名副其实的新一代产品。
                            </p>
                            <p>
                                （六味寿牌）六味地黄酒专利发明人金松山先生将白酒工艺与健康饮酒理念相结合，酿造出白酒口感和滋补功能兼具的（六味寿牌）六味地黄酒。
                            </p>
                            <p>
                                （六味寿牌）六味地黄酒以“健康，科学，文明，高雅”酒文化为宗旨，以生产经销“造福人类健康，倡导高雅人性”的专利产品。
                            </p>
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
