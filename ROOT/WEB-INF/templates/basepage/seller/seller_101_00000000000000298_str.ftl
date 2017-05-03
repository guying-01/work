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
                        <p>獐子岛集团股份有限公司（以下简称“獐子岛集团”）于2006年9月28日在深交所上市（股票代码002069），并创造中国农业第一个百元股。2007年，獐子岛集团成为达沃斯“全球成长型公司社区”首批创始会员，并当选为“ CCTV 年度最佳雇主”、全国首届“兴渔富民新闻人物”企业。</p>
                        <p>獐子岛集团系农业产业化国家重点龙头企业，以虾夷扇贝、海参、皱纹盘鲍、海胆、海螺等海珍品为主要产品，拥有国内唯一的国家级虾夷扇贝原良种场和国内一流的海参、鲍鱼等海珍品育苗基地；地处世界公认的海珍品适宜生长地带——北纬39度，在渤海、黄海、东海拥有远离大陆56海里的国家一类清洁海域100余万亩，是国内最大的海珍品增养殖基地；在大连、山东荣成等地建有6座水产精深加工基地，拥有中国最大的海胆和金枪鱼加工厂，年总加工能力超过2万吨。</p>
                        <p>獐子岛集团一直高度重视产品质量体系建设，在 2000 年就引进了 ISO9000 质量管理体系和 HACCP 食品安全管理体系，对育苗、养殖、加工、净化、配送全过程建立了质量管控和可追溯体系，确保产品从“产地到餐桌的安全”。 2003 年，公司虾夷扇贝、海参、鲍鱼通过国家质量监督检验检疫总局“国家地理标志保护产品”认证，并先后获得“辽宁省名牌产品”称号，虾夷扇贝还荣获“中国名牌农产品”称号。 2006 年，“獐子岛”牌商标被认定为“中国驰名商标” , 公司也获得“辽宁省质量管理奖 ” 。 2007 年 5 月，公司作为农业部重点推荐的贝类养殖和加工企业，顺利通过了美国 FDA 对我国贝类水产品卫生控制状况的检查。 2008 年 9 月，公司的食品安全监控获得香港食环署的高度赞扬。</p>
                        <p>獐子岛集团已经形成鲜活品、冻品、调理食品、即食产品等多个产品品系，销售网络已经覆盖了国内主要大中型城市，并远销美国、日本、欧盟、澳大利亚、新西兰、韩国、加拿大等国家和地区，深受当地消费者欢迎。为了加快国际化进程，公司于 2008 年先后在美国和香港设立了子公司，积极参与全球化竞争，树立中国水产品的良好国际形象。</p>
                        <p>獐子岛集团一直致力于科技创新，公司与中国科学院海洋研究所、中国水产科学研究院、中国海洋大学等国内水产界著名院校建立了战略合作关系。公司于 2004 年 7 月被认定为“大连市高新技术企业”。 2006 年 1 月，公司被国家科技部、发改委、财政部、海关总署、税务总局等五部委认定为首批国家级企业技术中心； 2008 年 2 月，公司入选“全国第二批创新型试点企业”。近 10 年来，公司获得省部级以上的奖项就近 10 项，其中《皱纹盘鲍杂交育种技术及其养殖工艺体系》项目获得 2007 年国家科技进步二等奖。</p>
                        <p>作为农业产业化龙头企业，獐子岛集团积极探索社会主义新渔村建设。公司 2004 年来，倡导并实践了“政府 + 银行 + 科研机构 + 公司 + 农户”的“五合一”合作模式，通过公司的资金、管理、技术、品牌输出，带领当地 1 万多名养殖业户共同致富。另外，公司还积极投身于社会公益事业，几年来捐赠慈善事业和投资公益事业的金额超过 2000 万元。</p>
                        <p>具有 50 年沉淀和积累的獐子岛集团，在走向百年的征程中，将秉承“责任、合作、执行、感恩”的企业价值观，通过“市场化、工业化、信息化、国际化”建设，致力于“为世界人民提供健康、安全的海洋珍品”，打造“受人尊敬的、卓越的世界海洋食品企业”。</p>
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