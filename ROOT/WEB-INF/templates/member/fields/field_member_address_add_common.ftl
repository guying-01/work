<#include "/common/common_var_definds.ftl" />
<#macro render data>
	<#------------------start-------------------------添加收货地址详细内容---------共通用--------两个页面用----------------------------------------->
	<form action="${ctx}/order/editAddress.ajax" id="addressform" name="addressform" method="post">
	<div class="pop_up cx2">
  <div class="pop_up_A">
  <input type="hidden" id="id" name="id" value=""> 
			<input type="hidden" id="memberId" name="memberId" value="">
			<input type="hidden" id="addres_modifyDate" name="modifyDate" value="">
    <h2><a href="javascript:void(0);" class="shut"><img src="${resources}/img/common/shutB.png" ></a>
	<div style="font-size:14px;color:#fff;" id="title"></div></h2> <#--title的名字写在JS里面因为有新增和编辑-->
    <#----------------------------省市区----------------------------------start------------------------->
    <div class="pop_bg">
      <div style="height:35px;"></div>
      <div class="add_adress"><span><em>*</em> 所在地区：</span>
      <div class="left" style="position: relative;">
        <select name="countryId" id="country" onchange="add_init(this.value)" class="left">
          <option>请选择国家</option>
        </select>
        </div>
        <div class="left" style="position: relative;">
		<input type="hidden" id="countryName" name="countryName" value="">
        <select name="provinceId" id="province" onchange="friChange(this.value)" class="left m-l-10">
          <option value="">请选择省</option>
        </select>
        </div>
        <div class="left" style="position: relative;">
		<input type="hidden" id="provinceName" name="provinceName" value="">
        <select name="cityId" id="city" onchange="secChange(this.value)" class="left m-l-10">
          <option>请选择市</option>
        </select>
        </div>
        <div class="left" style="position: relative;">
		<input type="hidden" id="cityName" name="cityName" value="">
		<select name="areaId" id="region" class="left m-l-10">
          <option>请选择区</option>
        </select>
		<input type="hidden" id="areaName" name="areaName" value="">
        </div>
      </div>
      <#-----------------------------省市区--------------------------------------end------------------->
      <div class="add_adress"><span><em>*</em> 详细地址：</span>
        <textarea name="address" id="address"class="textarea_A left " placeholder="不需要重复填写省市区，长度必须多于5个字符，不超过120个字符" ></textarea>
        <P class="clear"></P>
      </div>
      <div class="add_adress"><span><em>*</em> 邮政编码：</span>
        <input name="postcode" id="postcode" type="text" class="text_A left" value="" maxlength="6"/>
       
      </div>
      <div class="add_adress"><span><em>*</em> 联系人 ：</span>
        <input name="consignee" id="consignee" type="text" class="text_A left" value="" placeholder="长度不超过25个字符" maxlength="25" />
        
      </div>
      <div class="add_adress"><span><em>*</em> 手机号码：</span>
        <input name="mobile" id="mobileNum" type="text" class="text_A left" value="" placeholder="长度不超过11个字符" maxlength="11"/>
       
      </div>
      <div class="add_adress"><span>座机号码：</span>
	    <input name="telephone" id="telephone" type="hidden" value="" /> 
        <input name="telephone1" id="telephone1" type="text" class="text_A left width40" value="" placeholder="区号" maxlength="4"/>
        <strong>-</strong>
        <input name="telephone2" id="telephone2" type="text" class="text_A left" value="" placeholder="电话号码" maxlength="8" />
        <strong>-</strong>
        <input name="telephone3" id="telephone3" type="text" class="text_A left width40" value="" placeholder="分机号" maxlength="4"/>
        
      </div>
      <div class="add_adress">
        <input name="defaultFlag" id="defaultFlag" type="checkbox" value="" class="left" style="margin:8px 5px 0 110px;"/>
        <strong>设为默认地址</strong> </div>
      <div class="pop_up_button">
      <a href="javascript:void(0);" onclick="save()" class="small-button">保 存</a>
	  <a href="javascript:void(0);" class="small-button-greay m-l-20 shut">取 消</a></div>
    </div>
  </div>
</div>
</form>
<#------------------end-------------------------添加收货地址详细内容---------共通用--------两个页面用----------------------------------------->
 </#macro>
