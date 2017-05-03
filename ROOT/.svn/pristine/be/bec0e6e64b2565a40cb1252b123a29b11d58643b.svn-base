// JavaScript Document
$(function() {
	$('.footprint h3 u').css({'background':'url(/resources/img/common/ico01.png) no-repeat -266px -160px'})
    var footprintUL = $('.footprint ul').length;
    $(window).scroll(function() {
        for (i = 0; i <= footprintUL; i++) {
            var ulHeightnPre = $('.footprint ul').eq(i - 1).offset().top;
			if(i==1){if (($(window).scrollTop()) >= (ulHeightnPre)) {
                $('.footprintDate').eq(i-1).addClass('footprintDateFix')
				$('.footprintDate').eq(i-2).removeClass('footprintDateFix')
            }else{
                $('.footprintDate').eq(i-1).removeClass('footprintDateFix')
            };}else{  if (($(document).scrollTop()) >= (ulHeightnPre-50)) {
                $('.footprintDate').eq(i-1).addClass('footprintDateFix')
				$('.footprintDate').eq(i-2).removeClass('footprintDateFix')
            } else {
                $('.footprintDate').eq(i-1).removeClass('footprintDateFix')
            };}
          
			if(footprintUL==1){
				
				if (($(window).scrollTop()) >= 300) {
                $('.footprintDate').addClass('footprintDateFix')
				
            } else {
                $('.footprintDate').removeClass('footprintDateFix')
            };
				}

        }

    })
})