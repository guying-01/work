<#include "/common/common_var_definds.ftl" />
<#import "/common/fields/field_page_tracker.ftl" as field_page_tracker />
<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
<title>饭饭在线 | 友情链接</title>
<link rel="stylesheet" type="text/css" href="${resources}/css/common/lib.css" />
<link rel="stylesheet" type="text/css" href="${resources}/css/common/frindlinks.css" />
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
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script type="text/javascript" src="${resources}/js/common/validation.js"></script>
    <!--[if lt IE 9]>
    <script src="/resources/js/lib/html5/es5-shim.min.js"></script>
    <script  type="text/javascript" src="/resources/js/lib/html5/html5shiv.min.js"></script>
    <![endif]-->
<script type="text/javascript">
    $(function() {

        $("#save_btn").click(function(){
            if(!$("#submit_form").valid()){
                return;
            }
            $.dm.block();
            var params = $("#submit_form").serialize();
            callService("${ctx}/saveLink.ajax", params, {
                callSuccess : function(data) {
                    if (data.success > 0) {
                    	$.dm.unblock();
                    	refreshCaptcha('');
                        jsAlert("申请成功，请等待审批！");
                        $('#submit_form')[0].reset(); 
                    } else {
                    	refreshCaptcha('');
                        $.dm.unblock();
                        jsAlert(data.message);
                    }
                }
            });
        });

        $("#preview_btn").click(function(){
            if(!$("#submit_form").valid()){
                return;
            }
            $("#submit_form").submit();
        });
    });

</script>
</head>
<body>
<#include "/common/fields/field_common_nav.ftl" />
<div class="header">
  <div class="wrapper">
    <h1 class="left"><a href="/"><img src="${resources}/img/common/logo.png" /></a>&nbsp;&nbsp;&nbsp;<p class="right" style="font-size:35px;">| 友情链接</p></a></h1>
  </div>
  <div class="help-nav">
    <div class=" wrapper">
      <ul>
        <li><a href="/index.jhtml">首页</a></li>
        <li><a href="javascript:void(0)" class="help-navfoc" id="title_main">友情链接</a></li>
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

						<li><a id="faq" href="/indexAbout.jhtml?id=${spdWebBottomForm.id!''}" contentId="${spdWebBottomForm.id!''}" class="find_bottom_by_id">${spdWebBottomForm.title!''}</a></li>

					 </ul>
				  
				 </li>		   
	
			  </#list>
		  </#if>
		  
		  <li>
		  	 <ul class="level2" style="display:block;" >

				<li><a id="faq" href="/friendLink.jhtml"  class="find_bottom_by_id leftsidebar_foc">友情链接</a></li>

			 </ul>
		  
		 </li>	
	  </ul>
  </div>
  <div class="content-right helpcontent">
      <h2 id="content_name">友情链接</h2>
      <div class="help_article">
      <!--友情链接开始-->
      <ul class="link-con">
          <#if spdWebLinkFormList?? && spdWebLinkFormList?size gt 0>
			  <#list spdWebLinkFormList as spdWebLinkForm>
                <li><a id="faq" href="${spdWebLinkForm.webUrl!''}" " class="find_bottom_by_id" target="_blank">${spdWebLinkForm.webName!''}</a></li>

			   
	
			  </#list>
		  </#if>
		  <p class="clear"></p>
		  </ul>
      </div>
   <!--友情链接结束-->
  <!--提交 开始-->
  <div class="submit clear"><h5>友情链接申请</h5>
  <div class="submit_left">
  申请步骤：<br/>

1.请先在贵网站做好饭饭在线的文字友情链接：<br/>

链接文字：饭饭在线       链接地址：<a href="http://www.fan1080.com/">http://www.fan1080.com/</a> <br/>

 

2.做好链接后，请在右侧填写申请信息。饭饭在线只接受申请文字友情链接。<br/>

 

3.已经开通我站友情链接且内容健康，符合本站友情链接要求的网站，经饭饭在线管理员审核后，可以显示在此友情链接页面。<br/>

 

4.请通过右侧提交申请，注明：友情链接申请<br/>
  
  </div>
   <div class="panel">
               
                    <h4>友情链接添加</h4>
               
                <div class="panel-body">
                     <form id="submit_form" action="/help_index_content/toPreviewPCIndexBottom.jhtml" method="post" target="_blank" class="form-horizontal">
        <div id="user_add_div">
            <div class="form-group">
                <label class="control-label" for="userCode"><span style="color: red;">*</span> 网站名称：</label>
               
                    <input name="webName" id="webName" type="text" value="" size="" maxlength="10" class="text_A required" placeholder="请输入网站名称"/>
             
            </div>
             <div class="form-group">
                <label class="control-label" for="userCode"><span style="color: red;">*</span> URL：</label>
                
                    <input name="webUrl" id="webUrl" type="text" value="" size="" maxlength="100" class="text_A required url" placeholder="请输入URL http://www.xxx.com"/>
                
            </div>
             <div class="form-group">
                <label class="control-label" for="userCode"><span style="color: red;">*</span> email：</label>
              
                    <input name="email" id="email" type="text" value="" size="" maxlength="50" class="text_A required email" placeholder="请输入电子邮件"/>
            
            </div>

            <div class="form-group" style="height:110px;">
                <label class="control-label" for="userCode"><span style="color: red;"></span> 备注：</label>
              
                    <input name="remark" id="remark" type="text" value="" size="" maxlength="2000"  class="textarea_A" placeholder="请输入备注"/>
                
            </div>
            
            <div class="form-group">
                <label class="control-label" for="userCode"><span style="color: red;">*</span> 验证码：</label>
              
                    <input name="captcha" id="captcha" type="text" value="" size="" maxlength="5" class="text_A width80 required" placeholder="请输入验证码" minlength="5" maxlength="5"/>
                
           
            <img src="/kaptcha" class="left m-l-10" width="90" height="28"
					id="img_captcha" /> <a class="left m-l-10 m-t-5"
					onclick="javascript:refreshCaptcha('');">看不清换一张</a> </div>
        </div>
    </form>
    <div class="textalign-m p-t-10 ">
     <a href="javascript:void(0);" class="small-button clear" id="save_btn">提交申请</a>
         </div>       </div>
            </div>
           
  			
                <!--<a  target="_blank" class="btn btn-primary m-r-15" id="preview_btn"><i class="fa fa-eye"></i> 预览</a>-->
               
           
  <!--提交 结束-->
  </div></div>
  <div class="clear"></div>
  
  
  

  
</div>
<script type="text/javascript">

	function refreshCaptcha(url) {
		if($("#captcha").length != 0){
			document.getElementById("img_captcha").src = url + "/kaptcha?t="
			+ Math.random();
		}
	}

</script>

<#include "/common/fields/field_common_footer.ftl" />
<script src="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script> 
<@field_page_tracker.render />
</body>
</html>