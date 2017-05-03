// 商品api命名空间
var memberApi = {};
memberApi.delFav = {"afterDelSuccess":{}};
/**
 * 商品相关操作api
 */
(function($){
	
	/**
	 * 跳转到我的收藏列表页
	 */
	memberApi.jumpToGoodsFavList = function(){
		try{
			// 跳转到购物车路径
			var url = "/fav/toList.jhtml";
			// 参数
			var params = {};
			// 跳转到购物车列表
			$.dm.jumpTo(url, params);
		}catch(ex){
			console.log(ex);
		}
	};
	
	/**
	 * 查询是否是商品收藏夹里的商品
	 */
	memberApi.isGoodsFavorite = function(goodsId,success,error){
		try{
			var url = "/fav/isGoodsFavorite.ajax";
			var params = {"id":goodsId};
			callService(url
						,params
						,{callSuccess:function(result){
							success(result);
							}
						,callError:function(status,text){
							// 后台访问失败
							error(status,text);
							}
						});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 查询是否是商品收藏夹里的商品
	 */
	memberApi.isGoodsListFavorite = function(goodsIds,success,error){
		try{
			var url = "/fav/isGoodsListFavorite.ajax";
			var params = {"ids":goodsIds};
			callService(url
					,params
					,{callSuccess:function(result){
						success(result);
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 查询当前商品是否是收藏夹里的商品
	 */
	memberApi.findGoodsFavoriteIdListByMemberAndGoods = function(goodsId,success,error){
		try{
			var url = "/fav/findGoodsFavoriteIdListByMemberAndGoods.ajax";
			var params = {"id":goodsId};
			callService(url
					,params
					,{callSuccess:function(result){
						if(result && result["data"]){
							// 收藏商品成功
							success(result);
						}else{
							// 收藏商品失败
							error(result);
						}
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	
	/**
	 * 查询当前商品被收藏的数量
	 */
	memberApi.findGoodsFavoriteCountByGoodsId = function(goodsId,success,error){
		try{
			var url = "/gd/findGoodsFavoriteIdListByGoodsId.ajax";
			var params = {"goodsId":goodsId};
			callService(url
					,params
					,{callSuccess:function(result){
						success(result);
					}
			,callError:function(status,text,datas){
				// 后台访问失败
				error(status,text,datas);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	
	/**
	 * 查询商品收藏夹里的商品列表
	 */
	memberApi.findGoodsFavoriteList = function(success,error){
		try{
			var url = "/fav/findGdFavLst.ajax";
			var params = {};
			callService(url
					,params
					,{callSuccess:function(result){
						success(result);
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 将商品加入收藏夹
	 * 
	 * goodsId 要收藏的商品ID
	 * success 收藏成功时回调的方法
	 * error 收藏失败时或访问后台失败时的回调方法
	 */
	memberApi.addToGoodsFavorite = function(goodsId,success,error){
		try{
			var url = "/fav/addToGdFav.ajax";
			var params = {"id":goodsId};
			// {id:dm_data}
			callService(url
						,params
						,{callSuccess:function(result){
							if(result && result["data"]){
								// 收藏商品成功
								success(result);
							}else{
								// 收藏商品失败
								error(result);
							}
							}
						,callError:function(status,text){
							console.log("memberApi.addToGoodsFavorite");
							console.log(status+"==="+text);
							// 后台访问失败
							error(status,text);
							}
						});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 将商品移出收藏夹
	 * 
	 * goodsId 要收藏的商品ID
	 * success 收藏成功时回调的方法
	 * error 收藏失败时或访问后台失败时的回调方法
	 */
	memberApi.delGoodsFavorite = function(goodsId,success,error){
		try{
			var url = "/fav/delGdFav.ajax";
			var params = {"id":goodsId};
			// {id:dm_data}
			callService(url
					,params
					,{callSuccess:function(result){
						if(result && result["data"]){
							// 收藏商品成功
							success(result);
						}else{
							// 收藏商品失败
							error(result);
						}
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 将商品批量加入收藏夹
	 * 
	 * goodsId 要收藏的商品ID
	 * success 收藏成功时回调的方法
	 * error 收藏失败时或访问后台失败时的回调方法
	 */
	memberApi.addGoodsListToFavrite = function(goodsIdList,success,error){
		try{
			var addToGdFavUrl = "/fav/addToGdFavLst.ajax";
			var params = {"ids":goodsIdList};
			// {id:dm_data}
			callService(addToGdFavUrl
					,params
					,{callSuccess:function(result){
						if(result && result["data"]){
							// 收藏商品成功
							success(result);
						}else{
							// 收藏商品失败
							error(result);
						}
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	
	/**
	 * 将商品批量移出收藏夹
	 * 
	 * goodsId 要收藏的商品ID
	 * success 收藏成功时回调的方法
	 * error 收藏失败时或访问后台失败时的回调方法
	 */
	memberApi.delGoodsFavoriteList = function(goodsIdList,success,error){
		try{
			var url = "/fav/delGdFavLst.ajax";
			var params = {"ids":goodsIdList};
			callService(url
					,params
					,{callSuccess:function(result){
						if(result && result["data"]){
							// 收藏商品成功
							success(result);
						}else{
							// 收藏商品失败
							error(result);
						}
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 将店铺加入收藏夹
	 * 
	 * goodsId 要收藏的商品ID
	 * success 收藏成功时回调的方法
	 * error 收藏失败时或访问后台失败时的回调方法
	 */
	memberApi.addStoreToFavrite = function(storeId,success,error){
		try{
			var url = "/fav/addToStoFav.ajax";
			var params = {"id":storeId};
			callService(url
					,params
					,{callSuccess:function(result){
						if(result && result["data"]){
							// 收藏商品成功
							success(result);
						}else{
							// 收藏商品失败
							error(result);
						}
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 将店铺移出收藏夹
	 * 
	 * goodsId 要收藏的商品ID
	 * success 收藏成功时回调的方法
	 * error 收藏失败时或访问后台失败时的回调方法
	 */
	memberApi.delStoreFavorite = function(storeId,success,error){
		try{
			var url = "/fav/delStoFav.ajax";
			var params = {"id":storeId};
			callService(url
					,params
					,{callSuccess:function(result){
						if(result && result["data"]){
							// 收藏商品成功
							success(result);
						}else{
							// 收藏商品失败
							error(result);
						}
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 将店铺批量加入收藏夹
	 * 
	 * goodsId 要收藏的商品ID
	 * success 收藏成功时回调的方法
	 * error 收藏失败时或访问后台失败时的回调方法
	 */
	memberApi.addStoreListToFavrite = function(storeIdList,success,error){
		try{
			var url = "/fav/addToStoFavLst.ajax";
			var params = {"ids":storeIdList};
			callService(url
					,params
					,{callSuccess:function(result){
						if(result && result["data"]){
							// 收藏商品成功
							success(result);
						}else{
							// 收藏商品失败
							error(result);
						}
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 将店铺批量移出收藏夹
	 * 
	 * goodsId 要收藏的商品ID
	 * success 收藏成功时回调的方法
	 * error 收藏失败时或访问后台失败时的回调方法
	 */
	memberApi.delStoreFavoriteList = function(storeIdList,success,error){
		try{
			var url = "/fav/delStoFavLst.ajax";
			var params = {"ids":storeIdList};
			callService(url
					,params
					,{callSuccess:function(result){
						if(result && result["data"]){
							// 收藏商品成功
							success(result);
						}else{
							// 收藏商品失败
							error(result);
						}
					}
			,callError:function(status,text){
				// 后台访问失败
				error(status,text);
			}
			});
		}catch(ex){
			console.log(ex);
		}
	}
	
	//初始化动作
	var initActor=function(){
		$(document).on('click','[dm-actor]',function(){
			var $actor=$(this);
			var actor=$actor.attr('dm-actor');
//			if(actor==='gd2sc-info-close'){
//				$('[dm-container="gd2sc-info"]').hide();
//			}
			if(actor==='gd2fav-info-close'){
				$('[dm-container="gd2fav-info"]').hide();
			}
		});
	};
	
	initActor();
	
	/**
	 * 如果商品未被收藏，则添加收藏
	 */
	$.dmGoodsIsNotFavBefore = function(options,callback){
		try{
			var goodsId = options["goodsId"];
			memberApi.addToGoodsFavorite(goodsId
					,function(result){
						try{
							if(!result["isLoged"]){
								jsErrAlert("您还未登录，请先登录");
								callback(false,result);
							}else{
								/*if(playFavAni){
								playFavAni();
								}*/
								// 刷新顶部工具栏
								if($("#tool").dmLoadToolBar){
									$("#tool").dmLoadToolBar({"type":"html"});
								}
								// 刷新右侧工具栏
								if($(".topnav").dmHeaderBar){
									$(".topnav").dmHeaderBar({"type":"replaceWith"});
								}
							}
							
							}catch(ex){
								console.log(ex);
							}
							jsAlert("收藏商品成功！");	
							$("[dm-actor='alert-message-ok']").focus();
						// 同步根跟新头部和侧边工具栏
						callback(true,result);
						}
					,function(result){
								if(!result["isLoged"]){
									jsErrAlert("您还未登录，请先登录");
									callback(false,result);
								}else{
									jsErrAlert("收藏失败！！！");
									callback(false,result);
								}
								
						});
		}catch(ex){
			console.log(ex);
		}
	}
	
	/**
	 * 将单件商品加入收藏夹
	 */
	$.dmAddGoodsToFav = function(options,callback){
		try{
			options = options || {};
			var goodsId = options["goodsId"];
			// 如果有商品Id，才能收藏
			if(goodsId){
				memberApi.isGoodsFavorite(goodsId,function(result){
					if(result && result["data"]){
						//jsErrAlert("你已收藏过该商品！");
						$("[dm-actor='alert-message-ok']").focus();
						if(callback){
							callback(false);
						}
					}else{
						// 商品之前没被收藏
						$.dmGoodsIsNotFavBefore(options,callback);
					}
					
				},function(){
					jsErrAlert("收藏失败！");
					$("[dm-actor='alert-message-ok']").focus();
					if(callback){
						callback(false);
					}
				});
				
			}else{
				jsErrAlert("请选择要收藏的商品！");
				$("[dm-actor='alert-message-ok']").focus();
				if(callback){
					callback(false);
				}
			}
		}catch(ex){
			console.log(ex);
		}
	};
	
	/**
	 * 将多件商品加入收藏夹
	 */
	$.dmAddGoodsListToFav = function(options,callback){
		try{
			options = options || {};
			var goodsIds = options["goodsIds"];//关系型数组
			// 如果有商品Id，才能收藏
			if(goodsIds){
				memberApi.isGoodsListFavorite(goodsIds,function(result){
					if(result && result["data"]){
						var beFavedIds = result["beFavedIds"] || [];
						beFavedIds = beFavedIds.join(",");
						jsAlert("全部商品已被收藏！");
						$("[dm-actor='alert-message-ok']").focus();
						if(callback){
							callback(false,beFavedIds);
						}
					}else{
						// 商品集合之前未被收藏，加入收藏
						$.dmGoodsListIsNotFavBefore(options,callback);
					}
					
				},function(){
					jsErrAlert("收藏失败！");
					$("[dm-actor='alert-message-ok']").focus();
					if(callback){
						callback(false);
					}
				});
				
			}else{
				jsErrAlert("请选择要收藏的商品！");
				$("[dm-actor='alert-message-ok']").focus();
				if(callback){
					callback(false);
				}
			}
		}catch(ex){
			console.log(ex);
		}
	};
	
	/**
	 * 如果商品集合未被收藏，则添加收藏
	 */
	$.dmGoodsListIsNotFavBefore = function(options,callback){
		try{
			var goodsIds = options["goodsIds"];
			memberApi.addGoodsListToFavrite(goodsIds
					,function(result){
						try{
							if(!result["isLoged"]){
								jsErrAlert("您还未登录，请先登录");
								callback(false,result);
							}else{
								/*if(playFavAni){
								playFavAni();
								}*/
								// 刷新顶部工具栏
								if($("#tool").dmLoadToolBar){
									$("#tool").dmLoadToolBar({"type":"html"});
								}
								// 刷新右侧工具栏
								if($(".topnav").dmHeaderBar){
									$(".topnav").dmHeaderBar({"type":"replaceWith"});
								}
							}
							
							}catch(ex){
								console.log(ex);
							}
							jsAlert("收藏商品成功！");
							$("[dm-actor='alert-message-ok']").focus();
						// 同步根跟新头部和侧边工具栏
							if(callback){
								callback(true,result);
							}
						}
					,function(result){
						console.log(result);
								if(!result["isLoged"]){
									jsErrAlert("您还未登录，请先登录");
									callback(false,result);
								}else{
									jsErrAlert("收藏失败！！！");
									callback(false,result);
								}
								
						});
		}catch(ex){
			console.log(ex);
		}
	}
	
	
	/**
	 * 将商品移出收藏夹
	 */
	$.dmDelGoodsToFav = function(options,callback){
		try{
			options = options || {};
			var favId = options["favId"];
			// 如果有商品Id，才能删除
			if(favId){
				memberApi.delGoodsFavorite(favId
						,function(result){
					try{
						/*if(playFavAni){
							playFavAni();
						}*/
						// 刷新顶部工具栏
						if($("#tool").dmLoadToolBar){
							$("#tool").dmLoadToolBar({"type":"html"});
						}
						// 刷新右侧工具栏
						if($(".topnav").dmHeaderBar){
							$(".topnav").dmHeaderBar({"type":"replaceWith"});
						}
						
						// 同步删除
						for(var key in memberApi.delFav){
							try{
								//jsAlert("key: "+key);
								var afterDelFun = memberApi.delFav[key];
								try{
									afterDelFun();
									}catch(ex){console.log(ex);}
							}catch(ex){
								console.log(ex);
							}
							
						}
						
						}catch(ex){
							console.log(ex);
						}
					// 同步根跟新头部和侧边工具栏
						jsAlert("取消收藏成功");
						callback(true,result);
				}
				,function(result){
					if(!result["hasMember"]){
						callback(false,result);
					}else{
						jsErrAlert.log("取消收藏失败！！！");
						callback(false,result);
					}
					
				});
			}else{
				jsErrAlert("请选择要取消收藏的商品！");
				if(callback){
					callback(false);
				}
			}
		}catch(ex){
			console.log(ex);
		}
	};

})(jQuery);