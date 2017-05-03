<#include "/common/common_var_definds.ftl" /> <#macro render data>
<#escape x as x?html>
<div class="member-list-tab">
	<div class="orderdedetail m-a p-t-40">
		<div class="progress_five progress_A">
			<p class="progress_textA">采购商申请退货</p>
			<p class="progress_textB ">商家处理退货申请</p>
			<p class="progress_textC ">商家退货给卖家</p>
			<p class="progress_textD width200" style="left: 600px;">商家确认收货并处理退款</p>
			<p class="progress_textE">完成</p>
		</div>
		<#if returnOrderDetailForm??>
		<div class="payment-page">
			<#if returnType ==
			"${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
			<h2 class="member-tit">
				<i>&nbsp;</i>退款信息
			</h2>
			<#else>
			<h2 class="member-tit">
				<i>&nbsp;</i>退货信息
			</h2>
			</#if>
			<div class="orderdedetail">
				<ul class="order-information">
					<input type="hidden"
						value="${returnOrderStateMap['orderStateName'].code!''}"
						id="stateId" />
					<input type="hidden"
						value="${returnOrderDetailForm.returnOrderForm.returnReason!}"
						id="returnReasonId" />
					<input type="hidden" value="${returnType}" id="returnType" />
					<input type="hidden" id="returnOrderId"
						value="${returnOrderDetailForm.returnOrderForm.id!}" />
					<li><span class="left" style="margin-left: 24px;">卖家：<#--${returnOrderDetailForm.returnOrderForm.memberName!}-->${userCode!''}</span><a
						href="javascript:void(0);" class="consulting m-l-10"
						dm-actor="webim-store" dm-data="${userCode!''}"></a></li>
					<li>申请时间：${returnOrderDetailForm.returnOrderForm.applyDate?string('yyyy-MM-dd
						HH:mm:ss')!}</li> <#if returnType ==
					"${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
					<li>退款商品：</li> <#else>
					<li>退货商品：</li> </#if>
					<div class="refund-goods">
						<a href="/gd/${returnOrderDetailForm.goodsId!}.jhtml"><img
							src="${returnOrderDetailForm.itemSmallPicturePath!}" width="50"
							height="50" /></a>
						<P>
							<a href="/gd/${returnOrderDetailForm.goodsId!}.jhtml">${returnOrderDetailForm.goodsName!}</a>${(returnOrderDetailForm.itemName!'')?replace(returnOrderDetailForm.goodsName!'','','f')}
						</P>
					</div>
					<li>退款类型：${returnTypes}</li>
					<li class="width435">退款金额：<strong class="font-color-d"
						id="returnMoney">${returnOrderDetailForm.returnOrderForm.returnMoney?string("0.00")!}</strong>
						元
					</li> <#if returnType ==
					"${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
					<li id="returnReason">退款原因：${returnReason}</li> <#else>
					<li id="returnReason">退货原因：${returnReason}</li> </#if>
					<li>订单编号：<a
						href="javascript:toOrderDetail('${returnOrderDetailForm.returnOrderForm.orderId!}')">${returnOrderDetailForm.returnOrderForm.orderId!}</a></li>
					<li></li>
					<input type="hidden" id="goodsShippingStateId"
						value="${returnOrderDetailForm.returnOrderForm.goodsShippingStateId!}" />
					<input type="hidden" id="billId"
						value="${returnOrderDetailForm.returnOrderForm.billId!}" />
					<input type="hidden" id="shippingCompanyName"
						value="${returnOrderDetailForm.returnOrderForm.shippingCompanyName!}" />
					<input type="hidden" id="returnMoney"
						value="${returnOrderDetailForm.returnOrderForm.returnMoney!}" />
					<input type="hidden" id="memo"
						value="${returnOrderDetailForm.returnOrderForm.memo!}" /> <#if
					returnType == "${getConstant('dictionary.RETURN_ORDER_TYPE_00')}">
					<div id="shippingDiv">
						<li>商品状态：${returnOrderDetailForm.returnOrderForm.goodsShippingStateId!}</li>
						<li>运单编号：<a href="javascript:void(0);">${returnOrderDetailForm.returnOrderForm.billId!}</a></li>
						<li>物流公司：${returnOrderDetailForm.returnOrderForm.shippingCompanyName!}</li>
						<div></#if>
				</ul>
				<div class="clear"></div>
			</div>
			</#if>
			<h2 class="member-tit">
				<i>&nbsp;</i>填写退货物流信息
			</h2>
			<div class="orderdedetail">
				<input type="hidden" id="autoTimeTypeCode"
					value="${getConstant('dictionary.AUTO_CANCEL_RETURN_GOODS_SELLERAGREE')!''}"></input>
				<div class="information-line">
					<p class="m-l-10">
						请您在 <span class="font-color-d" id="timekeep">${(timekeep)!}天00:00:00</span>
						内退货给商家并提交物流信息，否则退货申请将自动关闭。
					</p>
				</div>
				<div class="information-line">
					<span class="linespan width150">退货地址：</span>
					<P style="word-break: break-all">${returnOrderDetailForm.returnOrderForm.returnAddress!}
					</P>
				</div>
				<input type="hidden"
					value="${returnOrderDetailForm.returnOrderForm.id!}"
					id="returnOrderId" /> <input type="hidden"
					value="${returnOrderDetailForm.returnOrderForm.orderDetailId!}"
					id="orderDetailId" /> <input type="hidden"
					value="${returnOrderDetailForm.returnOrderForm.returnType!}"
					id="returnType" /> <input type="hidden"
					value="${returnOrderDetailForm.returnOrderForm.modifyDate?string('yyyy-MM-dd HH:mm:ss')}"
					id="modifyDate" />
				<div class="information-line">
					<span class="linespan  width150"><em>*</em>物流公司：</span> <select
						name="" id="shippingCompanyId" class=" left">
						<option value="">请选择物流公司</option> <#if shippingCompanyList??
						&&shippingCompanyList?size gt 0> <#list shippingCompanyList as
						items>
						<option value="${items.id!}">${items.name!}</option> </#list>
						</#if>
					</select>
				</div>
				<div class="information-line">
					<span class="linespan width150"><em>*</em>运单编号：</span> <input
						type="text" id="billIds" class="text_A left dm-no-auto-clear" />
				</div>
				<div class="information-line">
					<span class="linespan width150 " style="word-break: break-all">补充说明：</span>
					<textarea id="shippingMemo" maxlength="200"
						onKeyUp="textCounter(200, countCsg)"
						class="textarea_A left dm-no-auto-clear"></textarea>
					<P class="m-l-10 font-color-e"
						style="padding-top: 50px; line-height: 20px;">
						<em id="reviwerEm" style="float: right"
							class="m-t-15 m-r-20 font-color-e">还可输入<span id="countCsg">200</span>字
						</em>
					</P>
				</div>
				<div class="information-line">
					<span class="linespan width150">上传凭证：</span> <a
						href="javascript:void(0)" id="browse" class=" small-button left">选择文件</a>
					<P class="m-l-10 font-color-e m-l-10">您最多可上传5张图片，单张图片不超过2M。</P>
					<ul class="groupimg clear" style="margin-left: 160px;"
						id="groupimg">

						<#if returnPictureList?? &&returnPictureList?size gt 0> <#list
						returnPictureList as itemA>
						<li><img src="${itemA.picUrl!}/${itemA.picName!}" width="800"
							height="800" />
							<div class="goodsoperation">
								<span title="放大" class="bigimg" onclick="bigimg(this)">放大</span>
								<span title="删除" class="goodsdelete" id="${itemA.id!}"
									onclick="deleteimgorno(this)">删除</span>
							</div> <input type="hidden" id="imgpicture" name="picture"
							value="${itemA.picUrl!}/${itemA.picName!}" /></li> </#list> </#if>
					</ul>
				</div>
				<div class="bottom-button m-t-20  m-b-20 p-t-20">
					<a href="javascript:editApplyRefund()" class="big-button left"
						style="margin-left: 200px;">提交信息</a> <a
						href="javascript:history.go(-1);"
						class="big-button-gray left m-l-20">取 消</a>
				</div>
				<h2 class="member-tit">
					<i>&nbsp;</i>操作记录
				</h2>
				<input id="returnOrderId" type="hidden" value="${returnOrderId}" />
				<input id="returnType" type="hidden" value="${returnType}" />
				<div id="history"></div>
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
