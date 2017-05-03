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
                        <p style="text-align: center;text-indent: 0;">一、商家介绍</p>
                        <p>大连顺祥牧业有限公司普兰店分公司和大连顺祥食品有限公司普兰店分公司是经大连市人民政府批准的肉鸡屠宰定点加工企业。位于普兰店市太平办事处工业园区柳家社区。隶属于大连顺祥牧业有限公司。是集肉鸡收购、屠宰、加工、冷冻冷藏、销售配送为一体的大型现代化食品企业。</p>
                        <p>大连顺祥牧业普兰店分公司成立于2014年5月。该公司拥有员工宿舍楼、办公楼、3间库房、员工食堂、锅炉房、一座污水处理站、制冷车间和大型生产车间、千吨冷库，共占地面积14000平，建筑面积11000平。公司日屠宰量达到6.5万羽。现有职工370余人，其中具有专业技术的管理人员50余人，其中具备大专以上学历人员30余人，本科学历员工15人。</p>
                        <p>大连顺祥食品普兰店分公司成立于2015年9月。该公司拥有大型生产车间、千吨冷库、两座污水处理站、员工宿舍楼、员工食堂、制冷车间等，共占地面积13500平方米，建筑面积一万平方米，公司日屠宰量达5万羽，现有职工270余人，其中具有专业技术管理人员40余人，其中具备大专以上学历人员20余人，本科学历人员8人。</p>
                        <p>总公司强大的自养小区和每年2000万羽的饲养量，极大的保障了普兰店两家分公司的屠宰量。普兰店分公司拥有一支实力非凡的销售团体，公司的每月销售业绩一直处于上升阶段。</p>
                        <p>为了赢得市场信誉、让全国人民吃上放心的鸡肉产品。公司致力于提高产品质量从而打造“三冠”、“亨鲜客”品牌肉鸡产品，产品销往全国各地，并与如双汇等大型企业进行合作。</p>
                        <p>公司在董事长曲顺祥的带领下，公司致力服务肉鸡食品全产业链安全和持续发展之道。以质量求生存，效率谋发展的宗旨将紧随时代发展的潮流，我们蓄势待发，把握历史机遇，愿与各界同仁携手并进、共谋发展，共同开创合作共赢的新篇章。</p>
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