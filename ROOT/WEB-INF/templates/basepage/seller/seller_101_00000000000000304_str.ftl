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
                    <div class="bp_txt">
                        <p>大连川连国际商贸有限公司成立于1996年，现有员工160余人。川连公司是大连地区最大的茅台、五粮液、洋河、红花郎、水井坊、泸州老窖封坛年份酒、张裕红酒的代理商。公司还代理了一千余种来自法国、澳大利亚、西班牙、智利、阿根廷等国家的名优红酒。公司分别在大连三八广场、万达华府、星海、华南、金州区、开发区、瓦房店市、庄河市开设了八家茅台•五粮液专卖店及红酒庄，现专卖店会员达30000余位。</p>
                        <p>川连公司自成立至今一直秉承“诚信经营、服务社会、创新发展、共享成果”的经营宗旨，严把进货关，坚持以货真价实的真品赢得消费者的信赖！川连公司连续多年被各大名酒厂评为模范专卖店、先进经销商，被辽宁省酒类协会评为放心酒示范店。</p>
                        <p style="width: 100%;margin: 5px auto;text-indent: 0;">
                            <img src="/resources/basepage/seller/img/101_00000000000000304_str/yx1.jpg" style="width: 100%;">
						</p>
                        <p style="font-weight: 600;">澳大利亚舒伯特酒庄</p>
                        <p>1838年，德国的舒伯特家族离开了故乡克莱姆齐，不远万里来到了南澳阿德莱德。1915年，舒伯特家族的后代开始种植葡萄、培育葡萄园，并将他们在巴罗萨谷所拥有的葡萄庄园命名为“舒伯特酒庄”（参考文献：Examiner Hooley Aust Gov.TM 1277627）。一个世纪以来，舒伯特酒庄为当地的葡萄酒产业作出了不朽的贡献，同时作为巴罗萨谷当地非常重要的选举区域，舒伯特酒庄在很长一段时间里被视为当地的地标性建筑。</p>
                        <p>最顶尖的葡萄酒永远取决于最优越的风土。舒伯特酒庄坐落在被称为“绝佳风土”的罗恩佛德路上，这里盛产澳洲巴罗萨谷最享誉盛名的设拉子红葡萄酒。罗恩佛德路作为顶级设拉子的摇篮，周边聚集的庄园有舒伯特酒庄、托布雷后裔酒庄、奔富酒庄、格林诺克酒庄与双掌酒庄等。</p>
                        <p>除了得天独厚的先天种植环境，精益求精的酿造理念也奠定了舒伯特葡萄酒的卓越品质。舒伯特酒庄庄主兼首席酿酒师史蒂夫舒伯特在 1980 年初，从叔叔奥瑟舒伯特手中继承了约 50 英亩的葡萄园，并把“专注酿造，专注精品”的酿造精神传承至今。为节省人工成本，很多酒庄选择机械化采摘压榨葡萄，而舒伯特酒庄却仍旧选择手工采摘、篮子压榨葡萄从而进一步提升葡萄酒的品质。</p>
                        <p>迄今为止，舒伯特酒庄的葡萄酒不仅在当地有数多支持者，也同样远销海外，得到了越来越多葡萄酒爱好者的拥护。</p>
                        <p style="width: 100%;margin: 5px auto;text-indent: 0;">
                            <img src="/resources/basepage/seller/img/101_00000000000000304_str/yx2.jpg" style="width: 100%;">
                        </p>
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