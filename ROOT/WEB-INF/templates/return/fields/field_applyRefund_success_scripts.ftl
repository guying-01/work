<#assign ctx = rc.contextPath,resources = ctx + "/resources">
<#macro render >	
<script type="text/javascript" src="${resources}/js/common/img_operation.js"></script>
<script type="text/javascript" src="${resources}/js/common/hideshow.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${resources}/js/member/orderinfomantion.js"></script>
<script type="text/javascript" src="${resources}/js/member/evaluation.js"></script>
<#import "/return/fields/field_return_image_scripts.ftl" as field_return_image_scripts />
<@field_return_image_scripts.render />
</#macro>
