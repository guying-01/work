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
                    <p>1.企业简介</p>
                    <p>北镇市福润食品有限公司成立于2015年7月，位于医巫闾山南麓的闾阳镇，与祈福灵境青岩寺毗邻相望，紧邻京沈铁路、102京哈国道、人杰地灵，交通便利，四通八达。公司占地面积4000㎡，建筑面积1000㎡，总资产120.6万元。现有员工49人，其中专业技术人员10人。有豆制品加工生产线2条，日加工黄豆2.5吨。主要以干豆腐、豆腐皮产品为主。产品主要销往沈阳市、大连市、盘锦市、鞍山市、营口市和北京市等地。注册商标为“豆强”品牌。公司自成立以来，始终坚持以客户需求为中心，本着“和谐、创新、共赢、发展”的营销理念，不仅为客户创造了丰厚的利润空间，同时也给企业带来了可观的经济效益。
                    </p>
                    <p>2.人员情况</p>
                    <p>现有员工49人。其中管理人员5人，技术人员10人。</p>
                    <p>3.产品情况</p>
                    <p>为了提高企业竞争力，占领北镇市及其周边省市豆制品市场，经过2—3年的筹备，于2015年7月成立北镇市福润食品有限公司。新建生产线，公用、辅助设施生产设备等，年可加工豆制品800吨。</p>
                    <p>公司成立了专业研发团队，技术水平周边县、市（区）处于领先地位，拥有两套先进的豆制品加工自动生产线，主要产品为生鲜豆制品。产品销往省内的盘锦、营口、沈阳、大连等地区，省外的北京、天津等城市的超市、农产品销售市场。本地市场占有率30%左右。企业银行信用AA级，纳税信用好。</p>
                    <p>4.预期效益</p>
                    <p>经济预期效益</p>
                    <p>我国是产豆大国，但豆制品加工业发展滞后。发达国家食品加工率一般都在70％以上，有的高达92％，而我国仅为20％～30％，科技含量和附加值相对偏低，资源浪费严重。因而，只有通过豆制品深加工，才能减少资源浪费，提高产品附加值，增加经济效益。预计到2015年底，企业可实现主营收入560万元，纳税18万元，净利润100万元，解决就业人员49人。</p>
                    <p>社会效益分析</p>
                    <p>豆制食品，以其天然、营养、经济方便等特点走进越来越多人的生活，从都市白领到营养专家，从时尚的年轻女性到注重生活品质的中产人士，都对豆制食品青睐有加。作为我国传统食品之一的豆制食品正在国人的健康饮食、改善营养结构的过程中扮演着重要的角色。
                    </p>
                    <p>随着营养学、植物学等研究的不断深入，大豆的天然营养的特点引发更多关注，大豆更被称做“天然营养加油站”。豆制品含有丰富的营养元素，包括优质的植物蛋白质及多种人体所需的微量元素钙、磷、铁等矿物质，豆浆中不含胆固醇与乳糖，却含有丰富的不饱和脂肪酸、大豆皂甙、异黄酮、卵磷脂等几十种对人体有益的物质，能够帮助调节人体健康状态，具有降低胆固醇、防止高血压、冠心病、糖尿病等多种疾病的功效，坚持食用能够增强人体免疫肌能，帮助延缓肌体衰老。</p>
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