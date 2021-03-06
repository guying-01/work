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
        <p>大连喜鹤食品有限公司成立于2013年，位于辽宁省大连市金州区，从事猪肉销售和千喜鹤与双汇的代理销售等业务。</p>
				<p>公司成立以来，依靠艰苦创业、诚信为本、开拓创新的精神，先后通过了ISO9001质量管理体系认证和ISO22000食品安全管理体系认证，生产经营良好。产品主要销往东北市场，并与各大超市建立了长期合作关系，形成了稳健的销售市场渠道。</p>
				<p>喜鹤的全体成员，期待用真诚，架起你我沟通的友谊桥梁，以天然的生态环境，丰富的肉类资源，优异的产品品质，与海内外朋友事业同创、成就共享！</p>
				<p>千喜鹤股份有限公司成立于1993年，总部设在北京市海淀区，经营范围涉及后勤社会化保障、团餐、百牌快餐、餐饮咨询、便利店、肉食品工业、商业地产、互联网金融、粮油果品贸易、物流配送、职业技术教育等多个领域，下属20多个全资子公司，员工8万余人，资产规模97亿元。2015年千喜鹤收入169亿元，其中团餐收入77亿元，生猪屠宰、肉制品、种植养殖收入54亿元，粮油果品贸易等收入38亿元。</p>
				<p>千喜鹤股份有限公司是“北京市2008年奥运会冷鲜猪肉及猪肉制品独家供应商”、“中国人民解放军饮食社会化保障龙头企业”、“中国团餐第一品牌”、“中南海指定冷鲜肉供应商”，2011年度被评为“中国团餐第一名”，2012和2013年蝉联“中国餐饮百强第五名”、“中国团餐第一名”，2015年荣获“2014年度中国餐饮百强第二名”、“2014年度中国团餐第一名”、“2014年度中国餐饮业十大品牌”、“2014年度中国十大团餐品牌”等荣誉称号。</p>
				<p>目前千喜鹤股份有限公司已在北京、天津、上海、江苏、广东、重庆、四川、河北、河南、山东、山西、安徽、陕西、吉林、辽宁、黑龙江、内蒙古、云南、贵州、甘肃、湖北、湖南、江西、浙江、福建、广西等30多个省、直辖市、自治区设立了200余个管理区，承担了全国3/4的军事院校、3/5的武警院校和1500余家大型企业、地方院校、政府机关及医院等400多万人一日三餐的饮食社会化保障工作。</p>
				<p>双汇集团是中国最大的肉类加工基地。双汇集团始终坚持围绕“农”字做文章，围绕肉类加工上项目，实施产业化经营。以屠宰和肉类加工业为核心，向上游发展饲料业和养殖业，向下游发展包装业、物流配送、商业、外贸等，形成了主业突出、行业配套的产业群，推动了企业持续快速发展：80年代中期，企业年销售收入不足1000万元，1990年突破1亿元，2013年达到472亿元，年均复合增长率30%以上。</p>
				<p>双汇集团实施六大区域的发展战略，立足河南、面向全国在黑龙江、辽宁、内蒙古、河北、山东、江苏、浙江、湖北、河南、江西、四川、广东、安徽、广西、上海等18个省市建设了20多家现代化肉类加工基地，在31个省市建有300多个销售分公司和现代化的物流配送中心，在美国、西班牙、日本、韩国、香港、新加坡、菲律宾等建立有办事机构，形成了纵横全国、辐射海外的生产销售网络，使双汇产品走出河南、遍布全国、走向世界。</p>
				<p>双汇集团坚持引进先进的技术和设备，改造传统肉类工业。先后投入40多亿元，从欧美等发达国家引进先进的技术设备4000多台/套，通过消化、吸收和再创新，实现技术与国际接轨。双汇集团率先把冷鲜肉引入国内，实行“冷链生产、冷链销售、冷链配送、连锁经营”，实现了肉类的品牌化经营，结束了中国卖肉没有品牌的历史，开创了中国肉类品牌。</p>
				<p>双汇集团坚持技术创新，建立了国家级的技术中心、博士后工作站，培育了600多人的产品研发队伍，围绕中式产品的改造、西式产品的引进、屠宰行业的精深加工，做出了1000多种的产品群，满足不同层次的消费需求，双汇肉制品、双汇冷鲜肉均是“中国名牌”产品，已成为广大消费者一日三餐首选的肉类品牌。</p>
				<p>双汇把诚信体系建设与企业的发展愿景、管理文化有机结合起来，确立了“开创中国肉类品牌，促进中国肉类产业升级”的企业使命；制定了“消费者的安全与健康高于一切，双汇品牌形象与信誉高于一切”的质量方针；形成了“诚信立企，德行天下”的企业文化；实现了企业的生产经营管理与诚信体系建设的高度统一。</p>
				<p>双汇集团秉承“产品质量无小事，食品安全大如天”的质量理念，铁腕抓质量，铁心保安全，把国际先进的ISO9001、HACCP、ISO22000、ISO14000等管理体系和信息化技术应用到供、产、存、运、销等各环节，不断完善质量和食品安全内控体系，严把采购、生产、销售关，实行进厂原料批批检验、生猪在线头头检测、出厂产品批批检查，开放式办工厂、透明化办企业，自觉接受消费者、媒体、政府等社会各界的监督，赢得了消费者的信赖。 </p>
				<p>双汇集团经过30年的发展，做大了产业、做优了产品、做响了品牌，在传统的肉类工业中走出了一条新型的工业化道路。双汇每年消化2000万头生猪、70万吨鸡肉、7万吨植物蛋白，年转化粮食1000多万吨，带动170多万人从事与双汇相关的种植、养殖及原料采购、产品销售，年增加农业产值600多亿元,增加社会各类人员收入100多亿元，为地方经济和中国肉类行业做出了突出贡献。</p>
				<p>2013年9月26日，双汇控股母公司万洲国际成功并购美国最大的猪肉加工企业——史密斯菲尔德公司，成为拥有100多家子公司、12万名员工、生产基地遍布欧美亚三大洲十几个国家的全球最大的猪肉加工企业，使双汇品牌走出了国门，迈向了世界。</p>
				<p>2014年8月5日9时30分，香港联交所，万洲国际董事局主席万隆敲响开市的锣声，宣告万洲国际成功上市。</p>
				<p>2015年发挥中美协同效应，郑州美式工厂建成投产，生产纯正美国味的Smithfield美式香肠、美式培根、美式火腿。</p>
				<p>2016年6月双汇集团财务公司成立，产融结合助推实业发展；7月20日《财富》世界500强榜单发布，万洲国际首度登榜，以全年营收212亿排495位。</p>
				<p>未来的双汇，将充分利用国内外两种资源，两个市场，实现优势互补，协同效应，推动质量、技术、管理、市场与国际接轨，努力打造卓越品牌、世界名牌，为全球消费者提供更加安全放心的产品，为世界肉类行业做出更大的贡献。</p>
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
