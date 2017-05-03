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
        <p> 大连冰源洋肉工厂，是一家以进口肉制品加工销售为主的民营企业，位于辽宁大连。公司广泛吸收国内外肉制品厂家的先进技术和配方，扬长避短，集各家之长，以精湛的技术及独特的产品，确保产品在同行业市场的占有率。</p>
				<p> 公司遵循“市场是企业之父，信誉是企业之母，创新是企业生命之源泉”的经营理念，始终不移地追求客户和消费者的完全满意，塑造了“诚信求实”的企业形象，以优质的产品和真诚的服务，赢得了越来越多的客户。</p>
				<p> 实力来自信心，不做最大，但争最好的企业。冰源人保证，唯有精湛的技术和最好的产品，才是企业的成功和发展的源泉，“路漫漫其修远兮”，冰源将上下求索。</p>
        <p>  自创立以来，冰源人以经济建设为中心，以科技兴企为目标，以强化管理为依托，以制度建设为内容，以形象建设为载体，以文化活动为手段，以思想政治工作为保证，通过建立创新理念，凝练企业精神，培养好的作风，完善管理机制，营造学习气氛，建设过硬队伍，树立良好形象，构筑“严谨、务实、创新、奉献”的企业文化氛围。</p>


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
