<#include "/common/common_var_definds.ftl" />
<#macro render data>
<#escape x as x?html>
<style>
	.modify i {
		background: url(/resources/img/member/goBack.png) no-repeat center center;
        display: inline-block;
        width: 0.3rem;
        height: 0.3rem;
        background-size: contain;
        position: absolute;
        left: 0.1rem;
        top: 50%;
		margin-top: -0.15rem;
	}
</style>
<div class="main">
    <h2 class="member-tit modify"> <a href="javascript:void(0);"></a> <i onclick="javascript :history.go(-1);"></i>个人资料设置</h2>
	<div class="member-list">
	<ul class="tabT" style="display: none">
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
        	<div class="orderdedetail m-1">
                <div style="display: none;" class="pop_up bigimg_up">
                    <div>
                        <p></p>
                    </div>
                </div>
                
				<form action="${ctx}/member/updateMemberDetailApply.ajax" id="userForm" name="userForm" method="post">
					<input id="input_id" name="memberId"	 value="${(userDetail.memberId)!""}" type="hidden">
                    
					<div class="information-line "><span class="linespan" style="text-align: right;">采购商登录账号：</span>
			            <P class="m_edP_nb">${(user.userCode)!""}</P>
			        </div>
                    
                    <div class="information-line" style="height:1.2rem;">
                        <span class="linespan" style="text-align: right; line-height: 1.1rem;">采购商头像：</span>
                        <div class="member-header member-haed" >
							<#if memberPictureForm.bigIconPath??>
                                <img id = "userDetailHeaderImg" src= ${(memberPictureForm.bigIconPath)!""}><#--<a href="javascript:void(0);" onclick="$('#tabDiv_1').click();">更换头像</a>-->
							<#else>
                                <img id = "userDetailHeaderImg" src= "/resources/img/member/backgroud.jpg"><#--<a href="javascript:void(0);" onclick="$('#tabDiv_1').click();">更换头像</a>-->
							</#if>
                        </div>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">采购商身份码：</span>
                        <P class="m_edP_nb">${(userInfo.passportNo)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">法人姓名：</span>
                        <P class="m_edP_nb">${(userDetail.lrName)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">联系电话：</span>
                        <p class="m_edP_nb">${(userDetail.lrMobile)!""}</p>
						<#--<#if userInfo.verifyStatus?? && userInfo.verifyStatus == 1>-->
                            <#--<a href="javascript:void(0);" class="small-button m-l-10"  style="background-color: grey;border-color: grey">修改</a>-->
						<#--<#else>-->
                            <#--<a href="javascript:void(0);" class="small-button m-l-10" onclick="$.dm.jumpTo('/member/towstoreCheckAuthUpdateMobileModel.jhtml')">修改</a>-->
						<#--</#if>-->

                    </div>
                    <#--<div class="information-line p-t-40"><span class="linespan width100">身份证：</span>
                        <P>${(userDetail.lrName)!""}</P>
                    </div>-->
                    <#--<div class="form-group information-line">-->
                                     <#--<span class="linespan" style="text-align: right; line-height: 1rem;"><label class="control-label col-xs-3" for="" ><span style="color: red;">*</span>身份证 ：</label></span>-->
                                     <#--<div class="col-xs-5" style="float: right;margin-right: 1.05rem;">-->
                                         <#--<ul class="groupimg left m-0">-->
                                             <#--<#if userDetail.lrIdCardPic1 ?exists>-->
                                                 <#--<#list userDetail.lrIdCardPic1 ?split(",") as item>-->
                                                     <#--<li><img src="${item}" >-->

                                                         <#--<div class="goodsoperation"><span class="bigimg" title="放大">放大</span></div>-->
                                                     <#--</li>-->
                                                 <#--</#list>-->
                                             <#--</#if>-->
                                             <#--<#if userDetail.lrIdCardPic2 ?exists>-->
                                                 <#--<#list userDetail.lrIdCardPic2 ?split(",") as item>-->
                                                     <#--<li><img src="${item}" >-->

                                                         <#--<div class="goodsoperation"><span class="bigimg" title="放大">放大</span></div>-->
                                                     <#--</li>-->
                                                 <#--</#list>-->
                                             <#--</#if>-->
                                         <#--</ul>-->
                                     <#--</div>-->
                                 <#--</div>-->

                    <div class="information-line"><span class="linespan" style="text-align: right;">身份证：</span>
                        <div style="display: inline-block;    vertical-align: middle;">
                            <ul class="groupimg itemImg itemImgShop m-0">
								<#if userDetail.lrIdCardPic1 ?exists>
									<#list userDetail.lrIdCardPic1 ?split(",") as item>
                                    <li><img src="${item}" onclick="bigimg(this)"></li>
									</#list>
								</#if>
								<#if userDetail.lrIdCardPic2 ?exists>
									<#list userDetail.lrIdCardPic2 ?split(",") as item>
                                    <li><img src="${item}" onclick="bigimg(this)"></li>
									</#list>
								</#if>
                            </ul>
                        </div>
                    </div>





                    <div class="information-line"><span class="linespan" style="text-align: right;">店名：</span>
                        <P class="m_edP_nb">${(userDetail.buyerName)!""}</P>
                    </div>


                    <div class="shopSence information-line">
                        <div style="float:left;">
						<span class="linespan" style="text-align: right;">门头清晰照片：</span>
                        <#--<P>${(userDetail.shop_pic)!""}</P>-->
                        </div>
                        <div style="float:right;margin-right: 0.78rem;width: 2.95rem;" class="showPics showPics-gy">
							<a href="javascript:;" class="left"><</a>
							<div class="groupImgDiv">
                            	<ul class="groupimg itemImg itemImgShop m-0" id="itemImgShop">
								<#if userDetail.shopPic ?exists>
									<#list userDetail.shopPic?split(",") as item>
                                        <li>
											<img src="${item}" width="800" height="800" onclick="bigimg(this)">
                                        </li>
									</#list>
								</#if>
                            </ul>
							</div>
                            <a href="javascript:;" class="right">></a>
                        </div>
                    </div>


					<div class="shopSence information-line">
                        <div style="float:left;">
							<span class="linespan" style="text-align: right;">资质证件：</span>
							<#--<P>${(userDetail.quality_pic)!""}</P>-->
                        </div>
                        <div style="float:right;margin-right: 0.78rem;width: 2.95rem;" class="showPics showPics-gy">
                            <#--<div class="information-line" style="padding-top: 0px;">&lt;#&ndash;<a href="javascript:void(0);" class=" small-button left" id="addImg4Quality">选择图片</a>&ndash;&gt;-->
                                <#--&lt;#&ndash;<P class="m-l-10 font-color-e">（单张图片不超过2M，总数不能超过8张）</P>&ndash;&gt;-->
                            <#--</div>-->
                                <a href="javascript:;" style="margin-right: 0.03rem;"class="leftQ"><</a>
                                <div class="groupImgDiv">
                            		<ul class="groupimg m-0 itemImg itemImgShop" id="itemImgQuality">
								<#if userDetail.qualityPic ?exists && userDetail.qualityPic!=''>
									<#list userDetail.qualityPic?split(",") as item>
                                        <li>
                                            <img src="${item}" width="800" height="800" onclick="bigimg(this)" title="">
                                        </li>
									</#list>
								</#if>
                            </ul>
								</div>
                                <a href="javascript:;" class="rightQ">></a>
                        </div>
                    </div>



					<div class="information-line"><span class="linespan" style="text-align: right;">接货人姓名：</span>
                        <P class="m_edP_nb">${(userDetail.masterPorterName)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">接货人电话：</span>
                        <P class="m_edP_nb">${(userDetail.masterPorterMobile)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">店内电话：</span>
                        <P class="m_edP_nb">${(userDetail.masterPorterTelephone)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">紧急联系人：</span>
                        <P class="m_edP_nb">${(userDetail.icePersonName)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">紧急联系人电话：</span>
                        <P class="m_edP_nb">${(userDetail.icePersonMobile)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">QQ号：</span>
                        <P class="m_edP_nb">${(userDetail.buyerQq)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">微信号：</span>
                        <P class="m_edP_nb">${(userDetail.buyerWeixin)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">邮箱：</span>
                        <p class="m_edP_nb">${(userDetail.buyerEmail)!""}</p>
                    </div>
                    <div class="information-line "><span class="linespan" style="text-align: right;">地址：</span>
                        <P class="m_edP_nb">辽宁省 大连市 ${(userDetail.deliveryDistrict)!""} ${(userDetail.deliveryStreet)!""} ${(userDetail.deliveryNumber)!""}</P>
                    </div>
                    <#--<div class="information-line "><span class="linespan width100">区域：</span>
                        <select class="form-control" name="buyerDistrict"  id="buyerDistrict">
                            <option  value="">请选择</option>
							<#list getConstant('dictionary.BUYER_DISTRICT') as item>
								<#if userDetail.buyerDistrict ?? && userDetail.buyerDistrict == item>
                                    <option   selected="selected" value="${item}">${item}</option>
								<#else >
                                    <option value="${item}" >${item}</option>
								</#if>
							</#list>
                        </select>
                    </div>-->

                    <#--<div class="information-line"><span class="linespan width100"><em>*</em>地址：</span>
                        <input type="text" class="text_A left" value="${(userDetail.buyerLocation)!""}" maxLength="100" id="buyerLocation" name="buyerLocation" required/>
                    </div>-->

                    <div class="information-line"><span class="linespan" style="text-align: right;">街道方位：</span>
                        <#--<P>${(userDetail.deliveryStreetBearing)!""}</P>-->

                        <#if userDetail.deliveryStreetBearing ?exists>
                                    	<#if userDetail.deliveryStreetBearing == 'c'>
                                         <p class="form-control b16 m_edP_nb">中段</p>
                                         </#if>
                                         <#if userDetail.deliveryStreetBearing == 'e'>
                                         <p class="form-control b16 m_edP_nb">东段</p>
                                         </#if>
                                         <#if userDetail.deliveryStreetBearing == 's'>
                                         <p class="form-control b16 m_edP_nb">南段</p>
                                         </#if>
                                         <#if userDetail.deliveryStreetBearing== 'w'>
                                         <p class="form-control b16 m_edP_nb">西段</p>
                                         </#if>
                                         <#if userDetail.deliveryStreetBearing == 'n'>
                                         <p class="form-control b16 m_edP_nb">北段</p>
                                         </#if>
                                         <#if userDetail.deliveryStreetBearing == ''>
                                         <p class="form-control b16 m_edP_nb"></p>
                                         </#if>
                                                                              <#else>
                                     <p class="form-control b16 m_edP_nb"></p>
                                     </#if>

                    </div>
					<div class="information-line"><span class="linespan" style="text-align: right;">邻近路街名称：</span>
                        <P class="m_edP_nb">${(userDetail.deliveryNearbyStreet)!""}</P>
                    </div>
                    <div class="information-line"><span class="linespan" style="text-align: right;">附近标志建筑：</span>
                        <P class="m_edP_nb">${(userDetail.deliveryNearbyLandmarks)!""}</P>
                    </div>
                   <#-- <div class="form-group">
                            <label class="control-label col-xs-3" for="bean.deliveryLongitude"><span style="color: red;">*</span>百度地图：</label>
                            <div class="col-xs-3">
                                <input class="form-control b19" name="userDetail.deliveryLongitude" id="userDetail.deliveryLongitude" type="text" value="${userDetail.deliveryLongitude!''}" size="" class="form-control" maxLength="20" placeholder="经度" required isLongitude="true" readonly/>
                            </div>
                            <div class="col-xs-3">
                                <input class="form-control b20" name="userDetail.deliveryLatitude" id="userDetail.deliveryLatitude" type="text" value="${userDetail.deliveryLatitude!''}" size="" class="form-control" maxLength="20" placeholder="纬度" required isLatitude="true" readonly/>
                            </div>


                        </div>-->

                      <div class="form-group">
                            <#--<label class="control-label col-xs-3" for="userDetail.deliveryLongitude">百度地图：</label>-->
                            <div class="col-xs-2">
                                <input name="userDetail.deliveryLongitude" id="userDetail.deliveryLongitude" type="hidden" value="${userDetail.deliveryLongitude!''}" size="" class="form-control" maxLength="20" placeholder="经度" isLongitude="true"/>
                            </div>
                            <div class="col-xs-2">
                                <input name="userDetail.deliveryLatitude" id="userDetail.deliveryLatitude" type="hidden" value="${userDetail.deliveryLatitude!''}" size="" class="form-control" maxLength="20" placeholder="纬度" isLatitude="true"/>
                            </div>


                        </div>

                        <div class="form-group" style="width: 80%;margin: auto">
                            <label class="control-label col-xs-3" for=""></label>
                            <div class="col-xs-5">
                                <div id="baiduMap" class="col-xs-2" style="width:100%;height:5rem;margin: 0.1rem 0;"></div>
                            </div>
                        </div>


                    <#--<div class="information-line"><span class="linespan" style="text-align: right;">审核信息：</span>
						<#if userInfo.verifyStatus?? && userInfo.verifyStatus == 1>
                            <P class="m_edP_nb">审核中</P>
						<#elseif userInfo.verifyStatus?? && userInfo.verifyStatus == 2>
                            <P class="m_edP_nb">审核通过</P>
						<#elseif userInfo.verifyStatus?? && userInfo.verifyStatus == 9>
                            <P class="m_edP_nb">审核未通过</P>
						<#else >
                            <P class="m_edP_nb">未审核</P>
						</#if>
                    </div>
					<div class="information-line"><span class="linespan" style="text-align: right;">审核意见：</span>
                        <P class="m_edP_nb">${(userDetail.verifyInfo)!""}</P>
                    </div>-->
					 <div class="contactBox">
                        <P style="text-indent: 0.06rem">信息修改请联系客服</P>
                        <P>客服电话：<span style="color: #db0401;font-size: 0.3rem;">0411-39655915</span></P>
                    </div>
			        <#--<div  class="bottom-button p-t-40" id="submitbtn">
						<#if userInfo.verifyStatus?? && userInfo.verifyStatus == 1>
							<input type="button" class="big-button" style="background: grey" disabled="disabled" value="已 提 交"/>
						<#else>
                            <a href="javascript:void(0);" class="big-button" onClick="saveUser()" >提 交 审 核</a>
						</#if>
			        </div>-->
				</form>
			</div>
			<#--<div class="web-note m-t-20 add-point">-->
				<#--<h2>完善个人信息可以获得额外积分哦！<a href="javascript:void(0);" class=" font-color-c" onclick="$('#tabDiv_2').click();">去完善</a></h2>-->
			<#--</div>-->
		</div>
	</div>

	<div id="JKDiva_1" style="display:none">
		<div class="member-list-tab" >
			<div class="orderdedetail m-1">
				<div class="information-line p-t-20"><a href="javascript:void(0);" class=" small-button left" id="addImg" style="margin-left: 0.1rem;">选择图片</a>
					<#--<P class="m-l-10 font-color-e"></P>-->
          		</div>
          		<div class="information-line"><span class="linespan width100">头像预览：</span>
          		<input type="hidden" id="hidden_input"/>
            		<div class="left" dm-container="previewImg" style="width: 100%"> <img src="${ctx}/resources/img/member/backgroud.jpg" id="target" style="width: 100%"/>
              			<div class="jc-boxtext" style="width: 100%;padding: 0.1rem;box-sizing: border-box">请在工作区域放大缩小及移动选取框，选择要裁剪的范围，裁切宽高比例固定；裁切后的效果将显示在下方预览图中；保存提交后生效。
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
          		<div  class="bottom-button" style=" margin-top:0.2rem;"><a href="javascript:void(0);" class="big-button" onClick="saveHeader()" style="float: none">保 存</a>
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
     <div class="extendsPage" style="    width: 100%;height: 2rem;background: #fff;"></div>
</div>

</div>
</#escape>
</#macro>