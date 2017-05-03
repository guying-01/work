<#include "/common/common_var_definds.ftl" />
<#macro render path>
<div class="wrapSpace"></div>
<script>
    $.ajax({
                type: "get",
                async: true,
                url: "/about/other_page.jhtml?page=${path}",
                success: function (data) {
                    $(".wrapSpace").html(data);
                }
            }
    );
</script>
</#macro>
