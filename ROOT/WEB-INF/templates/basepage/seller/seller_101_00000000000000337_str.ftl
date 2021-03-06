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
        <p>大连百味特食品有限公司创建于2003年，建成了集生产，配送，连锁经营与一体的国际化餐饮运营体系，本企业拥有管理公司—大连亿源商业连锁发展有限公司，食品工厂—大连百味特食品有限公司，基金管理公司—深圳金利源股权基金公司，2009年成立团膳运营部，专业管理大中型食堂、美食广场托管，蔬菜粮油配送方案、厨房设计方案、食堂保洁劳务管理、大型团膳配送方案设计等一体化的绿色餐饮企业。</p>
        <p>本企业为中国商务部重点扶持企业，大连市甘井子区政府明星企业，大连市政府早餐工程指定单位，2015年1月首轮路演，证劵签约。3月10日证劵团队进场内部梳理，6月份股改完成，8月份证劵上报材料，10月份正式挂牌上市。</p>
        <p>公司成立以来，广揽烹饪人才及企业高级管理人才，现已具有雄厚的资金实力。拥有6000平米集团大楼：4000平米中央厨房，1000平办公区域，1000平多媒体会议室，50吨的冷冻仓库，50吨的保鲜库，10辆配送用车。公司高薪聘任资深餐饮总监及多名营养师，培养和储备了一大批优秀的管理人才，以科学的管理模式，精湛的烹饪技术，为公司的稳健发展奠定了坚实的基础。我们愿能秉承过往的光荣业绩，以优质的产品及至诚的服务赢取广大客户的认可与信赖。目前已和多家企业建立了良好的经营合作关系，本公司“以品质求生存，以诚信求市场，以创新求发展”的经营理念，秉承“立本、立身、立心、立命”的企业核心价值观，打造膳食行业的权威品牌!公司的愿景是：携手合作，优势互补，优化资源的配置，提高贵公司员工用餐的质量，塑造贵公司的知名度，从而达到“双赢”。我们期望与贵公司真诚的合作，能为贵公司再造辉煌铺平后勤工作之路!</p>


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
