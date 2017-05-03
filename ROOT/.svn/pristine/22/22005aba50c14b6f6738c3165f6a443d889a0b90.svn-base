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
                        <p style="text-align: center;text-indent: 0;">大连森野绿洲农业发展有限公司简介</p>
                        <p>
                            大连森野绿洲农业发展有限公司成立于2013年12月，是大连庄河步云山地区一家创品牌，打造生态绿色产业的新型企业。公司立足于名、优、特农产品的开发与推广，利用当地天然步云山温泉优势，开发出原生态喝山泉水乌鸡、三黄鸡、乌鸡蛋、鸭蛋、庄河有名黑毛猪；并纵深整合资源，开发整合山区时令的山货系列：原生态绿色五谷小杂粮、山野菜及特色大棚的果蔬产品，如：引进种植美国大李子、日本的茉莉香葡萄等优品。公司在传统销售渠道的同时，不断探索新的销售模式，现已与省内外几家经销商达成多项合作，为公司致力打造“庄河原生态时令特色农产品”走向全国奠定坚实的基础。
						</p>
                        <p>
                            大连森野绿洲农业发展有限公司属股份制私营有限制公司，公司秉承着“只做良心产品”的宗旨耕耘于行业间。步云山是大连地区唯一一个没有开发无工业的山区，全年空气指数有354空气质量达到全优，与村里有名的“老汤温泉”“胜谷美地漂流”为邻。公司办事处在大连，仓储在步云山，以线下和线上订单形式销售全国市场。目前拥有种植园大棚区和观光园和私人定制种植区，在种养殖园区内四周青山环绕流水潺潺，胜产名品条件充分，品味独特，产品有亮点。
						</p>
					<p>
                        通过三年时间的努力，我们打造出“福喔喔”生态健康产品系列，实现了自然成熟，从田间到餐桌，当天早上新鲜摘同城中午送到家的服务供货模式。在未来我们还会紧紧围绕“整合资源，创新品牌，实现新跨越”的工作思路，推进公司加农户的战略目标，继续打造的更精细、更丰富、更具有山区代表性原生态产品走向全国市场。将庄河时令特色农产品推进发展，创名优品牌企业。
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