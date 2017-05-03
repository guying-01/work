<#include "/common/common_var_definds.ftl" />
<#import "field_store_apply_first.ftl" as field_store_apply_first />
<#import "field_store_apply_second.ftl" as field_store_apply_second />
<#import "field_store_apply_third.ftl" as field_store_apply_third />
<#import "field_store_apply_fourth.ftl" as field_store_apply_fourth />
<#macro render data>
<div class="wrapper p-t-40"  style="width:960px;">
	<form id="submit_form" method="post" action="${ctx}/sai/save.jhtml" >
	<#if (storeEdit.modifyDate_str)?exists><input type="hidden" name="modifyDate_str" value="${storeEdit.modifyDate_str}" /></#if>
	<#if (storeEdit.id)?exists><input type="hidden" name="id" value=${(storeEdit.id)!''} /></#if>
		<div id="div_1" >
			<@field_store_apply_first.render data??/>
		</div>
		<div id="div_2" style="display:none;">
			<@field_store_apply_second.render data??/>
		</div>
		<div id="div_3" style="display:none;">
			<@field_store_apply_third.render data??/>
		</div>
		<div id="div_4" style="display:none;">
			<@field_store_apply_fourth.render data??/>
		</div>
	</form>
</div>
<div class="pop_up bigimg_up" style="display: none;">
  <div>
    <p></p>
  </div>
</div>
<form id="down_form" method="post" target="_blank" action="${ctx}/sai/download.ajax" >
</form>
</#macro>