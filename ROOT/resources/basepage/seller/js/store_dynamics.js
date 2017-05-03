$(function() {
	var storeId = $("#pageInfo").attr("store_id"); //获取唯一商铺ID storeId;
	//var storeTemplateCode = $("#pageInfo").attr("store_template_code");
	if(ifStatic(storeId)){
		// $(".range").hide();
		$(".look_more").hide();
		// $("#sp_hd_2").hide();
        $('.productList').hide();
        $('.search').hide();
        $('.store-nav-index').css('width', '40%');
		getStatictemplate(staticStore[storeId]);
	}
	else {
		$.ww.getRange(storeId, 3, [4, 4, 4], getRange); //店铺id,range数量,每个range中商品数量,
	}

	/**
	 * 店铺信息信息请求并加载
	 */
	var store_fixed = $(".store-tab").length;
	if(store_fixed != 0){
		$("body").append("<div style='width: 100%;height:0.8rem;background:#fff'></div>");
	}
	(function() {
		var success = function(data) {
			data = JSON.parse(data);
			var template_storeInfo = $("#store_storeInfo").html();
			var html = loadHandlebarsTemplate(template_storeInfo, data);
			$(".store-header").append(html); //加载到html中
			//var template_store_qq = $("#store_qq").html();
			//var html_qq = loadHandlebarsTemplate(template_store_qq, data);
			//$(".store-nav ul").append(html_qq); //加载到html中
			$(".favStore").on("click", favStore);
		};
		requestDataWithAJAX("/fsajax/getStoreInfo.ajax?storeId=" + storeId, "get", true, {
			"success": success
		});
	})();
	Handlebars.registerHelper({
		storeLevel: function(supplierTypeCode) {
			var result = "";
			switch(supplierTypeCode) {
				case "10":    
					result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_01.png'/>"; //"大"
					break;
				case "20":
					result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_02.png'/>"; //"股"
					break;
				case "30":
					result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_03.png'/>"; //"共"
					break;
				case "40":
					result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_04.png'/>"; //"强"
					break;
				case "50":
					result = "<img src='/resources/basepage/store/default/common_img/store_level_icon_05.png'/>"; //"亲"
					break;
			}
			return result;
		}
	});
	/**
	 * 收藏店铺事件绑定
	 */
	function favStore() {
		$.ww.getLoginStatus(function() {
			var success = function(data) {
				if(data.success) {
					jsAlert("收藏成功");
					//                      favoriteGoods();
				} else {
					jsAlert(data.message);
				}
			};
			var request = {
				"storeId": storeId
			};
			requestDataWithAJAX("/mf/addSgMemberStoreFavorite.ajax", "post", true, {
				"success": success,
				data: request
			});
		}, function() {
			location.href = "/member/index.jhtml";
		});
	};


	/**
	 * range加载
	 * Created by WW on 2016/11/03.
	 */
	function getRange(data) {
			//range1区域模板
		function template_range1() {
			/*****
             {{#each this}}
             <li>
   				<a  href="/fsgd/{{goods_id}}.jhtml">
   					<img src="{{big_picture_path}}" alt="{{goods_name}}" class="goods_pic" />
   					<p class="goods_name">{{goods_name}}</p>
   					<div class="goods_price_box">
   						<span class="goods_price">￥{{showPrice item_saleprice}}</span>
   						<div class="btn">
   							<span>立即购买</span>
   							<i></i>
   						</div>
   					</div>
   				</a>
   			</li>
             {{/each}}
             *****/
		}

		var template_range1 = cutTemplateWrap(template_range1); //解析range1模板

		try {
			if(data.range1 == undefined || data.range1 == "" || data.range1 == []) {

			} else {
				var html_range1 = loadHandlebarsTemplate(template_range1, data.range1); //编译range1模板

				$(".range1").prepend("<div class='range_name'><img src='/resources/basepage/seller/img/" + storeId + "/top2.jpg'/><div>///<span>" + data.rangeList.range1.name + "</span>///</div></div>");
				$(".range1 ul").html(html_range1); //将range1内容加入页面
			}

		} catch(e) {
			console.error(e);
		}

		try {
			if(data.range2 == undefined || data.range2 == "" || data.range2 == []) {} else {
				var html_range2 = loadHandlebarsTemplate(template_range1, data.range2); //编译range2模板

				$(".range2").prepend("<div class='range_name'><img src='/resources/basepage/seller/img/" + storeId + "/top2.jpg'/><div>///<span>" + data.rangeList.range2.name + "</span>///</div></div>");
				$(".range2 ul").html(html_range2); //将range2内容加入页面
			}
		} catch(e) {
			console.error(e);
		}

		try {
			if(data.range3 == undefined || data.range3 == "" || data.range3 == []) {} else {
				var html_range3 = loadHandlebarsTemplate(template_range1, data.range3); //编译range3模板
				$(".range3").prepend("<div class='range_name'><img src='/resources/basepage/seller/img/" + storeId + "/top2.jpg'/><div>///<span>" + data.rangeList.range3.name + "</span>///</div></div>");
				$(".range3 ul").html(html_range3); //将range3内容加入页面
			}
		} catch(e) {
			console.error(e);
		}

	}

	var it_url = window.location.href;
	var ind = it_url.split("#tab")[1];
	if(ind) {
		tab_click(ind);
	}
});
/*静态商铺加载静态模板*/
function getStatictemplate(functionName) {
	var func=eval(functionName);
	var template=cutTemplateWrap(func);
	var html = loadHandlebarsTemplate(template);
	$("#static_box").html(html);
}

function tab_click(ind) {
	if(ind >= 0) {
		var index = ind;
	} else {
		var index = $(this).index();
	}
	$(".store-nav li a").removeClass("tab_nav_on").eq(index).addClass("tab_nav_on");
	$("#ff_tab_box .ff_tab_content").removeClass("ff_tab_ct_show").eq(index).addClass("ff_tab_ct_show");
}


$(function () {
	var gy=new getPic('introduction','tupian');
	gy.checkPic();
});

class getPic{
	constructor(name,src){
        this.picName=name
		this.picSrc=src
	}
	getStoreId(){
		return $("#pageInfo").attr('store_id')
	}
    checkPic(){
		var picL=$("."+this.picSrc+"1").length;
		if(picL==0){
			return
		}
		else{
			this.setPic()
		}
	}
	setPic(){
		var storeId=this.getStoreId()
		$('<img src="/resources/basepage/seller/img/'+storeId+'/'+this.picName+'1.jpg" width="100%">').appendTo($("."+this.picSrc+'1'));
		$('<img src="/resources/basepage/seller/img/'+storeId+'/'+this.picName+'2.jpg" width="100%">').appendTo($("."+this.picSrc+'2'));

	}
}




