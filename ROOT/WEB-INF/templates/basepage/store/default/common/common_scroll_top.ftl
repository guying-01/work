<#include "/common/common_var_definds.ftl" />
<#macro render>
	<style type="text/css">
		#scrollTop{
			display: none;
			position: fixed;
			z-index: 999;
			right: 0.15rem;
			bottom: 1rem;
			width:0.7rem ;
			height: 0.7rem;
			background: url(/resources/basepage/store/default/common_img/scrollTop.png);
			background-size: 100%;
		}
	</style>
	<div id="scrollTop"></div>
	<script type="text/javascript">
		$("#scrollTop").on("click",function(){
			$(window).scrollTop(0);
		})

		$(window).scroll(function(){
			if($(window).scrollTop()>0){
				$("#scrollTop").fadeIn(400);
			}else{
				$("#scrollTop").fadeOut(400);
			}
		})
		
	</script>
</#macro>