<#--二级类目页:海鲜类_活鲜鱼 ID:307_00000000000000240_gic-->
	<!DOCTYPE html>
	<html>

	<head lang="en">
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>饭饭1080°直采平台</title>
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<script type="text/javascript">
			var deviceWidth = document.documentElement.clientWidth;
			if(deviceWidth>768){
				deviceWidth=768;
			}
			document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
		</script>
		<#include "/common/common_var_definds.ftl" />
		<#include "/basepage/store/default/hb_templates/category_hb_templates.ftl" />
		<#import "/basepage/store/default/common/common_link.ftl" as link/>
		<#import "/basepage/store/default/common/common_script.ftl" as script/>
		<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
		<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
		<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
		<#import "/basepage/store/default/common/common_praise_business.ftl" as praBus/>
		<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
		<@link.render />
		<!--导入共通样式-->
		<@script.render />
		<!--导入共通脚本-->
		<link rel="stylesheet" href="${resources}/basepage/store/default/category_navigation/css/category.css" type="text/css">
		<link rel="stylesheet" href="${resources}/basepage/store/default/common_css/praBus.css" type="text/css">
		<script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="${resources}/basepage/store/default/category_navigation/js/category_data.js"></script>
		<script type="text/javascript" src="${resources}/basepage/store/default/category_navigation/js/category_dynamics.js"></script>
		<script type="text/javascript">
			$(function() {
				$(".page_fenlei_daohang li").eq(0).addClass("active");
				$(".page_fenlei_daohang li").on("click", function() {
					$(".page_fenlei_daohang li").removeClass("active");
					$(this).addClass("active");
				})

			})
		</script>
	</head>

	<body>
		<@praBus.render />
		<!--此处是头部开始-->
		<div class="top">
			<@top.render />
			<#--导入header_top-->
				<div class="category_search_box">
					<@searchBox.render />
					<#--导入search_box-->
				</div>
		</div>
		<!--此处是头部结束-->

		<#--<div class="live_fish_title">
			<ul class="live_fish_titile_link">
				<li class="live_fish_wrap_t">
					<a href="/">首页</a>
				</li>
				<li>
					<a>打折</a>
				</li>
				<li>
					<a>满减</a>
				</li>
				<li>
					<a>秒杀</a>
				</li>
				<li>
					<a>抽奖</a>
				</li>
				<li class="ff_koubei">
					<a>饭饭口碑库</a>
				</li>
				<li class="order_business">
					<a>订阅商机</a>
				</li>
			</ul>
		</div>-->
		<div class="page_fenlei_daohang">
			<ul>
				<li>
					<a class="firstClick" lv1_id="307_00000000000000237_gic" onclick="lv1_click(this)">海鲜类</a>
				</li>
				<li>
					<a lv1_id="307_00000000000002491_gic" onclick="lv1_click(this)">蔬菜类</a>
				</li>
				<li>
					<a lv1_id="307_00000000000003559_gic" onclick="lv1_click(this)">肉禽类</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000004244_gic" onclick="lv1_click(this)">米面粮油</a>
				</li>
				<li>
					<a lv1_id="307_00000000000005153_gic" onclick="lv1_click(this)">水果类</a>
				</li>
				<li>
					<a lv1_id="307_00000000000004784_gic" onclick="lv1_click(this)">豆蛋奶等</a>
				</li>
				<li>
					<a lv1_id="307_00000000000002298_gic" onclick="lv1_click(this)">调料</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000001644_gic" onclick="lv1_click(this)">干货类</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000997_gic" onclick="lv1_click(this)">熟食类</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000691_gic" onclick="lv1_click(this)">腌腊制品</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000249_gic" onclick="lv1_click(this)">速冻食品</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000002668_gic" onclick="lv1_click(this)">菌类野味</a>
				</li>
				<li>
					<a lv1_id="307_00000000000003171_gic" onclick="lv1_click(this)">滋补药膳</a>
				</li>
				<li>
					<a lv1_id="307_00000000000003414_gic" onclick="lv1_click(this)">合成速食</a>
				</li>
				<li>
					<a lv1_id="307_00000000000003675_gic" onclick="lv1_click(this)">淡水产品</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000004089_gic" onclick="lv1_click(this)">活禽畜类</a>
				</li>
				<li>
					<a lv1_id="307_00000000000004203_gic" onclick="lv1_click(this)">酒水饮料</a>
				</li>
				<li>
					<a lv1_id="307_00000000000004793_gic" onclick="lv1_click(this)">副食小食品</a>
				</li>
				<li>
					<a lv1_id="307_00000000000005535_gic" onclick="lv1_click(this)">火爆菜特区</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000000374_gic" onclick="lv1_click(this)">产地直供</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000379_gic" onclick="lv1_click(this)">品牌厂家</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000382_gic" onclick="lv1_click(this)">餐饮名店特色菜</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000390_gic" onclick="lv1_click(this)">全国特产</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000005479_gic" onclick="lv1_click(this)">装饰花卉</a>
				</li>
				<li>
					<a lv1_id="307_00000000000006104_gic" onclick="lv1_click(this)">土杂五金</a>
				</li>
				<li>
					<a lv1_id="307_00000000000005895_gic" onclick="lv1_click(this)">厨房设备</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000241_gic" onclick="lv1_click(this)">餐具等</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000002200_gic" onclick="lv1_click(this)">鱼缸制冷</a>
				</li>
				<li>
					<a lv1_id="307_00000000000002238_gic" onclick="lv1_click(this)">回收类</a>
				</li>
				<li>
					<a lv1_id="307_00000000000002542_gic" onclick="lv1_click(this)">燃料类</a>
				</li>
				<li>
					<a lv1_id="307_00000000000002606_gic" onclick="lv1_click(this)">维修保养</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000002618_gic" onclick="lv1_click(this)">客房用品</a>
				</li>
				<li>
					<a lv1_id="307_00000000000001166_gic" onclick="lv1_click(this)">办公设备</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000236_gic" onclick="lv1_click(this)">酒店装修</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000297_gic" onclick="lv1_click(this)">信息化</a>
				</li>
				<li class="mr0">
					<a lv1_id="307_00000000000000332_gic" onclick="lv1_click(this)">形象宣传</a>
				</li>
				<li>
					<a lv1_id="307_00000000000009135_gic" onclick="lv1_click(this)">进口免税</a>
				</li>
				<!--<li>
					<a onclick="lv1_click(this)">行业人才库</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000426_gic" onclick="lv1_click(this)">行业培训基地</a>
				</li>
				<li class="mr0">
					<a onclick="lv1_click(this)">金融服务大厅</a>
				</li>
				<li>
					<a lv1_id="307_00000000000000656_gic" onclick="lv1_click(this)">行业增值服务</a>
				</li>
				<li>
					<a onclick="lv1_click(this)">地面活动</a>
				</li>
				<li>
					<a onclick="lv1_click(this)">饭饭社区</a>
				</li>
				<li class="mr0">
					<a onclick="lv1_click(this)">商机无限</a>
				</li>-->
			</ul>
		</div>
		<div class="page_yiji_wrap">
			<ul>
			</ul>
		</div>
		</div>

		<!-----------------------此处为footer（楼层以下）-------------------->
		<@footer.render />
		<!--导入footer-->
		<@scrollTop.render />
		<!--此处为底部结束（楼层以下）-->
	</body>

	</html>