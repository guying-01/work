<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render>
<#--<script src="${ctx}/resources/js/common/menu.js"></script>-->
<script src="${ctx}/resources/js/lib/jquery/jquery.validate.min.js"></script>
<script src="${ctx}/resources/js/member/member_checkAuth.js"></script>

<script type="text/javascript">
	var pageUrl="${pageUrl!''}";
	var authType="${authType!''}"
	var DIC_AUTH_TYPE_000="${getConstant('dictionary.DIC_AUTH_TYPE_000')!''}";
	var DIC_AUTH_TYPE_100="${getConstant('dictionary.DIC_AUTH_TYPE_100')!''}";
	var DIC_AUTH_TYPE_200="${getConstant('dictionary.DIC_AUTH_TYPE_200')!''}";
	var errInfo="${errInfo!''}";
</script>
</#macro>