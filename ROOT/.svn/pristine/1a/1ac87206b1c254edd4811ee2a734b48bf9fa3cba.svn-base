<#include "/common/common_var_definds.ftl" />
<#macro render data>
	<#escape x as x?html>
		<div class="member-list myordertab">
	    <ul class="tabT">
	      <li onclick="JavaScript:ChangeDiv('0','JKDiva_',2)" class="on" id="selected1"><span>店铺优惠券</span></li>
	      <li onclick="JavaScript:ChangeDiv('1','JKDiva_',2)" id="selected2"><span>商城优惠券</span></li>
	      <!-- <li onclick="JavaScript:ChangeDiv('2','JKDiva_',2)" id="selected3"><span>商城红包</span></li>-->
	    </ul>
        <input type="hidden" id="currentPage" value='1'/>
        <input type="hidden" id="rows" value='6'/>
	    <input type="hidden" id="status" value="0"/>
	    <input type="hidden" id="showFlg" value="${showFlg!''}"/>
	    <div class="order-serch">
	        <strong>优惠券状态：</strong>
	        <span><select id="couponStatus"><option value="">全部</option><option value="10">未使用</option>
	        <option value="20">使用中</option>
	        <option value="30">已使用</option><option value="40">已过期</option></select></span>
	      	<div class='divStoreName'>
	      		<span>店铺名称：</span>
	        	<input type="text" name="input" id="issuerName" class="issuerName text_A dm-no-auto-clear" maxLength="100"/>
	      	</div>
	      	<a href="javascript:void(0)" class="commit small-button m-l-10 m-t-5">查询</a> 
	    </div>
	    <div id="JKDiva_0" mark="0" class="member-list-tab p-t-20">
	      <div class="sorting"> 
		      <span>分类排序：</span> 
		      <a class="denominationSort" href="javascript:void(0)"><i>优惠金额</i><u class="denominationSortImg sorting_top"></u></a>
	      	  <span> | </span>
	      	  <a class="endDateSort" href="javascript:void(0)"><i>到期时间</i><u class="endDateSortImg sorting_bot"></u></a> 
	          <span> | </span>
	          <a class="createDateSort" href="javascript:void(0)"><i>生效时间</i><u class="createDateSortImg sorting_bot"></u></a>
		      <input type="hidden" class="denominationSortNum" name="page" value=''/>
	          <input type="hidden" class="endDateSortNum" name="page" value=''/>
	          <input type="hidden" class="createDateSortNum" name="page" value=''/>
	      </div>
	      <div class="content"></div>
	    </div>
	    <div id="JKDiva_1" mark="1" class="member-list-tab p-t-20" style="display:none">
	    	<div class="sorting"> 
		      <span>分类排序：</span> 
		      <a class="denominationSort" href="javascript:void(0)"><i>优惠金额</i><u class="denominationSortImg sorting_top"></u></a>
	      	  <span> | </span>
	      	  <a class="endDateSort" href="javascript:void(0)"><i>到期时间</i><u class="endDateSortImg sorting_bot"></u></a> 
	          <span> | </span>
	          <a class="createDateSort" href="javascript:void(0)"><i>生效时间</i><u class="createDateSortImg sorting_bot"></u></a>
		      
		      <input type="hidden" class="denominationSortNum" name="page" value=''/>
	          <input type="hidden" class="endDateSortNum" name="page" value=''/>
	          <input type="hidden" class="createDateSortNum" name="page" value=''/>
	          
	      	</div>
	      	<div class="content"></div>	
	    </div>
 	</div>
	</#escape>
</#macro> 