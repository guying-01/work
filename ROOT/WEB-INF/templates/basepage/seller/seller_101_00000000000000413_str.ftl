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
                        <p>内蒙古阿尔山市蒙晟农牧业科技有限公司在阿尔山市政府的大力支持和推进下，由大连新网商信息技术有限公司孵化，设立于美丽的口岸城市阿尔山。采用公司+基地+合作社的管理模式，打造代表阿尔山地区区域产品“钰水珍山”品牌，让老百姓吃到良好生态环境中的原汁原味的安全食品。积极推进当地健康旅游+绿色食品原产地直供。目前公司主要经营四大系列产品：野山珍系列，冷鲜肉系列，粮食系列，进口食品系列，从田间到餐桌，品质保证，价格合理。目前公司旅游业务：为阿尔山-柴河；阿尔山-呼伦贝尔专线旅游</p>
                        <p>中国。健康。阿尔山地处中蒙边境，火山遗迹、地表温泉、地下矿泉，森林，在这里与草原完美结合，是非常难得的具有优质生态环境的高寒小城。广袤的土地上，市内人口还不到1万人。因阿尔山海拔高，温差大，使产品生长周期长，养分积累丰富，品质优良，口感极佳。阿尔山每一年有8-9个月处于冰雪覆盖下，冬天和夜晚的温度都低于更北的区域，昼夜温差近20度，夜间极低的温度，白天充足的阳光照射，优质富含健康矿物质元素的水以及纯净的空气，非常好的限制了病虫害的发生，所产的木耳、猴头菇、灵芝在整个培养、生产过程中不使用任何化肥，农药；蘑菇则为纯山林采摘的野生菌类；牛肉，羊肉则是来自呼伦贝尔基地的纯草地放养的溜达牛，溜达羊，非圈养人工育肥牛。钰水珍山产品均为原产地直供，是您放心食用的安全食品，馈赠亲朋好友的最佳礼品。“钰水珍山”为您的健康保驾护航！</p>
                        <div style=" height: auto; text-align: center;padding: 0 auto;">
                            <p class="tupian1" style="text-indent: 0;margin-bottom: 0.2rem"></p>
                            <p class="tupian2" style="text-indent: 0"></p>
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