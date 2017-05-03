<#include "/common/common_var_definds.ftl" />
<#macro render>
<script src="${resources}/js/common/hideshow.js"></script>
<script src="${resources}/js/common/img_operation.js"></script>
<script src="${resources}/js/lib/raty/jquery.raty.min.js"></script>
<script src="${resources}/js/lib/raty/evaluation.js"></script>
<script src="${resources}/js/lib/plupload/moxie.js"></script>
<script src="${resources}/js/lib/plupload/plupload.dev.js"></script>
<script src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script type="text/javascript">

var selectimg ; 
var evaluate=['点击星星就能打分','收到的商品质量很差，与商家的描述严重不符，很不满意','收到的商品质量较差，与商家的描述不符，不满意','收到的商品质量一般，与商家的描述有一定差距','收到的商品质量不错，与商家的描述基本一致，挺满意','收到的商品质量非常好，与商家的描述完全一致，非常满意'];
$(document).ready(function () {

	$(".cx1").click( function(){
		$(".cx2").fadeIn();
	})
	$(".shut").click( function(){
		$(".cx2").fadeOut();
		$(".cx4").fadeOut();
	})

/*	
	$('.goodsStar').find($('img')).click(function(){
		var score = $(this).attr('alt');
		$('.goodsStar').find($('input[name="score"]')).val(score);
		$('.goodsStar').find($('strong')).html(score);
	})
	*/
	
	$('.goodsStar').on('click','img',function(e){
		var score = $(this).attr('alt');
		$('input[name=score]',e.delegateTarget).val(score);
		$('strong[name=score]',e.delegateTarget).text(score);
		$('#function-hint2',e.delegateTarget).text(evaluate[score]);
	})
	
	$('.goodsStar').on('mouseover','img',function(e){
		var score = $(this).attr('alt');
		$('strong[name=score]',e.delegateTarget).text(score);
		$('#function-hint2',e.delegateTarget).text(evaluate[score]);
	})
	
	$('.goodsStar').on('mouseout','img',function(e){
		var score=$('input[name=score]',e.delegateTarget).val()?$('input[name=score]',e.delegateTarget).val():0;
		$('strong[name=score]',e.delegateTarget).text(score)		
		$('#function-hint2',e.delegateTarget).text(evaluate[score]);
	})
	
	
	var browseDomList = $('[id^="browse"]');
	
	for(var i = 0; i < browseDomList.length; i++){
		var browseDom = browseDomList[i];
		var id = $(browseDom).attr('id');
		
		var uploader = new plupload.Uploader({
			browse_button : id,
			multi_selection : false,
			url : '${ctx}/score/imgupload.ajax',
			filters: {
			  mime_types : [ //只允许上传图片类型
			    { title : "Image files", extensions : system_vars.upload_file_types_imgs }
			  ],
			  max_file_size : system_vars.upload_max_size_2m, //最大只能上传2M的文件
			}
				//,begin_select : function(){
				//if($(uploader.settings.browse_button).first().parent().find($(".groupimg")).find($('li')).length >= '5'){
				//	jsWarConfirm("你最多可上传5张图片")
				//	return false;
				//}else{
				//	return true;
				//}
				//}
		});
		uploader.init(); //初始化
		//绑定文件添加进队列事件
		uploader.bind('FilesAdded',function(uploader,files){
			if($(uploader.settings.browse_button).first().parent().find($(".groupimg")).find($('li')).length >= '5'){
				jsErrAlert("你最多可上传5张图片");
				uploader.removeFile(files[0].id)
			}else{
				uploader.start(); //开始上传
			}
		});
		//回调函数
		uploader.bind('FileUploaded',function(uploader,file,responseObject){
			var response = JSON.parse(responseObject.response);
			if(response.result){
				var imgstr = "<li id='a'><img src='"+response.content+"' />"
			          +"<div class='goodsoperation'><span title='放大' class='bigimg'>放大</span><span title='删除' class='goodsdelete' onclick='deleteimgorno(this)'>删除</span></div>"
			          +"<input type='hidden' id='imgpicture' name='picture' value='"+response.content+"'/>"
			          +"</li>"
				$(uploader.settings.browse_button).first().parent().find($(".groupimg")).append(imgstr);
			}else{
		     	jsErrAlert(response.content);
			}
		});
		//上传错误
		uploader.bind('Error',function(uploader,errObject){
			if(errObject.code == '-600'){
		     	jsErrAlert("上传的图片超过允许的最大值，请选择其他图片！");
			}
			if(errObject.code == '-601'){
		     	jsErrAlert("上传的图片类型不正确，请选择其他图片！");
			}
		});
	}
	
	$("button[name='sscore_tap']").toggle(
		function(){
			$(this).css('background','#9E9A9A');
			$(this).attr("check","yes")
		},
		function (){
			$(this).css('background','#F3F3F3') 
			$(this).attr("check","no")
		}
	)
 });




