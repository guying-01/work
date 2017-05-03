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
		<#import "/basepage/store/default/common/common_footer_no_tab.ftl" as footerNoTab/>
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
		<div class="top">
            <div class="store_search_box">
			<@searchBox.render />
				<#--导入search_box-->
            </div>
			<@header_bar.render '商铺',''/>
		</div>
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
        <p>贵州五星酒业集团有限责任公司坐落在中国酒都——仁怀市茅台镇。成立于1993年，是一家集白酒生产、研发、销售于一体的综合性酒类企业，专注白酒酿造23年。</p>
        <p>旗下拥有五大基酒厂、两大包装厂，是茅台镇历史悠久的十强白酒企业。拥有传统发酵窖池600多个，年生产优质酱香型白酒6000多吨，储酒能力15000多吨。两大包装厂，5条现代化灌装生产线，每条每小时生产4500瓶，5条每小时就能生产22500余瓶白酒。现代化勾兑、过滤设备、一流的产品检验、化验设备。严格把控每一个生产环节，确保每一滴白酒的质量。</p>
        <p>五星酒业能够获得这么多的荣誉，得到行业的广泛认可，客户口碑的肯定，是因为五星酒业23年来只专注做一件事：五星品质，纯粮酿造，“粮”心酿好酒 只用质量说话。</p>
        <p>镇酒，是利用茅台的特殊环境气候，以当地优质高梁、小麦为原料，经多次发酵、多次取酒等独特工艺酿制而成的酱香型窖酒，和茅台酒一脉相承。其酒体晶莹透明，略带微黄，丰满醇厚，绵软柔和；酒质幽雅细腻，和谐醇香，酱香突出，敞杯不饮，香气扑鼻，开怀畅饮，满口生香，空杯留香，持久不散，回味悠长，茅香不绝，具有茅台酒特有的典型风格，属有机、绿色健康食品。据有关医学专家实验证明，适量饮食镇酒，有益身体健康，饮后不上头、口不干、舌不燥、不伤肝，所以，深受广大消费者青睐。镇酒的生产周期长，产量低，需要一年时间的酿酒周期才能出酒，酿造工艺复杂，端午采曲、重阳投料，九次蒸煮、八次发酵、七次取酒，历时整整一年，一般都要窖藏3年以上才上市销售，其品质并不比茅台酒逊色，更甚者亦有之。</p>

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
