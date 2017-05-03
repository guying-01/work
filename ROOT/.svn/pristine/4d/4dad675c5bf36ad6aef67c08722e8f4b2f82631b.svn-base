<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>

<div class="member-list">
	<ul class="tabT">
	<#if memImg??>
	<input id="memImg" name="memberId" value="${(memImg)!""}" type="hidden">
		<li id="tabDiv_0" onclick="JavaScript:ChangeDiv('0','JKDiva_',2)" ><span>基本信息</span></li>
		<li id="tabDiv_1" onclick="JavaScript:ChangeDiv('1','JKDiva_',2)" class="on"><span>更换头像</span></li>
		<li id="tabDiv_2" onclick="JavaScript:ChangeDiv('2','JKDiva_',2)"><span>完善个人信息</span></li>
	<#else>
		<li id="tabDiv_0" onclick="JavaScript:ChangeDiv('0','JKDiva_',2)" class="on"><span>基本信息</span></li>
		<li id="tabDiv_1" onclick="JavaScript:ChangeDiv('1','JKDiva_',2)"><span>更换头像</span></li>
		<li id="tabDiv_2" onclick="JavaScript:ChangeDiv('2','JKDiva_',2)"><span>完善个人信息</span></li>
	</#if>
	</ul>
      
	<div id="JKDiva_0">
    	<div class="member-list-tab" >
        	<div class="orderdedetail  m-a">
				<form action="${ctx}/member/updateMemberDetail.ajax" id="userForm" name="userForm" method="post">
					<input id="input_id" name="memberId" value="${(userDetail.memberId)!""}" type="hidden">
					<div class="information-line p-t-40"><span class="linespan width100">会员名称：</span>
			            <P>${(user.userCode)!""}</P>
			        </div>
			        <div class="information-line" style="height:120px;">
			        	<span class="linespan width100">会员头像：</span>
			            <div class="member-header" style="top:3px;left:113px;">
			            <#if userDetail.bigIconPath??>
			            	<img id = "userDetailHeaderImg" src= ${(userDetail.smallIconPath)!""}><a href="javascript:void(0);" onclick="$('#tabDiv_1').click();">更换头像</a>
			            <#else>
			            	<img id = "userDetailHeaderImg" src= "/resources/img/member/backgroud.jpg"><a href="javascript:void(0);" onclick="$('#tabDiv_1').click();">更换头像</a>
			            </#if>
			            </div>
			        </div>
			        <div class="information-line"><span class="linespan width100">手机：</span>
			            <p>${(userDetail.mobile)!""}</p>
			            <a href="javascript:void(0);" class="small-button m-l-10" onclick="$.dm.jumpTo('/member/towstoreCheckAuthUpdateMobileModel.jhtml')">修改</a> 
			        </div>
			       <!-- <#if userDetail.mailAddress??>
			        <div class="information-line"><span class="linespan width100">邮箱：</span>
			            <p>${(userDetail.mailAddress)!""}</p>
			            <a href="javascript:void(0);" class="small-button m-l-10" onclick="$.dm.jumpTo('/member/towstoreCheckAuthIsMailModel.jhtml')">修改</a> 
			        </div>
			        <#else>
			        <div class="information-line"><span class="linespan width100">邮箱：</span>
			            <a href="javascript:void(0);" class="small-button m-l-10" onclick="$.dm.jumpTo('/member/towstoreCheckAuthIsMailModel.jhtml')">立即设置</a> 
			        </div>
			        </#if>-->
			        <div class="information-line"><span class="linespan width100">昵称：</span>
			            <input type="text" class="text_A left" value="${(userInfo.showName)!""}" maxLength="10" id="showName" name="showName"/>
			        </div>
			        <div  class="bottom-button p-t-40">
			        	<a href="javascript:void(0);" class="big-button" onClick="saveUser()">保 存</a>
			        </div>
				</form>
			</div>
			<div class="web-note m-t-20 add-point">
				<h2>完善个人信息可以获得额外积分哦！<a href="javascript:void(0);" class=" font-color-c" onclick="$('#tabDiv_2').click();">去完善</a></h2>
			</div>
		</div>
	</div>
     
	<div id="JKDiva_1" style="display:none">
		<div class="member-list-tab" >
			<div class="orderdedetail m-a">
				<div class="information-line p-t-20"><a href="javascript:void(0);" class=" small-button left" id="addImg">选择图片</a>
					<P class="m-l-10 font-color-e">（单张图片不超过3M）</P>
          		</div>
          		<div class="information-line"><span class="linespan width100">头像预览：</span>
          		<input type="hidden" id="hidden_input"/>
            		<div class="left" dm-container="previewImg"> <img src="${ctx}/resources/img/member/backgroud.jpg" id="target" />
              			<div class="jc-boxtext">请在工作区域放大缩小及移动选取框，选择要裁剪的范围，裁切宽高比例固定；裁切后的效果将显示在下方预览图中；保存提交后生效。
              			</div>
              			<form id="coords"    onsubmit="return false;" style="display:none">
							<label>X1
								<input type="text" size="4" id="x1" name="x1" />
				            </label>
				            <label>Y1
				                  <input type="text" size="4" id="y1" name="y1" />
				            </label>
				            <label>X2
				                  <input type="text" size="4" id="x2" name="x2" />
				            </label>
				            <label>Y2
				                  <input type="text" size="4" id="y2" name="y2" />
				            </label>
				            <label>W
				                  <input type="text" size="4" id="w" name="w" />
				            </label>
				            <label>H
				                  <input type="text" size="4" id="h" name="h" />
				            </label>
						</form>
					</div>
				</div>
          		<div  class="bottom-button" style=" margin-top:420px;"><a href="javascript:void(0);" class="big-button" onClick="saveHeader()">保 存</a>
          		</div>
        	</div>
      	</div>
	</div>
    
	<div id="JKDiva_2" style="display:none">
		<div class="member-list-tab" > 
			<div class="orderdedetail m-a">
				<form id="detailForm" action="${ctx}/member/updateMemberData.ajax" >
			  		<input id="input_id" name="memberId" value="${(userDetail.memberId)!""}" type="hidden">
	      			<div class="information-line p-t-20">
      					<span class="linespan width100">性别：</span>
         				<div class="left width400"> 
         					<input name="sex" type="radio" class="radio" id="RadioGroup1_0" value="0"  />
        					<p>男</p>
        					<input type="radio" name="sex" value="1" id="RadioGroup1_1" class="radio m-l-10"  />
        					<p>女</p>
        				</div>
        				<script>
				        	insertRadio($('[name="sex"]'),"${(userDetail.sex)!}");
				        </script>
        				<#--><p class="font-color-e m-l-10">(填写可得10积分）</p><-->
      				</div>
      				<div class="information-line"><span class="linespan width100">真实姓名：</span>
        				<div class="left width400">
          					<input type="text" class="text_A" name ="trueName" value="${(userDetail.trueName)!}" />
        				</div>
        				<#--><p class="font-color-e m-l-10">(填写可得10积分）</p><-->
      				</div>
      
      				<div class="information-line"><span class="linespan width100">常用药：</span>
        				<div class="left width400">
          					<input type="text" class="text_A" name="commonUseMedicine" value="${(userDetail.commonUseMedicine)!}"/>
        				</div>
        				<#--><p class="font-color-e  width325  m-l-10">(常用药、病史、过敏史三项词语之间用空格间隔，如：感冒 发烧 ，三项单独填写，每项可得50积分）</p><-->
     				 </div>
     
      				<div class="information-line"><span class="linespan width100">病史：</span>
        				<div class="left width400">
          					<input type="text" name="illnessHistory" class="text_A" value="${(userDetail.illnessHistory)!}"/>
        				</div>
      					<#--><p class="font-color-e m-l-10">(三项填写完整可得200积分）</p><-->
      				</div>
      				<div class="information-line"><span class="linespan width100">过敏史：</span>
        				<div class="left width400">
          					<input type="text" name="allergyHistory" class="text_A" value="${(userDetail.allergyHistory)!}"/>
        				</div>
        				<#--><p class="font-color-e m-l-10">(保密声明：常用药、病史、过敏史只能被医师查看)</p><-->
      				</div>
      				<div class="information-line"><span class="linespan width100">生日：</span>
		        		<div class="left width400">
		          			<select name="year" id ="year" class="left" dm-value="${(userDetail.year)!""}">
                  			</select>
		          			<select name="month" id="month" class="left m-l-10" dm-value="${(userDetail.month)!""}">
		          			</select>
		          			<select name="day" id="day" class="left m-l-10" dm-value="${(userDetail.day)!""}">
		          			</select>
		        		</div>
	      				<#--><p class="font-color-e m-l-10">(填写可得50积分）</p><-->
      				</div>
      				<div class="information-line"><span class="linespan width100">身高：</span>
        				<div class="left width400">
          					<select name="height" class="left">
            					<option value="">请选择</option>
            					<option value="1">140以下</option>
            					<option value="2">140-150</option>
					            <option value="3">150-160</option>
					            <option value="4">160-170</option>
					            <option value="5">170-180</option>
					            <option value="6">180-190</option>
					            <option value="7">190以上</option>
          					</select>
          					<P class="p-l-10">CM</P>
          					<script>
					          	$('[name="height"]').val("${(userDetail.height)!}");
					        </script>
        				</div>
        				<#--><p class="font-color-e m-l-10">(填写可得20积分）</p><-->
      				</div>
      				<div class="information-line"><span class="linespan width100">体重：</span>
				        <div class="left width400">
				          	<select name="bodyWeight" class="left">
					            <option value="">请选择</option>
					            <option value="1">40以下</option>
					            <option value="2">40-45</option>
					            <option value="3">45-50</option>
					            <option value="4">55-60</option>
					            <option value="5">60-65</option>
					            <option value="6">65-70</option>
					            <option value="6">70以上</option>
				          	</select>
				          	<P class="p-l-10">KG</P>
				          	<script>
				          		$('[name="bodyWeight"]').val("${(userDetail.bodyWeight)!}");
				          	</script>
				        </div>
        				<#--><p class="font-color-e m-l-10">(填写可得50积分）</p><-->
      				</div>
      				<div class="information-line"><span class="linespan width100">婚姻状况：</span>
				        <div class="left width400">
				          	<input name="maritalStatus" type="radio" class="radio" id="RadioGroup2_0" value="0"  />
				          	<p>已婚</p>
				          	<input name="maritalStatus" type="radio" value="1" id="RadioGroup2_1" class="radio m-l-10"  />
				          	<p>未婚</p>
				 		</div>
				 		<script>
				        	insertRadio($('[name="maritalStatus"]'),"${(userDetail.maritalStatus)!}");
				        </script>
				        <#--><p class="font-color-e m-l-10">(填写可得20积分）</p><-->
				     </div>
      				<div class="information-line"><span class="linespan width100">月收入：</span>
        				<div class="left width400">
					         <p class=" m-r-10"> <input name="monthIncome" type="radio" class="radio" id="RadioGroup3_0" value="0" checked="checked" />
					          2000以下</p>
					         <p class=" m-r-10"> <input type="radio" name="monthIncome" value="1" id="RadioGroup3_1" class="radio"  />
					          2000-3999元</p>
					          <p class=" m-r-10"><input type="radio" name="monthIncome" value="2" id="RadioGroup3_2" class="radio"  />
					          4000-5999元</p>
					          <p class=" m-r-10"><input type="radio" name="monthIncome" value="3" id="RadioGroup3_3" class="radio"  />
					          6000-7999元</p>
					          <p><input type="radio" name="monthIncome" value="4" id="RadioGroup3_3" class="radio"  />
					          8000元以上</p>
					     </div>
					     <script>
					        insertRadio($('[name="monthIncome"]'),"${(userDetail.monthIncome)!}");
					     </script>
					     <#--><p class="font-color-e m-l-10">(填写可得50积分）</p><-->
        				 <div class="clear"></div>
      				</div>
       				
       				<h3 class="m-t-20 bor-t p-t-20 clear">职业信息</h3>
      				<div class="information-line"><span class="linespan width100">工作性质：</span>
				        <div class="left width400">
					          <input name="workProperty" type="radio" value="1" class="radio"  >
					          <p>常坐</p>
					          <input name="workProperty" type="radio" value="2" class="radio m-l-10"  >
					          <p>常站</p>
					          <input name="workProperty" type="radio" value="3" class="radio m-l-10"  >
					          <p>常应酬</p>
					          <input name="workProperty" type="radio" value="4" class="radio m-l-10"  >
					          <p>常熬夜</p>
				        </div>
				        <script>
				        	insertRadio($('[name="workProperty"]'),"${(userDetail.workProperty)!}");
				        </script>
        				<#--><p class="font-color-e m-l-10">(填写可得50积分）</p><-->
      				</div>
      				<div  class="bottom-button p-t-40">
      					<a href="javascript:void(0);" onclick="submitDetail()" class="big-button left" style="margin-left:150px;">保 存</a>
      					<a href="javascript:void(0);" class=" big-button-gray left m-l-30" onclick="$.dm.jumpTo('/member/toUpdateMemberDetail.jhtml')">取 消</a>
      				</div>
		      </form>
			</div>
		</div>
	</div>
</div>
</#escape>
</#macro>