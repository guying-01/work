// JavaScript Document
$(document).ready(function(e) {
    $('.sorting a u').css('width', '0px');
	$('.sorting a').click(function() {
        $(this).children('i').css('color', '#f37052');
        $(this).siblings('a').children('i').css('color', '#000');
        $(this).children('u').css('width', '9px');
		$(this).children('u').toggleClass('sorting_bot');
        $(this).siblings('a').children('u').removeClass('sorting_bot').css('width', '0px');
    });

});