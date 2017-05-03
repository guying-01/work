<#include "/common/common_var_definds.ftl" />
<#import "/common/fields/field_page_tracker.ftl" as field_page_tracker />
<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
<title>饭饭在线 | ${title!''}</title>
    <link rel="shortcut icon" href="${resources}/basepage/store/default/common_img/favicon.ico"/>
    <link rel="bookmark" href="${resources}/basepage/store/default/common_img/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="${resources}/css/common/lib.css" />
<link rel="stylesheet" type="text/css" href="${resources}/css/help/help.css" />
<link rel="stylesheet" type="text/css" href="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.css" />
<script src="${resources}/js/lib/jquery/jquery-1.8.3.js"></script>
<script src="${resources}/js/lib/handlebars/handlebars-v2.0.0.js"></script>
<script src="${resources}/js/lib/pubsub/tiny-pubsub.js"></script>
<script src="${resources}/js/common/top_toolbar.js"></script>
<script src="${resources}/js/common/pager.js"></script>
<script src="${resources}/js/common/tool.js"></script>
<script src="${resources}/js/common/common.js"></script>
<script src="${resources}/js/common/help_center.js"></script>
<script src="${resources}/js/common/footer.js"></script>
    <!--[if lt IE 9]>
    <script src="/resources/js/lib/html5/es5-shim.min.js"></script>
    <script  type="text/javascript" src="/resources/js/lib/html5/html5shiv.min.js"></script>
    <![endif]-->
<script type="text/javascript">
$(document).ready(function () {
	 $(".lev_A").click(function(){
		 $(this).parent().children(".level2").slideDown();
		 $(this).parent().siblings().children(".level2").slideUp();
	 })
//	 var pageId = $('#pageId').val();
//	 document.title = $('#'+pageId).text();
 }) 
</script>
</head>
<body>
<#include "/common/fields/field_common_nav.ftl" />
<div class="header">
  <div class="wrapper">
    <h1 class="left"><a href="/"><img src="${resources}/img/common/logo.png" /></a>&nbsp;&nbsp;&nbsp;<p class="right" style="font-size:35px;font-weight:500;">| ${title!''}</p></h1>
  </div>
  <div class="help-nav">
    <div class=" wrapper">
      <ul>
        <li><a href="/index.jhtml">首页</a></li>
        <li><a href="/help/toHelpCenter.jhtml" class="help-navfoc">帮助中心</a></li>
      </ul>
    </div>
  </div>
</div>  
  <div class=" wrapper">
  <div class="content-left">
	  <ul class="leftsidebar">
		  <#if categoryList?? && categoryList?size gt 0>
			  <#list categoryList as category>
				  <li><a href="javascript:void(0);" class="lev_A">${category.name!''}</a>
					  <ul class="level2" <#if contentForm.categoryId == category.id >style="display:block;"</#if>>
						  <#if category.contentList?? && category.contentList?size gt 0>
							  <#list category.contentList as content>
								  <li><a id="faq" href="/help/toHelpCenter.jhtml?id=${content.id!''}" contentId="${content.id!''}" class="find_content_detail <#if contentForm.id == content.id>leftsidebar_foc</#if>">${content.name!''}</a></li>
							  </#list>
						  </#if>
					  </ul>
				  </li>
			  </#list>
		  </#if>
	  </ul>
  </div>
  <div class="content-right helpcontent">
      <h2 id="content_name">${contentForm.name!''}</h2>
      <div class="help_article help_article_no_padding">
          ${contentForm.content!''}
      </div>
  </div>
  <div class="clear"></div>
