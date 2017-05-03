// JavaScript Document
$(document).ready(function() {
    $(".goodsdelete").click(function() {
        $(".cx2").fadeIn()
    });

	$(".goodsdelete-B").click(function() {
        $(".cx2").fadeIn()
    })
    
    $(".bigimg").live("click",function(){
        $(".bigimg_up").fadeIn();
        $(this).parent().siblings("img").clone().prependTo(".bigimg_up div p");
        var H=$(window).height();
        $(".bigimg_up div p img").css({'max-height':H})
     }); 
     $(".bigimg_up div p").live("click",function(){
        $(this).empty();
        $(this).parent().parent(".bigimg_up").fadeOut();
     });

})