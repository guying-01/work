// JavaScript Document
$(document).ready(function () {
	  $(".cx1").click( function(){
			 $(".cx2").fadeIn();
	    })
		$(".cx3").click( function(){
			 $(".cx4").fadeIn();
	    })
		$(".cx5").click( function(){
			 $(".cx6").fadeIn();
	    })
	  $(".shut").click( function(){
			 $(".cx2").fadeOut();
			 $(".cx4").fadeOut();
			 $(".cx6").fadeOut();
		})
 });
  