<#--
 <div class="content-right helpcontent">
	<#switch pageId>
	  <#case 'faq'>
		<h2>常见问题</h2>
		<div class="help_article">
		  <p>1、如何取消订单？</p>
		  <p>订单生成后，商家未发货，您可以自行取消订单。</p>
		  <p>2、如何验明商品的真伪？</p>
		  <p>可以通过食品药品监督管理局的官网查询商品的真伪。</p>
		</div>
		<#break>
	  <#case 'shoppingProcess'>
		<h2>购物流程</h2>
		<div class="help_article">
		  <p>1、注册登录。</p>
		  <p>2、选择商品。</p>
		  <p>3、商品加入购物车。</p>
		  <p>4、填写收货信息。</p>
		  <p>5、支付信息。</p>
		  <p>6、提交订单。</p>
		</div>
		<#break>
	  <#case 'orderState'>
			<h2>订单状态</h2>
			<div class="help_article">
			  <p>1、订单未付款。</p>
			  <p>2、订单待发货。</p>
			  <p>3、订单已发货。</p>
			  <p>4、交易完成。</p>
			  <p>5、交易取消。</p>
			</div>
	  <#break>
	  <#case 'commercialInvoice'>
		   <h2>商品发票</h2>
			<div class="help_article">
			  <p>开票须知</p>
			  <p>1、如您需要开具发票，请与商家沟通并详细填写开具发票所需的资料。</p>
			  <p>2、发票金额即订单交易成交金额（不含运费、礼金券、红包等费用金额），赠品不开具发票。</p>
			  <p>3、发票抬头内容不能为空，您应根据实际情况选择填写个人或公司名称。</p>
			  <p>4、发票内容即是您所订购商品的具体信息。</p>
			</div>
	  <#break>
	  <#case 'distributor'>
		<h2>配送服务</h2>
		<div class="help_article">
		  <p>配送服务分为商家配送和消费者自提两种方式。</p>
		  <p>注意事项：</p>
		  <p>1、如遇交通管制、大雨雪、洪涝、冰灾、地震、节假日、周年庆、停电等因素，以及部分特殊订单类型等，可能会造成延迟，请谅解。</p>
		  <p>2、所有自提服务均为免运费服务，特殊情况及部分特殊订单不支持本服务。</p>
		  <p>3、会员自提需要在线上付款。</p>
		</div>
	  <#break>
	  <#case 'onlinePayment'>
		<h2>网上支付</h2>
		<div class="help_article">
		  <p>第三方支付、银行支付等方式。</p>
		</div>
	  <#break>
	  <#case 'pointsPayment'>
		<h2>积分支付</h2>
		<div class="help_article">
		  <p>1、消费者获取的积分可以在平台支付订单时抵扣一定的订单金额，积分与抵扣现金金额兑换比例为：200：1。</p>
		  <p>2、消费者获取的积分还可以在平台积分兑换专区换取特定商品。</p>
		  <p>3、积分有效期至少1年，即从获得积分开始至次年年底（以公历纪年、北京时间为准），逾期积分将会自动作废。</p>
		  <p>4、消费者使用积分支付的订单发生退款时，积分也会退回。</p>
		  <p>5、积分不直接兑换现金，不兑换运费。</p>
		</div>
	  <#break>
	  <#case 'preferentialPayment'>
	  <h2>优惠券支付</h2>
		<div class="help_article">
	   <p>1、消费者在购买商品时可以按照优惠券上的使用方法和使用条件抵扣一定的订单金额。</p>
		  <p>2、优惠券面值固定，只能单张使用，不能拆分使用。</p>
		  <p>3、优惠券具有有效期，超过有效期的优惠券将自动作废。</p>
		  <p>4、消费者使用优惠券支付的订单发生退款时，将只获得交易中实际支付的金额，优惠券不予退回。</p>
		  <p>5、优惠券不直接兑换现金，不兑换运费。</p>
		</div>
	  <#break>
	  <#case 'bonusPayment'>
		 <h2>红包支付</h2>
		<div class="help_article">
		  <p>1、消费者在购买商品时可以按照红包上的使用方法和使用条件抵扣一定的订单金额。</p>
		  <p>2、红包在平台范围内通用。</p>
		  <p>3、红包长期有效。</p>
		  <p>4、消费者使用红包支付的订单发生退款时，将只获得交易中实际支付的金额，红包不予退回。</p>
		  <p>5、红包可直接兑换现金。</p>
		</div>
	  <#break>
	  <#case 'contactCustomer'>
		  <h2>联系客服</h2>
			<div class="help_article">
			  <p>1、在线客服。</p>
			  <p>2、客服电话。</p>
			</div>
	  <#break>
	  <#case 'inspectionReceipt'>
		 <h2>验货签收</h2>
		<div class="help_article">
		  <p>为了保障您的权益，请您在收到商品时，仔细检查核对商品名称、种类、数量、规格、赠品等是否与订单一致，检查商品包装是否有破损、是否存在表面质量问题，是否在保质期内，如准确无误后再进行签收。如有问题请您当场指出并做拒收处理，有个别物流公司要求先行签收方可打开包装箱的，请您检查商品外包装，如有破损，请在发货单上注明。如您已打开外包装则视为您认可商品无破损，但商品短缺、错误或存在质量问题的除外。</p>
		</div>
	  <#break>
	  <#case 'refundInstructions'>
		<h2>退款说明</h2>
		<div class="help_article">
		  <p>1、如您需要退款，请联系商家或者平台客服进行退款申请。</p>
		  <p>2、若您与商家对退款问题无法达成一致，请联系平台客户协助解决。</p>
		  <p>3、若您与商家对退款问题达成一致的情况下，退款会在商家收到退货并确认无误后的5天内将退款原路返回到您的账户上。</p>
		</div>
	  <#break>
	  <#case 'complaintRights'>
		<h2>投诉维权</h2>
		<div class="help_article">
		  <p>1、平台有专业的药师服务团队为您解答在购物过程中的疑问。</p>
		  <p>2、如您在商品使用过程中发现商品存在质量问题请立即向平台客服反馈信息，信息内容包括商品名称、生产厂商、生产批号、销售单位、您的姓名、地址及联系方式、商品质量问题等详细情况。平台将协同销售商家对您反映的问题进行调查确认并指导您采取相应措施避免给您的人身、财产造成损害。</p>
		</div>
	  <#break>
	  <#case 'investmentObject'>
		   <h2>招商对象</h2>
			<div class="help_article">
			 <p>1、零售连锁药店。</p>
			  <p>2、医疗器械、化妆品、食品、保健食品生产或经营企业。</p>
			</div>
	  <#break>
	  <#case 'settledProcess'>
		  <h2>入驻流程</h2>
		<div class="help_article">
		  <p>1、商家资质审核。</p>
		  <p>2、与平台签定合作协议。</p>
		  <p>3、在平台上建设网上店铺。</p>
		  <p>4、发布商品，在线交易。</p>
		</div>
	  <#break>
	  <#case 'qualificationMaterials'>
		<h2>资质材料</h2>
		<div class="help_article">
		  <p>商家申请成为平台的卖方会员需向平台提供下述加盖企业公章原印章的电子版及纸质版复印件材料。</p>
		  <table width="100%" border="0">
			<tbody><tr>
			  <th width="40%">经营品类</th>
			  <th width="60%">资质清单</th>
			</tr>
			<tr>
			  <td rowspan="9"><span>药品</span></td>
			  <td>1、企业营业执照（副本）</td>
			</tr>
			<tr>
			  <td>2、组织机构代码证（副本）</td>
			</tr>
			<tr>
			  <td>3、税务登记证（副本）</td>
			</tr>
			<tr>
			  <td>4、药品经营许可证（副本）</td>
			</tr>
			<tr>
			  <td>5、GSP认证证书</td>
			</tr>
			<tr>
			  <td>6、可向个人消费者销售药品的互联网药品交易服务资格证明</td>
			</tr>
			<tr>
			  <td>7、与平台签订的协议</td>
			</tr>
			<tr>
			  <td>8、指定账户公函（银行账号或者第三方支付账号信息）</td>
			</tr>
			<tr>
			  <td>9、若非法定代表人签约，须提供法人授权委托书（原件）</td>
			</tr>
		  </tbody></table>
		  <table width="100%" border="0">
			<tbody><tr>
			  <td rowspan="8" width="40%"><span>医疗器械</span></td>
			  <td width="60%">1、企业营业执照（副本）</td>
			</tr>
			<tr>
			  <td>2、组织机构代码证（副本）</td>
			</tr>
			<tr>
			  <td>3、税务登记证（副本）</td>
			</tr>
			<tr>
			  <td>4、医疗器械生产或经营许可、备案凭证</td>
			</tr>
			<tr>
			  <td>5、可向个人消费者销售医疗器械的互联网药品交易服务资格证明</td>
			</tr>
			<tr>
			  <td>6、与平台签订的协议</td>
			</tr>
			<tr>
			  <td>7、指定账户公函（银行账号或者第三方支付账号信息）</td>
			</tr>
			<tr>
			  <td>8、若非法定代表人签约，须提供法人授权委托书（原件）</td>
			</tr>
		  </tbody></table>
		  <table width="100%" border="0">
			<tbody><tr>
			  <td rowspan="7" width="40%"><span>保健食品</span></td>
			  <td width="60%">1、企业营业执照（副本）</td>
			</tr>
			<tr>
			  <td>2、组织机构代码证（副本）</td>
			</tr>
			<tr>
			  <td>3、税务登记证（副本）</td>
			</tr>
			<tr>
			  <td>4、食品生产许可证或食品流通许可证（副本）</td>
			</tr>

			<tr>
			  <td>5、与平台签订的协议</td>
			</tr>
			<tr>
			  <td>6、指定账户公函（银行账号或者第三方支付账号信息）</td>
			</tr>
			<tr>
			  <td>7、若非法定代表人签约，须提供法人授权委托书（原件）</td>
			</tr>
		  </tbody></table>
		  <table width="100%" border="0">
			<tbody><tr>
			  <td rowspan="7" width="40%"><span>化妆品</span></td>
			  <td width="60%">1、企业营业执照（副本）</td>
			</tr>
			<tr>
			  <td>2、组织机构代码证（副本）</td>
			</tr>
			<tr>
			  <td>3、税务登记证（副本）</td>
			</tr>
			<tr>
			  <td>4、与平台签订的协议</td>
			</tr>
			<tr>
			  <td>5、若为生产企业，须提供《化妆品生产许可证》，经营企业不提供</td>
			</tr>
			<tr>
			  <td>6、指定账户公函（银行账号或者第三方支付账号信息）</td>
			</tr>
			<tr>
			  <td>7、若非法定代表人签约，须提供法人授权委托书（原件）</td>
			</tr>
		  </tbody></table>
		</div>
	  <#break>
	  <#case 'contentsCharges'>
		 <h2>收费内容</h2>
		<div class="help_article">
		  <p>1、平台使用年费。</p>
		  <p>2、技术服务费。</p>
		  <p>3、风险保证金。</p>
		</div>
	  <#break>
	  <#case 'introductionEnterprise'>
		<h2>企业简介</h2>
		<div class="help_article">
		  <p>饭饭在线隶属于饭饭集团股份有限公司，于2015年7月15日正式上线，秉承“以客户为中心，以健康为导向”的原则，致力于创造专业、高效、值得信赖的健康产品购物体验，以良心品质为您的健康保驾护航！</p>
		  <p>依托于深耕保健品市场近二十年的行业领军企业支撑，饭饭在线始终以专业的态度，严谨的作风，科学的方法为消费者甄选健康产品。目前，饭饭在线销售的商品包括保健品、食品、美容器械等十余种。在商品的选择上，我们始终以“健康”为前提，严格把控，从不追求数量上的突破，只在品质上孜孜以求，一丝不苟！未来，我们将一如既往依靠专业的健康团队，从品质、服务、价格等方面用心选择供应商，打造高效优化的供应链，建立科学严谨的管理制度，设计方便快捷的购物流程，在采购、仓储、支付、物流、售后等各个环节为消费者提供优质的服务和愉快的购物体验！</p>
		  <p>饭饭在线的商标为绿色，代表健康。保健，顾名思义，代表我们的主营产品是健康产品，我们的愿景是“为人类健康保驾护航”！在线，指我们是基于互联网科技的在线电子商务平台，实时保护人类健康。</p>
		</div>
	  <#break>
	  <#case 'qualityAssurance'>
	   <h2>品质保障</h2>
		<div class="help_article">
		  <p>1、平台入驻商家均具备合法网上经营资质，经营范围均已通过食品药品监督管理局认证。入驻商家具备良好的配送体系和售后服务体系，能够保证及时配送并良好应对售后服务问题。</p>
		  <p>2、商家组建了由执业药师为主的药学服务团队，对消费者提供基于电话、在线沟通工具等渠道的专业售前、售中和售后的药学服务。</p>
		  <p>3、平台将对各商家进行监督，消费者可在不能得到商家满意服务时，致电或者在线与平台客服沟通，若调查核实后，商家确实存在问题，平台将有权追究商家的相应责任。</p>
		</div>
	  <#break>
	  <#case 'advertisingService'>
		  <h2>广告服务</h2>
			<div class="help_article">
			  <p>平台为企业或品牌厂家提供药品展示信息服务以及品牌营销展示信息服务项目。 </p>
			  <p>1、首页及各频道页面、商家店铺页面展示广告。 </p>
			  <p>2、品牌专区。 </p>
			  <p>3、新品推荐。 </p>
			  <p>4、营销专区。 </p>
			  <p>5、会员营销。 </p>
			  <p>6、其他。</p>
			</div>
	  <#break>
	  <#case 'legalStatement'>
			 <h2>法律声明</h2>
			<div class="help_article">
			  <h3>饭饭在线提醒您：</h3>
			  <p>在使用平台各项服务前，请您务必仔细阅读并透彻理解本声明。您可以选择不使用平台服务，但如果您使用平台服务的，您的使用行为将被视为对本声明全部内容的认可。</p>
			  <p>平台会员或其发布的相关商品（包括但不限于店铺名称、公司名称、联系人及联络信息、产品的描述和说明、相关图片、视讯等）的信息均由会员自行提供，会员依法应对其提供的任何信息承担全部责任。</p>
			  <p>任何单位或个人认为平台网页内容（包括但不限于平台会员发布的商品信息）可能涉嫌侵犯其合法权益，应该及时向提出书面权利通知，并提供身份证明、权属证明、具体链接（URL）及详细侵权情况证明。在收到上述法律文件后，将会依法尽快移除相关涉嫌侵权的内容。</p>
			  <h3>知识产权声明</h3>
			  <p>平台拥有网站内所有信息内容（除平台会员发布的商品信息外，包括但不限于文字、图片、软件、音频、视频）的版权。</p>
			  <p>任何被授权的浏览、复制、打印和传播属于平台网站内信息内容都不得用于商业目的且所有信息内容及其任何部分的使用都必须包括此版权声明；</p>
			  <p>平台所有的产品、技术与所有程序均属于平台知识产权。未经许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用平台商标。否则，平台将依法追究法律责任。</p>
			  <h3>隐私权政策</h3>
			  <p>平台尊重并保护所有使用平台服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，平台会按照本隐私权政策的规定使用和披露您的个人信息。但平台将以高度审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，平台不会将这些信息对外披露或向第三方提供。平台会不时更新本隐私权政策。您在同意平台服务协议之时，即视为您已经同意本隐私权政策全部内容。</p>
			</div>
	  <#break>
	  <#case 'contactUs'>
		<h2>联系我们</h2>
		<div class="help_article">
		  <p>地址：大连金州新区先进装备制造业园区金七路9号</p>
		  <p> 在线客服：  QQ800118928</p>
		  <p> 电话：800-915-9555或22222222222</p>
		</div>
	  <#break>
	</#switch>
</div>
-->
</div>

<#include "/common/fields/field_common_footer.ftl" />
<script src="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script> 
<@field_page_tracker.render />
</body>
</html>