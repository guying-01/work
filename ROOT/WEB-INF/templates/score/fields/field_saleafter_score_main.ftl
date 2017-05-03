<#include "/common/common_var_definds.ftl" />
<#macro render data>
	<#escape x as x?html>
		<script type="text/javascript">
			var deviceWidth = document.documentElement.clientWidth;
			if(deviceWidth > 768) {
				deviceWidth = 768;
			}
			document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
		</script>
		<style type="text/css">
			html,
			body {
				height: 100%;
				font-family: "microsoft yahei";
				min-width: 300px;
				max-width: 768px;
				margin: 0 auto!important;
				background: #fff;
			}
			.line {
				width: 100%;
				border-top: 1px solid #dcdcdc;
			}
			
			
			.clearW:after {
				content: '.';
				clear: both;
				visibility: hidden;
				height: 0;
				display: block;
			}
			.goods_pic {
				float: left;
				width: 1.4rem;
				height: 1.4rem;
				margin-right: 0.1rem;
			}
			
			.goods_pic img {
				width: 100%;
				height: 100%;
			}
			
			.goods_name,
			.goods_guige,.store_name,.store_star_box {
				display: block;
				width: 4.6rem!important;
				float: left;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
				text-align: left!important;
				margin-bottom: 0.1rem;
				font-size: 0.24rem;
			}
			
			.orderdedetail {
				box-sizing: border-box;
				padding: 0.1rem 0;
			}
			
			.goodsStar {
				width: 4.6rem!important;
				float: left;
			}
			
			.goodsStar p {
				font-size: 0.22rem;
			}
			
			.goodsStar span,
			.goodsStar strong {
				float: left;
				font-size: 0.24rem;
			}
			
			.goodsStar strong {
				margin-left: 0.1rem;
			}
			
			.target-demo {
				margin: 0;
				float: left;
			}
			.textarea_A {
			    padding:0.06rem;
			    width:6rem;
			    height:1.6rem;
			    border: solid 1px #ddd;
			    background: none;
			    outline: none;
			    margin:0.1rem auto 0 auto;
			    font-size: 0.2rem;
			}
			.small-button {
			    font-size: 0.2rem;
			}
			.bottom-button{
				width: 100%;
				position: fixed;
				margin:0;
				left: 0;
				bottom: 0.87rem;
				float: right;
				height: 0.7rem;
				margin:0.1rem auto 0 auto;
				background:#fff;
			}
			.groupimg{
				width: 100%;
				padding:0.1rem 0;
				margin:0.1rem 0 0 0;
				height: auto;
			}
			.groupimg li{
				width: 1rem;
				height: 1rem;
				margin-right: 0.2rem;
				border:1px solid #dcdcdc;
				text-align: center;
			}
			.groupimg li img{
				max-width: 100%;
				max-height: 100%;
			}
			.store_star_box .linespans{
				float: left;
				font-size: 0.24rem;
			}
			.linespans{
				font-size: 0.24rem;
			}
			.font20{
				font-size: 0.2rem;
			}
			.paddlr10{
				padding:0.1rem
			}
			.i .font20{
				margin-top: 0.1rem;
			}
			.payment-page{
				padding:0;
			}
			.member-tit a{
			    position: absolute;
			    width: 0.4rem;
			    height: 0.4rem;
			    background: url(/resources/img/order/submit_return.png) no-repeat center center;
			    background-size: 100%;
				left: 0.2rem;
                top:50%;
				margin-top: -0.2rem;
			}
			.target-demo{
				width: auto!important;
				margin-top: 0.026rem;
			}
			.target-demo img{
				width: 0.26rem;
				height: 0.26rem;
			}
			.pingjia_con{
				margin:0.2rem 0 0.1rem 0;
			}
			.store_box{
				margin-top: 0.1rem;
			}
		</style>
		<div class="content-right">

			<div class="payment-page">
				<div class="line"></div>
				<h2 class="member-tit"><a onclick="javascript :history.go(-1)"></a>商品评价</h2>
				<form id="dataForm">

					<#list scoredata.scoreInfoFormList as scoreInfoForm>
						<div class="orderdedetail clearW">

							<div class="clearW goods_info paddlr10">
								<a href="${ctx}/gd/${scoreInfoForm.goodsId}.jhtml" class="goods_pic">
									<img src="${scoreInfoForm.itemSmallPicturePath!''}" />
								</a>
								<a href="${ctx}/gd/${scoreInfoForm.goodsId}.jhtml" class="goods_name">${scoreInfoForm.goodsName!''}</a>
								<p class="goods_guige">${(scoreInfoForm.itemName!'')?replace(scoreInfoForm.goodsName!'','','f')}</p>
	
								<div id="goodsStar" class="goodsStar">
									<div class="clearW">
										<span class="">商品评价：</span>
										<div class="target-demo function-demo"></div>
										<strong name="score" class="font-color-d">0</strong>
										<span>分</span>
									</div>
	
									<p id="function-hint2" class="font-color-e">点击星星就能打分</p>
								</div>
							</div>

							<#-- <#if scoredata.tagLsit?? &&scoredata.tagLsit?size gt 0>
								<div class="information-line" name="Item_tag"><span class="linespans ">商品标签：</span>

									<#list scoredata.tagLsit as tag>
										<button value="${tag.id}" name="sscore_tap" style="background:#F3F3F3;height:30px;width:90px">${tag.name}</button>
									</#list>

								</div>
								</#if> -->
								<div class="clearW paddlr10 pingjia_con">
									<p class="linespans">评价内容：</p>
									<textarea name="memo" rows="4" onKeyUp="textCounter(500, countCsg${scoreInfoForm_index})" maxlength="500" class="textarea_A" placeholder="请您认真填写评价内容，您的评价将对其他采购商起到很大的帮助！"></textarea>
									<P class=""><em id="reviwerEm" style="float:right" class="font-color-e font20">还可输入<span id="countCsg${scoreInfoForm_index}" class="font20">500</span>字</em></P>
								</div>
								<div class="i paddlr10" style="display: none">
									<span class="linespans">晒照片：</span>
									<a href="javascript:void(0)" id="browse${scoreInfoForm_index}" class=" small-button cx3">本地上传</a>
									<P class="font-color-e font20">(您最多可上传5张图片，支持格式jpg、png、gif，单张图片不超过2M)</P>
									<ul class="groupimg" id="groupimg${scoreInfoForm_index}">
									</ul>
								</div>
						</div>
						<input type="hidden" value="${scoreInfoForm.orderId}" id="orderId${scoreInfoForm_index}">
						<input type="hidden" value="${scoreInfoForm.id}" id="orderDetailId${scoreInfoForm_index}">
						<input type="hidden" value="${scoreInfoForm.goodsId}" id="goodsId${scoreInfoForm_index}">
						<input type="hidden" value="${scoreInfoForm.goodsName}" id="goodsName${scoreInfoForm_index}">
					</#list>
					<div class="line"></div>
					<h2 class="member-tit"> <i>&nbsp;</i>商铺评价</h2>
					<div class="orderdedetail clearW paddlr10 store_box">
						<div class="">
							<a href="javascript:void(0);" class="goods_pic"><img src="${scoredata.storeForm.storeLogo!}"/></a>
							<p class="store_name">${scoredata.storeForm.name}</p>
						</div>
						<div class="clearW store_star_box">
							<div class="clearW"><span class="linespans">商品满意度：</span>
								<div class="target-demo function-score"></div>
								<div class="function-hint"></div>
							</div>
							<div class="clearW"><span class="linespans">价格满意度：</span>
								<div class="target-demo function-score"></div>
								<div class="function-hint"></div>
							</div>
							<div class="clearW"><span class="linespans">服务满意度：</span>
								<div class="target-demo function-score"></div>
								<div class="function-hint"></div>
							</div>
						</div>
			</div>
			<div class="bottom-button">
				<a href="javascript:submitScore()" class="big-button" style="margin:0 auto;">发表评价</a>
			</div>
		</div>
		</form>
		<div class="clear"></div>
		<div style="height: 1.55rem;"></div>
		</div>
		<div class="pop_up bigimg_up">
			<div>
				<P></P>
			</div>
		</div>
		<div class="clear"></div>
		</div>
		<input type="hidden" value="${scoredata.storeForm.id}" id="storeId">
		<p id="function-hint" type="hidden" class="font-color-e" style="display: none;">点击星星就能打分</p>
	</#escape>
</#macro>