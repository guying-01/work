// JavaScript Document
$(document).ready(function() {
	   $("input").focus(function() {
        $(this).addClass("inputbor");
        $(this).siblings(".form-labe").fadeOut()
    });
    $("input").blur(function() {
        $(this).removeClass("inputbor");
        if ($(this).val().length == 0) {
            $(this).siblings(".form-labe").fadeIn()
        }
    });

    $("textarea").focus(function() {
        $(this).addClass("inputbor");
        $(this).siblings(".form-labe").fadeOut()
    });
    $("textarea").blur(function() {
        $(this).removeClass("inputbor");
        if ($(this).val().length == 0) {
            $(this).siblings(".form-labe").fadeIn()
        }
    });
    $("#check_stepA").click(function() {
        if ($("#check_stepA").attr("checked")) {
//            $(".step_A").attr('href', '商家入驻第二步.html');
			 $(".step_A").addClass("small-button")
        } else {
            $(".step_A").removeClass("small-button");
			$(".step_A").attr('href', '#')
        }
    });
    /* $("#settlement").click(function() {
        if ($("#settlement").attr("checked")) {
            $(".settlement").hide()
        } else {
            $(".settlement").show()
        }
    })*/

   /* $("#yaopin_id").click(function() {
        $("#yaopin").toggle();
		 if ($("#yaopin_id").is(':checked') || $("#qixie_id").is(':checked')) {
            $("#Czheng").show()
        } else {
            $("#Czheng").hide()
        };

    });
	 $("#qixie_id").click(function() {
        $("#qixie").toggle();
		 if ($("#yaopin_id").is(':checked') || $("#qixie_id").is(':checked')) {
            $("#Czheng").show()
        } else {
            $("#Czheng").hide()
        };
    });
	 $("#bao_shipin_id").click(function() {
        if ($("#bao_shipin_id").is(':checked') || $("#shipin_id").is(':checked')) {
            $("#shipin").show()
        } else {
            $("#shipin").hide()
        };

    });
	 $("#shipin_id").click(function() {
        if ($("#bao_shipin_id").is(':checked') || $("#shipin_id").is(':checked')) {
            $("#shipin").show()
        } else {
            $("#shipin").hide()
        };
    })

    $("#huazhuang_id").click(function() {
        $("#huazhuang").toggle()
    })
	 $("#xiaodu_id").click(function() {
        $("#xiaodu").toggle()
    });*/
	

})