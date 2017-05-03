<#include "/common/common_var_definds.ftl" /> <#macro render>

<script src="${ctx}/resources/js/common/tab.js"></script>
<script src="${ctx}/resources/js/member/card.js"></script>
<script src="${ctx}/resources/js/lib/jquery/jquery.dataTables.js"
	type="text/javascript"></script>
<script src="${ctx}/resources/js/lib/jquery/dataTables.bootstrap.js"
	type="text/javascript"></script>
<script src="${ctx}/resources/js/lib/jquery/dt-operation-commons.js"
	type="text/javascript"></script>




<script type="text/javascript">
	var div0_mark = 0;
	var div1_mark = 1;
	$(document).ready(function() {
		$("#JKDiva_0").attr("mark", div0_mark);
		$("#JKDiva_1").attr("mark", div1_mark);

		// 领取优惠券后，进入商城优惠券界面
		if ($("#showFlg").val() == "showFlg") {
			ChangeDiv('1', 'JKDiva_', 2);
			$("#selected1").removeClass();
			$("#selected2").attr("class", "on");
		}

		//初始化排序
		$(".denominationSortNum").val('1');
		$(".endDateSortNum").val('');
		$(".createDateSortNum").val('');

		toFindActivityCouponList(1);
		$(".denominationSort").click(function() {
			var dom = $(this).parents();
			//重置其他筛选项
			dom.find(".endDateSortNum").val('');
			dom.find(".createDateSortNum").val('');
			if (!dom.find(".denominationSortNum").val()) {
				dom.find(".denominationSortNum").val('2')
			}
			dom.find(".denominationSortNum").val(dom.find(".denominationSortNum").val() == 1 ? 2 : 1);
			toFindActivityCouponList(1);
		});
		$(".endDateSort").click(function() {
			var dom = $(this).parents();
			//重置其他筛选项
			dom.find(".denominationSortNum").val('');
			dom.find(".createDateSortNum").val('');
			if (!dom.find(".endDateSortNum").val()) {
				dom.find(".endDateSortNum").val('1')
			}
			dom.find(".endDateSortNum").val(dom.find(".endDateSortNum").val() == 1 ? 2 : 1);
			toFindActivityCouponList(1);
		});
		$(".createDateSort").click(function() {
			var dom = $(this).parents();
			//重置其他筛选项
			dom.find(".denominationSortNum").val('');
			dom.find(".endDateSortNum").val('');
			if (!dom.find(".createDateSortNum").val()) {
				dom.find(".createDateSortNum").val('1')
			}
			dom.find(".createDateSortNum").val(dom.find(".createDateSortNum").val() == 1 ? 2 : 1);
			toFindActivityCouponList(1);
		});
		$(".commit").click(function() {
			var dom = $(this).parents("[mark*=]");
			toFindActivityCouponList(1);
		});
	});

	function ChangeDiv(p, divName, zDivCount) {
		for (i = 0; i <= zDivCount; i++) {
			$('#' + divName + i).hide();
		}
		if (p == '0') {
			$(".divStoreName").show();
		} else {
			$(".divStoreName").hide();
		}
		$("#couponStatus option:first").prop("selected", 'selected');
		$('#' + divName + p).show();
		$('#status').val(p);
		$('#currentPage').val(1);
		$('#rows').val('6');
		toFindActivityCouponList(1);
	}

	function toFindActivityCouponList(currentPage) {
		var mark = $('#status').val();
		var issuerName = '';
		var couponStatus = $("#couponStatus").val();
		var param = {};
		var appendDom;
		var tableUrl = "${ctx}/member/findCouponList.ajax";
		$("#currentPage").val(currentPage);
		var start = (currentPage - 1) * $("#rows").val();
		var length = $("#rows").val();
		if (mark == 0) {
			param['couponSender'] = '00';
			appendDom = $("#JKDiva_0");
			issuerName = $(".issuerName").val();
		} else if (mark == 1) {
			param['couponSender'] = '20';
			appendDom = $("#JKDiva_1");
			issuerName = '';
		}
		param = $.extend(param, {
			"couponStatus" : couponStatus,
			"storeName" : issuerName,
			"start" : start,
			"length" : length,
			"couponFeeSort" : appendDom.find(".denominationSortNum").val(),
			"endDateSort" : appendDom.find(".endDateSortNum").val(),
			"createDateSort" : appendDom.find(".createDateSortNum").val()
		});
		callService(tableUrl, param, {
			async : false,
			callSuccess : function(datas) {
				if (datas != "" && datas.data.length > 0) {
					var str = "";
					for (var i = 0; i < datas.data.length; i++) {
						if (mark == div1_mark)
							datas.data[i].storeName = "商城"
						str += "<div class='member-coupons'>";
						str += "<h2><i>&nbsp;</i>" + datas.data[i].storeName + "<span onclick='removeByIds(this)' id='" + datas.data[i].couponId + "' title='删除'></span></h2>";
						if (datas.data[i].icon) {
							str += "<div class='coupons' style='background:url(" + $
							{
								ctx
							}
							datas.data[i].icon + ");background-size :100% auto;'>";
						} else {
							//默认背景颜色
							str += "<div class='coupons coupons-bgA'>";
						}
						var couponStatus = null;
						if (datas.data[i].couponStatus == "00") {
							couponStatus = "未领取";
						} else if (datas.data[i].couponStatus == "10") {
							couponStatus = "未使用";
						} else if (datas.data[i].couponStatus == "20") {
							couponStatus = "使用中";
						} else if (datas.data[i].couponStatus == "30") {
							couponStatus = "已使用";
						} else {
							couponStatus = "已过期";
						}
						var couponType=null;
						if(datas.data[i].couponType == "00"){
							couponType="订单抵值券"
						} else{
							couponType = "邮费抵值券";
						}
						str += "<i class='coupons-top-black'></i><i class='coupons-bottom-black'></i>" + "<div class='coupons-price'>￥<strong>" + datas.data[i].couponFee + "</strong><strong class='clear font14'>" + couponType + "</strong></div>" + "<div class='coupons-infor'>" + "<p class='font14'>" + datas.data[i].couponName + "("+ couponStatus + ")" + "</p>" + "<p>全店通用</p>";						str += "<p>全店满" + datas.data[i].conditionFee + "元使用</p>";
						str += "<p>有效期 " + format(datas.data[i].validateStart, 'yyyy-MM-dd') + " - " + format(datas.data[i].validateEnd, 'yyyy-MM-dd') + "</p>" + "</div></div>";
						str += "</ul></div></div>";
						str += "</div>";
					}
					str += "<div class='clear'></div>";

					appendDom.find(".content").html(str);
					appendDom.pager(datas, {
						rows : [ 6, 12, 24, 48 ],
						searchMethod : 'toFindActivityCouponList',
						drawAfter : function() {
							$('#datatable_info').parent().css('width', '400px');
						}
					})
				} else {
					var str = '<div style="text-align: center;" class="clear">没有匹配的记录</div>'
					appendDom.find(".content").html(str);
					appendDom.pager(datas, {
						rows : [ 6, 12, 24, 48 ],
						searchMethod : 'toFindActivityCouponList',
						drawAfter : function() {
							$('#datatable_info').parent().css('width', '400px');
						}
					})
				}
			}
		});
	}

	function removeByIds(dom) {
		//debugger
		jsConfirm('确定要删除这条数据吗?', {
			callback : function(result) {
				if (result) {
					var url = "${ctx}/member/removeMemberCouponByCouponId.ajax";
					var query = {
						"couponId" : $(dom).attr("id")
					};
					var status = $('#status').val();
					callService(url, query, {
						async : false,
						callSuccess : function(result) {
							if (result.result > 0) {
								var currentPage = $('#currentPage').val();
								toFindActivityCouponList(currentPage);
							}
						}
					});
				}
			}
		})
	}

	// 毫秒转成日期格式
	function format(time, format) {
		var t = new Date(time);
		var tf = function(i) {
			return (i < 10 ? '0' : '') + i
		};
		return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a) {
			switch (a) {
			case 'yyyy':
				return tf(t.getFullYear());
				break;
			case 'MM':
				return tf(t.getMonth() + 1);
				break;
			case 'mm':
				return tf(t.getMinutes());
				break;
			case 'dd':
				return tf(t.getDate());
				break;
			case 'HH':
				return tf(t.getHours());
				break;
			case 'ss':
				return tf(t.getSeconds());
				break;
			}
		})
	}
</script>
</#macro>
