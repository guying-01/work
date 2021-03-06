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
                    <p>大连凯隆食品有限公司坐落于依山傍水、风景秀丽、气候宜人的瓦房店九龙办事处。南距大连60公里，北抵营口鲅鱼圈80公里，东距“轴承之都”瓦房店市20公里，西临旅游胜地长兴岛20公里，交通十分便利。</p>
					<p>公司成立于2007年，位于大连市瓦房店市九龙街道杨沟村，主要从事肉种鸡饲养与繁育、肉鸡孵化、肉鸡饲养与放养、售后服务、饲料加工、毛鸡收购与屠宰加工等。2016年度实现销售收入48107万元、工业成本费用利润率8.7%。公司本着“守信誉、树品牌、抓管理、重防疫、促环保、争第一”的发展理念，以质量求生存。通过了ISO9001：2008质量认证和HACCP食品安全体系、QS生产许可体系认证。于2016年通过了“无公害农产品产地”认证和“无公害农产品”认证，被并评为农业产业化国家重点龙头企业，为该企业的后续发展奠定了坚实的基础。</p>
					<p>一、生产加工情况</p>
					<p>公司坚持规模化、集约化、标准化和生态科技化经营，加快肉鸡标准化健康养殖基地建设，为广大养殖户提供优质健康鸡雏。目前，公司已在瓦房店市九龙办事处建成标准化种鸡孵化场615亩，引进美国爱维因、科宝种鸡30万套，年产种蛋3000万枚。采用全自动化孵化设备80台套，实现自动化流水线孵化生产，年孵化鸡雏2400万只，成本比外采的降低25%左右。同时公司投资4000万元，在瓦房店市泡崖乡建成一座肉鸡养殖标配饲料厂，年产优质饲料30万吨；投资1.5亿元，在瓦房店市九龙办事处建成全国先进的肉鸡屠宰加工厂。2015年，公司投资2000万元，引进荷兰梅恩公司的全新肉鸡自动掏膛、分割和剔骨自动化生产线，其中“胸肉剔骨机M3.0”设备为亚洲第一台，实现了掏膛、剔骨、分割全部自动化，屠宰能力由原来的5万只/天跃升到12万只/天，有效地提升产品加工质量和加工效率。</p>
					<p>二、产品开发情况</p>
					<p>公司坚持市场导向和技术引领，积极做好产品研发和市场开拓。公司现有职工780人，有2个博士专家团队。具有高等职业技术职称技术人员60人，外聘高级管理人员20人，具有 10年以上肉鸡饲养加工经验员工210人。先后与国际肉类组织、中国农业大学、中国农科院、大连理工大学、墨尔本大学、日本晃伸株式会社和韩国嘉泉大学建立长期技术合作关系，定期前往企业做好技术指导和产品研发。目前，公司已经开发冻、鲜两大系列产品100多个，被辽宁省清真协会认定为“清真食品”。公司在北京、上海、沈阳等重要城市设立120个专营机构，美食厂的深加工产品“骨肉相连”、“川香鸡柳”、“凯隆肉丸”、“凯隆腿排”等产品已经占据沃尔玛、家乐福、华联超市、欧尚等各大超市专柜。公司已经成为河南双汇集团、北京柏慧燕都、江苏雨润集团等著名食品企业的战略合作伙伴。奥尔良鸡肉串等产品受到广大消费者青睐，成为大连啤酒节等重大节庆活动的指定供应产品，正在研发“御笼包”新产品，即将投放市场。公司积极开发调理品网上销售渠道，产品在淘宝、微店、苏宁易购开展网上直销。同时，积极开发国际市场，市场占有率稳步提高。“凯利成”牌系列产品成为百姓信赖食品，获得辽宁省著名商标、大连市名牌产品等多个荣誉，为企业持续发展奠定了坚实的基础。</p>
                    <img src="${resources}//basepage/seller/img/${storeId!''}/img01.jpg" style="width: 100%" />
					<p>三、质量安全管理情况</p>
					<p>公司坚持以质量促发展，始终把农产品质量安全作为企业生存的关键环节。创建了比较完善的质量控制和追溯体系。在肉鸡鸡雏饲养中，积极做好疫病防控工作，做好饲料和饮水标准化管理，采用国际先进的内环境和外环境生态化控制技术，从源头上保障肉鸡健康安全。同时，认真做好养殖户标准化管理，实现饲料投放、疫病防控等养殖管理规范化，有效防治重大动物疫病的发生。公司自成立以来，始终按照大连市和瓦房店市农业部门要求，认真组织农户做好每个环节监管，从没发生过重大动物疫情和食品质量安全事故。同时，公司高度重视质量安全体系认证工作，先后通过国际ISO9001:2000质量认证和HACCP食品安全体系认证、QS生产许可证，成为瓦房店市“信得过企业”和“五十强企业”。2015年，通过出口食品生产企业备案证明审查，成功获得了农产品出口经营权。</p>
					<p>四、带动农户情况</p>
					<p>公司始终坚持产业化经营方向，积极推行“公司+合作社+基地+农户”，通过“赊销+回购”带动养殖户共同致富。公司在创建自有养殖场的同时，积极引导农民发展肉鸡养殖合作社，在公司带动下成立了大连久隆肉鸡养殖专业合作社。现有社员400户，辐射带动大连市发展肉鸡专业养殖户6000多户。合作社与养户签订常年的毛鸡饲养合同，免费为养殖户提供鸡雏，同时赊销养户饲料款，有效地调动了养殖户生产积极性，促进肉鸡养殖业健康稳步发展。同时，公司和合作社开展送技术到户活动，建立兽医日巡查制度，安排兽医专业技术人员做好免费技术服务，解决养殖户生产中出现的技术问题。积极发展订单生产，合同约定给予养殖户利润保底价，不论市场价格如何波动，企业都按每只3元利润保底价收购，为广大养殖农户吃下“定心丸”。公司每月定期开一次养户交流会，公司管理层定期下乡巡查，准确获取肉鸡养殖市场发展深度分析研究，通过开展走访养殖户调查，及时调整放养政策，保证农民收益不减。通过订单生产，养殖户实现年收入10万元，增加农民收入6亿元。</p>
                    <img src="${resources}//basepage/seller/img/${storeId!''}/img02.jpg" style="width: 100%" />
					<p>五、企业销售产值情况</p>
					<p>企业从事养殖孵化业务已经近20年，基本形成从育种、孵化、放养、屠宰、加工的全产业链。特别是近年来，公司通过对厂房、车间进行改扩建，产能稳步扩大，收入规模增量明显。2016年达到4.8亿元。</p>
					<p>六、企业未来发展展望</p>
					<p>公司计划在2017年上半年进入集团化发展，引入产业金融，建设生态食品产品平台。</p>
					<p>1.做中国生态肉鸡食品产业的第一领跑者。</p>
					<p>2.整合资源（产业金融+互联网+人才+科技），用科技应用和全生态软实力创新发展，铸就凯隆品牌。</p>
					<p>3.做生态肉鸡食品产业平台生态系统，打造凯隆全生态安全食材和食品品牌。</p>
					<p>“十三五”时期，公司将立足大连、面向东北、辐射全国，积极做好肉鸡产业发展，争取把公司打造成为东北地区最大的肉鸡专业化加工企业。实现年生产加工肉鸡6000万只，实现销售收入15亿元，带动农户2万户，实现农民增收20亿元。</p>
					<p>一是扩大企业加工能力。公司借助进口设备自动化效率高，再增加两条生产线，扩大规模，生产加工能力不断上升，通过优化产品结构，调整生产工艺，缩短白羽鸡从入厂到分割产品投放市场时间，借助物流配送保鲜保质送到消费者手中，既降低生产成本，又受到消费者欢迎，从而使公司获取更多收益。</p>
					<p>二是加快养殖基地建设。公司大力发展养户进行养殖基地建设，主推“笼养”。对农民进行资金支援，通过垫付设备款、赊销鸡雏、赊销饲料款、兽医到位，把关农民新建鸡舍的地理位置、朝向、间距、饲料存放地点、包括引用水质等公司即将做统一规定，就是为了整体提升养殖肉鸡小区的基础建设，实现商品肉鸡饲养的良性循环，保证养殖户的根本利益。</p>
					<p>三是推行标准化服务。公司提出“守信誉、树品牌、抓管理、重防疫、助环保、争第一”的经营理念，在管理上实行“七个统一”即种鸡统一管理、种蛋统一挑选、统一供应雏鸡、统一使用药物、统一供应饲料、统一消毒防疫、统一收购屠宰。全程兽医跟踪到户，设置兽医GPS定位，落实每天到养户服务过程，公司设置兽医手机终端的OA上线，及时解决养户问题。</p>
					<p>四是开发国内国际市场。公司国内市场成熟，将继续和金锣、双汇、雨润等知名公司合作，同时寻求与麦当劳、肯德基的直供业务。公司计划未来三年与正大集团联手，扩展市场，调整产品结构，大力创新，研发新产品，目前已经与俄罗斯、香港客户签订出口订单合同，计划三年出口创汇2000万美元。销售方向从国内逐渐向出口转化，计划出口销售额占总销售额70%以上，产品辐射港澳台、亚洲以及欧美等国家。</p>
                    <img src="${resources}//basepage/seller/img/${storeId!''}/img03.jpg" style="width: 100%" />
					<p>公司拥有先进的企业文化，采用先进的管理模式，平台上管理和发展布局。</p>
					<p>（一）凯隆事业的愿景和使命</p>
					<p>愿景：创建引领世界生态科技食品发展的一流产业平台。</p>
					<p>使命：肩负用科技创新和管理创新发展生态科技食品的伟大使命。</p>
					<p>（二）凯隆事业的目标、战略和商业模式</p>
					<p>目标：做世界生态科技食品产业的第一领跑者。</p>
					<p>战略：整合全球金融、互联网、人才、技术等发展资源，用科技应用和管理创新驱动企业发展，铸就凯隆世界品牌。</p>
					<p>商业模式：做生态科技食品产业平台生态系统，开发凯隆生态安全食材和生态安全食品。</p>
					<p>（三）凯隆事业的核心能力</p>
					<p>（1）科技创新</p>
					<p>科技创新是凯隆事业发展的源泉。</p>
					<p>建立强大的科研队伍，创造优良的科研条件，全球范围内整合科技资源，创造凯隆事业无限多的自主知识产权。</p>
					<p>（2）管理创新</p>
					<p>每一次成功的管理创新，就是凯隆事业前进一部的标志，不断的管理创新，才能带来企业的不断发展，管理创新的前提是提高企业的综合经济效益。</p>
					<p>（3）质量第一</p>
					<p>产品质量是所有工作的基础，质量第一主导一切工作。</p>
					<p>产品质量是凯隆人品质和尊严的体现。</p>
					<p>视产品质量如生命是凯隆员工的工作基本理念。</p>
					<p>（4）凯隆文化是我们凯隆事业发展的制胜法宝。</p>
					<p>凯隆文化引领世界生态科技食品行业的发展，引领凯隆事业走向成功，是凯隆事业的灵魂，是凯隆人快乐创业的力量源泉，传播凯隆文化是每一个凯隆人神圣的职责。</p>
					<p>（四）凯隆生态科技食品产业平台管理机制如图所示：</p>
					<img src="${resources}//basepage/seller/img/${storeId!''}/img04.jpg" style="width: 100%" />
					<p>凯隆生态科技食品产业平台不断创新，为广大消费者提供科技生态安全食材和食品，凯隆生态食品，营养千万家！</p>
					<p style="text-align: right">大连凯隆食品有限公司</p>
					<p style="text-align: right">2017年3月</p>
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