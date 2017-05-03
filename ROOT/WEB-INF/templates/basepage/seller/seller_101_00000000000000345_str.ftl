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
                        <p>双升品牌猪肉是大连佳慧生态畜牧养殖有限公司自有农场生产的，公司农场2012年被大连市农委认定为无公害农产品产地，2016年公司生产的双升牌猪肉分别被评为辽宁省著名农产品、大连市著名农产品。</p>
                        <p>公司成立伊始便本着高起点，高标准，高环保的要求，设有高标准的防疫隔离带和消毒区，聘请畜牧兽医专业人员对整个生产过程进行监控和管理。实现了疫病少，饲料省，低成本，高产出，低排放，零污染，高环保的生态养殖模式。猪舍全部设有地下水恒定室温系统和音乐助养系统，对猪只的环境改善和健康起到非常积极的作用。同时公司还引进了猪的自动饲喂系统，进一步增加的养猪福利。</p>
                        <p>生产区域建设有妊娠母猪舍，母猪产房，仔猪保育舍，育肥（育成）舍及饲料生产车间。公司初期引进了大白，长白，杜洛克等优良品种。后备母猪于七个半月到八个半月约270斤左右进行配种，妊娠期约为113—115天，待产母猪于预产期前一个月转入产房进行短期优饲。母猪产仔后28天仔猪断奶，母猪转入妊娠舍待5-7天后发情配种，仔猪转入保育舍饲养。仔猪在保育舍饲养一个月后转入育肥舍饲养，转入育肥舍后约四个半月至五个月出栏体重约为110-140公斤。所有猪只在饲养期间全部按照国家规定的免疫程序进行免疫接种，并执行严格的消毒程序确保无疫病或少疫病。</p>
                        <p>饲料的加工生产严格按照国家标准GB17078的规定和《饲料药物添加剂使用规范》操作。饲料的主要原料玉米由本公司的专用卡车和人员到农户直接进行采购，以确保原料的质量。饲料中不添加任何抗生素等药物，保证了出栏生猪绝对无任何药物残留。猪只的饮用水取至于地下120米的深井水，经多层过滤和沉淀后饮用。养殖场被认定为大连市无公害农产品产地，认定证书已颁发。</p>
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