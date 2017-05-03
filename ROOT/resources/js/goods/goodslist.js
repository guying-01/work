// JavaScript Document
$(document).ready(function() {
    $(document).scroll(function() {
        if (($(document).scrollTop()) >= ($(".serch_conditions").height() + 210)) {
            $(".sorting").addClass("sortingB")
        } else {
            $(".sorting").removeClass("sortingB")
        };

    })
    $('.sorting a').click(function() {
        if (($(document).scrollTop()) >= ($(".serch_conditions").height() + 210)) {
            $(document).scrollTop($(".serch_conditions").height() + 210)
        }
    });
    if (($(".serch_conditions").children(".serch_conditions_ul").length) > 5) {
        $(".serch_conditions>.serch_conditions_ul:eq(4)").nextAll(".serch_conditions_ul").hide()
    } else {}
    $(".fan1080_serch_more p").click(function() {
        $(".serch_conditions>.serch_conditions_ul:eq(4)").nextAll(".serch_conditions_ul").toggle();
		$(".fan1080_serch_more p i").toggleClass("fan1080_serch_more_i");
		if(($(".serch_conditions").children(".serch_conditions_ul").is(":hidden"))) {
            $(".fan1080_serch_more p span").text("更多选项")
        } else {
            $(".fan1080_serch_more p span").text("收起")

        }
    })

})