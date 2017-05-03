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
                    <div>
                        <p>大连市绿之源生态农场成立于2016年4月，绿之源生态农场产品是业内最具有市场美誉度的生态农产品企业。绿之源生态农场绿色产品平台以电商代理模式畅销全国各大城市。</p>
                        <p>绿之源生态农场企业实力雄厚，科技精湛，是一个产品质量口碑俱佳的现代化生态农场，总部落座于中国辽宁省大连市，从事原始畜禽繁育养殖、生态稻米种植，有机水果种植生产，加工，销售、服务为一体的专业化供应商，作为一家负责任的生态农场企业，绿之源生态农场始终秉持“心系国民绿色健康饮食”“德行兼济天下万物苍生”的运行理念，不断耕深原始畜禽、生态鱼米种养、有机生态水果产品质量关，推陈出新，自我超越。</p>
                        <p>生态农场自创立以来，以诚信、绿色、生态，信仰、奉献、永续、创新为企业经营理念，以“源于自然，融于健康”的健康饮食精神，坚持”以人为本，科技领先”的发展战略方针，在市场的推广过程中，以客户需求为导向，用健康效果说话，在所有体验客户中，形成极好的口碑，现已推广电商实体店代理推广范围达二十多个城市。为了宣传利国利民的绿色健康饮食，农场成立之初即决定实行科学管理，利用电商网络营销商业模式，拓展营销区域，开设网络商城，销售种类齐全的有机、绿色、生态、天然、无公害的原始畜禽农产品，和农场自己开办的健康保健医师团队，为客户解答全方位的健康常识，让健康落实到实处。</p>
                        <p>绿之源生态农场奉行以人为本的企业理念和科技创新的经营理念吸引了中国农业大学，华中农业大学等大批农林优势大学的各类人才，原始基因顶尖学者专家加入我生态农场，海纳百川，大象无形。</p>
                        <p>绿之源生态农场不仅吸收高素质人才，更注重对人才管理培训。生态农场一直以来坚持对人才定期培训，现已形成一批专业生态农技师团队精英骨干，为绿之源生态农场奠定坚实后盾。优质的产品质检体验是生态农场对客户最好的价值服务,也是市场期盼与呼声之所在。</p>

                    </div>
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