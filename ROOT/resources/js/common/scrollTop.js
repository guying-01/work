// JavaScript Document
$(document).ready(function () {
// 返回顶部
$("#scrollTop").click(function(){
	$("body").animate({scrollTop: '0px'}, 800)
	})
$(document).scroll(function(){
	if(($(document).scrollTop())>0){
	$(".Top").show(100)
		}else{$(".Top").hide(100)}})
})
