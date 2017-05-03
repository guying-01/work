// JavaScript Document
(function($) {
    var topshort = function(options) {
        $(".top-li-pop").mouseover(function() {
            $(".mes-con").parents('.top-scoll').perfectScrollbar();
            $(".mes-set").parents('.top-scoll').perfectScrollbar();
            $(".mes-set").parents('.top-scoll').css("height", "250px");
            $(".top-car-con").parents('.top-scoll').perfectScrollbar();
            $(".topnav .ps-scrollbar-y ").css("background-color", "#db0401");
        });
        $(".Unread-mes h2 a").click(function() {
            $(".Unread-mes").animate({
                'margin-left': '-250px'
            },
            500);
            $(".Set-mes").animate({
                'margin-right': '0px'
            },
            500);
        });
        $(".Set-mes h2 u").click(function() {
            $(".Unread-mes").animate({
                'margin-left': '0px'
            },
            500);
            $(".Set-mes").animate({
                'margin-right': '-250px'
            },
            500);
        });
        $(".mes-c-o .right").click(function() {
            if ($(".mes-c-o").children("div").hasClass("mes-o")) {
                $(this).parent("div").removeClass("mes-o");
                $(this).parent("div").addClass("mes-c");
            };
        });
        $(".mes-c-o .left").click(function() {
            if ($(".mes-c-o").children("div").hasClass("mes-c")) {
                $(this).parent("div").removeClass("mes-c");
                $(this).parent("div").addClass("mes-o");
            };
        });
        $(".top-car-del").click(function() {
            $(this).parents(".top-car-goods").remove()
        });
    }

    $.fn.topshort = function(options) { 
        var opts = {
            topshort: function(options) {
                topshort(options);
            },
            needtopshort: true
        };

        if (options) {
            $.extend(opts, options);
        }
        if (opts.needtopshort) {
            opts.topshort(options);
        }
    };
})(jQuery);