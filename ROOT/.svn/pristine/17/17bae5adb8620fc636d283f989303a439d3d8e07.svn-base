<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>

     <div class="progress_four progress_D">
      <p class="progress_textA font-color-b">入驻协议</p>
      <p class="progress_textB font-color-b">填写企业基本信息</p>
      <p class="progress_textC font-color-b">填写企业经营信息</p>
      <p class="progress_textD progress_text">填写联系人信息</p>
    </div>
    <div id="btnSubmintDiv">
   
    <h2 class="store-intoH">联系信息</h2>
    <div class="information-into">
      <div class="information-line"><span class="linespan"><em>*</em> 联系人姓名：</span>
        <input name="contactsName" value="${(storeEdit.contactsName)!''}" type="text" class="text_A width100 left required" maxlength="50">
        <div class="clear font-color-e" style="margin-left:160px;">请填写店铺运营者姓名</div>
      </div>
      <div class="information-line"><span class="linespan"><em>*</em> 手机号码 ：</span>
        <input type="text" class="text_A left width50" value="+86">
        <em class=" m-l-10 left m-t-5">-</em>
        <input name="contactsPhone" id="contactsPhone" value="${(storeEdit.contactsPhone)!''}" type="text" class="text_A width100 left required" maxlength="11">
        <a href="javascript:void(0);" id="send_msg" class="small-button m-l-10">获取短信验证码</a>
        <p id="send_failed" class="font-color-e" style="display:none">发送失败，请重试</p>
        <p id="send_timeout" class="font-color-e" style="display:none">请等待一分钟后发送您的请求</p>
        <div class="clear font-color-e" style="margin-left:160px;">非常重要的联系人信息，用于我们与店铺运营者的联系</div>
        <div id="timeshow" class="information-note cx2 m-t-5">请注意查收短信，如果没有收到，您可以在<strong class="font-color-b" id="second"> 60 </strong>秒后要求系统重新发送 </div>
      </div>
      <div class="information-line"><span class="linespan"><em>*</em> 验证码：</span>
        <input id="authCode" name="authCode" type="text" class="text_A left required" maxlength="6">
      </div>
      <div class="information-line"><span class="linespan"><em>*</em> 常用邮箱：</span>
        <input name="contactsEmail" value="${(storeEdit.contactsEmail)!''}" type="text" class="text_A left required" maxlength="50">
      </div>
      <div class="information-line"><span class="linespan"><em>*</em> 联系人身份证复印件：</span> 
      <a href="javascript:void(0)" id="upload13" upload='contactsPhotoFront,contactsPhotoBack' class=" myUpLoadClass small-button left cx3">选择文件</a>
        <p class="m-l-10 font-color-e">请上传联系人身份证正反面复印件 图片大小不超过3M</p>
       	<ul class="groupimg clear m-t-15"  style="margin: 0 0 0 160px;">
    	   <#if storeEdit?exists>
	            <li><img width="500" height="304" src="${(storeEdit.contactsPhotoFront)!''}">
	            <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
	            <input type="hidden" name="contactsPhotoFront" value="${(storeEdit.contactsPhotoFront)!''}"></div>
	            </li>
	            <li><img width="500" height="304" src="${(storeEdit.contactsPhotoBack)!''}">
	            <div class="goodsoperation"><span title="放大" class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
	            <input type="hidden" name="contactsPhotoBack" value="${(storeEdit.contactsPhotoBack)!''}"></div>
	            </li>
	      </#if>
          <div class="clear"></div>
        </ul>
      </div>
    </div>
     <h2 class="store-intoH">平台合约</h2>
    <div class="information-into">
    <div class="information-line" style="padding-left:160px;">
        <p class=" float-no clear">请下载、打印平台合约模板，填写完成后加盖企业公章，并邮寄给我们。<a href="javascript:void(0);"  class=" font-color-c"  onclick="downLoadDoc()">点击下载模板</a> </p>
        <p class=" float-no clear">若非法定代表人签署合约，则需提供法人授权委托书，<a href="javascript:void(0);" class=" font-color-c m-r-10"  onclick="downLoadDoc()">下载模板</a>后加盖企业公章，与合约一并邮寄。</p>
        <P class=" float-no clear">(邮寄地址：大连金州新区先进装备制造业园区金七路9号)</P>
        <p class=" float-no clear">平台将在收到邮寄合约后，开始受理入驻申请，请尽快邮寄。</p>
       
        
      </div>
     <!--  <div class="information-line" style="padding-left:160px;">
        <p>请下载、打印平台协议模板，填写完成后加盖企业公章并扫描上传。 <a href="javascript:void(0);" onclick="downLoadDoc()">点击下载模板</a> </p>
        <div class="clear"></div>
        <a class="small-button left cx3" id="lastUpload" href="javascript:void(0)">选择文件</a> 
        <p>&nbsp;</p>
        <ul class="groupimg clear m-t-15" style="margin:0 0 0 0px; ">
          <#if (pro)?exists>
          <#list pro as pl>
	            <li><img width="500" height="304" src="${(pl)!''}">
	            <div class="goodsoperation"><span title="放大" onclick='window.open("${(pl)!''}")' class="bigimg">放大</span><span title="删除" onclick="$(this).parents('li').remove()" class="goodsdelete">删除</span>
	            <input type="hidden" name="storeEnterProtocolForm.contractElectronic" value="${(pl)!''}"></div>
	            </li>
	      </#list>
	      </#if>
        </ul>
        </div> -->
    </div>
    <div class="m-t-20 p-t-40" style="text-align:center">
    <a href="javascript:void(0);" onclick="cutDivPrev('div_3')"  class="small-button">上一步，填写企业经营信息</a> 
    <a href="javascript:void(0);" onclick="submit_func()" class="small-button m-l-20">下一步，等待平台审核</a></div>
     </div>
</#escape>
</#macro>