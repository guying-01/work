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
                        <p>大连千禧苗木果品专业合作社简介大连千禧苗木果品专业合作社位于大连瓦房店市复州城镇，该镇素有中国“黄桃之乡”和“东北最大的大棚桃主产区”的盛誉。2015年“宁波杯”全国赛桃会，本社油桃荣获“金奖”和全国唯一的“桃王奖”，2015大连夏季达沃斯年会文化晚宴，本社被会务组定为油桃独家赞助商，得到国内行业专家的高度赞誉。理事长邹长仁同志为中国园艺学会桃分会理事、大连市“12316”金农热线桃优秀专家、瓦房店市特等劳动模范和获得农业部《全国农牧渔业丰收奖》科技推广贡献奖。“甜八里”品牌油桃2016年被评为“全国农产品百强品牌”、“全国最具人气智慧农场”、“全国优秀示范农场”。</p>
                        <p>大连千禧苗木果品专业合作社自2010年成立以来，目前注册社员300户，实际合作社员超过1000户，社员来自于本村、本镇、瓦房店市各乡镇及大连市各县市区、辽宁省和全国15个省、市、自治区。目前合作社基地已达到20个，本市大型基地4个（八里村棚桃基地100亩）、（三台乡绿化树苗、露地油桃新品种基地1000亩）、（仙浴湾露地油桃新品种基地500亩）、（红沿河露地油桃新品种基地200亩），及庄河、长海、普兰店、金州，面积200亩以上的基地4个，外省（新疆吐鲁番、山西大同、陕西延安、内蒙赤峰、河北唐山、甘肃敦煌、江苏南京）等面积500亩以上的大型基地12家，新品种和新技术全国推广辐射面积超过10万亩。各基地根据不同的地理位置、气候条件、不同的市场，通过我们合作社经过试验示范的甜油桃新品种苗木，新技术调控，已初见成效，（被誉为火焰山的新疆吐鲁番地区，通过合作社的苗木和技术指导，产出了比我们本地品质还好的油桃、陕西延安老区果农感动的说“别说大棚桃，就是露地桃我们也没有见过，我们这也能生产大棚油桃了”......）大连油桃今年全国首次出口澳大利亚，千禧合作社被定为本次出口油桃的生产基地。油桃出口面临最大的难题就是如何解决桃不耐贮运的问题，除了做好全程冷链外，合作社积极与中科院郑州果科所合作，相继引进了SH肉质的新品种油桃,当澳方专家在基地里看到“中油20号”油桃时，经过一系列的检验、检测，兴奋的说：“大连油桃太好了、这个品种太好了.....”</p>
                        <p>下一步，合作社未来的发展思路是提供国内最新的甜油桃苗木品种、推荐使用符合国家标准的新技术、通过农产品的高端市场、电子商务及出口加大销售渠道，力争做到产品回收。统一品种、统一管理、统一营销，真正做好桃产业的产前、产中、产后全方位服务，让桃农在生产上无后顾之忧。</p>
                        <p>合作社现有生产基地，种植面积4万多亩，产量超过10万吨，上市期为4月至10月，通过贮藏鲜果可供应至元旦。产品已通过绿色食品产地和产品认证，以及富硒、SOD的产品认证。所注册的“千禧甜缘”、“甜八里”桃，现已远销到国内各大城市。北纬39°，造就了桃树生产得天独厚的地理环境，这里是桃树生长北限，海洋性气候和气候的温差，成就了果品的一流品质。合作社负责新品种的引进、试验示范和苗木推广，技术统一管理，果品统一销售。对外承揽大型园区规划、品种推介、技术调控、果品营销。健康、营养果品是我们的发展理念，不论是反季桃还是露地桃管理，不求最早最大，但求营养和健康。</p>
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