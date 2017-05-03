<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render>
<#--<script src="${ctx}/resources/js/common/menu.js"></script>-->
<script src="${ctx}/resources/js/member/member_security_edit_scripts.js" type="text/javascript" ></script>
<script type="text/javascript">
	var IS_AUTH_Y="${getConstant('system.IS_AUTH_Y')}";
	var isPwProtectAuth='${(userInfo.isPwProtectAuth)!""}';
	var isMailAuth='${(userInfo.isMailAuth)!""}';
	var isMobileAuth='${(userInfo.isMobileAuth)!""}';
	var PWD_STRENGTH_TWO="${getConstant('system.PWD_STRENGTH_TWO')}";
	var PWD_STRENGTH_THREE="${getConstant('system.PWD_STRENGTH_THREE')}";
    var PWD_STRENGTH_FOUR="${getConstant('system.PWD_STRENGTH_FOUR')}";
	var pwStrength="${(userInfo.pwStrength)!""}";	
</script>
</#macro>