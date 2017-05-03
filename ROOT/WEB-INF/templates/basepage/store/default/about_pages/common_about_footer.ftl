<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#macro render>
    <@footer.render></@footer.render>
<script type="text/javascript">
    $(function () {
        $("img.lazy").lazyload({effect: "fadeIn", threshold: 180});
    });
</script>
</#macro>