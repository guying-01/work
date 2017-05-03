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
                        <p>我公司自1996年成立，至2006年正式更名为大连华美亚贸易发展有限公司。现已经发展成为一个集零售与餐饮两大业态于一体的综合型企业。公司在零售行业以散货休闲食品为主，现有员工300多人，配送车辆8台，年销售额1亿元， 与多个国内、国际大中型零售企业有着深厚而密切的合作关系，总部设在大连。 经过多年的经营拓展，公司已形成了“雄踞大连，辐射东北，走向全国”的发展格局，公司先后与大商新玛特集团，百盛集团，千盛集团，友谊集团，旺客隆，沃尔玛等大型知名零售企业建立了战略合作伙伴关系，在多个超市设有联销专柜，专柜经营十多大类三百余种商品，并在全国各地建立分公司和直营专卖店，销售网络遍布东北、河南等多个省份地区。成为大连散货行业的龙头企业。</p>
                        <p>公司在多年的发展过程中，凭借着良好的行业口碑，诚信的经营理念，与国内外多家知名企业、知名品牌建立了长期、友好的合作关系，成为福建盼盼、福建泡吧、福建亲亲、旺旺、河北怡达、山东奥赛、福建雅客、阿尔卑斯、等知名品牌的独家代理商。截止2016年，盼盼、亲亲等部分品牌的年销售额已经达到500万左右，并保持着年增长率20%的速度高速运转。大连华美亚贸易发展有限公司也因此成为厂商们信赖和认可的优质经销商。</p>
                        <p>为了满足发展的需要，公司在2009年成立了以分装产品为主的加工厂，注册自有品牌“金半岛”，从不同方面迎合商家和消费者的各种需求。</p>
                        <p>长期以来本公司秉承“诚信立业，服务为本”的理念，在多年经营工作中，为广大销费者提供质优价廉的商品和满意的服务，这一切得到了消费者的赞誉，赢得了众商家的信赖，也为行业同仁们所瞩目。目前，大连华美亚贸易发展有限公司正以迅猛发展速度和强劲的经营续航力，遨游并挺立于商海的潮头。</p>
                        <p>同时本公司也真诚的希望能够与国内外各厂商建立广泛的合作关系，共同开拓市场，携手并进，达到双赢的目的。</p>
                        <p>公司经营的品种大类及品牌如下：</p>
                        <p>1、蜜饯系列   2、糕点系列   3、干果系列   4、糖果系列  5、膨化系列</p>
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