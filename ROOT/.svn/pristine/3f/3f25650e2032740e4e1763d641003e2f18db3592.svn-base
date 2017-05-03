<#include "/common/common_var_definds.ftl" /> 
<#macro render data>
<#escape x as x?html>
<div class="member-list">
	<ul class="tabT">
		<li class="on" id="jtk"><span  onclick="returnOrder(1)"><a
				href="javascript:void(0);">仅退款(无需退货)</a></span></li>
		<li id="thtk"><span onclick="returnGoods(1)"><a href="javascript:void(0);"
				>退货退款</a></span></li>
	</ul>
	<div class="member-list-tab">
		<div class="m-a p-t-40">
				<div class="progress_three progress_A" style="display: show;">
					<p class="progress_textA font-color-b">采购商申请退款</p>
					<p class="progress_textB">商家处理退款申请</p>
					<p class="progress_textC">完成</p>
				</div>
				<div class="progress_five progress_A" style="display: none;">
					<p class="progress_textA font-color-b">采购商申请退货</p>
					<p class="progress_textB">商家处理退货申请</p>
					<p class="progress_textC">采购商退货给卖家</p>
					<br />
					<p class="progress_textD width200" style="left:595px;">商家确认收货并处理退款</p>
					<p class="progress_textE">完成</p>
				</div>
				<div class="payment-page">
						<h2 class="member-tit tk" style="display: show;">
						<i>&nbsp;</i>退款商品
					</h2>
					<h2 class="member-tit th" style="display: none;">
						<i>&nbsp;</i>退货商品
					</h2>
					<#if promotionList??>
					<#list promotionList as orderDetailForm>
					<table width="90%" border="0" cellspacing="0" cellpadding="0"
						class="table-line m-t-20">
						<tr class="bor-l bor-r bor-t">
							<th width="35%" colspan="2" valign="middle" scope="col">商品名称</th>
							<th width="13%" scope="col">商品规格</th>
							<th width="13%" scope="col">单价（元）</th>
							<th width="11%" scope="col">数量</th>
							<th width="13%" scope="col">小计（元）</th>
							<th width="15%" scope="col">商家</th>
						</tr>
						<tr>
							<input type="hidden" id="mainOrderDetailId" name="mainOrderDetailId"
								value="<#if mainOrderDetailId??>${mainOrderDetailId!}</#if>" />
							<input type="hidden" id="mainStoreName" name="mainStoreName"
								value="<#if mainOrderForm??>${mainOrderForm.storeName!}</#if>" orderType="combinationStoreName"/>
							<input type="hidden" id="mainStoreId" name="mainStoreId"
								value="<#if mainOrderForm??>${mainOrderForm.storeId!}</#if>" orderType="combinationStoreId"/>
							<input type="hidden" id="orderDetailId" name="orderDetailId"
								value="${orderDetailForm.id!}" orderType="combinationOrderDetailId" />
							<input type="hidden" id="storeName" name="storeName"
								value="${orderForm.storeName!}" orderType="combinationStoreName"/>
							<input type="hidden" id="storeId" name="storeId"
								value="${orderForm.storeId!}" orderType="combinationStoreId"/>
							<input type="hidden" id="" name="" value="" />
							<td width="10%" class="bor-no"><a
								href="${ctx}/fsgd/${orderDetailForm.goodsId}.jhtml"><img
									src="${orderDetailForm.itemSmallPicturePath!''}" width="80"
									height="80" /></a></td>
							<td width="25%" class="bor-no" valign="top"
								style="text-align: left;"><a
								href="${ctx}/fsgd/${orderDetailForm.goodsId}.jhtml">${orderDetailForm.goodsName!''}</a></td>
							<td valign="top" class="bor-no">${(orderDetailForm.itemName!'')?replace(orderDetailForm.goodsName!'','无','f')}</td>
							<td valign="top" class="bor-no">${orderDetailForm.itemPrice?string("0.00")}</td>
							<td valign="top" class="bor-no">${orderDetailForm.itemAmount}</td>
							<td rowspan="2" class="bor-no" valign="top">${(orderDetailForm.itemAmount
								* orderDetailForm.itemPrice)?string("0.00")}</td>
							<td rowspan="2" valign="top" class="bor-no">
							<a href="${ctx}/fsst/${orderForm.storeId}/top.jhtml" class="font-color-b">${orderForm.storeName!}</a>
								<a href="javascript:QQtalk('1739073619');" class="consulting" dm-actor="webim-store" dm-data="${userCode!''}"><i></i>联系客服</a></td>
						</tr>
					</table>
					</#list>
					<#else>
						<#if orderDetailForm??>
					<table width="90%" border="0" cellspacing="0" cellpadding="0"
						class="table-line m-t-20">
						<tr class="bor-l bor-r bor-t">
							<th width="35%" colspan="2" valign="middle" scope="col">商品名称</th>
							<th width="13%" scope="col">商品规格</th>
							<th width="13%" scope="col">单价（元）</th>
							<th width="11%" scope="col">数量</th>
							<th width="13%" scope="col">小计（元）</th>
							<th width="15%" scope="col">商家</th>
						</tr>
						<tr>
							<input type="hidden" id="orderDetailId" name="orderDetailId"
								value="${orderDetailForm.id!}" orderType="orderDetailId" />
							<input type="hidden" id="storeName" name="storeName"
								value="${orderForm.storeName!}" orderType="storeName" />
							<input type="hidden" id="storeId" name="storeId"
								value="${orderForm.storeId!}"  orderType="storeId"/>
							<input type="hidden" id="" name="" value="" />
							<td width="10%" class="bor-no"><a
								href="${ctx}/fsgd/${orderDetailForm.goodsId}.jhtml"><img
									src="${orderDetailForm.itemSmallPicturePath!''}" width="80"
									height="80" /></a></td>
							<td width="25%" class="bor-no" valign="top"
								style="text-align: left;"><a
								href="${ctx}/fsgd/${orderDetailForm.goodsId}.jhtml">${orderDetailForm.goodsName!''}</a></td>
							<td valign="top" class="bor-no">${(orderDetailForm.itemName!'')?replace(orderDetailForm.goodsName!'','无','f')}</td>
							<td valign="top" class="bor-no">${orderDetailForm.itemPrice?string("0.00")}</td>
							<td valign="top" class="bor-no">${orderDetailForm.itemAmount}</td>
							<td rowspan="2" class="bor-no" valign="top">${(orderDetailForm.itemAmount
								* orderDetailForm.itemPrice)?string("0.00")}</td>
							<td rowspan="2" valign="top" class="bor-no">
							<a href="${ctx}/fsst/${orderForm.storeId}/top.jhtml" class="font-color-b">${orderForm.storeName!}</a>
								<a href="javascript:QQtalk('1739073619');" class="consulting" dm-actor="webim-store" dm-data="${userCode!''}"><i></i>联系客服</a></td>
						</tr>
					</table>
					</#if>
					</#if>
					<h2 class="member-tit tk" style="display: show;">
						<i>&nbsp;</i>申请退款
					</h2>
					<h2 class="member-tit th" style="display: none;">
						<i>&nbsp;</i>申请退货
					</h2>
					<div class="orderdedetail">
						<div class="information-line">
							<span name='returnMoneyType' class="linespan width110 tk" ><em>*</em>退款商品数量：</span>
							<span name='returnMoneyType' class="linespan width110 th" style="display: none;"><em>*</em>退货商品数量：</span>
							 <!--商品数量-->
							<input id="returnOrderamount" value="${returnOrderamount!}" type="hidden"/>
							<select name="returnAmount" id="threturnAmount" value=""
								class=" left"  >
								<option value="">请选择</option> 
								<#if amountList??&&amountList?size gt 0>
								<#list amountList as amount>
									<#if amountHistory??&&amountHistory?string == amount?string>
										<option value="${amount!}" selected = "selected">${amount!}</option>
									<#else>
										<option value="${amount!}">${amount!}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="information-line">
							<span class="linespan width110 tk"><em>*</em>退款原因：</span>
							 <span class="linespan width110 th" style="display: none;"><em>*</em>退货原因：</span>
							<#if returnOrderForm??> 
								<input type="hidden"
								value="${returnOrderForm.id}" id="returnOrderId" name="id" /> <input
								type="hidden" value="${returnOrderForm.returnType}"
								id="returnType" name="returnType" /> <input type="hidden"
								value="${returnOrderForm.modifyDate?string('yyyy-MM-dd HH:mm:ss')!}"
								id="modifyDate" /> <input id="returnReason"
								value="${returnOrderForm.returnReason!}" type="hidden" />
							<#else> 
								<input type="hidden" value="" id="id" name="id" /> <input
								type="hidden" value="" id="returnType" name="returnType" /> <input
								id="returnReason" value="" type="hidden" /> </#if>
							<!-- 退款 -->
							<select name="returnReason" id="tkreturnReason" value=""
								class=" left tk" onchange="sel(this)">
								<option value="">请选择原因</option> <#if returnMoneyDictionaryList??
								&&returnMoneyDictionaryList?size gt 0> <#list
								returnMoneyDictionaryList as item> <#if returnOrderForm??> <#if
								returnOrderForm.returnReason==item.code>
								<option value="${item.code!}" selected="selected">${item.name!}</option>
								<#else>
								<option value="${item.code!}">${item.name!}</option> </#if>
								<#else>
								<option value="${item.code!}">${item.name!}</option> </#if>
								</#list> </#if>
							</select>
							
							<!-- 退货 -->
							<select name="returnReason" id="threturnReason" value=""
								class=" left th" onchange="sel(this)" style="display: none">
								<option value="">请选择原因</option> <#if returnGoodsDictionaryList??
								&&returnGoodsDictionaryList?size gt 0> <#list
								returnGoodsDictionaryList as items> <#if returnOrderForm??> <#if
								returnOrderForm.returnReason==items.code>
								<option value="${items.code!}" selected="selected">${items.name!}</option>
								<#else>
								<option value="${items.code!}">${items.name!}</option> </#if>
								<#else>
								<option value="${items.code!}">${items.name!}</option> </#if>
								</#list> </#if>
							</select>
						</div>
						<form id="moneyForm">
							<div class="information-line">
								<span class="linespan width110"><em>*</em>退款金额：</span> <input
									name="returnMoney" id="returnMoney" type="text"<#if
								returnOrderForm??> value="${returnOrderForm.returnMoney?c!}"
								<#else> value="" </#if> class="text_A left width70
								dm-no-auto-clear" maxlength="20"/>
								<input id="returnmoneynone" style="display:none" value="" />
								<P class="m-l-10">元</P>
								<p class=" font-color-e m-l-10">
									您可申请的退款金额最多不超过 <#if remainMoneyInfo.hasShipped> 
										<strong
										class="font-color-d ccd" id="changeReturnMoney">
										<!--${remainMoneyInfo.remainMoney?string("0.00")} -->
										<#if canReturnMoney??>${canReturnMoney?string("0.00")}<#else>0.00</#if></strong>元，因为已经发货，所以运费不再计算在内。
								</P>
								<#else> <strong class="font-color-d ccd" id="changeReturnMoney"><#if canReturnMoney??>${canReturnMoney?string("0.00")}<#else>0.00</#if>
									</strong>元，<span id="other" class="font-color-e"><span id="isLastGood" class="font-color-e" style="display:none">不</span>包含发货运费 <strong
									class="font-color-d" id="changeShippingMoney">
									<#--<#if canReturnMoney?? >${orderDetailMap['orderForm'].shippingMoney?string("0.00")}<#else>0.00 </#if></strong>元。</div>-->
									<#--<input id="hideShipMoney" value="${orderDetailMap['orderForm'].shippingMoney?string("0.00")}" type="hidden"/>-->
								</P>
								</#if>
							</div>
						</form>
						<div class="information-line">
							<span class="linespan width110">补充说明：</span> <#if
							returnOrderForm??>
							<textarea name="memo" id="memo" maxlength="200"
								onKeyUp="textCounter(200, countCsg)"
								class="textarea_A left dm-no-auto-clear">${returnOrderForm.memo!}</textarea>
							<#else>
							<textarea name="memo" id="memo" maxlength="200"
								onKeyUp="textCounter(200, countCsg)"
								class="textarea_A left dm-no-auto-clear"></textarea>
							</#if>

							<P class="m-l-10 font-color-e"
								style="padding-top: 50px; line-height: 20px;">
								<em id="reviwerEm" style="float: right"
									class="m-t-15 m-r-20 font-color-e">还可输入<span id="countCsg">200</span>字
								</em>
							</P>
						</div>
						<div class="information-line">
							<span class="linespan width110">上传凭证：</span> <a
								href="javascript:void(0)" id="browse" class=" small-button left">选择文件</a>
							<P class="m-l-10 font-color-e m-l-10">您最多可上传5张图片，单张图片不超过2M。</P>
							<ul class="groupimg clear p-t-10 p-l-10" id="groupimg">

								<#if returnPictureList?? &&returnPictureList?size gt 0> <#list
								returnPictureList as itemA>
								<li><img src="${itemA.picUrl!}${itemA.picName!}"
									width="800" height="800" />
									<div class="goodsoperation">
										<span title="放大" class="bigimg" onclick="bigimg(this)">放大</span>
										<span title="删除" class="goodsdelete" id="${itemA.id!}"
											onclick="deleteimgorno(this)">删除</span>
									</div> <input type="hidden" id="imgpicture" name="picture"
									value="${itemA.picUrl!}${itemA.picName!}" /></li> </#list> </#if>
							</ul>
						</div>
						<div class="bottom-button m-b-20 p-t-20">
							<a<#if returnOrderForm??> href="javascript:editApplyRefund()"<#else> href="javascript:addApplyRefund()" </#if>
								class="big-button left" style="margin-left:200px;">提交申请</a> <a
								href="javascript:history.go(-1);"
								class="big-button-gray left m-l-20">取 消</a>
						</div>
					</div>
					<#if orderMap['orderForm']??>
					<h2 class="member-tit">
						<i>&nbsp;</i>订单信息
					</h2>
					<div class="orderdedetail">
						<ul class="order-information">
							<input id="orderId" type="hidden"
								value="${orderMap['orderForm'].id!''}" />
							<li>订单编号：${orderMap['orderForm'].id!''}</li>
							<li>确认收货时间：<#if orderMap['doneTime']??>
								${orderMap['doneTime']?string('yyyy-MM-dd HH:mm:ss')}</#if>    </li>
							<li>下单时间：${orderMap['orderForm'].orderDate?string('yyyy-MM-dd
								HH:mm:ss')}</li>
							<li>支付单号：${(orderDetailMap['tradeSerialNumber'])!''}</li>
							<li>付款时间： <#if orderDetailMap['tradeAsynNotifyTime']??> <#if
								orderDetailMap['tradeAsynNotifyTime']??>
								${orderDetailMap['tradeAsynNotifyTime']!?string('yyyy-MM-dd
								HH:mm:ss')} </#if> </#if></li>
							<li></li>
							<#if shippingBillList?? && shippingBillList?size gt 0>
		  						 <#list shippingBillList as shippingBill>
							<li>物流类型：<#if shippingBill??>${shippingBill.shippingType!''}</#if>   </li>
							<li>运单编号：<#if shippingBill??>${shippingBill.billId!''}</#if>   </li>
							<li>物流公司：<#if shippingBill??>${shippingBill.companyName!''}</#if>    </li>
								</#list>
							</#if>
							<li class="float-no" style="word-break: break-all">收货信息：
								${(orderMap['shippingInfoForm'].countryName)!''}
								${(orderMap['shippingInfoForm'].provinceName)!''}
								${(orderMap['shippingInfoForm'].cityName)!''}
								${(orderMap['shippingInfoForm'].areaName)!''}${(orderMap['shippingInfoForm'].address)!''}，
								邮编：${(orderMap['shippingInfoForm'].postCode)!''} ，
								${(orderMap['shippingInfoForm'].customer)!''}(收)，
								${(orderMap['shippingInfoForm'].mobile)!''} <#if
								orderMap['shippingInfoForm'].telephone??> ， </#if>
								${(orderMap['shippingInfoForm'].telephone)!''}</li>
							<li class="float-no"><span class="left">商家信息：<span
									id="sellerName">${orderMap['sellerName']!''}</span></span> <a
								href="javascript:void(0);" class="left m-l-10"><img
									src="/resources/img/common/consulting.png" width="24"
									height="22" style="display: none;" dm-actor="webim-store"
									dm-data="" /></a></li>
							<li class="float-no" style="word-break: break-all">采购商留言：${(orderMap['orderForm'].memo)!''}</li>
							<li class="float-no">隐藏商品名称：<#if orderMap['orderForm'].isGoodsNameHide?? &&
								orderMap['orderForm'].isGoodsNameHide==1> <input type="checkbox"
								checked="checked" disabled="disabled" /> <#else> <input
								type="checkbox" disabled="disabled" /> </#if>
							</li>
							<li class="float-no">商品清单：</li>
							<div class="anclose-button">
								<p></p>
							</div>
						</ul>
					</div>
					<div class="goodslist">
						<div class="table-tit">
							<span class="width400">商品名称</span><span class="width200">商品规格</span>
							<span>单价（元）</span><span>数量</span><span>小计（元）</span>
						</div>
						<div class="order-tab ">
							<#list orderDetailMap['orderDetailFormList'] as orderDetailForm>
							<div class="table-produce refundsuccess" id="div_${orderDetailForm.id!''}">
								<input type="hidden" id="orderDetailId" name="orderDetailId"
									value="${orderDetailForm.id!}" />
								<p class="textalign-l" style="padding-left:80px; width:320px; word-break:break-all">
									<span><a
										href="${ctx}/gd/${orderDetailForm.goodsId}.jhtml"><img
											src="${orderDetailForm.itemSmallPicturePath!''}" /></a></span> <span><a
										href="${ctx}/gd/${orderDetailForm.goodsId}.jhtml" class="left">${orderDetailForm.goodsName!''}</a></span>
								</p>
								<p class="width200 textalign-l">
									<strong>${(orderDetailForm.itemName!'')?replace(orderDetailForm.goodsName!'','','f')}</strong>
								</P>
								<p>${orderDetailForm.itemPrice?string("0.00")}</p>
								<p>${orderDetailForm.itemAmount}</p>
								<p>${(orderDetailForm.itemAmount *
									orderDetailForm.itemPrice)?string("0.00")}</p>
							</div>
							</#list>
						</div>
					</div>
					<div class="table-message">
						<div class="order-sum">
							<ul>
							<#if couponList??>
								<#list couponList as couponList>
									<li><span>${activityCouponTypeMap[couponList.couponType].name}（元）：</span><strong id="psyf">-${couponList.discountAmount?string("0.00")}</strong></li>
								</#list>
							</#if>
							<#if pointsSale!=0>
									<li><span>积分（元）：</span><strong id="psyf">-${pointsSale?string("0.00")!}</strong></li>
							</#if>
								<li><span>商品合计（元）：</span><strong>${orderDetailMap['orderForm'].goodsMoney?string("0.00")}</strong></li>
								<#--<li><span>配送运费（元）：</span><strong id="psyf">${orderDetailMap['orderForm'].shippingMoney?string("0.00")}</strong></li>-->
								<li><span>订单实付（元）：</span> <strong class="font-color-d" id="ddsf"> 
										${(orderDetailMap['orderForm'].payMoney )?string("￥0.00")}
							</ul>
						</div>
					</div>
					<div class="clear"></div>
					</#if>
				</div>
		</div>
	</div>
</div>
<div class="pop_up bigimg_up">
	<div>
		<P></P>
	</div>
</div>
</#escape> </#macro>
