<#include "/common/common_var_definds.ftl" /> <#import
"/common/fields/field_page_tracker.ftl" as field_page_tracker /> <#-- 标题
| metas | 链接 | 脚本 | 主要内容 | 页脚 | 数据 |SEO数据 title metas=>[] links=>[]
scripts=>[] mainParts=>[] footParts=>[] data seoForm --> <#macro render
title,metas,links,scripts,mainParts,footParts,data,seoForm> <#escape x
as x?html>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">

<#-- TemplateBeginEditable name="doctitle" -->
<title>${title}</title> <#-- TemplateEndEditable --> <#-- CHANGE START
BY geshuo 20151214:meta start --> <#list metas as part> <#if seoForm??>
<@part.render seoForm/> </#if> </#list> <#-- CHANGE END BY geshuo20151214:meta end -->
<link rel="shortcut icon" href="${resources}/basepage/store/default/common_img/favicon.ico" />
<link rel="bookmark" href="${resources}/basepage/store/default/common_img/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${resources}/css/common/lib.css" />
<link rel="stylesheet" type="text/css" href="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.css" />
<#-- TemplateBeginEditable name="my_css" --> <#list links as part>
<@part.render /> </#list> <#-- TemplateEndEditable -->
<script>
	var dm_ctx = '${ctx}';
	var dm_resources = '${resources}';
</script>
<script src="${resources}/js/lib/jquery/jquery-1.8.3.js"></script>
<script src="${resources}/js/lib/handlebars/handlebars-v2.0.0.js"></script>
<script src="${resources}/js/lib/pubsub/tiny-pubsub.js"></script>
<script src="${resources}/js/common/top_toolbar.js"></script>
<script src="${resources}/js/common/pager.js"></script>
<script src="${resources}/js/common/tool.js"></script>
<script src="${resources}/js/common/headsearch.js"></script>
<script src="${resources}/js/common/common.js"></script>
<!--[if lt IE 9]>
	<script src="/resources/js/lib/html5/es5-shim.min.js"></script>
	<script  type="text/javascript" src="/resources/js/lib/html5/html5shiv.min.js"></script>
    <![endif]-->
<#-- TemplateBeginEditable name="my_js" -->
<script>
	var dm_ctx = '${ctx}';
	var dm_resources = '${resources}';
</script>
<#list scripts as part> <@part.render /> </#list> <#--
TemplateEndEditable --> <#-- TemplateBeginEditable name="head" --> <#--
TemplateEndEditable -->
</head>
<body>
	<#include "/common/fields/field_common_nav.ftl" />
	<div class="header">
		<div class="wrapper">
			<h1 class="left">
				<a href="/"><img src="${resources}/img/common/logo.png" /></a>
			</h1>
			<div class="topAnimate">
			<a id="leftLink" target="_blank" href="${Session.url1!''}">
			<img id="leftImg" src="${Session.ad_pic1!''}" width="120" height="60"></a>
			</div>
			<div class="search">
				<#--<select id="selectType" onchange="changeShowInfo(this)">
					<option value="byGoods">按商品</option>
					<option value="byStore">按店铺</option>
				</select> --> <input name="searchWord" type="text" value=""
					dm-info="gd-search-word" class="dm-no-auto-clear">
				<p id="showInfo">商品名称/店铺名称</p>
				<a href="javascript:void(0);" dm-actor="gd-search">搜 索</a>
			</div>
			<div class="hot-search" dm-info="gd-hot-search-list"></div>
			<div class="headapp"><a id="rightLink" target="_blank" href="${Session.url2!''}"><img id="rightImg" src="${Session.ad_pic2!''}" width="240" height="100"></a></div>
		</div>
	</div>

	<div class="nav" dm-container="mallNav">
		<div class="wrapper">
			<ul id="navigationBar"></ul>
		</div>
	</div>
	<div class="menu" style="z-index: 110;" dm-container="menu"></div>
	<#-- TemplateBeginEditable name="my_conner" --> <#list mainParts as
	part> <@part.render data/> </#list> <#-- TemplateEndEditable -->
	<#include "/common/fields/field_common_footer.ftl" />
	<script src="${resources}/js/common/footer.js"></script>
	<@field_page_tracker.render /> <#-- TemplateEndEditable -->
	<script
		src="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			try {
				var options = {
					container : "",
					replace : true,
					range : {},
					loadedShow : true
				};
				// 搜索
				var gdSearch = function(search, from) {
					console.log('商品搜索  gdSearch----------------' + encodeURIComponent(search));
					location.href = '/goodsSearch.jhtml?from=' + from + '&s=' + encodeURIComponent(search);
				};
				//输入搜索关键词
				$(document).on('keypress', '[dm-info="gd-search-word"]', function() {
					switch (event.keyCode) {
					case 13:
						gdSearch($('[dm-info="gd-search-word"]').val(), 'gd-search');
						break;
					default:
						break;
					}
				});
				$(document).on('click', '[dm-actor="gd-search"]', function() {
					gdSearch($('[dm-info="gd-search-word"]').val(), $(this).attr('dm-actor'));
				});
				//热门搜索
				$(document).on('click', '[dm-info="gd-hot-search-item"]', function() {
					gdSearch($(this).attr('dm-data'), $(this).attr('dm-info'));
				});

				callService("/findHotWords.ajax", {}, {
					callSuccess : function(data) {
						var htmlStr = '';
						$.each(data, function(inx, val) {
							var content = '<a href="/goodsSearch.jhtml?from=gd-search&s=' + val.content + '">' + val.content + '</a>';
							if (inx != 0) {
								content = '&nbsp&nbsp' + content;
							}
							htmlStr += content;
						})
						$('.hot-search').append(htmlStr);
					}
				});

				callService("/tpl/fingNavigationBar.ajax", {
					"subsystemId" : "00",
					"pageId" : "page0001",
					"gridId" : "grid0001",
					"rangeId" : "range0003"
				}, {
					callSuccess : function(data) {
						if (data.success) {
							if (data.result.length != 0) {
								var html = "";
								for ( var i in data.result) {
									var rangeExtendData = data.result[i].rangeExtendData;
									if (rangeExtendData != null) {
										var hot_goods = $.parseJSON(rangeExtendData).hot_goods;
										var value = JSON.parse(hot_goods);
										for (var j=0;j < value.length;j++) {
											html += "<li><a href='"+value[j].url+"' title='"+value[j].label+"' style='padding: 0px 10px; text-align: center; overflow: hidden; width: 70px; height: 50px;'>" + value[j].label + "</a></li>"
										}
									}
								}
								$("#navigationBar").html(html);
							}
						}
					}
				});
			} catch (ex) {
				console.log(ex);
			}
		});

		function changeShowInfo() {
			var checkValue = $("#selectType").val();
			if (checkValue == 'byGoods') {
				$("#showInfo").empty().append("商品名称");
			} else {
				$("#showInfo").empty().append("店铺名称");
			}
		}
	</script>
	<script src="${resources}/js/common/hover.js"></script>

</body>
</html>
</#escape> </#macro>

