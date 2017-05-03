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
                        <p>大连东扬海产有限公司成立于1994年，位于金州龙王庙海滨，占地面积3.5万平方米。注册资金3329万元，固定资产投入3亿多，拥有员工500多名，是一家集冷冻、冷藏、加工、国内外贸易为一体的综合性实业公司，冷冻、冷藏能力达2万吨。公司经营广泛，主要有鱿鱼系列产品、鱼类、贝类、海鲜礼盒、烧烤礼盒及新西兰进口牛羊肉等，产品畅销日本、欧盟、美洲、东南亚及国内市场，注册商标“东扬”产品在国内外享有广泛赞誉。</p>
                        <p>公司拥有国内外一流生产设备，有经验丰富、技术精湛的食品检测、产品开发人员数十人，为产品质量提供了强有力的技术保障。公司率先通过国家检验检疫局出口卫生注册、ISO22000质量管理体系、HACCP食品安全管理体系、SC食品安全市场准入、BRC食品安全管理体系认证、IFS国际食品标准及中国CIQ、美国FDA、欧盟EU（2100/02442）等官方注册；通过以上食品安全管理体系的有效运行，为打造出绿色、卫生、健康、营养美味的食品奠定坚实的基础。</p>
                        <p>2005年在朝鲜境内成立“朝鲜东扬-罗先启盛加工贸易会社”，占地面积2万平方米，投资1000万美元，固定资产投入2亿多，冷库储存量5000吨，拥有员工800多名，主要加工朝鲜无污染的鱿鱼系列产品、鳕鱼、三文鱼、帝王蟹、鳕蟹等。</p>
                        <p>2010年在吉林省珲春市成立“珲春东扬实业有限公司”，占地面积15万平方米，注册资金5000万元，固定资产投入5亿多，冷库储存量达4万吨，拥有员工1000多名，成为目前吉林省唯一的保税冷库，主要加工生产北太平洋狭鳕、真鳕、三文鱼、鲽鱼、鱿鱼等系列产品。</p>
                        <p>2016年在俄罗斯海参崴成立“海参崴东联责任有限公司”，在海参崴港口收购海产品初加工企业。</p>
                        <p>“质量是东扬人的品格和自尊”，东扬人立志以二十年出口食材的品质为国内消费者提供绿色、原始、自然、健康、放心的营养食品。</p>
                        <p>公司已经在大连及东北地区建立区域代理商，公司拟在全国范围甄选代理商。欢迎有志之士抓住机遇，与东扬共创辉煌。</p>
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