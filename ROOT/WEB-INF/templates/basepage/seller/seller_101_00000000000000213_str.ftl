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
        <p>大连心乐乳业有限公司坐落在大连市普湾新区三十里堡街道,是集奶牛饲养、良种繁育、乳品加工、销售终端为一体的省级农业产业化重点龙头企业。</p>
							<p>公司创建于2001年11月。现有厂房建筑面积1,1000平方米，奶源基地面积100，000平方米，下设牧业、生产、信息、销售四大事业部，员工400多人，日产能达100吨，信誉等级AAA。</p>
							<p>心乐乳业目前拥有三个现代化牧场(分别位于普湾新区三十里堡街道，金州新区华家街道和杏树街道)。旗下的北乐牧场是我市唯一的省级无公害现代化牧场，拥有优质苜蓿草场、良种奶牛繁育中心、奶牛饲养基地，目前饲养奶牛4000多头，日产原奶40吨，全部引进品种优良的澳大利亚荷斯坦奶牛。牧场采用现代化管理模式，全部采用机械化挤奶。</p>
							<p>心乐乳业坚持 “让每一位大连人都能喝上真正的鲜牛奶”为企业的使命，已发展成为大连市著名的乳业品牌。公司及其产品分别被中国食品工业协会、辽宁省工商行政管理局、大连市政府分别授予“诚信企业、放心食品”、“安全卫生食品”等称号。2008年度心乐乳业被大连市质量技术监督局授予食品安全特别贡献奖。</p>
							<p>心乐乳业公司以信息化改造传统的管理模式，推行ERP系统，建立了完善的ISO9001国际质量管理体系和HACCP食品</p>
              <p style="text-indent: 0">安全管理体系，开发、生产、销售巴氏鲜牛奶、酸牛奶和乳饮料等三大系列、二十余种产品。其中巴氏鲜奶和高档酸奶——“老北京酸奶”是大连市巴氏鲜奶和凝固型酸奶的第一品牌。“心乐”、“北乐牧场”和“金百乐”已成为大连市家喻户晓的著名品牌。在市场营销方面，心乐乳业建设了高效的城市型冷链配送营销网络；目前心乐乳业的销售终端网络达1500个，日配奶站32个，开展送奶到户业务，订户已达10，000户。</p>
							<p>心乐乳业结合大连市都市化农业建设，配合发展养殖业和新农村建设，加强与科研机构的合作，开发出一系列具有国内领先水平的功能性乳制品，如：益生菌产品、益生元产品；低乳糖或无乳糖产品；提高人体免疫力的产品。心乐乳业与大连工业大学合作，利用国际最先进的技术，在国内率先开发含共轭亚油酸和ω3脂肪酸的降血压和血脂保健型功能牛奶。该项目先后获大连市和辽宁省科技一等奖。</p>
							<p>心乐乳业今后的发展思路和规划是：结合大连市建立的10万头优质奶源基地的支持，坚持以巴氏鲜牛奶、酸奶等高端冷链产品为主，进一步加强与科研机构的合作，用高科技手段加强开发特色和功能性高附加值的乳制品，建设高效的城市型配送营销网络，将企业打造成城市型液态奶优秀生产企业，创中国特色奶业知名品牌。</p>
						
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
