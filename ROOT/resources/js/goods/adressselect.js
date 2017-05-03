$(document).ready(function() {
    $(".detail-adress i").click(function() {
        $(this).parent().children(".detailcx2").toggle();
        $(this).toggleClass('detail-adress-i');
        $(this).parent().siblings().children("i").removeClass('detail-adress-i');
        $(this).parent().siblings().children(".detailcx2").hide();
    });
    $(document).bind("click",
    function(e) {
        var target = $(e.target);
        if (target.closest('.detail-adress').children('i').length == 0) {
            $(".detailcx2").hide();
            $('.detail-adress i').removeClass('detail-adress-i');
        }

    });
    $('.evaluationImg li img').click(function() {
        $(".evaluationImg-big").empty();
        $(this).siblings('u').toggle().parent('li').siblings('li').children('u').hide();
        $(".evaluationImg-big").show();
        $(this).clone().prependTo(".evaluationImg-big");
    });
    $('.evaluationImg li u').click(function() {
        $(".evaluationImg-big").empty().hide();
        $(this).hide();
    });

    $(".evaluationImg-big").click(function() {
        $(this).empty().hide();
        $('.evaluationImg li').children('u').hide();
    });
	$("input:text").focus(function(){
		$(this).siblings("p").fadeOut();
		$(this).parents('.loginStyleA').css({'border-color':'#db0401'})
		});
	$("input").blur(function(){
		if($(this).val().length==0){
			$(this).siblings("p").fadeIn();
			$(this).parents('.loginStyleA').css({'border-color':'#d0d0d0'})
			}	
		});

})