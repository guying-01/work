$(document).ready(function() {
	guessInterested();
});

// 同类商品
function guessInterested() {
	var category = $('#category').val();
	callService(
			"/gd/findInterested.ajax",
			{
				"category" : category
			},
			{
				callSuccess : function(data) {
					if (data.length > 0) {
						var proSource = $("#guessInterested").html();// 取得模板
						var proTemplate = Handlebars.compile(proSource);// 生成HanDlebars对象
						for ( var i in data) {
							data[i].salesMinPrice = fmoney(data[i].salesMinPrice, 2);
						}
						;
						var proHtml = proTemplate(data);
						$("[dm-container='relativeGoods']").html(proHtml);
						$("[dm-container='relativeGoods']").children(".nullA").remove();
					} else {
						$("[dm-container='relativeGoods']")
								.html(
										'<div class="nullA" style="padding:50px 0 30px 0"><img src="/resources/img/member/null2.png" width="48" height="45" class="left m-t-5"><div class="left"><P>还没有同类商品哦~~~</P><P>去 <a href="../index.jhtml">随便逛逛</a>吧，看看有没有合适的~</P></div></div>');
					}
				}
			});
}

// 最近收藏的
function recentFav() {
	callService(
			"/fav/findGdFavLst.ajax",
			{},
			{
				callSuccess : function(data) {
					
					var proSource = $("#recentFav").html();// 取得模板
					var proTemplate = Handlebars.compile(proSource);// 生成HanDlebars对象
					var proData = data.data;
					var finalList = new Array();
					for ( var i in proData) {
						if (i < 6) {
							proData[i].marketPrice = fmoney(proData[i].marketPrice, 2);
							finalList.push(proData[i]);
						} else {
							break;
						}
					}
					;
					var proHtml = proTemplate(finalList);
					$("[dm-container='relativeGoods']").html(proHtml);
					if ($("[dm-container='relativeGoods']").children("div").hasClass("goods")) {
						$("[dm-container='relativeGoods']").children(".nullA");
					} else {
						$("[dm-container='relativeGoods']")
								.html(
										'<div class="nullA" style="padding:50px 0 30px 0"><img src="/resources/img/member/null2.png" width="48" height="45" class="left m-t-5"><div class="left"><P>你还没收藏过宝贝哦~~~</P><P>去 <a href="../index.jhtml">随便逛逛</a>吧，看看有没有喜欢的~</P></div></div>');
					}
				}
			});
}

// 最近浏览的
function recentSearch() {
	callService(
			"/member/findBrowseHistory.ajax",
			{},
			{
				async : false,
				callSuccess : function(result) {
					if (!result) {
						return;
					}
					var reultsList = new Array();
					var finalList = new Array();
					var ids = new Array();
					for ( var item in result) {
						ids.push(result[item].goodsId);
					}
					if (ids.length != 0) {
						var requestData = {
							"ids" : ids
						};
						var url = "/gd/findGoodsInfoByIds.ajax";
						// 想后台服务获取数据
						callService(url, requestData, {
							callSuccess : function(goodsList) {
								for (var i = 0; i < goodsList.length; i++) {
									var id = goodsList[i].id;
									var name = goodsList[i].name;
									var goodsPic = "";
									if (goodsList[i].sgItemPictureFormList != 0) {
										goodsPic = goodsList[i].sgItemPictureFormList[0].bigPicturePath;
									}
									var minSalesPrice = goodsList[i].minSalesPrice;
									var goodsInfo = {
										'id' : id,
										'name' : name,
										'goodsPic' : goodsPic,
										'minSalesPrice' : minSalesPrice
									};
									reultsList.push(goodsInfo);
								}
								for ( var i in reultsList) {
									if (i < 6) {
										finalList.push(reultsList[i]);
										for ( var i in reultsList) {
											if (i < 6) {
												reultsList[i].minSalesPrice = fmoney(reultsList[i].minSalesPrice, 2);
											} else {
												break;
											}
										}
									} else {
										break;
									}
								}
								var proSource = $("#recentSearch").html();// 取得模板
								var proTemplate = Handlebars.compile(proSource);// 生成HanDlebars对象
								var proData = finalList;// 创建数据对象
								var proHtml = proTemplate(proData);
								$("[dm-container='relativeGoods']").html(proHtml);
							}
						});
					} else {
						$('.goods').remove();
						$("[dm-container='relativeGoods']")
								.html(
										'<div class="nullA" style="padding:50px 0 30px 0"><img src="/resources/img/member/null3.png" class="left m-t-5"><div class="left"><P>你什么都没有看过呢~赶紧去逛两圈吧~~</P><P>去 <a href="../index.jhtml">随便逛逛</a>吧~</P></div></div>');
					}
				}
			});
}

function recentGoods(type) {
	$('#recentType').val(type);
	switch (parseInt(type)) {
	case 1:// 同类商品
		guessInterested();
		break;
	case 2:// 最近收藏的
		recentFav();
		break;
	case 3:// 最近浏览的
		recentSearch();
		break;
	}
}
