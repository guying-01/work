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
                    <p style="font-size:0.22rem;">大连稼钰实业有限公司坐落于风景秀丽的大连庄河市兰店乡。公司始于1994年，经二十多载风雨岁月中的行业耕耘，稼钰实业现已发展成为集农业生产资料供应、农业产业化种植、休闲观光农业发展与农副产品收购及精深加工、特色农产品品牌运作、生物科技研发与农业科技信息咨询服务于一体的现代化股份制农业企业。
					</p>
					<p style="font-size:0.22rem;">
                        大连稼钰实业有限公司旗下拥有大连稼钰农业科技开发服务有限公司、大连迈滋得生物科技有限公司、大连稼钰农业新技术开发有限公司、大连创意农业专业合作社、大连大当稼生物科技有限公司及上海镓钰农业科技发展有限公司6家子公司。其中大连稼钰农业科技开发服务有限公司在大连庄河市境内拥有15家分公司，278家分销网点经营农业投入品。稼钰实业农业技术力量雄厚，不仅组建了二十多人的农业专家团队，还专门聘请了庄河市农业技术推广中心权威高级农艺师作为公司的技术顾问和后盾，涵盖植保、土肥、果树、蔬菜、农业环保与检测、农业栽培等各方面，并与各大农资厂家结成技术联盟，搭建各种网络服务平台，全年、全程、全方位为广大农民定向解决农业生产问题，提供最新的农作物种植技术和标准化植保技术解决方案。
					</p>
					<p>
                        稼钰实业坚持“科技为本，服务为先”的企业精神，把“倾听百姓的心声，解决百姓的心事”作为公司的工作使命，专门为广大农户打造了一个“农民110稼钰网站” 和“大当稼”微信公众服务平台，开办“农业科技大讲堂”，定期聘请国内外农业专家，通过现场种植模拟、技术培训、互动答疑等方式为农户解决生产实际问题，从而很好地推进了公司“放心农资下乡，有机农产品进城”两条业务主线的发展，真正实现了农业增效农民增收。
					</p>
					<p>
                        在“创新、协调、绿色、开放、共享”发展理念指引下，公司不断探索农业产业化全产业链模式，现已形成了完整的上游生产资料供应、中游专业化种植、下游农产品收购、销售及农产品品牌创建与推广的专业纵向一体化农业模式，并与大连饭饭网络科技股份有限公司建立了战略合作关系，全力打造一乡一品农业产业工程，并成功注册了“大当稼”肥料品牌和“稼钰•农道”农产品品牌，不断为公司主线业务的发展提供了有力保障，同时解除了广大农户的后顾之忧，实现了农产品的利润最大化，率先为农业领域开辟出了一条全产业化运作的新模式。优质的农资产品，完善的售后服务、先驱式的培训指导、可靠的信誉口碑赢得了广大客户及农民朋友的一致好评，稼钰实业连续多年荣获国家工商总局、国家商标总局、辽宁省工商局、庄河市工商局、庄河市农发局、庄河市电视台等部门授予的农业行业“著名商标品牌”、“诚信经销商”，“优秀经销商”，“重合同守信誉单位”、“全国重质量守信用（品牌）单位”等荣誉称号，成为了大连农业行业的明星企业，老百姓的坚实后盾。
					</p>
					<p>
                        农业，自古以来就是个最质朴的行业，而如今在沸沸嚷嚷的农业炒作热潮中，如何能安静下来，为中国农业的发展做点点滴滴的思考和实事，让食品更安全，让环境更美好，将是稼钰实业永恒的追求。
					</p>
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
