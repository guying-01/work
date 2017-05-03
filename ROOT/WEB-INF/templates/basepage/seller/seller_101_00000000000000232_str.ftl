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
        <p>大连修竹贸易有限公司始创于1995年，二十二年来，我们专注做好一件事：为全市餐饮企业提供优质原材料。经过二十二年的奋斗与发展，公司从无到有，从个体户成长成为凝聚一百多名员工的正规企业，拥有数十个世界和国内知名品牌的代理权和销售权，连续多年取得骄人的销售业绩，在业界拥有良好口碑和影响力。大连修竹贸易有限公司现为大连市餐饮协会理事单位，总经理任维杰担任大连市餐饮协会副会长。公司旗下自营物流中心，库房面积9000平方米，自建900吨冷库。现代化的仓储管理，为食品安全保驾护航。十人的专业销售团队，多为服务企业多年的老员工，业务熟练，经验丰富，为客户提供最佳餐饮解决方案。六人的客服团队提供细致入微的售前售后服务。由二十二台配送车辆、近40人组成的运输团队保障货物及时送达。设立长兴批发部和菜市批发部，满足渠道客户订购需要。强大的团队，构建了修竹贸易有限公司从销售，到仓储，到物流，到售后的完善服务体系。客户满意，是我们的最高宗旨。二十二年间，我们取得了数十个世界知名品牌及国内著名品牌在东北三省的代理权和经销权。我司拥有直接进口权，已经自主进口了达菲丽意大利面、蓝威薯条等数个知名品牌并培育了成熟的销售渠道。大连修竹贸易有限公司管理正规、服务能力强，经过多年深耕，形成了覆盖大连，辐射东北及山东沿海的全方位销售网络，客户资源遍布餐饮业、烘焙业、快餐连锁业、食品加工业、零售业及网络电商等。</p>
        <p>大连本地100%的五星级酒店以及80%以上的四星级酒店,知名连锁快餐,大型食品厂,知名饼房,西式餐饮,航空配餐均与我公司有多年的合作，例如香格里拉，富丽华，远洋洲际，新世界酒店，凯宾斯基，瑞诗酒店，万达希尔顿酒店,银帆大酒店等。知名连锁餐厅，如亚惠食品、吉野家公司。知名连锁饼房：如经典味道、巴黎贝甜、面包新语等。大型食品厂如艾伦蛋糕行、介画食品厂、大万食品厂、天天利食品厂、麦花食品厂等。航空配餐客户如大连美航食品有限公司和大连航空食品有限公司。在大连市政府承办的历届夏季达沃斯会议及APEC峰会中，我公司始终是指定餐饮承办单位的可靠供货商。我公司销售网络辐射东三省及山东地区，星级酒店客户覆盖沈阳、营口、鞍山、鲅鱼圈、熊岳、丹东、盘锦、威海、烟台等地。二十二年来，公司一直秉承：做事先做人，用大爱之心做事，用感恩之心做人的原则；用：诚信、谦和、守信、公平的思想贯穿整个经营过程；始终坚持：经营一流产品，提供一流服务，为客户创造价值，为员工创造幸福的使命观。我们立志：建设大连市安全、优质、绿、名牌食品航母，服务大众，共同成长！</p>


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
