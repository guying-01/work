<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<script type="text/javascript" > 
function SetWinHeight(obj) {
	var win=obj;
	if (document.getElementById) {
		if (win && !window.opera) {
			if (win.contentDocument && win.contentDocument.body.offsetHeight){
				win.height = win.contentDocument.body.scrollHeight+10;
			} else  if(win.Document && win.Document.body.scrollHeight) {
				win.height = win.Document.body.scrollHeight;
			}
		}
	}
}
</script>
    <div class="member-list-tab" style="height: 100%;">
      <h2 class="member-tit"> <i>&nbsp;</i>消息内容</h2>
           <div class="orderdedetail" style="height: 100%;">
           <div class="title" style="margin-top: 30px;font-size: 3em;text-align: center;margin-bottom: 10px;">${(form.message)!}</div>
           <iframe src="${ctx}/notify/findMessageDetail.jhtml?id=${(form.id?c)!}" frameborder=0 border=0 style="text-align: center;width: 940px;border: 0px;" onload="Javascript:SetWinHeight(this)" scrolling="no" ></iframe>
           </div>
      </div>
</#escape>
</#macro>