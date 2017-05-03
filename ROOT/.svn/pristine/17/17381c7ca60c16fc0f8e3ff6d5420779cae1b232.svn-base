// JavaScript Document
$(function(){
	 $(".tool-tab").mouseover(function() {
            $(this).children().children("p").show().stop().animate({
                'left': '-80px',
                'opacity': '1'
            },
            300);
        });
        $(".tool-tab").mouseleave(function() {
            $(this).children().children("p").hide().stop().animate({
                'left': '-160px',
                'opacity': '0px'
            },
            300);
        });
		 $(".tool-scroll").click(function() {
            $("body").animate({
                scrollTop: '0px'
            },
            300);
            $(document.documentElement).animate({
                scrollTop: '0px'
            },
            300);
        });
$(window).scroll(function() {
            if (($(document).scrollTop()) > 0) {
                $(".tool-scroll").show();
            } else {
                $(".tool-scroll").hide();
            }
        });
	
	
	
	})












