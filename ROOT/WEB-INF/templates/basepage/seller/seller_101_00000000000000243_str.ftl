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
        <p>青岛九联集团股份有限公司位于青岛莱西市，是一个集种禽繁育、肉鸡养殖、饲料生产、善宰冷藏、熟食制品加工、印刷包装、出口贸易为一体的国家大型肉食鸡专业化一条龙生产企业，国家级农业产业化重点龙头企业。目前，青岛九联集团下辖100多个生产企业，总资产30.8亿元，员工10000余人。2014年完成销售收入75亿元，上缴税金4908万元，出口创汇2亿美元。</p>
        <p>九联集团秉承“为人类贡献安全健康食品，为员工幸福而不懈努力”的宗旨，始终坚持“肉鸡专业化生产不动摇、食品安全从源头抓起不动摇、走产品深加工道路不动摇”的原则，不断推进科技创新，狠抓产品质量源头控制和标准化建设，形成了以肉鸡养殖、鸡肉加工为核心配套完善的产业链。</p>
        <p>公司拥有父母代种鸡场21座，存栏肉种鸡120万套；孵化场1座，年孵化肉雏能力1.6亿只；饲料加工厂4座，年饲料加工能力75万吨。2001年开始引进国际先进的自动化养殖生产线，经过十余年的不懈努力在全国率先建成了国内规模最大、全封闭管理、与自属善宰厂完全配套的自养肉食鸡饲养基地。这一规模化、标准化、自养自宰的生产模式被各级政府部门命名为“九联模式”，并在全国进行推广，极大的推动了中国肉鸡业的快速发展。公司目前建有规模化、标准化养殖场95座、1000余栋鸡舍，年出栏商品肉鸡1.3亿只，是中国目前最大的现代化肉鸡养殖基地、出口备案基地和优质鸡肉原料供应基地。</p>
        <p>九联集团拥有肉鸡善宰加工厂3座，年善宰1.6亿只，生产鸡肉产品30万吨；鸡肉熟食制品加工厂5座，年加工熟食制品10万吨。公司不断加大设备投入，近年来已先后投资10亿元，引进国际先进的肉鸡善宰加工流水线和熟食加工流水线，是目</p>
        <p style="text-indent: 0;">前全球鸡肉加工设备最先进、国内鸡肉熟食制品加工能力最强、国内获得出口资格认证最多的企业。2014年，出口鸡肉产品5万吨，占全国对日、欧出口总量的近四分之一，并连续七年稳居全国首位。</p>
        <p> 多年来，九联集团始终秉承“为人类贡献安全健康食品”这一宗旨，先后获得过国家级农业产业化重点龙头企业、中国民营500强、中国民营制造业500强企业、中国白羽肉鸡20强、全国食品行业肉制品十强企业 、国际农产品（鸡肉）产业化创新示范基地、中国肉类食品强势企业、中国畜牧业先进企业、山东省质量诚信企业、山东省畜牧业发展最具影响力企业等荣誉称号。</p>
        <p>九联集团以良好的企业信誉和卓越的产品质量，赢得了国内外官方的高度认可，同时也赢得了国内外客户和消费者的高度青睐。公司获得了出口日本、欧盟、美国、加拿大、智利、俄罗斯、南非、阿联酋、韩国、马来西亚、蒙古等国家和地区的注册认证，并与以上国家和地区的客户建立了稳定的业务关系。国内销售网络已辐射一百多个大中城市，与铭基食品、河南双汇、烟台中宠、上海大江等国内优秀的快餐公司、食品加工企业、超市、高校以及苏食集团五百多家优质经销商建立了良好的业务合作关系。</p>
        <p> 从2011年起，集团公司将投资重点全部转向南方地区，2011年9月与广西钦州市委市政府签订20亿元的投资协议，计划用五年的时间打造一条与青岛九联同等规模的肉鸡产业链。2013年8月8日采用与广东富农合资的方式，共投资8亿元、首期2.68亿元，计划在广东兴宁成立九联富农养殖和三丰禽业两个公司。</p>
        <p>2015年1月19日，九联集团与广东富农生物科技有限公司合资创建的广东三丰禽业食品有限公司与广东九联富农禽业养殖有限公司隆重开业，这是九联集团发展史上最具有标志性的一件大事。他标志着九联集团正式在山东省外擎起了肉鸡生产的第一个龙头，九联集团沿海布局、沿江发展的战略布局开始结出第一枚硕果。</p>
        <p> 2015年5月19日，广西钦州九联正式投产，她是九联集团在省外独资建设的第一个一条龙肉鸡生产加工项目，九联集团将把钦州九联打造成中国最好的绿色肉鸡生产基地，打造成广西最大的农业产业化龙头企业，打造成钦州工业的旗帜、环保的旗帜、纳税的旗帜、就业的旗帜，以实际行动报答钦州人民的厚爱！</p>
        <p>广东九联、广西九联相继投产，标志着九联集团走出山东，向沿海布局、沿江发展战略迈出了坚实的一步。随着这两个公司的投产，公司将增加1000多个管理岗位。未来十到十五年，将属于九联集团黄金发展期，九联模式全面成熟，核心竞争力全面形成</p>
        <p>九联集团将进一步探索在肉鸡养殖、饲料加工、善宰冷藏、熟食品加工等方面的成功经验，计划在未来15年内在中西部地区，以青岛九联为依托，总投资300亿元，再建12个与目前青岛九联同等规模的九联，达到年善宰肉食鸡13-15亿只，完成年销售收入1000-1500亿元，实现税收10亿元，真正实现“为人类贡献安全健康食品”的庄严承诺！</p>
      
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
