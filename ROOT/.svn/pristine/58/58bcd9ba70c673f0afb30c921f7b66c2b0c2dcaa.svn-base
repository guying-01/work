<#include "/common/common_var_definds.ftl" />
<#macro render data>
<style>
.dataTables_info{ margin-top:6px !important;}
</style>
   		<div class="member-list-tab" >
   			<a href="javascript:void(0)" class="small-button cx1 m-l-20 m-t-20" onclick="useOtherAddress()">添加收货地址</a>
   			<div class="Shipping-address" style="text-align: center" id="addresspager">
   			 <#--<div class="Shipping-address">-->
				<h2><span>联系人</span><span class="width200">所在地区</span><span class="width200">详细地址</span><span >邮政编码</span><span>手机号码</span><span >座机号码</span><span>操作</span></h2>
				<div class="bor-l bor-r" id="addressData">
				</div>
			</div>
			<input type="hidden" id="rows" name="length" value="5"/>
			<input type="hidden" id="currentPage" name="currentPage" value="1"/>
		</div>
	</div>
<script id="addressValue" type="text/x-handlebars-template">
{{#each this}}
		{{#addressDetail isDefault}}
		<div class="Shipping-address-con">
		{{else}}
		<div class="Shipping-address-con defaultadress">
		{{/addressDetail}}
            <p>{{consignee}}</p>
            <p class="width200" >{{countryName}}{{provinceName}}{{cityName}}{{areaName}}</p>
            <p class="width200">{{address}}</p>
            <p>{{postcode}}</p>
            <p>{{mobile}}</p>
            <p>
            <#--设为收货地址有问题，座机电话大于13位就会换行，所以用handlebar做了判断-->
            {{#if telephone}}
            	{{#shisanwei this.telephone}}
            		{{this.telephone}}
            	{{else}}
            		{{this.telephone}}</br>&nbsp;
            	{{/shisanwei}}          
            {{else}}
            --</br>--			<#--这里做了handlebar的helper判断，电话号码如果为空就显示“--”。-->
            {{/if}}
            </p>
            <p>
            <#--这里是handlebar判断-------start---->
            <a href="javascript:void(0)" class="font-color-c" dm-actor="editAddress" value='{{id}}'>编辑</a> 
            <a href="javascript:void(0);" class="m-l-10 font-color-c" dm-actor="deleteAddress" value='{{id}}'>删除</a></p>
			<p>
			{{#addressDetail isDefault}}
            <a href="javascript:void(0);" class="font-color-c" dm-actor="setDefaultAddress" value='{{id}}'>设为默认地址</a></p>
            {{/addressDetail}}
            <#--这里是handlebar判断-------end----->
            <input type='hidden' id='telephone_{{id}}' value='{{telePhone}}'>
			<input type='hidden' id='modifyDate_{{id}}' value='{{modifyDate}}'>
            <div class="clear"></div>
        </div>
{{/each}}
</script>	
<#--这里判断是否为默认收货地址-->
<script type="text/javascript">	
<#--如果不是默认收货地址就有'编辑'，'删除'，'设为默认收货地址'功能-->
Handlebars.registerHelper("addressDetail",function(param,options){
	 if(param=='1'){
	  return options.inverse(this);
	 }else{
	  
	  return options.fn(this);
	 }
});
<#--大于13位换行，要不然“设为默认地址”显示不正确-->
Handlebars.registerHelper("shisanwei",function(param,options){
	 if(param.length<=13){
	  return options.inverse(this);
	 }else{	  
	  return options.fn(this);
	 }
});
</script>	    
 </#macro>
