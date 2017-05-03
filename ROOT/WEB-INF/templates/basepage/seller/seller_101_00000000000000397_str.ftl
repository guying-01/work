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
                        <p>万福肉类有限公司（以下简称“万福”）成立于2007年，是一家总部位于河北省廊坊市，集肉牛饲养、屠宰、肉牛精深加工、调理牛排、调理方便菜和销售于一体的大型民营企业。公司总资产为1亿元人民币，占地80亩，厂房建筑面积8000平方米，年屠宰肉牛6万头，销售各类牛肉制品20000吨，年销量收入达10亿元人民币。</p>
                        <p>万福公司牛肉产业链条完整，发展稳定。通过万福人不懈的努力，公司获得了多项荣誉和资质。</p>
                        <p style="text-indent: 4em;">1、2011年万福被廊坊市政府正式确定为“肉牛定点屠宰厂”</p>
                        <p style="text-indent: 4em;">2、2012年正式确定万福公司为“农业产业化重点龙头企业”</p>
                        <p style="text-indent: 4em;">3、2012年被评为清真食品协会副会长单位</p>
                        <p style="text-indent: 4em;">4、2013年荣获河北省质量技术监督局颁发的“河北省优质产品”奖</p>
                        <p style="text-indent: 4em;">5、2013年通过了ISO-9001国际质量管理体系认证和ISO22000国际食品安全体系认证</p>
                        <p style="text-indent: 4em;">6、荣获廊坊市消费者协会第十届、第十一届消费者信得过产品单位荣誉称号</p>
                        <p style="text-indent: 4em;">7、2014年被评为“河北省中小企业名牌产品”</p>
                        <p style="text-indent: 4em;">8、2014年被中国饭店业协会评定为“金牌供应商”</p>
                        <p>荣誉已成为历史，万福公司更加努力向前！随着生活水平不断提高，人们更加注重和追求安全、营养、美味的食品。</p>
                        <p>民以食为天------吃得好才能身体好。身体强健是中华民族伟大复兴的基础。健康的体魄，是中国人实现中国梦想的根基。</p>
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