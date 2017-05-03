/** 商品评价js */
$(function() {
	// 获取商品评价信息 by geshuo
	var params = {
		goodsId : $("#goods_carriage_goodsId").val()
	};
	callService("/gd/findGoodsScoreNum.ajax", params, {
		callSuccess : function(data) {
			if (!data.success) {
				// 错误处理
				jsAlert("获取商品评价总数失败！");
			} else {
				$("[dm-type='goodsScore']").html("商品评价（<span dm-info='goods-score-count-base' id='scoreNum'>" + data.result + "</span>）");
				$("#allScore").html("所有评价("+data.result+")");
			}
		}
	})

	var clickNum = 0;
	$("[dm-type='goodsScore']").click(function() {
		$('#currentPage').val('1');
		createEvaluateScore(1,null,null);
	});

	// 初始化评价标签点击事件
	$(document).on('click', '.showTag', function() {
		showTag(this);
	});
})

/** 显示评价信息 by geshuo */
function createEvaluateScore(currentPage, tagId,typeId) {
	var param = {};
	param.goodsId = $("#goods_carriage_goodsId").val();
	param.start = (currentPage - 1) * $("#rows").val();
	param.length = $("#rows").val();
	if (tagId != null) {
		param.tagId = tagId;
	}
	if(typeId != null){
		param.typeId = typeId;
	}
	callService("/gd/findGoodsScore.ajax", param, {
		callSuccess : function(data) {
			if (data.data.recordsTotal != 0) {
				$('.evaluation').show();
				$('#JKDiva_1').find($('.detail-null')).hide();
				var html = $("#discuss_tl").html();
				var handlebarsObject = Handlebars.compile(html);
				var str = handlebarsObject(data);
				$("#discuss_div").html("");
				$("#discuss_div").append(str);
				$('.evaluationImg li img').click(function() {
					$(this).parent().parent().parent().find($('.evaluationImg-big')).empty();
					$(this).siblings('u').toggle().parent('li').siblings('li').children('u').hide();
					$(this).parent().parent().parent().find($('.evaluationImg-big')).show();
					$(this).clone().prependTo($(this).parent().parent().parent().find($('.evaluationImg-big')));
				});
				$('.evaluationImg li u').click(function() {
					$(this).parent().parent().parent().find($(".evaluationImg-big")).empty().hide();
					$(this).hide();
				});

				$(".evaluationImg-big").click(function() {
					$(this).empty().hide();
					$(this).parent().find($('.evaluationImg li')).children('u').hide();
				});

				$('#discuss_div').pager(data.data, {
					rows : [ 5, 10, 25, 50 ],
					searchMethod : 'createEvaluateScore',
					drawAfter : function() {
						$('.paging_full_numbers').parent().css('width', '600px');
						$("#datatable_length").css("float", "left");
					}
				});
				var num = $("#scoreNum").text();
				$("#allScore").html("所有评价("+num+")");
			} else {
				$('#JKDiva_1').find($('.detail-null')).show();
				$('.evaluation').hide();
			}
		}
	});
}

function showTag(item) {
	var tagId = null;
	var typeId = null;
	$('#currentPage').val('1');
	if($(item).hasClass("pictureComment")||$(item).hasClass("addedComment")){
		typeId = $(item).attr("data-id");
	}else{
		tagId = $(item).attr("data-id");
	}
	createEvaluateScore(1, tagId,typeId);
}