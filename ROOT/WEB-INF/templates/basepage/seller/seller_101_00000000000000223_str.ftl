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
                        <p>大连金字塔食品有限公司，成立于2010年，坐落于普兰店市杨树房镇，占地面积4万平方米，企业在职员工100人，固定资产1000万元，资产总额 2000万元。</p>
                        <p>本公司是经国家商务部批准的、具有A级屠宰资质的屠宰企业，屠宰证号为：A16100801、A16100802；是一家集生猪、羊及大牲畜屠宰、收购、初级加工、销售、养殖；肉制品、速冻食品生产、加工于一体的现代化综合食品加工企业。现生猪年屠宰量为16万头，其产品猪白条及分割品、副产品供应大连市内四区及北三市各大、中商超及农贸市场，目前已在辖区内发展直营店40个，加盟店60个，年产值在2亿元左右。同时公司还为大连市几大肉类品牌厂家（如炮台山溜达猪、正和元黑猪等）提供代宰服务。2015年公司又新增羊屠宰、分割、加工、销售项目，目前羊屠宰量为每天300只，其产品羊白条及分割品、副产品也全面进入各大酒店、饭店、商超及农贸市场。 </p>
                        <p>公司地处辽宁省生猪养殖产业园区，周边猪源丰厚，生猪养殖体系成熟，政府监管体系完善，对于生猪进厂检疫检验严格监管，所收购的毛猪为美国杜洛克、大白及三元猪，其瘦肉率高，肉质鲜嫩，生长期长，富含人体所需大量营养成份，24--48小时冷却排酸，0--4℃内无菌加工、运输、销售，全程冷链，是最安全健康的食用肉。公司屠宰羊源为内蒙古大草原生长的草原羔羊、绵羊、山羊，其肉层厚实紧凑，高蛋白，低脂，瘦肉率高；肌间脂肪分布均匀，富有人体所需各种氨基酸和脂肪酸，是高档羊肉产品。</p>
                        <p> 为了确保产品质量与安全，屠宰过程中有政府指定的检疫官全程进行动物胴体检疫检验及肉品品质检疫检验及瘦肉精检测，先进的屠宰设备，先进的屠宰工艺，严格的质量管理体系，健全的管理制度，定时定期检测分析，为大连市民吃上放心肉做好了保障，被工商管理局评定为“诚信单位”。
                            公司成立七年来，始终秉承以人为本、科学发展的理念，把“让老百姓吃上放心肉”作为公司的座佑铭，在新的经济常态下，本公司顺势而为、知难而上，不断创新，全面提升竞争力。在董事长迟军为核心的领导下，坚持走品牌制胜的发展道路，凭借得天独厚的资源优势，领先水平的专业优势，优越的产品性价比优势，高覆盖率的市场优势，从而实现企业的超常发展，创造企业快速成长的“奇迹”。</p>
                        <p>未来就是期待，客户所需就是金字塔人之想，目标一致，适应新常态，以服务双臂，畅游市场大海、以智慧双手，实现财富航母梦想。</p>
                        <p>金字塔人是你永远的好伙伴真朋友！</p>
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
