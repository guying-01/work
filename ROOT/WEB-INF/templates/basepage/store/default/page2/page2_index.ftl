<#--二级类目页-->
	<#include "/common/common_var_definds.ftl" />
	<#include "/basepage/store/default/hb_templates/lv2_hb_templates.ftl" />
	<!DOCTYPE html>
	<html>

	<head lang="en">
		<title>饭饭1080°直采平台</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<script type="text/javascript">
			var deviceWidth = document.documentElement.clientWidth;
			if(deviceWidth>768){
				deviceWidth=768;
			}
			document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
		</script>

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
		<link rel="stylesheet" href="${resources}/basepage/store/default/level_pages/css/fflv2_css/fflv2_css.css" type="text/css">
		<!--二级页共通样式-->
		<link rel="stylesheet" href="${resources}/basepage/store/default/common_css/praBus.css" type="text/css">
		<script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${resources}/basepage/store/default/level_pages/js/fflv2_js/lv2_dynamics.js"></script>
		<!--此处是动态数据绑定函数-->
	</head>

	<body>
		<div id="pageInfo_ww" lv1_id="${level1}" lv1_name="${name1}" currentPageId="${level2}" currentPageName="${name2}" style="display:none"></div>
		<!--页面信息-->
		<@praBus.render />
		<!--此处是头部开始-->
		<div class="top">
			<@top.render />
			<#--导入header_top-->
				<div class="top_banner">
					<img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/p2_${level2}_banner.jpg">
					<@searchBox.render />
					<#--导入search_box-->
				</div>
		</div>
		<!--此处是头部结束-->
		<!--此处是活鲜鱼开始-->
		<div class="live_fish_wrap">
			<#--<div class="live_fish_title">
				<ul class="live_fish_titile_link">
					<li class="live_fish_wrap_t">${name2}</li>
					&lt;#&ndash;<li>
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
					</li>&ndash;&gt;
				</ul>
			</div>-->

			<div class="live_fish_wrap_b">
				<ul class="live_fish_wrap_b_fish">
					<!--此处通过id="category_list"模板加载-->
				</ul>
			</div>
		</div>
		<!--此处是活鲜鱼结束-->

		<!--活动页面开始-->
		<div class="activity">
            <a href="/promotion/remaibangdan.jhtml" class="hotsale">
                <img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/hotsale.jpg" />
            </a>
            <a href="/promotion/pie.jhtml" class="free">
                <img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/free.jpg">
            </a>
            <a href="/promotion/berserk.jhtml" class="berserk">
                <img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/creazy.jpg" />
            </a>
			<a href="/others/comingSoon_2th.jhtml" class="newness">
            <img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/newness.jpg" />
            </a>
            <a href="/promotion/daily_burst.jhtml" class="daily_burst">
                <img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/daily_burst.jpg">
            </a>
			<a href="/promotion/clear.jhtml" class="clear">
				<img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/clear.jpg" />
			</a>
          	<a href="/promotion/discount.jhtml" class="sale">
				<img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/sale.jpg">
			</a>

		</div>
		<!--活动页面结束-->

		<!--八小只开始-->
		<ul class="conve-list">
			<li class="conve-item-1">
				<a href="/others/comingSoon_2th.jhtml">
					<div class="icons8 icons8_1"></div>
					<p>自由贷</p>
				</a>
			</li>
			<li class="conve-item-2">
				<a href="/others/comingSoon_2th.jhtml">
					<div class="icons8 icons8_2"></div>
					<p>信用贷</p>
				</a>
			</li>
			<li class="conve-item-3">
				<a href="/others/comingSoon_2th.jhtml">
					<div class="icons8 icons8_3"></div>
					<p>货易贷</p>
				</a>
			</li>
			<li class="conve-item-4">
				<a href="/others/comingSoon_2th.jhtml">
					<div class="icons8 icons8_4"></div>
					<p>保理贷</p>
				</a>
			</li>
			<li class="conve-item-5">
				<a href="/others/comingSoon_2th.jhtml">
					<div class="icons8 icons8_5"></div>
					<p>白条</p>
				</a>
			</li>
			<li class="conve-item-6">
				<a href="/others/comingSoon_2th.jhtml">
					<div class="icons8 icons8_6"></div>
					<p>饭小贷</p>
				</a>
			</li>
			<li class="conve-item-7">
				<a href="/others/comingSoon_2th.jhtml">
					<div class="icons8 icons8_7"></div>
					<p>理财宝</p>
				</a>
			</li>
			<li class="conve-item-8">
				<a href="/others/comingSoon_2th.jhtml">
					<div class="icons8 icons8_8"></div>
					<p>小金库</p>
				</a>
			</li>
		</ul>
		<!--八小只结束-->

		<!--猜你喜欢开始-->
		<div class="brand_wrap cainixihuan">
			<h4>
    		<div>
    			<img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/cainixihuan.png"/>
    			<span>猜你喜欢</span>
    		</div>
    	</h4>
			<ul class="brand_zone">
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_cainixihuan_01">
						<img src="" />
						<p class="brand_zone_title"></p>
						<p class="brand_zone_price"></p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_cainixihuan_02">
						<img src="" />
						<p class="brand_zone_title"></p>
						<p class="brand_zone_price"></p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_cainixihuan_03">
						<img src="" />
						<p class="brand_zone_title"></p>
						<p class="brand_zone_price"></p>
					</a>
				</li>
			</ul>
		</div>
		<!--猜你喜欢结束-->

		<!--品牌专区开始-->
		<div class="brand_wrap pinpaizhuanqu">
			<h4>
    		<div>
    			<img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/pinpaizhuanqu.png"/>
    			<span>品牌专区</span>
    		</div>
    	</h4>
			<ul class="brand_zone">
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_pinpaizhuanqu_01">
						<img src="" />
						<p class="brand_zone_title"></p>
						<#--<p class="brand_zone_price">￥666.66</p>-->
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_pinpaizhuanqu_02">
						<img src="" />
						<p class="brand_zone_title"></p>
						<#--<p class="brand_zone_price">￥666.66</p>-->
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_pinpaizhuanqu_03">
						<img src="" />
						<p class="brand_zone_title"></p>
						<#--<p class="brand_zone_price">￥666.66</p>-->
					</a>
				</li>
			</ul>
		</div>
		<!--品牌专区结束-->

		<!--本日秒杀开始-->
		<div class="brand_wrap benrimiaosha">
			<h4>
                <a href="/promotion/seckill.jhtml"></a>
			</h4>
			<ul class="brand_zone" id="brand_zone">
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_benrimiaosha_01">
						<img src="" />
						<p class="brand_zone_title"></p>
						<p class="brand_zone_price"></p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_benrimiaosha_02">
						<img src="" />
						<p class="brand_zone_title"></p>
						<p class="brand_zone_price"></p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="brand_zone_goods level_${level2}_benrimiaosha_03">
						<img src="" />
						<p class="brand_zone_title"></p>
						<p class="brand_zone_price"></p>
					</a>
				</li>
			</ul>
		</div>
		<!--本日秒杀结束-->
		<div class="miaosha_bottom">
			<a href="javascript:void(0);" class="level_${level2}_miaosha_bottom_01"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test6.jpg"></a>
			<a href="javascript:void(0);" class="level_${level2}_miaosha_bottom_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test7.jpg"></a>
			<a href="javascript:void(0);" class="level_${level2}_miaosha_bottom_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test8.jpg"></a>
		</div>
		<!--最新产品开始 -->
		<div class="latest_product_wrap floor_hb_1">
			<div class="latest_product_wrap_t">最新产品</div>
			<div class="latest_product_wrap_b">
				<a href="javascript:void(0);" class="latest_product1 level_${level2}_f1_05"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test3.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f1_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f1_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f1_04"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg">
					<a href="javascript:void(0);" class="latest_product2 level_${level2}_f1_06"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
			</div>
		</div>
		<!--最新产品结束 -->

		<!--畅销榜开始-->
		<div class="latest_product_wrap floor_hb_2">
			<div class="latest_product_wrap_t">畅销榜</div>
			<div class="latest_product_wrap_b">
				<a href="javascript:void(0);" class="latest_product3 level_${level2}_f2_01"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test4.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f2_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test2.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f2_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f2_04"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f2_05"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test2.jpg"> </a>
			</div>
		</div>
		<!--畅销榜结束-->
		<!--口碑甄选开始-->
		<div class="latest_product_wrap floor_hb_3">
			<div class="latest_product_wrap_t">口碑甄选</div>
			<div class="latest_product_wrap_b">
				<a href="javascript:void(0);" class="latest_product1 level_${level2}_f3_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test3.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f3_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f3_04"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test2.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f3_05"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f3_06"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test2.jpg"> </a>
			</div>
		</div>
		<!--口碑甄选结束-->

		<!--真实惠-->
		<div class="latest_product_wrap floor_hb_4">
			<div class="latest_product_wrap_t">真实惠</div>
			<div class="latest_product_wrap_b">
				<a href="javascript:void(0);" class="latest_product3 level_${level2}_f4_01"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test4.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f4_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f4_05"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f4_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test2.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f4_06"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
			</div>
		</div>
		<!--真实惠结束-->

		<!--独一无二开始-->
		<div class="latest_product_wrap floor_hb_5">
			<div class="latest_product_wrap_t">独一无二</div>
			<div class="latest_product_wrap_b">
				<a href="javascript:void(0);" class="latest_product1 level_${level2}_f5_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test3.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f5_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f5_04"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f5_05"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test2.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f5_06"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
			</div>
		</div>
		<!--独一无二结束-->

		<!--良心品质开始 -->
		<div class="latest_product_wrap floor_hb_6">
			<div class="latest_product_wrap_t">良心品质</div>
			<div class="latest_product_wrap_b">
				<a href="javascript:void(0);" class="latest_product1 level_${level2}_f6_05"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test3.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f6_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f6_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f6_04"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f6_06"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
			</div>
		</div>
		<!--良心品质结束-->

		<!--特色专供开始-->
		<div class="latest_product_wrap floor_hb_7">
			<div class="latest_product_wrap_t">特色专供</div>
			<div class="latest_product_wrap_b">
				<a href="javascript:void(0);" class="latest_product3 level_${level2}_f7_01"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test4.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f7_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f7_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f7_04"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f7_05"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test1.jpg"> </a>
			</div>
		</div>
		<!--特色专供结束-->

		<!--饭饭力荐开始-->
		<div class="latest_product_wrap floor_hb_8">
			<div class="latest_product_wrap_t">饭饭力荐</div>
			<div class="latest_product_wrap_b">
				<a href="javascript:void(0);" class="latest_product3 level_${level2}_f8_01"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test4.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f8_02"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f8_03"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f8_04"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
				<a href="javascript:void(0);" class="latest_product2 level_${level2}_f8_05"><img src="/resources/basepage/store/default/level_pages/img/fflv2_img/test5.jpg"> </a>
			</div>
		</div>
		<!--饭饭力荐结束-->

		<!--生鲜风采开始-->
		<div class="latest_product_wrap fresh_wrap">
			<div class="latest_product_wrap_t">生鲜风采</div>
			<div class="latest_product_wrap_b">
				<a href="/others/comingSoon_2th.jhtml" class="fresh_l level_307_00000000000000237_gic_sxxb_00">
					<img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/fresh01.png" />
				</a>
				<div class="fresh_r">
					<a href="javascript:void(0);" class="fresh_fans_news_tit">生鲜小报</a>
					<a href="/fsst/101_00000000000000405_str/top.jhtml">
						<dl class="fresh_r_item">
							<dt><i></i>长海兴东海珍品</dt>
							<dd>好产地，长海县。</dd>
						</dl>
					</a>
					<a href="/fsst/101_00000000000000408_str/top.jhtml" class="fresh_r_item2_box">
						<dl class="fresh_r_item">
							<dt><i></i>养正居海产品</dt>
							<dd>品味深海，纯净鲜美。</dd>
						</dl>
					</a>
					<a href="/fsst/101_00000000000000399_str/top.jhtml">
						<dl class="fresh_r_item fresh_r_item3">
							<dt><i></i>双汇生鲜</dt>
							<dd>冷链锁鲜，便捷生活。</dd>
						</dl>
					</a>
				</div>
			</div>
			<div class="fresh_b">
				<a class="fresh_b_item fresh_b_item1" href="/others/comingSoon_2th.jhtml">
					<div class="user_pic"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/fresh_style_icon01.png" /></div>
					<div class="goods_pic"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/fresh_1.jpg" /></div>
                    <div class="user_word">
                        <div>保冷箱配送，很新鲜，牛肉味浓，不像市场上的那些牛肉吃起和猪肉味道一样</div>
                    </div>
				</a>
				<a class="fresh_b_item" href="/others/comingSoon_2th.jhtml">
					<div class="user_pic"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/fresh_style_icon02.png" /></div>
					<div class="goods_pic"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/fresh_2.jpg" /></div>
                    <div class="user_word">
                        <div class="">
                            店家的真诚是不用置疑的，非常好。东港的海鲜的品质不用置疑的，肯定是好呀。
                        </div>
                    </div>
				</a>
                <a class="fresh_b_item fresh_b_item1" href="/others/comingSoon_2th.jhtml">
                    <div class="user_pic"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/fresh_style_icon03.png" /></div>
                    <div class="goods_pic"><img src="${resources}/basepage/store/default/level_pages/img/fflv2_img/fresh_3.jpg" /></div>
                    <div class="user_word">
                        <div>正宗的大连海蛰头，分量足，口味好，价格实惠，配送及时，无论商品还是服务，都无可挑剔，这钱，花的值</div>
                    </div>
                </a>
			</div>
		</div>
		<!--生鲜风采结束-->

		<!-----------------------此处为footer（楼层以下）-------------------->
		<@footer.render />
		<!--导入footer-->
		<@scrollTop.render />
	</body>

	</html>
