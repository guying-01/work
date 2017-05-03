<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<script type="text/javascript">
			var deviceWidth = document.documentElement.clientWidth;
			if(deviceWidth>768){
				deviceWidth=768;
			}
			document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
		</script>
		<#include "/common/common_var_definds.ftl" />
		<#import "/basepage/store/default/common/common_link.ftl" as link/>
		<#import "/basepage/store/default/common/common_script.ftl" as script/>
	<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
		<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
		<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
		<@link.render />
		<!--导入共通样式-->
		<@script.render />
		<!--导入共通脚本-->
		<link rel="stylesheet" type="text/css" href="${resources}/basepage/store/default/others/css/coming_soon.css" />

	</head>

	<body>
		<!--此处是头部开始-->
        <div class="top">
            <div class="ff_list_search_box">
			<@searchBox.render />
            </div>
		<@header_bar.render "饭饭1080°直采平台",""/>
		<#--导入header_top-->

        </div>
		<!--此处是头部结束-->
		<div class="con1 se2"></div>
		<div class="con2"></div>
		<div class="con3"></div>
		<div class="con4"></div>
		<div class="con5"></div>
		<div class="con7">
			<div class="baodao_box">
				<div class="baodao_item">
					<a class="baodao_item_pic"><img src="${resources}/basepage/store/default/others/img/baodao_item01.png" /></a>
					<a class="baodao_item_t">
						<p>饭饭直采</p>
						<p>平台报道</p>
					</a>
				</div>
				<div class="baodao_item mr0">
					<a class="baodao_item_pic"><img src="${resources}/basepage/store/default/others/img/baodao_item02.png" /></a>
					<a class="baodao_item_t">
						<p>饭饭直采</p>
						<p>平台报道</p>
					</a>
				</div>
                <div class="baodao_item baodao_item1">
                    <a class="baodao_item_pic"><img src="${resources}/basepage/store/default/others/img/baodao_item03.png" /></a>
                    <a class="baodao_item_t">
                        <p>饭饭直采</p>
                        <p>平台报道</p>
                    </a>
                </div>
				<div class="baodao_item">
					<a class="baodao_item_pic"><img src="${resources}/basepage/store/default/others/img/baodao_item04.png" /></a>
					<a class="baodao_item_t">
						<p>饭饭直采</p>
						<p>平台报道</p>
					</a>
				</div>
				<div class="baodao_item mr0">
					<a class="baodao_item_pic"><img src="${resources}/basepage/store/default/others/img/baodao_item05.png" /></a>
					<a class="baodao_item_t">
						<p>饭饭直采</p>
						<p>平台报道</p>
					</a>
				</div>
			</div>
		</div>
		<div class="con8">
		</div>
		<div class="con9">
			<div class="contact_us">联系我们</div>
			<div class="busniess_info">
				<p>公司地址：大连市西岗区鞍山路长兴市场106号楼 </p>
				<p> 公司电话：0411-39983978</p>
				<p>公司邮箱：fan@fan1080.com</p>
			</div>
		</div>
		<!-----------------------此处为footer（楼层以下）-------------------->
		<@footer.render />
		<!--导入footer-->
		<!--此处为底部结束（楼层以下）-->
		<div class="f_returnTop" title="返回顶部"></div>
	</body>

</html>