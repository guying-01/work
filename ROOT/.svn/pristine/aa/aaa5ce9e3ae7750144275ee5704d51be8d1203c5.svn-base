<#include "/common/common_var_definds.ftl" /> <#macro render>
<script src="${resources}/js/common/dome_num.js"></script>
<script src="${resources}/js/common/hideshow.js"></script>
<script src="${resources}/js/goods/adressselect.js"></script>
<script src="${resources}/js/goods/goods_detail.js"></script>
<script src="${resources}/js/member/member_api.js"></script>
<script src="${resources}/js/goods/goods_score.js"></script>
<script src="${resources}/js/goods/goods_transaction.js"></script>
<script src="${resources}/js/common/activity.js"></script>
<script src="${resources}/js/common/browse_history.js"></script>
<script src="${resources}/js/goods/goods_carriage.js"></script>
<script src="${resources}/js/common/sys_info.js"></script>
<script src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script src="${resources}/js/common/tab.js"></script>
<script src="${resources}/js/goods/storeinfo.js"></script>
<script src="${resources}/js/member/goods_favorite.js"></script>
<script src="${resources}/js/member/store_favorite.js"></script>
<script src="${resources}/js/lib/jquery/jquery.md5.js"></script>
<script src="//img.fan1080.com/public/tj.js"></script>

<#--
<script src="${resources}/js/goods/other.js"></script>
-->

<script type="text/javascript">
	//添加足迹信息
	$(document).ready(function() {
		$.dm.getLogStatus(function(data) {
			if (data != null) {
				$.dm.addBrowseHistory({
					goodsId : '${data.id!""}',
					storeId : '${data.storeId!""}',
					goodsName : '${data.name!""}',
					storeName : '${storeName!""}'
				});
			}
		});

		$("#report").click(function() {
			var storeId = '${data.storeId!""}';
			var storeName = '${storeName!""}';
			$.dm.getLogStatus(function(data) {
				if (data == null) {
					location.href = '/toLogin.jhtml'
				} else {
					url = '${ctx}/report/addNewReport.jhtml';
					params = {
						storeId : storeId,
						storeName : storeName
					};
					$.dm.jumpTo(url, params);
				}
			});
		})
	});
	<#if data??>
	var storeId = '${data.storeId!""}';
	var storeName = '${data.storeName!""}';

	var activitySearch = {
		channelType : '00',
		storeId : '${data.storeId!""}',
		brandId : '${data.brandId!""}',
		goodsCategoryId : '${data.goodsCategoryId!""}',
		productId : '${data.productId!""}',
		goodsId : '${data.id!""}'
	};
	</#if>
	$('[dm-info="price"]').each(function() {
		$(this).html(fmoney($(this).html(), 2));
	});
</script>
<script type="text/javascript">
	function refreshCaptcha(url) {
		document.getElementById("img_captcha").src = url + "/kaptcha?t=" + Math.random();
	}
	$(document).ready(function() {
		<!--光标点进去时的提示-->
		$(".prompt").click(function() {
			$(this).siblings("input:text,input:password").focus();
		});
		$("#userName").focus(function() {
			$(this).siblings(".loginError").hide();
			$("#userNamep").hide();
			$(this).parents('.loginStyleA').css({
				'border-color' : '#2e75d5'
			});
		});
		$("#userName").blur(function() {
			if ($("#userName").val().length == 0) {
				$("#userNamep").show();
			}
			;
			$(this).parents('.loginStyleA').css({
				'border-color' : '#d0d0d0'
			});
		});
		$("#password").focus(function() {
			$(this).siblings(".loginError").hide();
			$("#passwordp").hide();
			$(this).parents('.loginStyleA').css({
				'border-color' : '#2e75d5'
			});
		});
		$("#password").blur(function() {
			if ($("#password").val().length == 0) {
				$("#passwordp").show();
			}
			$(this).parents('.loginStyleA').css({
				'border-color' : '#d0d0d0'
			});
		});
		<!--点击提交时的校验-->
		$("#btnSubmit").click(function() {
			spot = 2;
			var keyVal = $("#userName").val();
			var keyVal1 = $("#password").val();
			if (keyVal.length == 0) {
				$("#usere").show();
				$("#usere").siblings(".loginError").hide();
			} else {
				$(".form #userName").siblings(".loginError").hide()
				spot--
			}
			if (keyVal1.length == 0) {
				$("#pwde").show();
				$(".form #password").addClass("redborder");
			} else {
				$(".form #password").siblings(".loginError").hide();
				spot--
			}

			if (spot != 0) {
				return false;
			}
			$("#password").val($.md5($("#password").val()));
			callService("/doLogin.ajax", $("#loginForm").serialize(), {
				callSuccess : function(data) {
					$(".loginError").hide();
					if(data.data.loginErrorTimesInt>3){
						if($(".login").find(".loginStyleA-ico3").length==0){
							$(".login").append(Handlebars.compile($('#captcha-tl').html()));
							$(".loginStyleA-ico3").insertBefore($(".loginStyleA-bot"));
						}
					}
					if (!data.success) {
						if(data.code=="userName_passWord_isNull"){
							if(data.data.username== null||data.data.username== ""){
								$("#usere").show();
							}
							if(data.data.password== null||data.data.password== ""){
								$("#pwde").show();
							}
						}else if(data.code=="infoCaptcha_isError"){
							$("#captchaWrong").show();
							refreshCaptcha("");
						}else if(data.code=="userName_passWord_isError"){
							$("#usere_2").show();
						}else if(data.code=="userLock_isError"){
                            $("#usere_3").show();
                        }
					} else {
						location.reload();
					}
				}
			});
		});
	})
</script>
</#macro>
