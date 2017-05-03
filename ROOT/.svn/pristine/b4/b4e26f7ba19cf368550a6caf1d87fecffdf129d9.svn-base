// JavaScript Document
  $(document).ready(function () {
//失效商品
  if($(".cartable-td div span").hasClass("failure")){$(".failure").parent().parent(".cartable-td").addClass("gray")}else{};
  
//购物车底部操作栏，可浮动
if(($(".tableheight").height()+156)>=($(window).height())){
	$(".bottomWidth").addClass("bottom-navB")
	}else{}
 $(document).scroll(function(){
	 if(($(document).scrollTop())>=($(".tableheight").height()+156-$(window).height())){
			$(".bottomWidth").removeClass("bottom-navB")
	 }else{$(".bottomWidth").addClass("bottom-navB")}})

//删除商品
		  $(".deletegoods").click(function(){
			  $(".cx2").fadeIn()
			  
			  $(".pop_up_button a").click(function(){
				  if($(this).hasClass("queding")){
				$(this).parents(".goods").remove()
				 }else{ $(".cx2").fadeOut()}
				  
				  
				  })
			 
		})
 })
  