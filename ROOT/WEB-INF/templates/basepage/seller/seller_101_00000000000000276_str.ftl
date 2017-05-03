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
				<#--副食小食品类模板1_首页-->

                    <p>大连非得酒业有限公司位于中国北方著名的海滨城市——大连，注册资金2000万人民币，占地面积1万余平，年产量可达千吨以上，是中国高科技海参领导品牌---大连非得生物产业有限公司旗下集科研、生产、销售为一体的专业化营养型白酒生产和销售公司。</p>
                    <p>进入21世纪，海参保健热潮席卷大江南北，海参养生和保健作用受到神话般追捧。同时，“白酒营养化”潮流风起云涌，“健康饮酒”开始成为广大消费者普遍追求的消费心态和时尚理念。大连非得酒业公司在此背景下，依托大连非得生物产业公司母公司技术和生产优势，利用大连特产海参资源，秉承“口感为先，健康为本”的研发理念，通过获得“国家技术发明大奖”生物工程技术的应用，解决了传统造酒工艺无法克服的“海参蛋白遇酒沉淀”的技术难题，历经4年之久，终于研制成功中国第一款“好喝又营养”的非得海参酒，彻底打破了中国酒水市场“纯白酒好喝没营养、保健酒营养不好喝”的尴尬现状。目前已形成浓香型、酱香型、米香型、陈香型四大系列，产品包装分为普装、精装、礼盒等多种款型，可满足不同地区、不同人群、不同渠道的多样化需求。如今“非得”已成为国内海参酒行业最具品牌价值的领军品牌。</p>
                    <p>大连非得酒业公司是中国白酒百花园中的一朵奇葩，虽是后起之秀，但在海参营养分析、功效成分获得、基酒风味提升、海参酶解除味等技术领域均达到同行业领先水平。今天，非得酒业在美丽富饶的渤海湾畔起步，立志弘扬现代健康酒文化、海参文化，利用大连得天独厚的海参资源，依托现有的先进技术和科学的产品理念，以质量开拓市场，以文化提升形象，全力打造中国海参酒第一品牌，发展民族健康酒工业！“得健康，赢未来！”我们相信在新世纪“倡导健康饮酒”的今天，大连非得酒业必将走向辉煌！</p>
                    <p>品牌释义</p>
                    <p>大师设计 匠心独运 </p>
                    <p>非得海参酒“非得”品牌标志设计堪称中国白酒界之经典，汉字“非”与海参最为相似，以字为范，采用象形草书书法一挥而就，如同一只海参律动在海浪之上，既体现了海参酒产品原料特点，又借助于中国书法的浓淡干湿，粗细抑扬，把标志的意境与美感表现的淋漓尽致。</p>
                    <p>“非得”有“一定要得到、志在必得”的含义，饮酒既要享受酣畅淋漓的痛快，同时又要尽量避免过度饮酒对身体的伤害，因此，“非得”饮用可以畅饮的营养型白酒才行。非得，得健康，得天下。</p>
                    <p>造酒理念</p>
                    <p>口感为先 健康为本</p>
                    <p>非得酒业倡导“健康饮酒”理念。主张“饮酒要乐趣多一点、伤害少一点”，饮酒要有礼有节，适量为佳，如能达到“既过酒瘾又滋补养生”的健康饮酒境界为最佳。</p>
                    <p>非得海参酒造酒理念：“口感为先，健康为本”。首先，酒必须好喝，要人们喜欢喝、愿意喝，喝的舒畅、喝的尽兴。其次，才是要有营养保健作用。简单讲就是“好喝又营养”。</p>
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