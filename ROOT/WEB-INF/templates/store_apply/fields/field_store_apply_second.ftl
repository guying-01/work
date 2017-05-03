<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#assign busLicence=(getConstant('dictionary.BUSINESS_LICENCE')!'') />
<#assign orgCode=(getConstant('dictionary.ORGANIZATION_CODE')!'') />
<#assign general=(getConstant('dictionary.GENERAL')!'') />
<#if storeEdit?exists>
<#assign licenceMap=((storeEdit.licenceMap)!'') />
</#if>
<#escape x as x?html>
   <div class="progress_four progress_B">
    <p class="progress_textA font-color-b">入驻协议</p>
    <p class="progress_textB progress_text">填写企业基本信息</p>
    <p class="progress_textC">填写企业经营信息</p>
    <p class="progress_textD">填写联系人信息</p>
    

  </div>
 	<h2 class="store-intoH">企业支付信息</h2>
    <div class="information-line m-t-15 m-b-15"><span class="linespan"><em>*</em> 支付宝账号：</span>
        <input name="taobaoPayAccountNo"  id="taobaoPayAccountNo" type="text" class="text_A width260 left required" value="${(storeEdit.taobaoPayAccountNo)!''}" maxlength="40">
      </div>
	  <h2 class="store-intoH">企业基本信息</h2>
	  <div class="information-into">
	    <div class="information-line"><span class="linespan"><em>*</em> 企业名称：</span>
		        <input id="companyName" name="companyName" type="text" class="text_A width260 left required" maxlength="50" value="${(storeEdit.companyName)!''}">
		      </div>
		       <div class="information-line"><span class="linespan"><em>*</em> 企业类型：</span>
		         <select class="left" name="companyTypeSel" id="companyTypeSel" onchange="divNameChang()">
		           <#list companyType as type>
		          	<option value="${(type.code)!''}"  <#if (storeEdit.companyType)?exists&&storeEdit.companyType==(type.code)!''>selected=selected</#if>>${(type.name)!''}</option>
		          </#list>
		        </select>
		        <input name="companyType" id="companyType" type="hidden" value=""/>
		      </div>
				<div class="information-line" id="jingyingDiv" style="display: none;">
					<span class="linespan"><em>*</em> 经营类型：</span>
					<#list manageCompanyType as item2>
						<input name="manageCompanyType" type="radio" class="radio"  value="${(item2.code)!''}" onchange="manageCompanyTypeChange(this)">
						<p class="m-r-10">${(item2.name)!''}</p>
					</#list> 
    		</div>
		       <div class="information-line"><span class="linespan"><em>*</em> 企业所在地：</span>
		        <select class="left" name="companyNation" id='company_nation' mark="0" onchange="nation_change(this,$('#company_province'))"></select>
				<span>
					<select class="left m-l-10" name="companyProvince" id='company_province' mark="1" onchange="address_change(this,$('#company_city'))"></select>
					<select class="left m-l-10" name="companyCity" id="company_city"  mark="2" onchange="address_change(this,$('#company_county'))"></select>
					<select class="left m-l-10" name="companyCounty" id="company_county"  mark="3" min="1" onchange="streetChangeJson('company','companyAddress')"></select>
				</span>
		        <div class="clear"></div>
		        <div class=" m-t-10">
		        	<textarea name="companyAddressDetail" class="textarea_A left clear required textareaaddress" style="margin-left:160px;" maxlength="50">${(storeEdit.companyAddressDetail)!''}</textarea>
		        </div>
		        <input type="hidden" name="companyAddress" id="companyAddress">
		        <#if (storeEdit.companyAddressDetail)?exists></#if>
</#escape>
		          <#if storeEdit?exists>
		          <script>
		          loadArea("#company_nation","#company_province","#company_city","#company_county",'${(storeEdit.companyAddress)!""}');
		          </script>
		          </#if>	
<#escape x as x?html>
 <div class="clear"></div>
		      </div>
		  </div>
		   <h2 class="store-intoH">企业营业执照</h2>
		  <input type="hidden" name="licenceList[0].storeName" value="" class="storeNameCss"/>
		  <input type="hidden" name="licenceList[0].businessLicenceType" value="${busLicence}"/>
	      <div class="information-into">
    		<div class="information-line"><span class="linespan"><em>*</em> 注册号：</span>
	          <input name="licenceList[0].businessLicenceCode" value="${(licenceMap[busLicence].businessLicenceCode)!''}"  type="text" class="text_A width260 left required" maxlength="100" >
	        </div>
	        <div class="information-line"><span class="linespan"><em>*</em> 住所：</span>
		        <select class="left" name="businessNation" id='business_nation' mark="0" onchange="nation_change(this,$('#business_province'))"></select>
				<span>
					<select class="left m-l-10" name="businessProvince" id='business_province' mark="1" onchange="address_change(this,$('#business_city'))"></select>
					<select class="left m-l-10" name="businessCity" id="business_city"  mark="2" onchange="address_change(this,$('#business_county'))"></select>
					<select class="left m-l-10" name="businessCounty" id="business_county"  mark="3" min="1" onchange="streetChangeJson('business','businessLicenceAddress')"></select>
				</span>
		        <div class=" m-t-10">
		        	<textarea name="licenceList[0].storehouseAddressDetail" class="textarea_A left clear required textareaaddress" style="margin-left:160px;" maxlength="50">${(licenceMap[busLicence].storehouseAddressDetail)!''}</textarea>
		        </div>
				<input type="hidden" name="licenceList[0].storehouseAddress" id="businessLicenceAddress">
