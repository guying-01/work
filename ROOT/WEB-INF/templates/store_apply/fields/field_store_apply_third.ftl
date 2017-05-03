<#include "/common/common_var_definds.ftl" />

<#assign type30=getConstant('dictionary.NETWORK_DRUG_QUALIFICATIONS')!'' >
<#assign type40=getConstant('dictionary.DRUG_QUALIFICATIONS')!'' >
<#assign type50=getConstant('dictionary.DRUG_PROSECUTION_QUALIFICATIONS')!'' >
<#assign type60=getConstant('dictionary.MEDICAL_PROSECUTION_QUALIFICATIONS')!'' >
<#assign type70=getConstant('dictionary.BUTTERY_PROSECUTION_QUALIFICATIONS')!'' >
<#assign type80=getConstant('dictionary.COSMETIC_PROSECUTION_QUALIFICATIONS')!'' >
<#assign type90=getConstant('dictionary.DISINFECTION_PRODUCTS')!''>
<#assign type100=getConstant('dictionary.DRUGGIST')!''>
<#if storeEdit?exists>
<#assign map=storeEdit.licenceMap >
</#if>
<#macro render data>
<#escape x as x?html>
<#if storeEdit?exists>
<input type="hidden" name="storeId" value="${(storeEdit.storeId)!''}" />
</#if>
    <div class="progress_four progress_C">
    <p class="progress_textA font-color-b">入驻协议</p>
    <p class="progress_textB font-color-b">填写企业基本信息</p>
    <p class="progress_textC progress_text">填写企业经营信息</p>
    <p class="progress_textD">填写联系人信息</p>
  </div>
   <div class="information-into">
    <h2 class="store-intoH">店铺经营信息</h2>
    <div class="information-line m-t-20"><span class="linespan"><em>* </em>店铺名称：</span>
        <input name="storeName" onchange="storeNameChange()" value="${(storeEdit.storeName)!''}" type="text" class="text_A left required" maxlength="50">
        <!-- <label class=" errorwrong"><i>&nbsp;</i><u>&nbsp;</u>不能为空</label> -->
         <P class="m-l-10 font-color-e">店铺名称注册后不可修改，请认真填写。</P>
      </div>
       <div class="information-line"><span class="linespan"><em>*</em> 经营品类：</span>
        <input name="prosecutionCkB" type="checkbox" class="radio div3_radio dm-no-auto-clear" divs="['Czheng','yaopin']" id="yaopin_id" value="${getConstant('dictionary.LIGHTGREEN00')!''}" <#if (storeEdit.mainGoods)?exists&&(storeEdit.mainGoods?index_of(getConstant('dictionary.LIGHTGREEN00')!'')>-1) > checked="checked"</#if> >
        <p class="m-r-20">药品</p>
        <input type="checkbox" name="prosecutionCkB" value="${getConstant('dictionary.LIGHTGREEN10')!''}" divs="['Czheng','qixie']" id="qixie_id" class="radio div3_radio dm-no-auto-clear" <#if (storeEdit.mainGoods)?exists&&(storeEdit.mainGoods?index_of(getConstant('dictionary.LIGHTGREEN10')!'')>-1)> checked="checked"</#if> >
        <p class="m-r-20">医疗器械</p>
        <input type="checkbox" name="prosecutionCkB" value="${getConstant('dictionary.LIGHTGREEN20')!''}" divs="['shipin']" id="bao_shipin_id" class="radio div3_radio dm-no-auto-clear" <#if (storeEdit.mainGoods)?exists&&(storeEdit.mainGoods?index_of(getConstant('dictionary.LIGHTGREEN20')!'')>-1)> checked="checked"</#if> >
        <p class="m-r-20">保健食品</p>
        <input type="checkbox" name="prosecutionCkB" value="${getConstant('dictionary.LIGHTGREEN30')!''}" divs="['shipin']" id="shipin_id" class="radio div3_radio dm-no-auto-clear" <#if (storeEdit.mainGoods)?exists&&(storeEdit.mainGoods?index_of(getConstant('dictionary.LIGHTGREEN30')!'')>-1)> checked="checked"</#if> >
        <p class="m-r-20">食品</p>
        <input type="checkbox" name="prosecutionCkB" value="${getConstant('dictionary.LIGHTGREEN40')!''}" divs="['huazhuang']" id="huazhuang_id" class="radio div3_radio dm-no-auto-clear" <#if (storeEdit.mainGoods)?exists&&(storeEdit.mainGoods?index_of(getConstant('dictionary.LIGHTGREEN40')!'')>-1)> checked="checked"</#if> >
        <p class="m-r-20" id="errorLocal">化妆品</p>
        <input type="checkbox" name="prosecutionCkB" value="${getConstant('dictionary.LIGHTGREEN50')!''}" divs="['xiaodu']" id="xiaodu_id" class="radio div3_radio dm-no-auto-clear" <#if (storeEdit.mainGoods)?exists&&(storeEdit.mainGoods?index_of(getConstant('dictionary.LIGHTGREEN50')!'')>-1)> checked="checked"</#if> >
        <p class="m-r-20" id="errorLocal">消毒用品</p>
       <div class="clear" style="margin-left:160px;">请根据实际的经营范畴认真选择经营品类，若存在不符合项，店铺将受到相应处罚</div>
      <div class="clear font-color-e" style="margin:5px 0 0 160px;"> 注：根据《互联网药品交易服务审批暂行规定》要求，向个人消费者提供互联网药品交易服务的企业应该是依法设立的药品连锁零售企业（经营型企业）。</div>
      </div>
    </div>
    <div id="Czheng" class="showDiv">
       <h2 class="store-intoH">互联网药品交易服务资格证书</h2>
      <input name="licenceList[3].storeName" type="hidden" class="storeNameCss">
      <input type="hidden" name="licenceList[3].businessLicenceType" value="${getConstant('dictionary.NETWORK_DRUG_QUALIFICATIONS')!''}"/>
      <div class="information-into">
          <div class="information-line"><span class="linespan"><em>*</em>证书编号：</span>
          <input name="licenceList[3].businessLicenceCode" value="${(map[type30].businessLicenceCode)!''}" type="text" class="text_A left required" maxlength="100">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em>网站名称：</span>
          <input name="licenceList[3].attr1" type="text" value="${(map[type30].attr1)!''}" class="text_A left required" maxlength="50">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em>IP地址：</span>
          <input name="licenceList[3].attr2" type="text" value="${(map[type30].attr2)!''}" class="text_A left required" maxlength="50">
        </div>
          <div class="information-line"><span class="linespan"><em>*</em>网络域名：</span>
          <input name="licenceList[3].attr3" type="text" value="${(map[type30].attr3)!''}" class="text_A left required" maxlength="50">
        </div>
       <div class="information-line"><span class="linespan"><em>*</em>有效期：</span>
          <input name="licenceList[3].licenceStartDate_str" value="${(map[type30].licenceStartDate_str)!''}" class=" text_A width100 laydate-icon left" readonly="readonly" id="start3">
          <p class=" m-l-10">-</p>
          <input name="licenceList[3].licenceEndDate_str" value="${(map[type30].licenceEndDate_str)!''}" class="text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="end3">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 服务范围：</span>
          <textarea name="licenceList[3].businessScope" class="textarea_A left required" maxlength="500">${(map[type30].businessScope)!''}</textarea>
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 上传资质证明：</span>
          <a href="javascript:void(0);" id="upload5" upload="licenceList[3].licenceElectronic" class="myUpLoadClass small-button left cx3">选择文件</a>
          <P class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</P>
          <ul id="groupimgA"  class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
          <#if map?exists&&map[type30]?exists>
          	<li><img src="${(map[type30].licenceElectronic)!''}" width="500" height="304">
              <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
              <input type="hidden" name='licenceList[3].licenceElectronic' value="${(map[type30].licenceElectronic)!''}" /></div>
            </li>
           </#if>
            <div class=" clear"></div>
          </ul>
        </div>
      </div>
    </div>
    <div id="yaopin"  class="showDiv">
     <h2 class="store-intoH">药品经营许可证</h2>
      <input name="licenceList[4].storeName" type="hidden" class="storeNameCss">
      <input type="hidden" name="licenceList[4].businessLicenceType" value="${getConstant('dictionary.DRUG_QUALIFICATIONS')!''}"/>
      <div class="information-into">
         <div class="information-line"><span class="linespan"><em>*</em>药品经营许可证号：</span>
          <input name="licenceList[4].businessLicenceCode" value="${(map[type40].businessLicenceCode)!''}" type="text" class="text_A left required" maxlength="100">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em>药品经营许可证有效期：</span>
          <input name="licenceList[4].licenceStartDate_str" value="${(map[type40].licenceStartDate_str)!''}" class="text_A width100 laydate-icon left" readonly="readonly" id="start4">
          <p class=" m-l-10">-</p>
          <input name="licenceList[4].licenceEndDate_str" value="${(map[type40].licenceEndDate_str)!''}" class="text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="end4">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 经营范围：</span>
          <textarea name="licenceList[4].businessScope" class="textarea_A left required" maxlength="500">${(map[type40].businessScope)!''}</textarea>
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 仓库地址：</span>
          <textarea  name="licenceList[4].storehouseAddressDetail" class="textarea_A left required" maxlength="50">${(map[type40].storehouseAddressDetail)!''}</textarea>
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 药品经营许可证电子版：</span> 
        <a href="javascript:void(0);" id="upload6" upload="licenceList[4].licenceElectronic" class="myUpLoadClass small-button left cx3">选择文件</a>
           <P class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</P>
          <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
            <#if map?exists&&map[type40]?exists>
          	<li><img src="${(map[type40].licenceElectronic)!''}" width="500" height="304">
              <div class="goodsoperation"><span title="放大"  class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span><input type="hidden" name='licenceList[4].licenceElectronic' value="${(map[type40].licenceElectronic)!''}" /></div>
            </li>
           </#if>
            <div class=" clear"></div>
          </ul>
        </div>
      </div>
      
      <h2 class="store-intoH">药品经营质量管理规范认证证书</h2>
      <input name="licenceList[5].storeName" type="hidden" class="storeNameCss">
      <input type="hidden" name="licenceList[5].businessLicenceType" value="${getConstant('dictionary.DRUG_PROSECUTION_QUALIFICATIONS')!''}"/>
     <div class="information-into">
      <div class="information-line"><span class="linespan"><em>*</em> GSP证书编号：</span>
          <input name="licenceList[5].businessLicenceCode" value="${(map[type50].businessLicenceCode)!''}" type="text" class="text_A left required" maxlength="100">
        </div>
         <div class="information-line"><span class="linespan"><em>*</em> GSP证书有效期：</span>
          <input name="licenceList[5].licenceStartDate_str" value="${(map[type50].licenceStartDate_str)!''}" class="text_A width100 laydate-icon left" readonly="readonly" id="start5">
          <p class=" m-l-10">-</p>
          <input name="licenceList[5].licenceEndDate_str"  value="${(map[type50].licenceEndDate_str)!''}" class="text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="end5">
        </div>
         <div class="information-line"><span class="linespan"><em>*</em> GSP证书电子版：</span> 
          <a href="javascript:void(0);" id="upload7" upload="licenceList[5].licenceElectronic" class="myUpLoadClass small-button left cx3">选择文件</a>
          <P class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</P>
           <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
          <#if map?exists&&map[type50]?exists>
          	<li><img src="${(map[type50].licenceElectronic)!''}" width="500" height="304">
              <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span><input type="hidden" name='licenceList[5].licenceElectronic' value="${(map[type50].licenceElectronic)!''}" /></div>
            </li>
           </#if>
            <div class=" clear"></div>
          </ul>
        </div>
        
        <h2 class="store-intoH">执业药师注册证</h2>
         <input name="licenceList[10].storeName" type="hidden" class="storeNameCss">
      	<input type="hidden" name="licenceList[10].businessLicenceType" value="${getConstant('dictionary.DRUGGIST')!''}"/>
        <div class="information-into">
         <div class="information-line"><span class="linespan"><em>*</em> 注册证编号：</span>
          <input name="licenceList[10].businessLicenceCode" value="${(map[type100].businessLicenceCode)!''}" type="text" class="text_A left required" maxlength="100">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 执业地区：</span>
         <select name="" id="job_nation" mark="0" onchange="nation_change(this,$('#job_province'))" class="left">
            <option>中国</option>
          </select>
          <select name="" id="job_province" mark="1" onchange="address_change(this,$('#job_city'))" class="left m-l-10">
            <option>请选择省</option>
          </select>
          <select name="" id="job_city" mark="2" onchange="address_change(this,$('#job_county'))" class="left m-l-10">
            <option>请选择市</option>
          </select>
          <select name="job_county" id="job_county"  mark="3" class="left m-l-10 required" onchange="streetChangeJson('job','jobAddress')">
            <option>请选择区县</option>
          </select>
          </#escape>
          <#escape x as x?html>
        </div>
        <input type="hidden" name="licenceList[10].storehouseAddress" id="jobAddress">
         <div class="information-line"><span class="linespan"><em>* </em>执业类别：</span>
          <input name="licenceList[10].attr1" value="${(map[type100].attr1)!''}"  type="text" class="text_A left required" maxlength="100">
        </div>
        <div class="information-line"><span class="linespan"><em>* </em>执业范围：</span>
         <textarea name="licenceList[10].businessScope" class="textarea_A left required" maxlength="500">${(map[type100].businessScope)!''}</textarea>
        </div>
        <div class="information-line"><span class="linespan"><em>* </em>经营单位：</span>
          <input name="licenceList[10].attr2" value="${(map[type100].attr2)!''}" type="text" class="text_A left required" maxlength="100">
        </div>
          <div class="information-line"><span class="linespan"><em>*</em> 有效期至：</span>
           <input name="licenceList[10].licenceStartDate_str" value="${(map[type100].licenceStartDate_str)!''}" class="text_A width100 laydate-icon left" readonly="readonly" id="start10">
          <p class=" m-l-10">-</p>
          <input name="licenceList[10].licenceEndDate_str"  value="${(map[type100].licenceEndDate_str)!''}" class=" text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="end10">
        </div>
        <div class="information-line"><span class="linespan width150"><em>*</em> 执业药师注册证电子版：</span>
          <a href="javascript:void(0);" id="upload8" upload="licenceList[10].licenceElectronic" class="myUpLoadClass small-button left cx3">选择文件</a>
           <P class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</P>
          < <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
            <#if map?exists&&map[type100]?exists>
            <li>
            <img src="${(map[type100].licenceElectronic)!''}" width="500" height="304">
              <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span><input type="hidden" name='licenceList[10].licenceElectronic' value="${(map[type100].licenceElectronic)!''}" /></div>
            
            </li>
            </#if>
            <div class=" clear"></div>
          </ul>
        </div>
      </div>
      
      
      
      
        
      </div>
    </div>
    <div id="qixie"  class="showDiv">
      <h2 class="store-intoH" id="h10">医疗器械生产许可证或备案凭证</h2>
      <h2 class="store-intoH" id="h00" style="display:none">医疗器械经营许可证或备案凭证</h2>
      <input name="licenceList[6].storeName" type="hidden" class="storeNameCss">
      <input type="hidden" name="licenceList[6].businessLicenceType" value="${getConstant('dictionary.MEDICAL_PROSECUTION_QUALIFICATIONS')!''}"/>
       <div class="information-into">
      <div class="information-line"><span class="linespan"><em>*</em>证书编号：</span>
          <input name="licenceList[6].businessLicenceCode" value="${(map[type60].businessLicenceCode)!''}" type="text" class="text_A left required" maxlength="100">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 生产或经营范围：</span>
          <textarea  name="licenceList[6].businessScope" class="textarea_A left required " maxlength="500">${(map[type60].businessScope)!''}</textarea>
        </div>
         <div class="information-line"><span class="linespan"><em>*</em> 生产或仓库地址：</span>
          <select name="" id="warehouse_nation" mark="0" onchange="nation_change(this,$('#warehouse_province'))" class="left">
            <option>中国</option>
          </select>
          <select name="" id="warehouse_province" mark="1" onchange="address_change(this,$('#warehouse_city'))" class="left m-l-10">
            <option>请选择省</option>
          </select>
          <select name="" id="warehouse_city" mark="2" onchange="address_change(this,$('#warehouse_county'))" class="left m-l-10">
            <option>请选择市</option>
          </select>
          <select name="warehouse_county" id="warehouse_county"  mark="3" class="left m-l-10 required" onchange="streetChangeJson('warehouse','medicalAddress')">
            <option>请选择区县</option>
          </select>
          <div class="clear"></div>
          <div class=" m-t-10">
          	<textarea  id="xiangxidizhi" name="licenceList[6].storehouseAddressDetail" class="textarea_A clear left required textareaaddress" style="margin-left:160px;" maxlength="50">${(map[type60].storehouseAddressDetail)!''}</textarea>
          </div>
          <input type="hidden" name="licenceList[6].storehouseAddress" id="medicalAddress">
          </#escape>
           <#escape x as x?html>
           <div class="clear"></div>
        </div>
         <div class="information-line"><span class="linespan"><em>*</em>证书有效期：</span>
          <input name="licenceList[6].licenceStartDate_str" value="${(map[type60].licenceStartDate_str)!''}" class="text_A width100 laydate-icon left" readonly="readonly" id="start6">
          <p class=" m-l-10">-</p>
          <input name="licenceList[6].licenceEndDate_str" value="${(map[type60].licenceEndDate_str)!''}" class="text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="end6">
        </div>
         <div class="information-line"><span class="linespan"><em>*</em> 证书电子版：</span> 
        <a href="javascript:void(0);" id="upload9" upload="licenceList[6].licenceElectronic" class="myUpLoadClass small-button left cx3">选择文件</a>
           <P class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</P>
           <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
          	<#if map?exists&&map[type60]?exists>
          	<li><img src="${(map[type60].licenceElectronic)!''}" width="500" height="304">
              <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span><input type="hidden" name='licenceList[6].licenceElectronic' value="${(map[type60].licenceElectronic)!''}" /></div>
            </li>
           </#if>
            <div class=" clear"></div>
          </ul>
        </div>
      </div>
    </div>
    <div id="shipin"  class="showDiv">
      
      <h2 class="store-intoH" id="foodh10">食品生产许可证</h2>
      <h2 class="store-intoH" id="foodh00" style="display:none">食品流通许可证</h2>
      
      <input name="licenceList[7].storeName" type="hidden" class="storeNameCss">
      <input type="hidden" name="licenceList[7].businessLicenceType" value="${getConstant('dictionary.BUTTERY_PROSECUTION_QUALIFICATIONS')!''}"/>
      <div class="information-into">
        <div class="information-line"><span class="linespan"><em>*</em>证书编号：</span>
          <input name="licenceList[7].businessLicenceCode" value="${(map[type70].businessLicenceCode)!''}" type="text" class="text_A left required" maxlength="100">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em>许可范围：</span>
          <textarea name="licenceList[7].businessScope" class="textarea_A left required" maxlength="500">${(map[type70].businessScope)!''}</textarea>
        </div>
        <div class="information-line"><span class="linespan"><em>*</em>证书有效期：</span>
          <input name="licenceList[7].licenceStartDate_str" value="${(map[type70].licenceStartDate_str)!''}"  class="text_A width100 laydate-icon left" readonly="readonly" id="start7">
          <p class=" m-l-10">-</p>
          <input name="licenceList[7].licenceEndDate_str" value="${(map[type70].licenceEndDate_str)!''}" class=" text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="end7">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 证书电子版：</span>
        <a href="javascript:void(0);" id="upload10" upload="licenceList[7].licenceElectronic" class="myUpLoadClass small-button left cx3">选择文件</a>
          <p class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</p>
           <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
            <#if map?exists&&map[type70]?exists>
          	<li><img src="${(map[type70].licenceElectronic)!''}" width="500" height="304">
              <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span><input type="hidden" name='licenceList[7].licenceElectronic' value="${(map[type70].licenceElectronic)!''}" /></div>
            </li>
           </#if>
            <div class=" clear"></div>
          </ul>
        </div>
      </div>
    </div>
    <div id="huazhuang"  class="showDiv">
      <h2  class="store-intoH">化妆品生产企业卫生许可证或全国工业产品生产许可证（产品名称为化妆品）</h2>
      <input name="licenceList[8].storeName" type="hidden" class="storeNameCss">
      <input type="hidden" name="licenceList[8].businessLicenceType" value="${getConstant('dictionary.COSMETIC_PROSECUTION_QUALIFICATIONS')!''}"/>
      <div class="information-into">
        <div class="information-line"><span class="linespan"><em>*</em>证书编号：</span>
          <input name="licenceList[8].businessLicenceCode"  value="${(map[type80].businessLicenceCode)!''}"  type="text" class="text_A left required" maxlength="100">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em>证书有效期：</span>
          <input name="licenceList[8].licenceStartDate_str"  value="${(map[type80].licenceStartDate_str)!''}" class="text_A width100 laydate-icon left" readonly="readonly" id="start8">
          <p class=" m-l-10">-</p>
          <input name="licenceList[8].licenceEndDate_str" value="${(map[type80].licenceEndDate_str)!''}" class="text_A width100 laydate-icon left m-l-10" readonly="readonly" id="end8">
        </div>
        <div class="information-line"><span class="linespan"><em>*</em> 证书电子版：</span> 
        <a href="javascript:void(0);" id="upload11"  upload="licenceList[8].licenceElectronic" class="myUpLoadClass small-button left cx3">选择文件</a>
           <P class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</P>
              <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
            <#if map?exists&&map[type80]?exists>
          	<li><img src="${(map[type80].licenceElectronic)!''}" width="500" height="304">
              <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span><input type="hidden" name='licenceList[8].licenceElectronic' value="${(map[type80].licenceElectronic)!''}" /></div>
            </li>
           </#if>
            <div class=" clear"></div>
          </ul>
        </div>
      </div>
    </div>
    <div id="xiaodu" class="showDiv">
            <h2 class="store-intoH	">消毒产品生产企业卫生许可证</h2>
            <input name="licenceList[9].storeName" type="hidden" class="storeNameCss">
   			<input type="hidden" name="licenceList[9].businessLicenceType" value="${getConstant('dictionary.DISINFECTION_PRODUCTS')!''}"/>
   			<div class="information-into">
              <div class="information-line"><span class="linespan width150"><em>*</em>证书编号：</span>
                <input name="licenceList[9].businessLicenceCode"  value="${(map[type90].businessLicenceCode)!''}" maxlength="100" type="text" class="text_A left required">
              </div>
              <div class="information-line"><span class="linespan width150"><em>*</em> 生产地址：</span>
                <select name="" id="disinfection_nation" mark="0" onchange="nation_change(this,$('#disinfection_province'))" class="left">
	            <option>中国</option>
	          </select>
	          <select name="" id="disinfection_province" mark="1" onchange="address_change(this,$('#disinfection_city'))" class="left m-l-10">
	            <option>请选择省</option>
	          </select>
	          <select name="" id="disinfection_city" mark="2" onchange="address_change(this,$('#disinfection_county'))" class="left m-l-10">
	            <option>请选择市</option>
	          </select>
	          <select name="disinfection_county" id="disinfection_county"  mark="3" class="left m-l-10 required" onchange="streetChangeJson('disinfection','disinfectionAddress')">
	            <option>请选择区县</option>
	          </select>
	          <input type="hidden" name="licenceList[9].storehouseAddress" id="disinfectionAddress">
                <div class="clear"></div>
                <div class="m-t-10">
                	<textarea name="licenceList[9].storehouseAddressDetail" class="textarea_A clear left required textareaaddress" style="margin-left:160px;" maxlength="50">${(map[type90].storehouseAddressDetail)!''}</textarea>
                </div>
                <div class="clear"></div>
              </div>
              <div class="information-line"><span class="linespan width150"><em>*</em>生产方式：</span>
                <input name="licenceList[9].attr1" value="${(map[type90].attr1)!''}" type="text" maxlength="100" class="text_A left required">
              </div>
              <div class="information-line"><span class="linespan width150"><em>*</em>生产项目：</span>
                <input name="licenceList[9].attr2" value="${(map[type90].attr2)!''}" type="text" maxlength="100" class="text_A left required">
              </div>
              <div class="information-line"><span class="linespan width150"><em>*</em>生产类别：</span>
                <input name="licenceList[9].attr3" value="${(map[type90].attr3)!''}" type="text" maxlength="100" class="text_A left required">
              </div>
              <div class="information-line"><span class="linespan width150"><em>*</em>证书有效期：</span>
                <input name="licenceList[9].licenceStartDate_str" value="${(map[type90].licenceStartDate_str)!''}" class="text_A width100 laydate-icon left" readonly="readonly" id="start9">
                <p class=" m-l-10">-</p>
                <input name="licenceList[9].licenceEndDate_str" value="${(map[type90].licenceEndDate_str)!''}" class=" text_A width100 laydate-icon left  m-l-10" readonly="readonly" id="end9">
              </div>
              <div class="information-line"><span class="linespan"><em>*</em> 证书电子版：</span> 
		        <a href="javascript:void(0);" id="upload12"  upload="licenceList[9].licenceElectronic" class="myUpLoadClass small-button left cx3">选择文件</a>
		          <P class="m-l-10 font-color-e">请确保图片清晰、文字可辨并有清晰的红色公章，图片大小不超过3M</P>
		          <ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
		            <#if map?exists&&map[type90]?exists>
		          	<li><img src="${(map[type90].licenceElectronic)!''}" width="500" height="304">
		              <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
		              <input type="hidden" name='licenceList[9].licenceElectronic' value="${(map[type90].licenceElectronic)!''}" /></div>
		            </li>
		           </#if>
		            <div class=" clear"></div>
		          </ul>
		        </div>
		        </div>
          </div>
    <div class="m-t-20 p-t-40" style="text-align:center"> 
    <a href="javascript:void(0);" onclick="cutDivPrev('div_2')" class="small-button">上一步，填写企业基本信息</a>
    <a href="javascript:void(0);" onclick="cutDivNext('div_4')" class="small-button m-l-20">下一步，填写联系人信息</a> </div>
    </#escape>
</#macro>
