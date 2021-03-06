<#--二级类目页-->
	<#include "/common/common_var_definds.ftl" />

	<!DOCTYPE html>
	<html>

	<head lang="en">
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
		<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
	<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
		<@link.render />
		<!--导入共通样式-->
		<@script.render />
		<!--导入共通脚本-->
		<link rel="stylesheet" href="${resources}/basepage/store/default/level_pages/css/fflv2_css/fflv2_css.css" type="text/css">
		<!--二级页共通样式-->
		<link rel="stylesheet" href="${resources}/basepage/store/default/promotion/css/notify_list.css" type="text/css">
		<script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${resources}/basepage/store/default/level_pages/js/fflv2_js/lv2_dynamics.js"></script>
        <script src="${resources}/resources/js/common/scrollTop.js" type="text/javascript" charset="utf-8"></script>
		<!--<script src="${resources}/basepage/store/default/promotion/js/remaibangdan.js" type="text/javascript" charset="utf-8"></script>-->
		<!--此处是动态数据绑定函数-->
	</head>

	<body>
    <div class="top">
        <div class="ff_list_search_box">
		<@searchBox.render />
        </div>
	<@header_bar.render "饭饭公告",""/>
	<#--导入header_top-->
    </div>
		<@scrollTop.render />
		<div class="banner">
			<div class="title"></div>
		</div>
		<div class="goodsList">
			<ul>
				<li>
					<a href="/promotion/notify_list_content.jhtml">
						<i></i>
						<span class="item-tit">饭饭平台简介</span>
						<span class="time">2017.02.25</span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
				<li>
					<a href="####">
						<i></i>
						<span class="item-tit"></span>
						<span class="time"></span>
					</a>
				</li>
			</ul>

		</div>

		<@footer.render />
	</body>

	</html>