var fav_st_tl;
var fav_gd_tl;
var fav_not_tl;

$(document).ready(function (){
	//初始化模板
	fav_st_tl = Handlebars.compile($('#fav-st-tl').html());
	fav_gd_tl = Handlebars.compile($('#fav-gd-tl').html());
	fav_not_tl = Handlebars.compile($('#fav-not-tl').html());
	initGoodsList();
	

	initActors();
	
	// 实现删除同步
	memberApi.delFav.afterDelSuccess = function(){
		initGoodsList();
	};
	var tab_num=document.location.href.split('#');
	if(tab_num[1]){
		ChangeDiv('1','JKDiva_',0);
		$('#storeLi').addClass("on").siblings().removeClass("on");
		findStoreFavorite();
	}
	
});

var initGoodsList=function(){
	var $goods_list=$('[dm-container="fav-gd"]');
	clearItems($goods_list,'fav-gd-item');
	callService('/fav/findGdFavLst.ajax', {},{callSuccess:function(data){
		data.data=data.data.reverse();
		if(data && data.data && data.data.length>0){
			$(data.data).each(function(i,item){
				item.salesPrice=fmoney(item.salesPrice,2);
				item.marketPrice = fmoney(item.marketPrice,2);
				show_goods($goods_list, item);
			});
		} else {
			show_not_data($goods_list, {itemName:'商品'});
		}
	}});
};

var initActors=function(){
	$(document).on('click','[dm-actor]',function(){
		var $actor=$(this);
		var actor=$actor.attr('dm-actor');
		var dm_data=$actor.attr('dm-data');

		if(actor=="fav-gd-del"){
			jsConfirm('确定删除吗？',{callback:function(result){
		           if(result){
		        	   callService(dm_ctx+'/fav/delGdFav.ajax',
		   					{id:dm_data},{callSuccess:function(data){
		   				if(data){
		   					$('[dm-container="fav-gd-item"][dm-data="'+dm_data+'"]').remove();
		   					var $goods_list=$('[dm-container="fav-gd"]');
		   					//删除商品时，同步顶部工具栏和侧边工具栏
		   					if($("#tool").dmLoadToolBar){
		   						$("#tool").dmLoadToolBar({"type":"html"});
		   					}
		   					if($(".topnav").dmHeaderBar){
		   						$(".topnav").dmHeaderBar({"type":"replaceWith"});
		   					}
		   					if($('[dm-container="fav-gd-item"]').length==0){
		   						show_not_data($goods_list, {itemName:'商品'});
		   					}
		   				}
		   			}});
		           }
		       }
		     });
			
		}
	});
};
var clearItems=function($container, containerType){
	$container.find('[dm-container="fav-gd-item"]').remove();
};
var show_not_data=function($container, data){
	var fav_not_tl_html=fav_not_tl(data);

	$container.append($(fav_not_tl_html));
};
var flag=true;
var show_goods=function($container, data){ //回调页面
	var fav_gd_tl_html=fav_gd_tl(data);

	$container.append($(fav_gd_tl_html));
	f_img($(".aaa"),$(".collection-goods"),"0.6rem");
};
function f_img(pic,box,left) {
	//图片居中方法
	var sh=pic.height();
	var lh=box.outerHeight();
	var num=(lh-sh)/2;
	pic.css({"top":num,"left":left});
}

function selectAll (){
	var maxNum=0
	//全选按钮开始
	$(".circle-gy").each(function(){
		if($(this).hasClass('checked')){
          maxNum++
		}
	})
	if(maxNum==$(".circle-gy").length){
		   $(".circle-gy").removeClass('checked')
	   }
	   else{
		   $(".circle-gy").addClass('checked')
	   }
	//全选按钮结束
}

function editBtn(){
	//编辑按钮开始
		if(flag){
			$(".select").animate({"bottom":"0.87rem"},"slow")
			$(".circle-gy").css("display","block");

			flag=false
		}
		else{
			$(".select").animate({"bottom":0},"slow")
			$(".circle-gy").css("display","none").removeClass('checked');


			flag=true
		}

	//编辑按钮结束
}
function contact(mm){

		$(mm).siblings(".hiddenpt").fadeToggle()


}
function jChoose(i){
	$(i).toggleClass("checked");
	//判断打勾状态结束
}

//取消收藏商铺开始
$(document).on('click','.leftpart',function(){
	var $actor=$(this).closest(".hiddenpt").siblings(".delete");
	var actor=$actor.attr('dm-actor');
	var dm_data=$actor.attr('dm-data');
	if(actor=="fav-sto-del"){
		jsConfirm('确定取消收藏吗？',{callback:function(result){
			if(result){
				callService('/mf/deleteStoreFavorite.ajax',
					{id:dm_data},{callSuccess:function(data){
						if(data){
							$('[dm-container="fav-sto-item"][dm-data="'+dm_data+'"]').remove();
							//var $goods_list=$('[dm-container="fav-gd"]');
							////删除商品时，同步顶部工具栏和侧边工具栏
							//if($("#tool").dmLoadToolBar){
							//	$("#tool").dmLoadToolBar({"type":"html"});
							//}
							//if($(".topnav").dmHeaderBar){
							//	$(".topnav").dmHeaderBar({"type":"replaceWith"});
							//}
							//if($('[dm-container="fav-gd-item"]').length==0){
							//	show_not_data($goods_list, {itemName:'商品'});
							//}
						}
					}});
			}
		}
		});

	}
});

//取消收藏商铺结束

//删除收藏商品按钮开始
function del(){
	$(".circle-gy").each(function(){
		if($(this).hasClass('checked')){
		   $(this).parents('.collection-goods').addClass('checked')
		}
		})
	var dm_data=[]

	var $actor=$(".collection-goods.checked")
	$actor.each(function () {
		dm_data.push($(this).attr('dm-data'))
	})
	var actor=$actor.attr('dm-actor');
	var num=$(".circle-gy.checked").length
	if(num==0){
		jsAlert('请至少选择一件商品')
	}
	else{
		jsConfirm('确定删除吗？',{callback:function(result){
			if(result){
				dm_data.forEach(function(v,i){
					callService(dm_ctx+'/fav/delGdFav.ajax',
						{id:dm_data[i]},{callSuccess:function(data){
							if(data){
								$actor.remove()
								editBtn()
								//var $goods_list=$('[dm-container="fav-gd"]');
								////删除商品时，同步顶部工具栏和侧边工具栏
								//if($("#tool").dmLoadToolBar){
								//	$("#tool").dmLoadToolBar({"type":"html"});
								//}
								//if($(".topnav").dmHeaderBar){
								//	$(".topnav").dmHeaderBar({"type":"replaceWith"});
								//}
								//if($('[dm-container="fav-gd-item"]').length==0){
								//	show_not_data($goods_list, {itemName:'商品'});
								//}
							}
						}});
				})

			}
		  }
		})
	}



}
//删除收藏按钮结束


   





