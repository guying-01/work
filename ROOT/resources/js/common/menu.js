	  $(document).ready(function () {
		 $(".lev_A").click( function(){
			 $(this).parent().children(".level2").slideDown();
			 $(this).parent().siblings().children(".level2").slideUp();
			 $(this).addClass("cur");
			 $(this).parents().siblings().children(".lev_A").removeClass("cur");
			 })
		 }) 
	 
