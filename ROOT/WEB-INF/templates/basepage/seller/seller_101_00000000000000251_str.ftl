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
                        <p>
                            良耘谷物有限公司2007年成立，良运集团独资。拥有意大利面粉生产线一条，年产优质面粉三万吨。其产品“辽南福”小麦粉、麦芯粉、饺子粉及“良耘”雪花粉、特精粉，良耘大米、长粒香米等系列产品均已进入大连各大商超卖场。“辽南福”面粉荣获2011年第十一届中国国际粮油产品及设备技术展览会金奖产品。
                        </p>
                        <p>
                            良运集团成立于1962年，前身为“旅大市革命委员会生产指挥组粮食接运指挥部”，隶属中国内贸部；曾被评为“中国最大服务业企业称号”，后更名为“大连粮食进出口接运总公司”，“大连良运集团有限责任公司”，2012年更名为“良运集团有限公司”,成为跨区域综合性大型股份制企业集团。
                        </p>
                        <p>
                            2014年，实现营业收入近百亿元，有员工1500余人。下属独资、控股、参股企业40余家，2012年入选中国服务业企业500强。建企50年来，几代良运人不断探索，锐意进取，将良运由一家传统单一的粮食转运企业发展成为从事粮食供应链管理、房地产开发、金融投资、酒店连锁、休闲度假、通用航空、有机食品连锁经营等众多领域的综合性企业集团。
                        </p>
                        <p style="text-align: center;font-weight: 600;font-size: 0.28rem;text-indent: 0;padding: 0.1rem 0">
                            良运文化
                        </p>
                        <p>
                            绿色发展理念：良运坚持可持续发展的战略规划，目标是生产绿色产品，提供绿色服务，创建绿色员工关系、股东关系、客户关系，引领绿色消费、开拓绿色市场。
                        </p>
                        <p>
                            幸福企业理念：良运倡导创造财富、分享财富，力求企业发展成果能惠及员工，员工与企业能休戚与共、风雨同舟。
                        </p>
                        <p>
                            企业公民：良运热心公益事业，认真践行企业公民的社会责任，积极参与各类社会公益活动，被评为2009年大连市“最佳雇主”，2011年辽宁省“劳动关系和谐企业”。
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
