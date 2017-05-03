<#include "/common/common_var_definds.ftl" />
<#import "/common/fields/field_page_tracker.ftl" as field_page_tracker />
<#-- 标题 | metas | 链接 | 脚本 | 主要内容 | 左侧导航栏 | 页脚 | 数据 title metas=>[] links=>[] scripts=>[] mainParts=>[] leftNav footParts=>[] data -->
<#macro render title,metas,links,scripts,mainParts,leftNav,footParts,data>
<#escape x as x?html>
<!--浏览历史-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <meta name = "format-detection" content = "telephone=no">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<#list metas as part> <@part.render /> </#list>
<#--TemplateBeginEditable name="doctitle" -->
<title>${title}</title>
<#-- TemplateEndEditable -->
    <link rel="shortcut icon" href="${resources}/basepage/store/default/common_img/favicon.ico"/>
    <link rel="bookmark" href="${resources}/basepage/store/default/common_img/favicon.ico"/>
<link rel="stylesheet" href="${resources}/basepage/store/default/common_css/common.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${resources}/css/common/lib.css" />
<link rel="stylesheet" type="text/css" href="${resources}/css/common/pager.css" />
<link rel="stylesheet" type="text/css" href="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css" href="${resources}/css/member/member.css" />
<#-- TemplateBeginEditable name="my_css" -->
<#list links as part>
<@part.render /> </#list>
<#-- TemplateEndEditable -->
<script src="${resources}/js/lib/jquery/jquery-1.8.3.js"></script>
<script src="${resources}/js/lib/handlebars/handlebars-v2.0.0.js"></script>
<script src="${resources}/js/lib/pubsub/tiny-pubsub.js"></script>
<script src="${resources}/js/common/top_toolbar.js"></script>
<script src="${resources}/js/common/tool.js"></script>
<script src="${resources}/js/common/pager.js"></script>
<script src="${resources}/js/common/headsearch.js"></script>
<script src="${resources}/js/common/common.js"></script>
    <!--[if lt IE 9]>
	<script src="/resources/js/lib/html5/es5-shim.min.js"></script>
	<script  type="text/javascript" src="/resources/js/lib/html5/html5shiv.min.js"></script>
    <![endif]-->
<#-- TemplateBeginEditable name="my_js" -->
<script>
	var dm_ctx = '${ctx}';
	var dm_resources = '${resources}';
</script>
<#list scripts as part> <@part.render /> </#list>
<#--TemplateEndEditable -->
<#--TemplateBeginEditable name="head" -->
<#--TemplateEndEditable -->
</head>
<body>
	<#--<#import "/basepage/store/default/about_pages/common_about_header.ftl" as header/>-->
	<#--<@header.render />-->

<script type="text/javascript">
    var meta = document.createElement('meta');
    meta.setAttribute('name', 'viewport');
    var content = 'with=device-width,initial-scale=' + 1 + ',minimum-scale=' + 1 + ',maximum-scale=' + 1 +  ',user-scalable=' + 0;
    meta.setAttribute('content', content);
    document.querySelector('head').appendChild(meta);

    var fontSize = document.documentElement.clientWidth / 6.4;
    document.querySelector('html').style.fontSize = fontSize + 'px';
