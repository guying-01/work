<#-- 加载通用变量定义 -->
	<#include "/common/common_var_definds.ftl" />
	<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
	<#macro render data>
		<#escape x as x?html>
			<@scrollTop.render />
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
					height: 0.1rem;
					background: red;
				}
				
				.clearW:after {
					content: '.';
					clear: both;
					visibility: hidden;
					height: 0;
					display: block;
				}
				
				.order-search-name:after,
				.order-serch:after {
					content: '.';
					clear: both;
					visibility: hidden;
					height: 0;
					display: block;
				}
				
				.member-tit {
					text-align: center;
					height: 0.8rem;
					line-height: 0.8rem;
					font-weight: bold;
					font-size: 0.3rem;
				}
				
				.order-serch input {
					width: 2rem;
					height: 0.54rem;
					line-height: 0.54rem;
					font-size: 0.2rem;
					box-sizing: border-box;
				}
				
				.order-serch strong {
					font-size: 0.24rem;
					margin: 0.1rem 0.1rem 0 0;
					/*margin-right: 0.1rem;*/
					letter-spacing: -1px;
					line-height: 0.34rem;
				}
				
				.order-search-name {
					margin-bottom: 0.2rem;
				}
				
				.order-search-name input {
					width: 3rem;
				}
                .order-search-name input:focus{
					border: 0.01rem solid purple;
				}
				.order-serch {
					width: 100%;
					box-sizing: border-box;
					padding: 0.2rem 0 0.2rem 0.9rem;
				}
				
				.order-serch span {
					padding: 0;
					display: inline-block;
					width: 0.3rem;
					text-align: center;
					line-height: 0.34rem;
				}
				
				.small-button {
					display: block;
					margin: 0 auto 0 1.3rem;
					padding: 0;
					color: #fff;
					background: #ff8b0e;
					text-align: center;
					text-decoration: none;
					width: 2rem;
					height: 0.4rem;
					line-height: 0.4rem!important;
					font-size: 0.24rem;
					border-radius: 0.1rem;
				}
				
				.member-tit {
					position: relative;
				}
				
				.member-tit a {
					position: absolute;
					left: 0.2rem;
					top: 0.25rem;
				    width: 0.35rem;
				    height: 0.28rem;
					background: url(/resources/img/order/submit_return.png) no-repeat center center;
					background-size: 100%;
				}
				
				.laydate-icon,
				.text_A {
					padding-left: 0.05rem;
				}
				.evaluation_list {
					width: 85%;
					margin: 0 auto;
					overflow: hidden;
				}


				.evaluation_list h3,
				.evaluation_list p {
					font-size: 0.25rem;
					width: 100%;
					text-align: left!important;
					padding: 0.05rem;
				}

				.score,
				.btn {
					font-size: 0.25rem;
				}

				.score {
					text-align: left!important;
				}

				.btn {
					text-align: right!important;
				}
				.groupimg{
                    width:100%;
					margin: 0;
					padding: 0.05rem 0;
				}
				.groupimg li{
					position: relative;
					width: 1rem;
					height: 1rem;
					margin-right: 0.2rem;
					margin-top: 0.1rem;
					border:1px solid #dcdcdc;
					text-align: center;
				}
				.groupimg li img{
					max-width: 100%;
					max-height: 100%;
				}
				.font-color-c{
					margin:0;
				}
				#loadmore{
				    display: block;
				    height: 0.6rem;
				    line-height: 0.6rem;
				    text-align: center;
				    color: #fff;
				    font-size: 0.26rem;
				    background: #d01202;
				    border-top: 1px solid #dcdcdc;
				}
				.big_img_box{
					display: none;
					position: fixed;
					width: 100%;
					height: 100%;
					z-index: 1002;
					background: rgba(0,0,0,0.5);
					text-align: center;
					left: 0;
					top: 0;
				}
				.big_img_box img{
					position: absolute;
					max-width: 100%;
				}
				.groupimg:after{
					content: '.';
					clear: both;
					visibility: hidden;
					height: 0;
					display: block;
				}
				.everyOrderTitle,.itemStore{
					width: 95%;
					height: auto;
					margin: 0.2rem auto 0;
					padding: 0.1rem;
					border: 0.05rem solid #e3e3e3;
					border-radius: 0.3rem;
					box-sizing: border-box;
					overflow: hidden;
				}
                .everyOrderTitle p{
					overflow: hidden;
					margin: 0 auto;
					padding: 0.1rem;
					box-sizing: border-box;
					border-bottom: 0.02rem solid #e3e3e3;
				}
                .everyOrderTitle p:last-of-type{
					border-bottom: none;
				}
                .everyOrderTitle p span:nth-of-type(2){
					float: right;
					max-width: 70%;
					white-space: nowrap;
					text-overflow: ellipsis;
					display: block;
					overflow: hidden;
				}
				.bigPic{
					width: 1.7rem;
					height: 1.7rem;
                    border: 0.05rem solid #e3e3e3;
                    border-radius: 0.3rem;

                }
                .goods-pic a{
					display: block;
					width: 100%;
					height: 100%;
				}
				.itemStoreRight{
					box-sizing: border-box;
					padding: 0.05rem;
					width: 67%;
					overflow: hidden;
				}
                .itemStoreRight p{
					padding: 0.05rem;
					width: 100%;
					box-sizing: border-box;
					white-space: nowrap;
					text-overflow: ellipsis;
					overflow: hidden;
				}
                .contact-gy{
					width: 0.3rem;
					height: 0.3rem;
					background: url("${resources}/img/common/consulting.gif") no-repeat center center;
					float: left;
					background-size: contain;
				}
				.goods-item:last-of-type{

				}
				.scoreListTitle{
                    margin-top: 0.1rem!important;
					text-align: center;
					background: #f2f2f2;
					padding: 0.1rem 0;
					border-top: 0.02rem solid #e3e3e3;
					border-bottom: 0.02rem solid #e3e3e3;
				}
			</style>
			<div class="line"></div>
			<div class="member-list-tab">
				<h2 class="member-tit"> <a href="/member/index.jhtml"></a>评价管理</h2>
				<div class="order-serch">
					<div class="order-search-name">
						<strong>商品名称&nbsp;:</strong>
						<input type="text" class=" text_A dm-no-auto-clear" id="goodsName" name="goodsName" maxLength="100">
					</div>
					<div class="clearW order-search-name">
						<strong>开始日期&nbsp;:</strong>
						<input readonly="" class=" text_A laydate-icon dm-no-auto-clear" id="startDate" name="startDate">
					</div>
					<div class="clearW order-search-name">
						<strong>结束日期&nbsp;:</strong>
						<input readonly="" class=" text_A laydate-icon dm-no-auto-clear" id="endDate" name="endDate">
					</div>

					<a href="javascript:void(0)" class="small-button left" onClick="searchScoreList(1,false)">
						查找
					</a>
					<div class="clear"></div>
				</div>
				<script id="scoreList-tl" type="text/x_handlebars_template">
						{{#each this}} {{#compare orderId}}
						<div class="scoreListTitle">
								订单编号:<a href="javascript:toOrderDetail('{{orderId}}');">{{orderId}}</a>
								<!--<p class="right" style="text-align: right;">{{orderDate}}</p>-->
						</div>

						{{/compare}}
                        <div class="everyOrderTitle">
                            <p>
                                <span>采购商账号：</span><span>{{memberAccount}}</span>
                            </p>
                            <p>
                                <span>采购商名称：</span><span>{{buyerName}}</span>
                            </p>
                            <p>
                                <span>下单时间：</span><span>{{orderDate}}</span>
                            </p>
                        </div>
						<div class="goods-item">
							<div class="itemStore">
                                    <img src="{{itemSmallPicturePath}}" class="left bigPic">
                                    <#--<a href="/fsgd/{{goodsId}}.jhtml"></a>-->
								<div class="itemStoreRight left">
                                    <p>
                                        商铺名称：{{storeName}}
                                    </p>
                                    <p class="goods-name">
                                        商品名称：<a href="/fsgd/{{goodsId}}.jhtml">{{goodsName}}</a>
                                        <span>${(itemName!'')?replace(goodsName!'','','f')}</span>
                                    </p>
                                    <p class="score">商铺评分：{{score}}分</p>
                                    <p><span class="left">联系客服：</span><a class="contact-gy" href="javascript:QQtalk('1739073619');" ></a></p>
								</div>

							</div>

							<div class="evaluation_list">
								{{#each historyList}}
								{{#isScore scoreState}}
								{{#isNotReScore scoreState}}
								<h3><span style="color: #f24a4a;font-size: 0.25rem">[采购商评价]</span>{{memo}}</h3> {{#if pictureList}}
								<ul class="groupimg">
									{{#each pictureList}}
									<li><img onclick="bigImg('{{picUrl}}{{picName}}')" src="{{picUrl}}{{picName}}" style="height:100%; width:100%;" usemap="#Map" border="0">
										<!--<div class="goodsoperation"><span title="放大" class="bigimg" onclick="bigimg(this)">放大</span></div>-->
									</li>
									{{/each}}
								</ul>
								{{/if}}
								<p>评价时间：{{scoreDate}}</p>
								{{else}}
								<h3><span style="color: #f24a4a;font-size: 0.25rem">[采购商追评]</span>{{memo}}</h3> {{#if pictureList}}
								<ul class="groupimg">
									{{#each pictureList}}
									<li><img onclick="bigImg('{{picUrl}}{{picName}}')" src="{{picUrl}}{{picName}}" style="height:100%; width:100%;" usemap="#Map" border="0">
										<!--<div class="goodsoperation"><span title="放大" class="bigimg" onclick="bigimg(this)">放大</span></div>-->
									</li>
									{{/each}}
								</ul>
								{{/if}}
								<p>评价时间：{{scoreDate}}</p>
								{{/isNotReScore}} {{else}}
              		            <h3 class="font-color-c">[商家回复]{{memo}}</h3>
								<p>回复时间：{{scoreDate}}</p>
								<p>回复人：{{userCode}}</p>
								{{/isScore}} {{/each}}
								

								<span class="btn right">
									{{#isNeedRescore historyList}}
									<#if Session.user.memberType?? && (Session.user.memberType=="member_servant" || Session.user.memberType=="member_separate")>
                                    <#else>
									<a href="javascript:void(0)" onclick="addScore('{{orderId}}')" class="font-color-c">追加评价</a>
									</#if>
									{{/isNeedRescore}}
								</span>
							</div>


						</div>
						{{/each}}
					    {{orderMore this}}
					</script>
				<div id="scoreData" style="padding-bottom: 0.5rem"></div>
				<input type="hidden" id="currentPage" name="currentPage" value="1" />
				<input type="hidden" id="rows" name="rows" value="5" />
			</div>
			<div style="height: 0.87rem;"></div>
            <div class="popUp bigimg_up">
				<div>
					<P></P>
				</div>
			</div>
			<div class="big_img_box">
				<img src="" alt="" />
			</div>
			<script type="text/javascript" src="${resources}/js/lib/date/date.js"></script>
			<script type="text/javascript">
				function bigImg(src){
					$(".big_img_box img").attr("src",src);
					$(".big_img_box").fadeIn()	
					$(".big_img_box img").css({
						'top':($(window).height() - $(".big_img_box img").height())/2,
						'left':($(window).width() - $(".big_img_box img").width())/2
					})
					$(".big_img_box").on("click",function(){
						$(this).fadeOut();
					})
				}
			</script>
		</#escape>
	</#macro>