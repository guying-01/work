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
                        <p>大连品善食品有限公司是一个以鲍鱼、海参、调味品等海洋珍品生物开发和精深加工为主，集海珍品收购、加工、销售为一体的综合型高新技术企业。</p>
                        <p>自2011年成立以来，一直秉承着“与品为伴、与人为善”的发展理念，以长海县丰富的海珍品资源为基地，选取驰名中外的长海县优质鲍鱼和海参为原料，在继承和发扬传统加工工艺的基础上，利用先进完备的生产设备，采用国际先进的工程技术合同行业领先的生产工艺，通过严格的质量控制体系，生产出深受人们喜爱的“王氏善品”品牌海珍品系列，其中冻煮活鲍鱼、活冻鲍鱼、即食鲍鱼、即食去肚鲍鱼、碳烤鲍鱼、黄金鲍肉、干鲍鱼、鲍鱼捞饭、速发海参、美味海参、免煮海参、淡干海参、即食海参、大火侯盐渍海参、磷虾酱、参鲍汁、等几大系列数十个品种海洋营养食品备受市场青睐。</p>
                        <p>公司先后通过国家ISO9001:2000国际质量管理体系认证、ISO14000国际环境管理体系认证、HACCP国际食品安全管理体系认证、SC水产质量安全认证等，并获得“地理标志保护产品大连海参、大连鲍鱼专用标志使用权”、“重合同守信用单位”、“大连市诚信A级单位”、等一系列荣誉称号。</p>
                        <p>公司董事长王命耀先生始终坚守质量第一、回馈第一、服务第一的宗旨，愿与社会有志之士共谋海洋科技产业发展前程，将“王氏善品”品牌海珍品推向全国，让海洋生物造福人类，为社会经济发展尽绵薄之力。</p>
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