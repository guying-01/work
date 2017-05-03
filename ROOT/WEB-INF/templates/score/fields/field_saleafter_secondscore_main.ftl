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
			}
			
			.line {
				width: 100%;
				border-top: 1px solid #dcdcdc;
			}
			
			.fenge {
				height: 0.2rem;
				background:#f0f0f0;
			}
			
			.clearW:after,.font-color-e:after{
				content: '.';
				clear: both;
				visibility: hidden;
				height: 0;
				display: block;
			}
			
			.member-tit {
				text-align: center;
				height: 0.6rem;
				line-height: 0.6rem;
				font-weight: normal;
				font-size: 0.3rem;
				font-weight: bold;
			}
			
			.member-tit a {
				position: absolute;
				left: 0.2rem;
				top: 0.18rem;
			    width: 0.35rem;
			    height: 0.28rem;
				background: url(/resources/img/order/submit_return.png) no-repeat center center;
				background-size: 100%;
			}
			.goods_pic{
				width:1.4rem;
				height: 1.4rem;
				margin-right: 0.1rem;
			}
			.goods_pic img{
				width: 100%;
				height: 100%;
			}
			.information-line {
				box-sizing: border-box;
			    padding: 0.1rem;
			    clear: both;
			    overflow: hidden;
			}
			.goods_name,.goods_guige{
				display: block;
				width: 4.7rem!important;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
				font-size: 0.22rem!important;
				border:0!important;
				text-align: left!important;
				float: left!important;
				margin:0 0 0.05rem 0!important;
			}
			.goods_pingjia{
				display: block;
				float: left;
				width: 4.7rem!important;
				word-break: break-all;
				font-size: 0.22rem;
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
			.groupimg{
				width: 100%;
				padding:0.1rem 0;
				margin:0.1rem 0 0 0;
			}
			.groupimg li{
				width: 1rem;
				height: 1rem;
				margin-right: 0.2rem;
				margin-top: 0.2rem;
				border:1px solid #dcdcdc;
				text-align: center;
				position: relative;
			}
			.groupimg li img{
				max-width: 100%;
				max-height: 100%;
			}
			.information-line .linespans{
				padding:0;
				font-size: 0.22rem;
				width:2rem ;
			}
			.font22{
				font-size: 0.22rem;
			}
			.font20{
				font-size: 0.2rem;
			}
			.bottom-button{
				width: 100%;
				margin:0;
				background: #fff;
				float: right;
				height: 0.7rem;
			}
			.small-button {
			    font-size: 0.2rem;
			}
			.payment-page{
				padding:0;
				margin-bottom: 0.8rem;
			}
		</style>
		<div class="member-list-tab">
			<div class="payment-page">
				<h2 class="member-tit"> <a href="/score/toScoreList.jhtml"></a>追加评价</h2>
				<#list secondScoreInfoFormlist as secondScoreInfoForm>
					<div class="orderdedetail">
						<div class="information-line">
							<a href="${ctx}/fsgd/${secondScoreInfoForm.goodsId}.jhtml" class="goods_pic left">
								<img src="${secondScoreInfoForm.itemSmallPicturePath!''}" width="70" height="70" />
							</a>
							
								<a class="goods_name" href="${ctx}/gd/${secondScoreInfoForm.goodsId}.jhtml">${secondScoreInfoForm.goodsName!''}</a>
								<p class="goods_guige">${(secondScoreInfoForm.itemName!'')?replace(secondScoreInfoForm.goodsName!'','','f')}</p>
							
								<span class="goods_pingjia"> 商品评价：[ ${secondScoreInfoForm.createDate!''} ] ${secondScoreInfoForm.memo!''}</span>
								<#if secondScoreInfoForm.scorePictureFormList?exists && secondScoreInfoForm.scorePictureFormList?size !=0>
									<ul class="groupimg clear">
										<#list secondScoreInfoForm.scorePictureFormList as scorePictureForm>
											<li><img src="${scorePictureForm.picUrl!''}${scorePictureForm.picName!''}" width="3rem" height="3rem" />
											</li>
										</#list>
									</ul>
								</#if>
						</div>
						<div class="information-line">
							<span class="font22">评价内容：</span>

								<textarea id="secondMemo1" name="secondMemo" rows="4" onKeyUp="textCounter(500, countCsg${secondScoreInfoForm_index})" class="textarea_A left dm-no-auto-clear" placeholder="请您认真填写评价内容，您的评价将对其他采购商起到很大的帮助！"></textarea>
								<span class="font-color-e"> <em id="reviwerEm" style="float:right;margin-top: 0.1rem;" class="font-color-e font20">还可输入<span id="countCsg${secondScoreInfoForm_index}" class="font20">500</span>字</em> </span>
							
							<div class="clearW" style="display: none">
								<span class="left font22" style="margin-top: 0.1rem;">晒照片：</span>
								<a href="javascript:void(0)" id="browse${secondScoreInfoForm_index}" class=" small-button left cx3">本地上传</a>
								<span class="left font22" style="width: 100%;margin-top: 0.1rem;">(您最多可上传5张图片，支持格式jpg、png、gif，单张图片不超过2M)</span>
								<br />
								<ul class="groupimg clearW" id="secondgroupimg${secondScoreInfoForm_index}">
								</ul>
							</div>
						</div>
						<div class="fenge"></div>
						<input type="hidden" value="${secondScoreInfoForm.orderId!''}" id="orderId${secondScoreInfoForm_index}">
						<input type="hidden" value="${secondScoreInfoForm.orderDetailId!''}" id="orderDetailId${secondScoreInfoForm_index}">
						<input type="hidden" value="${secondScoreInfoForm.modifyDate?string('yyyy-MM-dd HH:mm:ss')!''}" id="modifyDate${secondScoreInfoForm_index}">
						<input type="hidden" value="${secondScoreInfoForm.id!''}" id="scoreId${secondScoreInfoForm_index}">
				</#list>
				<div class="bottom-button">
					<a href="javascript:submitScore()" class="big-button" style="margin:0 auto;">发表评价</a>
				</div>
				</div>

				<div class="clear"></div>
			</div>

			<div class="pop_up bigimg_up">
				<div>
					<P></P>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</#escape>
</#macro>