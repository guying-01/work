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
                        <p>大连盐化集团是大连市属国有企业，原名大连复州湾盐场，始建于1848年，距今已有160多年的历史。集团公司地处海水制盐世界公认的北纬39度，占地面积145平方公里，拥有海盐线40公里，是全国四大海盐场之一。集团公司也是东北地区最大的海水制盐企业、唯一的海水化工生产企业、国内首家利用太阳能技术生产雪花盐的企业和国家食盐定点生产企业。</p>
                        <p>集团公司下设21个分子公司，从业人员近2000人。企业现已从最初单一的制盐场，发展成为以海盐生产为基础，以海水化工、海水养殖及盐田生物资源开发为重点，以开发海盐文化产业为引擎，以实现生产自动化、技术创新体系化、商业模式产业化和资本证券化为保证，以加快海水资源综合利用和一二三产业深度融合发展为特征，以实现海盐世界公园为方向的大型集团公司，经济效益处于全国同行业前列，跻身中国轻工业制盐行业十强。</p>
                        <p>2008年以来，集团公司不断推动了传统产业升级改造，打造产业结构调整升级版，按照国际先进的集中纳潮、集中制卤、集中结晶、集中管理的生产模式，完成了建国以来盐化史上最大规模的生产改造，形成了初级制卤——海水生物养殖——提溴——制盐——海水化工的完整产业链条，使晒盐用的海水浓度由低到高得到充分梯级开发利用，最终实现零排放</p>
                        <p>创新调整后，集团公司年生产海盐达70万吨，产品种类由单一的海盐发展到海盐、海水化工、海洋生物三个系列共30余种。 其中，“海湾牌”食用盐商标被国家工商总局认定为中国驰名商标；“海湾牌”加碘精制盐、加碘粉碎洗涤盐被中国绿色食品发展中心授予“绿色食品标志商标”使用权；“飞雪牌”白色氯化镁获国家产品银质奖。</p>
                        <p>与此同时，浮吸式自动收盐机、联合装盐机、大塑塑料收放自动化装置等一系列自主创新的新技术、新设备得到推广使用。其中，“大塑浮卷自动收放装置” 创新项目，获三项国家实用新型专利，并在2013年第八届海峡两岸职工创新成果展上获得银奖。</p>
                        <p>强企不忘惠民。从2009年起，企业的员工收入保证每年增幅10%以上；职工食堂伙食保证每年500万元投入；海盐班组实现“星级”管理，加强了小菜园建设，其环境建设每年上一个新台阶；员工免费体检、免费培训坚持常态化。</p>
                        <p>在经济新常态下，企业发展态势向好。集团公司正按照生产自动化、技术创新体系化、商业模式产业化、资产证券化的高远要求，加强中外合作，引进高级智库，打造转型升级新引擎，开发海盐文化产业新领域，发展海盐文化旅游支柱产业，建设海盐文化观光体验带、“浓海水”康体度假基地和海盐系列健康产品生产基地，利用三到五年时间，努力使企业步入同行业国内国际先进行列，圆百年国企“盐化梦”。</p>
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