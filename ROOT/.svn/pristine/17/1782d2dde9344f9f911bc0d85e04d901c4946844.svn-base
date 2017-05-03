(function($) {
	/**
	 * 加载页面头部状态栏插件
	 */
	$.fn.dmHeaderBar = function(ops) {
		try {
			ops = ops || {};
			var type = ops["type"] || "html";
			var $_header = $(this);
			// 查询布局数据url
			var url = "/resources/js/ranges/range0001/html/header.html";
			// 参数
			var query = {};
			// 调用后台，获取数据并加载模板
			callService(url, query, {
				type : 'GET',
				callSuccess : function(template_tl) {
					// 将模板加载到指定dom节点上
					if (type == "replaceWith") {
						$_header.replaceWith(template_tl);
					} else if (type == "append") {
						$_header.append(template_tl);
					} else {
						$_header.html(template_tl);
					}
					// 给tab添加样式变化
					$.dmClickTab();
					// 判断是否已登录，并修改状态栏
					$.dmJudgeLogStatusAndUpdateStatus();
					// 加载客服信息
					$.dmSetQQ();
				}
			});

			// 返回对象
			var api = {
				dmTopFav : $.dmTopFav,
				dmTopShopCar : $.dmTopShopCar
			};
			return api;
		} catch (ex) {
			console.log(ex);
		}

	};

	/**
	 * 判断用户是否已登录，并在判断后，修改个状态信息
	 */
	$.dmJudgeLogStatusAndUpdateStatus = function() {
		try {
			$.dm.getBasicUrls(function(urls) {
				$.dm.getLogStatus(function(data) {
					// 当用户已登录，则显示已登录的信息
					if (data && data["userCode"]) {
						try {
							// 买家中心路径
							data["seller_path"] = urls.sellerUrl;
						} catch (ex) {
							// 买家中心路径
							data["seller_path"] = "http://127.0.0.1:8084";
						}
						// 模板
						var topnav_tl = $("#topnav-tl").html();
						// 将模板编译成handlerbars对象
						var topnav_template = Handlebars.compile(topnav_tl);
						// 将模板与数据结合
						var temp = sansplid(data.point);
						data.point = temp;
						var topnav_html = topnav_template(data);
						// 查找要插入html的节点
						var $_topnav = $("[class='topnav']");
						// 插入html
						$_topnav.html(topnav_html);

						// 在将模板编译完成后继续进行修改状态操作
						// 修改头像信息
						$.dmUpdateStatus(data, true);
						// 
					} else {
						// 如果用户未登录，显示默认头部信息
						// 修改头像信息
						// $.dmUpdateStatus(data);
					}
					$.dmBindEvent();
				});
			});
		} catch (ex) {
			console.log(ex);
		}
	};

	$.dmBindEvent = function() {

		$('.topnav li').mouseover(function() {
			$(this).children('.top-li-pop').show()
		});
		$('.topnav li').mouseleave(function() {
			$(this).children('.top-li-pop').hide()
		});
	};

	/**
	 * 修改头部状态栏信息
	 */
	$.dmUpdateStatus = function(userInfo) {
		try {
			// 1,设置头像信息
			$.dmChangeHeadImg(userInfo);
			// 2,初始化头部购物车
			$.dmTopShopCar();
			// 3,初始化头部收藏
			$.dmTopFav();
			// 4，初始化头部收藏店铺
			$.dmTopFavStore();
			// 5 ...修改其他状态栏
			$.dmTopMsg();
		} catch (ex) {
			console.info(ex);
		}
	}

	/**
	 * 修改用户头像图片
	 */
	$.dmChangeHeadImg = function(userInfo) {
		try {
			// 如果数据为false
			if (!userInfo) {
				userInfo = {};
			}
			var headerImg = userInfo["bigIconPath"];
			// 头像初始化
			if (headerImg) {
				$('#headerPic').attr("src", '' + headerImg);
			} else {
				$('#headerPic').attr("src", '/resources/img/member/header.png');
			}
		} catch (ex) {
			console.log(ex);
		}
	}

	/**
	 * 收藏商品和收藏店铺tag切换
	 */
	$.dmClickTab = function() {
		try {
			var $dLi = $("ul.tabT li");
			// 给每个tab加上click事件
			$dLi.click(function() {
				$(this).addClass("on").siblings().removeClass("on");
			});
		} catch (ex) {
			console.log(ex);
		}

	}

	/**
	 * 购物车状态信息
	 */
	$.dmTopShopCar = function() {
		try {
			var topnav_tl = $("#header-top-shopcar").html();
			// 将模板编译成handlerbars对象
			var topnav_template = Handlebars.compile(topnav_tl);
			// 将模板与数据结合
			var url = "/sc/findScLst.ajax";
			var requestData = {
				isMerger : "true"
			};
			callService(url, requestData, {
				callSuccess : function(result) { // 调用后台服务
					// console.log("!!!!!!!!!!!!!!!!!!");
					if (result["data"] && result["data"].length) {
						var topcar_datas = result["data"]; // 编辑购物车的数据
					} else {
						var topcar_datas = []; // 编辑购物车的数据
					}

					var topnav_html = topnav_template(topcar_datas);
					// 将商品展示在购物车区里
					$(".top-car-con").html(topnav_html)
					var header_shopCar_Count = 0;
					if (result["data"] && result["data"].length) {
						header_shopCar_Count = result["data"].length;
					}
					// 展示购物车里商品数量
					$("[dm-actor='header_shopCar_Count']").html(header_shopCar_Count);
					if (header_shopCar_Count > 99) {
						$("#shopCtCountEm").html('99');
					} else {
						$("#shopCtCountEm").html(header_shopCar_Count);
					}
					// 给购物车里的删除按钮添加click事件
					$("[dm-actor='header-shopcar-delete']").one('click', $.dmClickShopcarDel);
				}
			});
		} catch (ex) {
			console.log(ex);
		}
	}

	/**
	 * 删除购物车商品处理
	 */
	$.dmClickShopcarDel = function() {
		try {
			// 单品id
			var itemId = $(this).attr("dm-data");
			var url = "/sc/delSc.ajax";
			var requestData = {
				"id" : itemId
			};
			callService(url, requestData, {
				callSuccess : function(result) {
					// 如果删除成功，则重新初始化购物车
					if (result.success) {
						jsAlert("删除商品成功！");
						$.dmTopShopCar();
						if ($("#tool").dmLoadToolBar) {
							$("#tool").dmLoadToolBar({
								"type" : "html"
							});
						}
						// $.dmLoadTool();
						if (initScList) {
							initScList();
						}
						// reCalcAll();
					} else {
						jsErrAlert("删除失败!!!");
					}
				}
			});
		} catch (ex) {
			console.log(ex);
		}
	}

	/**
	 * 收藏夹状态
	 */
	$.dmTopFav = function() {
		try {
			// console.info("$.dmTopFav-------修改收藏夹状态");
			// $.dmClickTab();
			var teml_tl = $("#header-top-fav").html();
			var topnav_template = Handlebars.compile(teml_tl);
			// 收藏商品的数据
			var url = "/fav/findGdFavLst.ajax";// 收藏URL
			var requestData = {};// 请求参数
			callService(url, requestData, {
				callSuccess : function(result) { // 调用后台服务
					// console.info("初始化我的收藏------------");
					// console.info(result);
					if (result["data"] && result["data"].length) {
						var facorite_datas = result["data"]; // 编辑收藏的数据
					} else {
						var facorite_datas = []; // 编辑收藏的数据
					}
					// 4 html
					var topnav_html = topnav_template(facorite_datas);
					/*
					 * console.info(facorite_datas); alert(topnav_html);
					 */
					// 5.show
					// 将商品展示在购物车区里
					$("[dm-actor='top-fav-gd']").html(topnav_html);

					// 展示商品数量
					// $("[dm-actor='header_shopCar_Count']").html(result["data"].length);

					// 给购物车里的删除按钮添加click事件
					$("[dm-actor='header-favGd-delete']").one('click', $.dmClickFavGdDel);

				}
			});
		} catch (ex) {
			console.log(ex);
		}
	}
	/**
	 * 收藏店铺状态
	 */
	$.dmTopFavStore = function() {
		try {

			// 收藏商品的数据
			var url = "/mf/findStoreFavorite.ajax";// 收藏URL
			var requestData = {};// 请求参数
			callService(url, requestData, {
				callSuccess : function(result) { // 调用后台服务
					// console.info("初始化我的收藏------------");
					// console.info(result);
					if (result && result.length) {
						var facorite_datas = result; // 编辑收藏的数据
					} else {
						var facorite_datas = []; // 编辑收藏的数据
					}
					// 4 html
					var teml_tl = $("#favorites_store_list").html();
					var topnav_template = Handlebars.compile(teml_tl);
					var topnav_html = topnav_template(facorite_datas);
					// 5.show
					// 将商品展示

					$("[dm-actor='top-fav-store']").html(topnav_html);

					// 给删除按钮添加click事件
					$("[dm-actor='header-store-delete']").one('click', $.dmClickFavStoreDel);

				}
			});
		} catch (ex) {
			console.log(ex);
		}
	}
	/**
	 * 顶部消息
	 */
	$.dmTopMsg = function() {
		try {
			var topnav_tl = $("#header-top-msg").html();
			// 将模板编译成handlerbars对象
			var topnav_template = Handlebars.compile(topnav_tl);
			var template_data = {};
			// 将模板与数据结合
			var topnav_html = topnav_template(template_data);
			// 将商品展示在购物车区里
			$("#station_message").replaceWith(topnav_html);
			$(".top-li-pop").mouseenter(function() {
				$(".mes-con").parents('.top-scoll').perfectScrollbar();
				$(".mes-set").parents('.top-scoll').perfectScrollbar();
				$(".mes-set").parents('.top-scoll').css("height", "250px");
				$(".top-car-con").parents('.top-scoll').perfectScrollbar();
				if ($(".ps-container .ps-scrollbar-y").parents("div").hasClass("top-scoll")) {
					$(".ps-container .ps-scrollbar-y ").css("background-color", "#c60401")
				}
				;
			})
			$(".Unread-mes h2 a").click(function() {
				$(".Unread-mes").animate({
					'margin-left' : '-250px'
				}, 500);
				$(".Set-mes").animate({
					'margin-right' : '0px'
				}, 500);
			})
			$(".Set-mes h2 u").click(function() {
				$(".Unread-mes").animate({
					'margin-left' : '0px'
				}, 500);
				$(".Set-mes").animate({
					'margin-right' : '-250px'
				}, 500);
			})
			$(".mes-c-o .right").click(function() {
				if ($(".mes-c-o").children("div").hasClass("mes-o")) {
					$(this).parent("div").removeClass("mes-o");
					$(this).parent("div").addClass("mes-c");
				}
				;
			})
			$(".mes-c-o .left").click(function() {
				if ($(".mes-c-o").children("div").hasClass("mes-c")) {
					$(this).parent("div").removeClass("mes-c");
					$(this).parent("div").addClass("mes-o");
				}
				;
			})
			$(".top-car-del").click(function() {
				$(this).parents(".top-car-goods").remove()
			})
			$("#station_message .top-li-pop").click(function() {
				return false;
			});
			$("#station_message #more").click(function() {
				location = "/notify/notifyList.jhtml";
				return false;
			})
			var message = null;
			getUnreadMessage = function() {
				callService("/notify/findTopMessage.ajax", {
					"messageType" : ""
				}, {
					callSuccess : function(data) {
						if (data.result) {
							if (data.content > -1) {
								$("#station_message_num").html(data.content);
							} else
								clearInterval(message);
						}
					},
					callError : function() {
						clearInterval(message);
					}
				});
			}
			// message=setInterval(function(){getUnreadMessage()},60000)
			getUnreadMessage();
			$("#station_message").mouseenter(function() {
				var content = $("#station_message_content");
				// 获取数据
				callService("/notify/findTopMessage.ajax", null, {
					callSuccess : function(data) {
						if (data.result) {
							if ((!!data.data) && data.data.length > 0) {
								content.html('');
								$.each(data.data, function(i, v) {
									var kk
									if (v.templateType == '50') {
										// 自动分析链接，然后进行数据组装
										var golook = $('<a href="javascript:void(0);">去看看</a>')
										kk = $("<p>" + v.message + "</p>");
										kk.append(golook);
										golook.click(function() {
											callService("/notify/statusChange.ajax", {
												id : v.id
											}, {
												callSuccess : function(data) {
													$.dm.jumpTo("/notify/findMessageInfo.jhtml", {
														id : v.id
													});
													// location="/notify/findMessageInfo.jhtml?id="+v.id;
												}
											})
											return false;
										})
									} else {
										kk = $("<p>" + v.message + "</p>");
										kk.find("a").each(function(x, y) {
											var y = $(y);
											var url = y.attr("href");
											y.attr("num", v.id);
											if (url != "#" && url != "" && url.indexOf("javascript:void") < 0) {
												var param = processParam(url);
												var url = processUrl(url);
												y.click(function() {
													$.dm.msgJump(this, url, param, {
														'method' : 'get'
													});
													return false;
												})
												y.attr("href", "javascript:void(0);");
											}
										});
									}
									content.append(kk);
								})
								// $("#station_message_num").html(data.content.length);
								$("#more").show();
							}
						}
					}
				})
				function processParam(url) {
					var result = {};
					var start = url.indexOf("?") + 1;
					if (start > 0) {
						var arr = url.substr(start).split("&");
						for ( var k in arr) {
							if ($.trim(arr[k])) {
								var content = arr[k].split("=");
								var k = content[0];
								var v = content[1];
								result[k] = v;
							}
						}
					}
					return result;
				}
				function processUrl(url) {
					var end = url.indexOf("?");
					if (end < 0)
						return url;
					return url.substr(0, end);
				}
			});
		} catch (ex) {
			console.log(ex);
		}
	}

	/**
	 * 删除收藏商品
	 */
	$.dmClickFavGdDel = function() {
		try {
			// 单品id
			var itemId = $(this).attr("dm-data");
			// console.info(itemId);
			var url = "/fav/delGdFav.ajax";
			var requestData = {
				"id" : itemId
			};
			/*
			 * callService(url, requestData, { callSuccess : function(result){ //
			 * 如果删除成功，则重新初始化购物车 if(result && result["data"]){
			 * jsAlert("顶部工具栏中删除收藏商品成功!!!"); if($(".topnav").dmHeaderBar){
			 * $(".topnav").dmHeaderBar({"type":"replaceWith"}); }
			 * if($("#tool").dmLoadToolBar){
			 * $("#tool").dmLoadToolBar({"type":"html"}); } if(initGoodsList){
			 * initGoodsList(); } //$.dmLoadTool(); }else{ // TODO 提示删除失败
			 * jsErrAlert("顶部工具栏中删除收藏商品失败!!!"); } } });
			 */
			// 实现取消收藏商品功能
			$.dmDelGoodsToFav({
				"favId" : itemId
			});
		} catch (ex) {
			console.log(ex);
		}
	}

	/**
	 * 删除收藏店铺
	 */
	$.dmClickFavStoreDel = function() {
		try {
			// 单品id
			var itemId = $(this).attr("dm-data");
			// console.info(itemId);
			var url = "/mf/deleteStoreFavorite.ajax";
			var requestData = {
				"id" : itemId
			};
			callService(url, requestData, {
				callSuccess : function(result) {
					// 如果删除成功，则重新初始化购物车
					if (result) {
						jsAlert("顶部工具栏中删除店铺成功!!!");
						if ($("#tool").dmLoadToolBar) {
							$("#tool").dmLoadToolBar({
								"type" : "html"
							});
						}
						if ($(".topnav").dmHeaderBar) {
							$(".topnav").dmHeaderBar({
								"type" : "replaceWith"
							});
						}
						if (findStoreFavorite) {
							findStoreFavorite();
						}
						// $.dmLoadTool();
					} else {
						// TODO 提示删除失败
						jsErrAlert("顶部工具栏中删除店铺失败!!!");
					}
				}
			});
		} catch (ex) {
			console.log(ex);
		}
	};

	/**
	 * 设置平台QQ
	 */
	$.dmSetQQ = function() {
		try {
			var url = "/customService/getQQ.ajax";
			var requestData = {};
			callService(url, requestData, {
				callSuccess : function(result) {
					if (result.success) {
						$("#setQQ").attr("href", "javascript:QQtalk('1739073619');");
					}
				}
			});
		} catch (ex) {
			console.log(ex);
		}
	};

})(jQuery);
function chgColor(obj) {
	var myColor = $(obj).css("color");
	$("[dm-actor='headerfovGoods']").css("color", "#c60401");
	$("[dm-actor='headerfovStore']").css("color", "#c60401");
	$(obj).css("color", "#E0A41A");// c
}
