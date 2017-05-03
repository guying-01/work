<#include "/common/common_var_definds.ftl" />
<#import "/common/fields/field_page_tracker.ftl" as field_page_tracker />
<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
<title>饭饭在线 | ${title!''}</title>
    <link rel="shortcut icon" href="${resources}/basepage/store/default/common_img/favicon.ico"/>
    <link rel="bookmark" href="${resources}/basepage/store/default/common_img/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="${resources}/css/common/lib.css" />
<link rel="stylesheet" type="text/css" href="${resources}/css/help/help.css" />
<link rel="stylesheet" type="text/css" href="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.css" />
<script src="${resources}/js/lib/jquery/jquery-1.8.3.js"></script>
<script src="${resources}/js/lib/handlebars/handlebars-v2.0.0.js"></script>
<script src="${resources}/js/lib/pubsub/tiny-pubsub.js"></script>
<script src="${resources}/js/common/top_toolbar.js"></script>
<script src="${resources}/js/common/pager.js"></script>
<script src="${resources}/js/common/tool.js"></script>
<script src="${resources}/js/common/common.js"></script>
<script src="${resources}/js/common/help_center.js"></script>
<script src="${resources}/js/common/footer.js"></script>
    <!--[if lt IE 9]>
    <script src="/resources/js/lib/html5/es5-shim.min.js"></script>
    <script  type="text/javascript" src="/resources/js/lib/html5/html5shiv.min.js"></script>
    <![endif]-->
<script type="text/javascript">
$(document).ready(function () {
	 $(".lev_A").click(function(){
		 $(this).parent().children(".level2").slideDown();
		 $(this).parent().siblings().children(".level2").slideUp();
	 })
//	 var pageId = $('#pageId').val();
//	 document.title = $('#'+pageId).text();

<#--
 $(".find_bottom_by_id").click(function(){
 alert("dd");
        var id = $(this).attr("contentId");
        $(this).addClass("leftsidebar_foc");
        callService("/findIndexAbout.ajax",{id:id},
            {callSuccess:function(data){
                if(data.success){
                    $(".helpcontent").find("h2").html(data.result.title);
                    #("#title_main").html(data.result.title);
                    $(".helpcontent").find(".help_article").html(data.result.content);
                }else{
                    jsAlert(data.message);
                }
            }
        });
    });
--->
 })




</script>
</head>
<body>
<#include "/common/fields/field_common_nav.ftl" />
<div class="header">
  <div class="wrapper">
    <h1 class="left"><a href="/"><img src="${resources}/img/common/logo.png" /></a>&nbsp;&nbsp;&nbsp;<p class="right" style="font-size:35px;font-weight:500;">| ${title!''}</p></h1>
  </div>
  <div class="help-nav">
    <div class=" wrapper">
      <ul>
        <li><a href="/index.jhtml">首页</a></li>
        <li><a href="javascript:void(0)" class="help-navfoc" id="title_main">${contentForm.title!''}</a></li>
      </ul>
    </div>
  </div>
</div>
  <div class=" wrapper">
  <div class="content-left">
	  <ul class="leftsidebar">
		  <#if spdWebBottomFormList?? && spdWebBottomFormList?size gt 0>
			  <#list spdWebBottomFormList as spdWebBottomForm>
				<li>
				  	 <ul class="level2" style="display:block;" >

						<li><a id="faq" href="/indexAbout.jhtml?id=${spdWebBottomForm.id!''}" contentId="${spdWebBottomForm.id!''}" class="find_bottom_by_id <#if contentForm.id == spdWebBottomForm.id>leftsidebar_foc</#if>">${spdWebBottomForm.title!''}</a></li>

					 </ul>

				 </li>

			  </#list>
		  </#if>

		  <li>
		  	 <ul class="level2" style="display:block;" >

				<li><a id="faq" href="/friendLink.jhtml"  class="find_bottom_by_id ">友情链接</a></li>

			 </ul>

		 </li>
	  </ul>
  </div>
  <div class="content-right helpcontent">
      <h2 id="content_name">${contentForm.title!''}</h2>
      <div class="help_article help_article_no_padding">
          ${contentForm.content!''}
      </div>
  </div>
  <div class="clear"></div>
</div>

<#include "/common/fields/field_common_footer.ftl" />
<script src="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<@field_page_tracker.render />
</body>
</html>