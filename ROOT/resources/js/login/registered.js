// JavaScript Document
$(function() {
	 $("input").focus(function() {
		 $(this).siblings("p.loginError").show();
	        $(this).css({
	            'border-color': '#2e75d5'
	        })
	    });
	    $("input").blur(function() {
	        if ($(this).val().length == 0) {
	         
	            $(this).css({
	                'border-color': '#d0d0d0'
	            })
	        };
	        $(this).siblings("p.loginError").hide();
	    });
	$('.getCode').click(function(){
		$(this).hide();
		$('.getTime').show();
		});

});

