<#include "/common/common_var_definds.ftl" />
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<#--  ADD START BY geshuo 20151215:SEO管理 -->
<#if seoForm??>
<title>${seoForm.title!''}</title>
<meta name="description" content="${seoForm.description!''}">
<meta name="Keywords" content="${seoForm.keywords!''}">
<META NAME="ROBOTS" CONTENT="${seoForm.robots!''}">
</#if>
<#--  ADD END   BY geshuo 20151215:SEO管理 -->

${readPageTemplate(data.layoutInfo.pageTemplateId)}
<#include "../help/footbar_index.ftl"/>
<script>
var dm_ctx='${ctx}';
var dm_resources='${resources}';
var layoutJson = ${data.layoutJson};

</script>

    <script type="text/javascript">
        var _paq = _paq || [];
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
            var u="//${getConstant('constant.POM_PAGE_TRACKER_URL')!''}/";
            _paq.push(['setTrackerUrl', u+'piwik.php']);
            _paq.push(['setSiteId', 1]);
            _paq.push(['setReferrerUrl', document.referrer]);
            var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
            g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
        })();
    </script>
    
</body>
</html>
