<#include "/common/common_var_definds.ftl" />
<#macro render>
<script src="${resources}/js/common/tab.js"></script>
<script src="${resources}/js/common/common.js"></script>
<script src="${resources}/js/common/hideshow.js"></script>
<script src="${resources}/js/common/img_operation.js"></script>
<script src="${resources}/js/member/orderinfomantion.js"></script>
<script src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script src="${resources}/js/lib/handlebars/handlebars-v2.0.0.js"></script>
<script type="text/javascript">

    $(function () {
        $("#shippingCompany").change(function () {
            getShippingCompanyName();
        });
        getShippingCompanyName();
    });

    function cancelSendBack() {
        window.location.href = "${ctx}/order/toOrderList.jhtml";
    }

    function confirmGeneSendBack() {

        jsConfirm("确认回寄样品吗?", {
            callback: function (result) {
                if (result) {
                    var target = $(".bottom-button");
                    var sellerReturnAddressId = $("#seller_return_address_id").val();
                    if (!sellerReturnAddressId) {
                        jsErrAlert("卖家默认收货地址不存在，请联系卖家设置！");
                        return false;
                    }
                    var shippingCompany = $("#shippingCompany").val();
                    if(!shippingCompany||shippingCompany==''){
                        jsErrAlert("请选择物流公司");
                        return false;
                    }
                    var shippingNum = $("#shipping_bill_id").val();
                    if(!shippingNum||shippingNum==''){
                        jsErrAlert("请填写运单编号！");
                        return false;
                    }
                    $.dm.block(target);
                    $("#gene_send_bakc_form").submit();
                } else {
                    $.dm.unblock(target);
                }
            }
        });

    }

    function getShippingCompanyName() {
        var shippingCompanyName = $("#shippingCompany").find("option:selected").text();
        $("#send_back_shiiping_company_name").val(shippingCompanyName);

    }
</script>
</#macro>