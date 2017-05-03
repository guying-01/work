<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<div class='member-list'>
	<div class="member-list">
		<ul class="tabT">
	      <li class="on" dm-actor="tab1"><span style="cursor:default">积分明细</span></li>
		</ul>
	</div>
	
	<div style="background:#fff;">
	<div style="width:960px; line-height:30px;" class='m-a'><label id="pointsName">总积分</label><span id="points"></span></div>
	<table id="datatable" width="960" border="0" cellspacing="0" cellpadding="0" class="table-line">
		<thead>
			<tr class="bor-l bor-r bor-t">
              	<th width="35%" scope="col">积分来源/用途</th>
	          	<th width="10%" scope="col">积分变化</th>
	          	<th width="20%" scope="col">积分变化时间</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table><div class='h10'></div>
	</div>
	
	</div>
 </#escape> 
</#macro>