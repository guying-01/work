// JavaScript Document
$(function() {
	$("input:text").focus(function() {
		   $(this).siblings("p").hide();
        $(this).parents('.loginStyleA').css({
            'border-color': '#db0401'
        })
    });
    $("input").blur(function() {
        if ($(this).val().length == 0) {
            $(this).siblings("p").fadeIn();
            $(this).parents('.loginStyleA').css({
                'border-color': '#d0d0d0'
            })
        }
    });
});