//    document.querySelector('body').style.fontSize = 16 + 'px';
</script>
	<#--<#include "/common/fields/field_common_nav.ftl" />-->
	<#--<div class="header">-->
		<#--&lt;#&ndash;<div class="wrapper">-->
			<#--<h1 class="left">-->
				<#--<a href="/"><img src="${resources}/img/common/logo.png" /></a>-->
			<#--</h1>-->
			<#--<div class="topAnimate">-->
			<#--<a id="leftLink" target="_blank" href="${Session.url1!''}">-->
			<#--<img id="leftImg" src=${Session.ad_pic1!''} width="120" height="60"></a>-->
			<#--</div>-->
			<#--<div class="search">-->
				<#--&lt;#&ndash;<select id="selectType" onchange="changeShowInfo(this)">-->
					<#--<option value="byGoods">按商品</option>-->
					<#--<option value="byStore">按店铺</option>-->
				<#--</select> &ndash;&gt; <input name="searchWord" type="text" value=""-->
					<#--dm-info="gd-search-word" class="dm-no-auto-clear">-->
				<#--<p id="showInfo">商品名称/店铺名称</p>-->
				<#--<a href="javascript:void(0);" dm-actor="gd-search">搜 索</a>-->
			<#--</div>-->
			<#--<div class="hot-search" dm-info="gd-hot-search-list"></div>-->
			<#--<div class="headapp"><a id="rightLink" target="_blank" href="${Session.url2!''}"><img id="rightImg" src=${Session.ad_pic2!''} width="240" height="100"></a></div>-->
		<#--</div>&ndash;&gt;-->
	<#--</div>-->
	<#--<div class="nav">-->
		<#--<div class="wrapper">-->
			<#--<ul>-->
				<#--<li><a href="/member/index.jhtml" class=" navfoc">首页</a></li>-->
				<#--<li><a href="javascript:void(0);">账号管理<i>&nbsp;</i></a>-->
					<#--<dl>-->
						<#--<a href="/member/toUpdateMemberDetail.jhtml">采购商资料</a>-->
						<#--<a href="/member/toUpdateSecurityInfo.jhtml">安全设置</a>-->
					<#--</dl></li>-->
				<#--<li><a href="/notify/notifyList.jhtml">消息</a></li>-->
			<#--</ul>-->
		<#---->
		<#--</div>-->
	<#--</div>-->
	<#--<div class="menu" style="z-index: 110;" dm-container="menu"></div>-->
	<#--<div class="wrapper">-->
		<#--&lt;#&ndash; TemplateBeginEditable name="左侧导航" &ndash;&gt;-->
		<#--<div class="content-left">-->
			<#--<ul class="leftsidebar">-->
				<#--<li><a href="#none" class="cur lev_A"><i>&nbsp;</i>交易管理</a>-->
					<#--<ul class="level2" style="display: block;">-->
						<#--<li><a href="/sc/toList.jhtml"<#if leftNav?? &-->
								<#--leftNav=="shopcat">class="leftsidebar_foc"</#if>>我的购物车</a></li>-->
						<#--<li><a href="/order/toOrderList.jhtml"<#if leftNav?? &-->
								<#--leftNav=="order">class="leftsidebar_foc"</#if>>我的采购单</a></li>-->
					     <#--<li><a href="/order/toStoreHouse.jhtml"<#if leftNav?? &-->
								<#--leftNav=="address">class="leftsidebar_foc"</#if>>我的仓库</a></li>-->
						<#--<li><a href="/fav/toStoreHouse.jhtml"<#if leftNav?? &-->
								<#--leftNav=="favorite">class="leftsidebar_foc"</#if>>我的收藏</a></li>-->
						<#--&lt;#&ndash; <li><a href="/member/toList.jhtml"<#if leftNav?? &-->
								<#--leftNav=="address">class="leftsidebar_foc"</#if>>我的收货地址</a></li> &ndash;&gt;-->
						<#---->
						<#--<li><a href="/member/toBrowseHistory.jhtml"<#if leftNav??-->
								<#--& leftNav=="history">class="leftsidebar_foc"</#if>>浏览历史</a></li>-->
						<#---->
					<#--</ul></li>-->
				<#--<li><a href="#none" class="cur lev_A"><i>&nbsp;</i>客户服务</a>-->
					<#--<ul class="level2" style="display: block;">-->
						<#--<li><a href="/score/toScoreList.jhtml"<#if leftNav?? &-->
								<#--leftNav=="score">class="leftsidebar_foc"</#if>>评价管理</a></li>-->
						<#--<li><a href="/return/toReturnOrderList.jhtml"<#if-->
								<#--leftNav?? &-->
								<#--leftNav=="return">class="leftsidebar_foc"</#if>>退货退款管理</a></li>-->
					<#--</ul></li>-->
				<#--<li><a href="#none" class="cur lev_A"><i>&nbsp;</i>资产管理</a>-->
					<#--<ul class="level2" style="display: block;">-->
						<#--<li><a href="/member/gotoList.jhtml"<#if-->
								<#--leftNav?? & leftNav=="point">class="leftsidebar_foc"</#if>>会员积分</a></li>-->
						<#--<li><a href="/member/gotoCouponIssueList.jhtml">卡券管理</a></li>-->
					<#--</ul></li>-->
			<#--</ul>-->
		<#--</div>-->
		<#-- TemplateEndEditable -->
		<div class="content-right">
		<#-- TemplateBeginEditable name="my_conner" -->
		<#list mainParts as part> <@part.render data/>
			</#list> <#-- TemplateEndEditable --></div>
                <div id="bg" class="pop_up cx6" >
                    <input type="hidden" id="pageFlag" />
                    <div id="add" class=" pop_up_A pop_up_B">
                        <div class="pop_bg" style=" height:98%">
                            <h2>
                                <a href="javascript:void(0);" onClick="remove();" class="shut"><img src="${resources}/img/common/shutC.png" width="10" height="10"></a>
                            </h2>
                            <div class="member-list-tab" style=" height:46px;">
                                <div class="information-line" style="padding-top: 50px; padding-left: 170px;">

                                    <label style="float:left;margin-left:30px;font-size:13px;margin-top:3px;width:100px;" class="left m-l-10"> 提现密码：</label>
                                    <input type="password" class="text_A left" id="withDrawPassword" name="withDrawPassword" maxlength="16" placeholder="请输入提现密码" />
                                </div>

                            </div>
                            <div class="member-list-tab" style="width: 70px; padding-left: 300.5px; padding-top: 40px;">
                                <a href="javascript:passwordVerify();" class="small-button">确认</a>
                            </div>
                        </div>
                    </div>
                </div>
		</div>
	</div>
	<#-- TemplateEndEditable -->
	<#-- TemplateBeginEditable name="foot_js"-->
	<#list footParts as part> <@part.render data/> </#list>
	<#--TemplateEndEditable -->
	<#--<#include "/common/fields/field_common_footer.ftl" />-->
	<script src="${resources}/js/common/footer.js"></script>
	<#import "/basepage/store/default/common/common_member_footer.ftl" as footer/>
	<@footer.render />
	<script
		src="${resources}/js/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var options = {
								container : "",
								replace : true,
								range : {},
								loadedShow : true
							};
							$.dm.loadWidget("[dm-container='menu']",
									'mallItemMenu', options);//载入顶部商城搜索栏

							// 搜索
							var gdSearch = function(search, from) {
								location.href = '/goodsSearch.jhtml?from=' + from
										+ '&s=' + encodeURIComponent(search);
							};
							//输入搜索关键词
							$(document)
									.on(
											'keypress',
											'[dm-info="gd-search-word"]',
											function() {
												switch (event.keyCode) {
												case 13:
													gdSearch(
															$(
																	'[dm-info="gd-search-word"]')
																	.val(),
															'gd-search');
													break;
												default:
													break;
												}
											});
							$(document).on(
									'click',
									'[dm-actor="gd-search"]',
									function() {
										gdSearch(
												$('[dm-info="gd-search-word"]')
														.val(), $(this).attr(
														'dm-actor'));
									});
							//热门搜索
							$(document).on(
									'click',
									'[dm-info="gd-hot-search-item"]',
									function() {
										gdSearch($(this).attr('dm-data'), $(
												this).attr('dm-info'));
									});

							callService(
									"/findHotWords.ajax",
									{},
									{
										callSuccess : function(data) {
											var htmlStr = '';
											$
													.each(
															data,
															function(inx, val) {
																var content = '<a href="/goodsSearch.jhtml?from=gd-search&s='
																		+ val.content
																		+ '">'
																		+ val.content
																		+ '</a>';
																if (inx != 0) {
																	content = '&nbsp&nbsp'
																			+ content;
																}
																htmlStr += content;
															})
											$('.hot-search').append(htmlStr);
										}
									});

							$('.nav li').mouseover(function() {
								$(this).children('dl').show()
							});
							$('.nav li').mouseleave(function() {
								$(this).children('dl').hide()
							});
						});

        function changeDetail(){
            var url = "/member/changeDetails.ajax";
            callService(url, {}, {
                async : true,
                callSuccess : function(data) {
                    if(data=="0"){
                        window.location.href = "/member/changeDetail.jhtml";

                    }else{
                        jsAlert("您暂未开通饭饭平台广发资金保障账户");
                    }
                }
            });

        }

        function withDrawAccount(flag){
            var url = "${ctx}/memberWithdrawCash/checkMemberCouldWithdraoCash.ajax";
            var withDrawCashUrl = "${ctx}/memberWithdrawCash/toMemberWithdrawCashPage.jhtml";
            var withDrawCashPwdUrl = "${ctx}/memberWithdrawCash/toMemberWithdrawCashPassword.jhtml";
            var withDrawAccountUrl = "${ctx}/memberWithdrawCash/toMemberWithdrawCashAccount.jhtml";
            var param = {};
            callService(url,param,{async:true ,
                callSuccess:function(resultJson){
                    if(resultJson.success){
                        if(flag==1){
                            if(!resultJson.result.isSetupPassword){
                                jsAlert("您还没有设置提现密码");
                                return;
                            }

                            if(!resultJson.result.isSetupAccount){
                                jsAlert("您还没有设置提现账户");
                                return;
                            }

                            $.dm.jumpTo(withDrawCashUrl, {}, {'method' : 'post'});
                        }

                        if(flag==2){
                            $.dm.jumpTo(withDrawCashPwdUrl, {}, {'method' : 'post'});
                        }

                        if(flag==3){
                            if(!resultJson.result.isSetupPassword){
                                jsAlert("您还没有设定提现密码");
                                return;
                            }

                            $.dm.jumpTo(withDrawAccountUrl, {}, {'method' : 'post'});
                        }
                    } else {
                        jsAlert(resultJson.message);
                    }
                }
            });
        }

        function passwordVerify(){
            var flag = $("#pageFlag").val();
            var withDrawCashUrl = "${ctx}/memberWithdrawCash/toMemberWithdrawCashPage.jhtml";
            var withDrawCashPwdUrl = "${ctx}/memberWithdrawCash/toMemberWithdrawCashPassword.jhtml";
            var withDrawAccountUrl = "${ctx}/memberWithdrawCash/toMemberWithdrawCashAccount.jhtml";
            var withDrawPwd = $("#withDrawPassword").val();
            var withDrawCashPwd = $.md5(withDrawPwd);
            var param = {withDrawPwd : withDrawCashPwd};
            var url = "${ctx}/gdb_cash/checkPassword.ajax";
            var indexUrl = "${ctx}/member/index.jhtml";
            if(withDrawPwd==null||withDrawPwd==""){
                jsAlert("请输入提现密码。");
            }else{
                $.ajax( {
                    type : "POST",
                    url : url,
                    data :param,
                    dataType : 'json',
                    success : function(data){
                        var Curedata = data.result;
                        var params = {
                            tab : 'judge'
                        };
                        params.tabStatus = $('#tabStatus').val();
                        if(Curedata=="密码不正确"){
                            $(".cx6").fadeOut();
                            $.dm.jumpTo(indexUrl, params, {'method' : 'post'});
                        }else{
                            $(".cx6").fadeOut();
                            if(flag==1){
                                $.dm.jumpTo(withDrawCashUrl, {}, {'method' : 'post'});
                            }
                            if(flag==2){
                                $.dm.jumpTo(withDrawCashPwdUrl, {}, {'method' : 'post'});
                            }
                            if(flag==3){
                                $.dm.jumpTo(withDrawAccountUrl, {}, {'method' : 'post'});
                            }

                        }
                    }
                });
            }

        }
        function remove(){
            $("#withDrawPassword").val("");
            $(".cx6").fadeOut();
        }
	</script>
<!--页面主体结束-->
</body>
</html>
</#escape>
</#macro>
