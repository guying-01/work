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
					 <p>瓦房店市鑫龙果品有限公司位于瓦房店市万家岭镇万家岭村，法人代表孟宪威，公司注册资金417万元，现有管理人员98人，季节职工3400多人，年销售水果万余吨，是大连市著名农产品企业龙头企业之一。生产的"威云"牌苹果、葡萄驰名中外，远销菲律宾、俄罗斯、朝鲜等国际市场，在国际市场上供不应求，而且在国际市场销售价连创最高。现已形成了水果生产与技术指导、包装与加工、储藏与销售于一体的一条龙服务体系，完善了"公司+基地+协会+农户"管理经营模式，带动了当地及周边地区果业的迅速发展，实现了农民增收、企业增效，推动了地区经济发展。</p>
                        <p>公司自2002年成立以来，得到了快速发展，当年修建2000平方米恒温气调库，建设综合办公楼一栋，建立了农民培训中心,公司成立当年就把中国苹果推向了国际市场,解决了当地农民的卖果难问题,总经理孟宪威被评为大连市农产品"销售能手"。</p>
                        <p>2003年，为了增大公司与农民的利益，公司在俄罗斯伊尔库茨克市建立了自己的销售点，自己销售中国果品，因成绩显著而被大连市评为"市场开拓有功人"，同时在当地开始着手建设自己的水果基地。</p>
                        <p>2004年，公司在俄罗斯伊尔库茨克市成立了布莱斯富德有限公司,法人代表孟宪威，执行经理高亮。在俄固定资产合人民币500万元，注册资金合人民币100万元，公司员工20人。在伊尔库茨克市果蔬批发市场设有恒温冷藏库两座，建筑面积2000平方米，年销果蔬3万余吨。成立了万家岭镇果品产销协会，注册了"威云"牌水果商标，基地建设初具规模达到7500亩，取得了无公害水果产地认证，形成了以协会为纽带，公司与农户相结合的运做体系，真正实现了产、供、销一条龙。总经理孟宪威被瓦房店市人民政府评为农产品经销"十佳经纪人"。</p>
                        <p>2006年，为了满足市场不断扩大的需求，新建恒温气调库2500平方米；为了扩大市场，公司投资引进了一条水果打蜡上光生产线；为全力打造水果品牌，提高产品质量，加大基地建设，公司安装杀虫灯500余台，释放赤眼蜂四次，建设病虫害预测预报站5个，建设科技服务中心一个，使基地步入了现代农业的轨道，实现了标准化管理。</p>
                        <p>2008年，由于公司不断提高产品质量，公司水果基地生产的国光苹果先后被评为“辽宁省名牌农产品”、“中国名牌农产品”，公司被评为“辽宁省农业产业化龙头企业”。2009年公司的水果生产基地被评为“辽宁省现代农业示范基地”。为了更进一步提高公司产品质量、产品与欧美地区接轨、把公司产品打入欧美市场，2010年5月公司对目前的质量管理体系进行了GLOBAL GAP认证, "威云"牌水果商标被评为辽宁省著名商标。</p>
                        <p>经过十几年的风雨历程，目前公司占地面积2.5万平方米，建筑面积1.7万余平方米，一次性储藏量达10000多吨，年储藏各类水果2万余吨；公司组织建设水果生产基地1.8万亩；产品远销中东、东南亚、俄罗斯三大地区二十几个国家，主要销售国家为：1.中东 ：约旦、埃及、科威特、阿曼、伊朗、沙特、苏丹、孟加拉等国家；2.俄罗斯；3.东南亚：菲律宾、泰国、缅甸、泰国、马来西亚、新加坡、越南等国家。至2014年底公司资产规模13552万元，水果销售量24000吨，销售额1.13亿元，利税总额1307万元，出口创汇1507万美元。预计2015年出口量2.1万吨，出口额1560万美元。</p>
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