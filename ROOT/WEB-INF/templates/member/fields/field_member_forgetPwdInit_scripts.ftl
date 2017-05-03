<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render >
<script type="text/javascript" src="${ctx}/resources/js/lib/jquery/jquery.validate.min.js"></script>
<script>
	$(function(){
		$("#next_form").validate({
			onkeyup:false,
			errorClass:"errorwrong",
			rules:{
				userCode:{
					required:true,
					remote:{
						url:"${ctx}/forget/validate.ajax",
						type:'post',
						data:{
							userCode:function(){
								return $("#userCode").val();
							}
						}
					}
				}
			},
			messages:{
				userCode:{
					required:"<div class='label-g'>用户名不能为空</div>",
					remote:"<div class='label-g'>该用户不存在</div>"
				}
			},
			

		});
	});
</script>
</#macro>