function submitScore(){
	
	var str = "{";
	//不包含店铺评价
	for(var i = 0 ; i < $(".orderdedetail").length-1 ; i++){
		var item_tag = $("#Item_tag").eq(i);
		
		var score_tap = $("[name='Item_tag']").eq(i).children("button[name='sscore_tap'][check='yes']");
		var score_tap_value="";
		var score_tap_name="";
		var score_tap_value_array=[];
		var score_tap_name_array=[];
		//alert("score_tap="+score_tap);
		if(score_tap.length>0){
			for(var sl=0;sl<score_tap.length;sl++){
				score_tap_value_array.push($(score_tap[sl]).val());
				score_tap_name_array.push($(score_tap[sl]).text());
			};
			score_tap_value=score_tap_value_array.join("-");
			score_tap_name=score_tap_name_array.join("-");
		}
		var score = $('input[name="score"]').eq(i).val();
		var memo = encodeURI($('[name="memo"]').eq(i).val());
		var orderId = $("#orderId"+i).val();
		var orderDetailId = $("#orderDetailId"+i).val();
		var goodsId = $("#goodsId"+i).val();
		var goodsName = $("#goodsName"+i).val();
		var storeId = $("#storeId").val();
		
		if(score == null || score == ""){
			jsErrAlert("商品评价分数不能为空");
			return;
		}
	
		if($('[name="memo"]').val()==''){
			jsErrAlert("请输入评价内容");
			return;
		}
	
		if($('[name="memo"]').val().length > 500){
			jsErrAlert("评价内容最多只能输入500个字。");
			return;
		}
	
		if(i == $(".orderdedetail").length-1 && $("#groupimg"+i+" input").length == 0){
			str += "\"list["+i+"].storeId\":\""+storeId+"\",\"list["+i+"].score\":\""+score+"\",\"list["+i+"].scoreHistoryForm.memo\":\""+memo+"\",\"list["+i+"].orderId\":\""+orderId+"\",\"list["+i+"].orderDetailId\":\""+orderDetailId+"\",\"list["+i+"].goodsId\":\""+goodsId+"\",\"list["+i+"].goodsName\":\""+goodsName+"\",\"list["+i+"].scoreTapValue\":\""+score_tap_value+"\",\"list["+i+"].scoreTapName\":\""+score_tap_name+"\"";
		}
		if(i != $(".orderdedetail").length-1 ){
			str += "\"list["+i+"].storeId\":\""+storeId+"\",\"list["+i+"].score\":\""+score+"\",\"list["+i+"].scoreHistoryForm.memo\":\""+memo+"\",\"list["+i+"].orderId\":\""+orderId+"\",\"list["+i+"].orderDetailId\":\""+orderDetailId+"\",\"list["+i+"].goodsId\":\""+goodsId+"\",\"list["+i+"].goodsName\":\""+goodsName+"\",\"list["+i+"].scoreTapValue\":\""+score_tap_value+"\",\"list["+i+"].scoreTapName\":\""+score_tap_name+"\",";
		}
		if(i == $(".orderdedetail").length-1 && $("#groupimg"+i+" input").length != 0){
			str += "\"list["+i+"].storeId\":\""+storeId+"\",\"list["+i+"].score\":\""+score+"\",\"list["+i+"].scoreHistoryForm.memo\":\""+memo+"\",\"list["+i+"].orderId\":\""+orderId+"\",\"list["+i+"].orderDetailId\":\""+orderDetailId+"\",\"list["+i+"].goodsId\":\""+goodsId+"\",\"list["+i+"].goodsName\":\""+goodsName+"\",\"list["+i+"].scoreTapValue\":\""+score_tap_value+"\",\"list["+i+"].scoreTapName\":\""+score_tap_name+"\",";
		}
		
		
	
		for(var j = 0 ; j < $("#groupimg"+i+" input").length ; j++){
		
			var scorePicture = $("#groupimg"+i+" input").eq(j).val();
			
			if(j == $("#groupimg"+i+" input").length-1 && i == $(".orderdedetail").length-1 && $('input[name="score"]').length == $(".orderdedetail").length){
				str += "\"list["+i+"].scoreHistoryForm.scorePictureFormList["+j+"].picUrl\":\""+scorePicture+"\",\"list["+i+"].scoreHistoryForm.scorePictureFormList["+j+"].scoreOrder\":\"1\"";
			}
			if(j != $("#groupimg"+i+" input").length-1 ){
				str += "\"list["+i+"].scoreHistoryForm.scorePictureFormList["+j+"].picUrl\":\""+scorePicture+"\",\"list["+i+"].scoreHistoryForm.scorePictureFormList["+j+"].scoreOrder\":\"1\",";
			}
			if(j == $("#groupimg"+i+" input").length-1 && i != $(".orderdedetail").length-1){
				str += "\"list["+i+"].scoreHistoryForm.scorePictureFormList["+j+"].picUrl\":\""+scorePicture+"\",\"list["+i+"].scoreHistoryForm.scorePictureFormList["+j+"].scoreOrder\":\"1\",";
			}
		}
		
		
	}
	
	//店铺评价
	for(var k = 0; k<3;k++){
		if($('input[name="score"]').eq(($(".orderdedetail").length-1+k)).val()!=null && 
			$('input[name="score"]').eq(($(".orderdedetail").length-1+k)).val()!=''){
			for(var q = 0; q<3;q++){
				if($('input[name="score"]').eq(($(".orderdedetail").length-1+q)).val()==null || 
					$('input[name="score"]').eq(($(".orderdedetail").length-1+q)).val()==''){
					jsErrAlert("店铺各项评价分数不能为空");
					return;
				}
			}
		}else{
			jsErrAlert("店铺各项评价分数不能为空");
			return;
		}
	}
	
		str += "\"saStoreScoreForm.orderId\":\""+$("#orderId0").val()+"\",\"saStoreScoreForm.storeId\":\""+$("#storeId").val()+"\",";
		str += "\"saStoreScoreForm.storeDescCredit\":\""+$('input[name="score"]').eq($(".orderdedetail").length-1).val()+"\",\"saStoreScoreForm.storePriceCredit\":\""+$('input[name="score"]').eq($(".orderdedetail").length).val()+"\",";
		str += "\"saStoreScoreForm.storeServiceCredit\":\""+$('input[name="score"]').eq($(".orderdedetail").length+1).val()+"\"";
	str += "}";
	
	console.log(str);
	json_data=eval("("+str+")");

console.log("json_data="+json_data);
jsConfirm("确定发表评价吗?",{callback:function(result){
			if(result){
				//遮罩
	var $target=$('.bottom-button');
	$.dm.block($target);
	
	callService('${ctx}/score/submitScore.ajax', json_data, 
		{callSuccess:function(data){
			if(data=="success"){
	    		window.location.href="${ctx}/score/toScoreSuccess.jhtml";
	    	}else if(data=="error"){
	    		jsErrAlert("发表评价提交失败！");
	    	}else{
	    		jsErrAlert("您的评价中有敏感词汇:"+data+" 请重新输入");
	    	}
	    	$.dm.unblock($target);
		},callValidFailed:function(error){
			if(error.businessErrAttachs[0][0].code=='typeMismatch'){
				jsErrAlert(error.errMsg||'');
			}else{
				jsErrAlert(error.businessErrAttachs[0][0].defaultMessage);
			}
		}
		,callError:function(textStatus, errorThrown, error){
			jsErrAlert(error.errMsg||'');
			$.dm.unblock(target);
		}});

}
		}});
	
}

function deleteimgorno(obj) {
		jsConfirm("确认要将图片删除吗？");
		selectimg = obj;
		$('[dm-actor="confirm-message-ok"]').click(function(){
			$(selectimg).parent().parent().remove();
		});

	}
</script>
</#macro>