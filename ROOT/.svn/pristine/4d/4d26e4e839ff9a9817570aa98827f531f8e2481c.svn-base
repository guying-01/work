// JavaScript Document
$(function(){			
	$(".jqzoom").jqueryzoom({
		xzoom:400,
		yzoom:400,
		offset:1,
		position:"right",
		preload:1,
		lens:1
	});

	$("#spec-list").jdMarquee({
		deriction:"left",
		width:330,
		height:56,
		step:2,
		speed:4,
		delay:10,
		control:true,
		_front:"#spec-right",
		_back:"#spec-left"
	});
	bindMouseOver();
	
});		
/**
 * 绑定鼠标悬停事件 by geshuo 20151208
 * */
function bindMouseOver(){
	
	$("#spec-list img").bind("mouseover",function(){
		var src=$(this).attr("src");
		$("#spec-n1 img").eq(0).attr({
			src:src.replace("\/n5\/","\/n1\/"),
			jqimg:src.replace("\/n5\/","\/n0\/")
		});
		$('[data-name="bigPicture"]').eq(0).attr({
			src:src.replace("\/n5\/","\/n1\/"),
			jqimg:src.replace("\/n5\/","\/n0\/")
		});
		$(this).addClass("specbor");
		$(this).parent().siblings().children("img").removeClass("specbor");
		$(this).parent().parent().siblings().children("li").children("img").removeClass("specbor");
	})	
	
}