<#include "/common/common_var_definds.ftl" />
<#macro render>
<script src="${resources}/js/common/tab.js"></script>
<script src="${resources}/js/common/common.js"></script>
<script src="${resources}/js/common/sys_info.js"></script>
<script src="${resources}/js/member/index.js"></script>
<script>
var orderStatesInpay = '${getConstant('dictionary.ORDER_STATES_INPAY')}';
var orderStatesPayed = '${getConstant('dictionary.ORDER_STATES_PAYED')}';
var orderStatesShipped = '${getConstant('dictionary.ORDER_STATES_SHIPPED')}';
var orderStatesReceipted = '${getConstant('dictionary.ORDER_STATES_RECEIPTED')}';
var orderStatesScoreNo = '${getConstant('dictionary.ORDER_STATES_SCORE_NO')}';
var userId = '${(user.id)!''}';
var ctx = '${resources}';
</script>
</#macro>