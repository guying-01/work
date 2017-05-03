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
                        <p>益海嘉里是新加坡丰益国际有限公司（Wilmar International Limited）在中国大陆投资，由著名爱国华侨郭鹤年先生及郭孔丰先生叔侄创办并经营的，集粮油加工及贸易、油脂化工、仓储物流、粮油科技研发等工贸业务为一体的多元化侨资企业。</p>
                        <h3 style="font-size: 0.3rem;">关于丰益国际</h3>
                        <p>丰益国际是亚洲领航的农业综合企业集团，2006年在新加坡证券交易所上市。2016年世界500强企业位列第254位，在全球粮油行业排名第5位。</p>
                        <p>丰益国际业务范围包括绿色棕榈产业、油籽压榨、食用油精炼、炼糖制糖、专用油脂、油脂化工、生物柴油和化肥制造以及粮食加工等，是世界知名的棕榈油生产和贸易商。丰益国际经营战略的核心是打造适应力强的综合型农业产业模式，整合农产品从种植到加工、从品牌产品到流通服务的整条农业价值链。</p>
                        <p>目前，丰益国际已在全球17个国家设有500多家工厂，经营网络遍及中国、印度、俄罗斯、美国、澳大利亚、加纳等50个国家。来自不同国家的超过9.2万名员工效力于丰益国际。</p>
                        <h3 style="font-size: 0.3rem;">关于益海嘉里</h3>
                        <p>截至目前，益海嘉里在祖国的总投资已超过300亿元人民币，现有员工2.3万人，在全国23个省、自治区、直辖市，建立生产基地共计61个，生产型实体企业130多家，主要涉足油籽压榨、食用油精炼、专用油脂、油脂化工、玉米深加工、大豆精深加工、水稻循环经济、小麦深加工、食品饮料、粮油科技研发等产业。</p>
                        <p>益海嘉里旗下拥有“金龙鱼”、“欧丽薇兰”、“胡姬花”、“香满园”、 “海皇”、“丰苑”、“金味”、“锐龙”、“洁劲100”等著名品牌，产品涵盖了小包装食用油、大米、面粉、挂面、米粉、豆奶、餐饮专用粮油、食品原辅料、油脂化工等诸多领域。与此同时集团在国内建立了网点广泛、点面结合、渠道畅通的营销网络，为广大消费者提供全方位服务。</p>
                        <p>展望未来，益海嘉里将继续响应国家产业和经济政策，发挥自身的品牌、规模、研发、人才等优势，秉承营养、健康、安全的研发理念，把国内外食品、营养等学科的最新研究成果与中国人民的膳食特点相结合，持续不断地为国人提供更营养、更健康、更安全的优质粮油产品，以实业报国，为推动中国粮油行业发展做贡献。</p>
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