</#escape>
				<#if storeEdit?exists>
		          <script>
		          loadArea("#business_nation","#business_province","#business_city","#business_county",'${(licenceMap[busLicence].storehouseAddress)!""}');
		          </script>
		         </#if>
<#escape x as x?html>
	        </div>
	        <div class="information-line"><span class="linespan"><em>*</em> 法定代表人：</span>
	          <input name="licenceList[0].attr1" value="${(licenceMap[busLicence].attr1)!''}" type="text" class="text_A width200 left required" maxlength="20">
	        </div>
	           <div class="information-line"><span class="linespan"><em>*</em> 营业期限：</span>
	          <input class="text_A width100 laydate-icon left "  readonly="readonly" id="businessLicenceStart" name="licenceList[0].licenceStartDate_str" value="${(licenceMap[busLicence].licenceStartDate_str)!''}">
	           <em class=" m-l-10 left m-t-5" id="fuhao">-</em>
	          <input class="text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="businessLicenceEnd" name="licenceList[0].licenceEndDate_str" value="${(licenceMap[busLicence].licenceEndDate_str)!''}">
	          <input type='checkbox' name="" class="wuqixian" id='VoteOption1'>无期限
	        </div>
	         <div class="information-line"><span class="linespan"><em>*</em> 经营范围：</span>
	          <textarea class="textarea_A left required" name="licenceList[0].businessScope" maxlength="500">${(licenceMap[busLicence].businessScope)!''}</textarea>
	        </div>
	        <div class="information-line"><span class="linespan"><em>*</em> 企业法人身份证复印件：</span>
	        <a id="upload1" upload="licenceList[0].attr2,licenceList[0].attr3" href="javascript:void(0)"  class=" myUpLoadClass small-button left cx3">选择文件</a>
	          <p class="m-l-10 font-color-e">请上传企业法人身份证正反面复印件（两张）,图片大小不超过3M</p>
	          <ul class="groupimg clear m-t-15" style="margin: 0 0 0 160px;">
	          	<#if licenceMap?exists && licenceMap[busLicence]?exists>
		            <li><img  width="254" height="158"  src="${(licenceMap[busLicence].attr2)!''}">
		            <div class="goodsoperation"><span title="放大"  class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
		            <input type="hidden" name="licenceList[0].attr2" value="${(licenceMap[busLicence].attr2)!''}"></div>
		            </li>
		            <li><img width="254" height="158" src="${(licenceMap[busLicence].attr3)!''}">
		            <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
		            <input type="hidden" name="licenceList[0].attr3" value="${(licenceMap[busLicence].attr3)!''}"></div>
		            </li>
	            </#if>
	            <div class=" clear"></div>
	          </ul>
	        </div>
	         <div class="information-line"><span class="linespan"><em>*</em> 营业执照电子版(副本)：</span>
	        <a id="upload2" upload="licenceList[0].licenceElectronic"  id="upload2" href="javascript:void(0)" class="myUpLoadClass small-button left cx3">选择文件</a>
	          <p class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</p>
	          <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
	          	 <#if licenceMap?exists && licenceMap[busLicence]?exists>
		            <li><img width="500" height="304" src="${(licenceMap[busLicence].licenceElectronic)!''}">
		            <div class="goodsoperation"><span title="放大"  class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
		            <input type="hidden" name="licenceList[0].licenceElectronic" value="${(licenceMap[busLicence].licenceElectronic)!''}"></div>
		            </li>
	            </#if>
	            <div class=" clear"></div>
	          </ul>
	        </div>
	      </div>
		 <h2 class="store-intoH">组织机构代码证</h2>
		  <input type="hidden" name="licenceList[1].storeName" value="" class="storeNameCss"/>
		  <input type="hidden" name="licenceList[1].businessLicenceType" value="${orgCode}"/>
	     <div class="information-into">
    		<div class="information-line"><span class="linespan"><em>*</em> 组织机构代码：</span>
	          <input name="licenceList[1].businessLicenceCode" value="${(licenceMap[orgCode].businessLicenceCode)!''}" type="text" class="text_A width260 left required" maxlength="100">
	        </div>
	         <div class="information-line"><span class="linespan"><em>*</em> 有效期：</span>
	          <input class=" text_A width100 laydate-icon left" readonly="readonly" id="organizationStart" name="licenceList[1].licenceStartDate_str" value="${(licenceMap[orgCode].licenceStartDate_str)!''}">
	           <em class=" m-l-10 left m-t-5">-</em>
	          <input class=" text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="organizationEnd" name="licenceList[1].licenceEndDate_str" value="${(licenceMap[orgCode].licenceEndDate_str)!''}">
	        </div>
	           <div class="information-line"><span class="linespan" style=" line-height:15px;"><em>*</em> 组织机构代码证电子版<br/>(副本)：</span>
	        <a id="upload3" upload="licenceList[1].licenceElectronic"  href="javascript:void(0)" class="myUpLoadClass small-button left cx3">选择文件</a>
	          <p class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</p>
	          <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
	          	  <#if licenceMap?exists && licenceMap[orgCode]?exists>
		            <li><img width="500" height="304" src="${(licenceMap[orgCode].licenceElectronic)!''}">
		            <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
		            <input type="hidden" name="licenceList[1].licenceElectronic" value="${(licenceMap[orgCode].licenceElectronic)!''}"></div>
		            </li>
	            </#if>
	            <div class=" clear"></div>
	          </ul>
	        </div>
	      </div>
	      <h2 class="store-intoH">税务登记证</h2>
	      <input type="hidden" name="licenceList[2].storeName" value="" class="storeNameCss"/>
		  <input type="hidden" name="licenceList[2].businessLicenceType" value="${general}"/>
	       <div class="information-into">
    		<div class="information-line"><span class="linespan"><em>*</em> 税务登记证号：</span>
	          <input name="licenceList[2].businessLicenceCode" value="${(licenceMap[general].businessLicenceCode)!''}" type="text" class="text_A width260 left required" maxlength="100">
	        </div>
	          <div class="information-line"><span class="linespan"><em>*</em> 发证日期：</span>
	          <input class=" text_A width100 laydate-icon left" readonly="readonly" id="taxRegistrationStart" name="licenceList[2].licenceStartDate_str" value="${(licenceMap[general].licenceStartDate_str)!''}">
	        </div>
	        <div class="information-line"><span class="linespan"><em>*</em> 税务登记证电子版(副本)：</span> 
	        <a id="upload4" upload="licenceList[2].licenceElectronic" href="javascript:void(0)" class="myUpLoadClass small-button left cx3">选择文件</a>
	          <p class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</p>
	          <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
	          	 <#if licenceMap?exists && licenceMap[general]?exists>
		            <li><img width="500" height="304" src="${(licenceMap[general].licenceElectronic)!''}">
		            <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
		            <input type="hidden" name="licenceList[2].licenceElectronic" value="${(licenceMap[general].licenceElectronic)!''}"></div>
		            </li>
	            </#if>
	            <div class=" clear"></div>
	          </ul>
	        </div>
	      </div>
	       <h2 class="store-intoH">结算账户信息</h2>
  			<div class="information-into">
    			<div class="information-line"><span class="linespan"><em>*</em>银行开户名：</span>
	          <input name="bankAccountName" value="${(storeEdit.bankAccountName)!''}" type="text" class="text_A width260 left required" maxlength="50">
	        </div>
	         <div class="information-line"><span class="linespan"><em>*</em>公司银行账号：</span>
	          <input name="bankAccountNumber" value="${(storeEdit.bankAccountNumber)!''}" type="text" class="text_A width260 left required" maxlength="50">
	        </div>
	          <div class="information-line"><span class="linespan"><em>*</em>*开户银行支行名称：</span>
	          <input name="bankName" value="${(storeEdit.bankName)!''}" type="text" class="text_A width260 left required" maxlength="50">
	        </div>
	        <div class="information-line"><span class="linespan"><em>*</em>开户银行所在地：</span>
			    <select class="left" name="bankNation" id='bank_nation' mark="0" onchange="nation_change(this,$('#bank_province'))"></select>
				<span>
					<select class="left m-l-10" name="bankProvince" id='bank_province' mark="1" onchange="address_change(this,$('#bank_city'))"></select>
					<select class="left m-l-10" name="bankCity" id="bank_city"  mark="2" onchange="address_change(this,$('#bank_county'))"></select>
					<select class="left m-l-10" name="bankCounty" id="bank_county"  mark="3" min="1" onchange="streetChangeJson('bank','bankAddress')"></select>
				</span>
				<input type="hidden" name="bankAddress" id="bankAddress">
</#escape>
				<#if storeEdit?exists>
		          <script>
		          loadArea("#bank_nation","#bank_province","#bank_city","#bank_county",'${(storeEdit.bankAddress)!""}');
		          </script>
		         </#if>
<#escape x as x?html>
	        </div>
     	 </div>
     <div class="m-t-20 p-t-40" style="text-align:center">
      <a href="javascript:void(0);" onclick="cutDivPrev('div_1')"  class="small-button">上一步，查看入驻协议</a> 
      <a onclick="cutDivNext('div_3')" href="javascript:void(0)" class="small-button m-l-20">下一步，填写企业经营信息</a></div>
</#escape>
</#macro>