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
      <p>吉林市东福米业有限责任公司成立于2003年，注册资金2.05亿元，是一家集科技研发、水稻种植、农机服务、稻米加工、仓储销售、杂粮生产、土特产加工、玉米烘干、畜禽养殖、生物肥研制、秸秆燃料加工于一体的大型农产品生产企业。公司占地面积20万平方米，现有资产5.5亿元，绿色水稻种植基地4500公顷，有机水稻种植基地600公顷，全年加工能力达20万吨。2011年，公司被农业部评为“农业产业化国家重点龙头企业”，2013年公司自有品牌“大荒地”被国家工商总局认定为“中国驰名商标”。</p>
      <p>东福米业位于长白山脉向松辽平原过渡地带的吉林市孤店子镇大荒地村，是世界三大黄金水稻种植带之一，具有独特的天文、地理生态环境，空气清新、水源纯净、日照充分，这里历经千年积淀形成的草甸土，土质肥沃、有机质含量高，为有机水稻生产提供了得天独厚的生长条件。从唐朝至清朝的1200年间，吉林市大米一直是皇室的贡米，东福米业一直传承和发展贡米生产精髓，2013年7月，吉林市被中国粮食行业协会命名为 “中国粳稻贡米之乡”。</p>
      <p>维护“中国粳稻贡米之乡”的最高荣誉，是东福米业义不容辞的责任，公司以高新科技、现代化农业设施、现代化农业装备的综合实力，加快现代农业的发展速度，从育苗、插秧到田间管理、收割、仓储、加工等生产流程，实现了信息化、机械化、自动化、标准化生产。</p>
      <p>公司以科技创新为发展动力，运用现代化农业设施、信息化平台，构建精准农业，推动传统农业到现代农业的飞跃。公司拥有10万平方米的工厂化育苗基地、75台太阳能无线监控设备、一座气象信息作业站、两门火箭炮、一个信息化监控大厅</p>
      <p style="text-indent: 0;">，形成了以信息化监控大厅为中心的全覆盖的农业信息监控网络，建立了生产全程质量追溯系统，从源头上保证了农产品的安全。可以说，从一颗颗绿油油的稻苗一直到餐桌的整个过程，都在精心的呵护之下，为消费者生产安全、高质量、高标准的产品。</p>
      <p>公司以生态种植为主要生产方式，每年定期对水稻种植基地的水源、土壤、空气环境进行严格检测，水稻种植过程严格执行国家规定的有机、绿色食品技术标准，施用无害化处理的有机肥料;采用生物技术防治病、虫害；使用清澈甘甜的地下水灌溉，营造有机、绿色水稻的生长环境。良好的生态环境，为稻田养鸭、养蟹、养鱼等领先技术的应用，提供了先天条件，提升了有机、绿色水稻的天然、健康、营养和安全品质。</p>
      <p>公司以基地建设为产业根基，拥有7万亩的水稻种植基地，全部实施农场化、标准化的种植管理模式。公司现有农业机械化设备500多台套，从育苗—施肥—翻耙地—插秧—田间管理—收割―运输，全程采用机械化作业，统一标准、精耕细作、降低成本、增产增效，通过机械深松整地，改良了土壤结构，推行秸秆还田，提高了土壤有机质和肥力，促进了生态农业循环产业链健康发展。</p>
      <p>公司以产品质量为根本保障，采用先进的低温仓储设施保持了谷物的新鲜和良好的口味。公司现有国内最先进的水稻专业烘干设备和2条国际领先的稻米加工生产线，采用多级清理、多级碾米、远红外色选、无菌包装的特殊工艺，全程实现计算机控制。生产环境卫生、环保、加工出来的大米整精率高、色泽一致、晶莹透明、品质优良。加工过程实行全程多人重复检验方式，严格把控每道作业工序，为确保消费者的身体健康筑</p>
      <p style="text-indent: 0;">起了一道坚固的防线。</p>
      <p>公司以顾客满意为企业宗旨，生产的“大荒地”牌有机、绿色系列产品在全国二十几个省市均有销售，并出口港、澳地区及中东国家，深受市场的欢迎。从原种繁育、工厂化育苗、生态化种植、工业化加工、便捷化配送，采用标准化管理手段全程实施信息化产品溯源系统管理，通过产品溯源系统的全程管控，实现了从种植到销售等环节的全流程可追溯，确保了产品的质量安全，真正做到了从土地到餐桌的食用安全保障。</p>
      <p>吉林市东福米业有限责任公司始终以人类健康为己任，生产安全、绿色、营养、健康的农产品，推动现代农业的可持续发展，全力打造世界高端品牌！</p>


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
