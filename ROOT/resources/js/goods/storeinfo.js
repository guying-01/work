$(document).ready(function(){	
			callService('/st/storeInfo.ajax',{storeId:storeId},
			{callSuccess:function(data){
				if(data.storeLogo == null){
					data.storeLogo='/resources/img/common/storeUser.jpg';
				}
				var storeInfo = $("#storeInfo").html();//获得字符串
				var storeInfo_handlebars = Handlebars.compile(storeInfo);//获得handlebars对象
				var strHtml=storeInfo_handlebars(data);//获得字符串
				$("#shop-informaiton").append(strHtml);
				
				//liqiang  tj
				
				$('body').trigger('tj.sp');
			}
			});		 
});
/*//点击"收藏店铺"
$('#collect').live('click', function() {
			//局部遮罩锁定 开始
			var blank_area=$(".shop-informaiton-bt");
			$.dm.block(blank_area);
			
			callService('/mf/addSgMemberStoreFavorite.ajax', {
				storeId : storeId
			}, {
				callSuccess : function(data) {
					if (data > 0) {
						jsAlert("收藏成功");
					} else {
						jsAlert("已收藏 ");
					}
				}
			});
			//局部遮罩锁定 结束
			//局部遮罩解锁 开始
			$.dm.unblock(blank_area);
			//局部遮罩解锁 结束
});
*/