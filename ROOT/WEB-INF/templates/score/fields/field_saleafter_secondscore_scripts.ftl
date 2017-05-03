<#include "/common/common_var_definds.ftl" />
<#macro render>
<script src="${resources}/js/common/img_operation.js"></script>
<script src="${resources}/js/lib/raty/jquery.raty.min.js"></script>
<script src="${resources}/js/lib/jquery/jquery.form.js"></script>
<script src="${resources}/js/lib/raty/evaluation.js"></script>
<script src="${resources}/js/lib/plupload/moxie.js"></script>
<script src="${resources}/js/lib/plupload/plupload.dev.js"></script>
<script src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script type="text/javascript">
	var selectimg;

$(document).ready(function () {

	$(".cx1").click( function(){
		$(".cx2").fadeIn();
	})
	$(".shut").click( function(){
		$(".cx2").fadeOut();
		$(".cx4").fadeOut();
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
});

function maxhide(){
	$(".cx4").fadeOut();
}

function submitScore(){
		
	var str = "{";
	
	for(var i = 0 ; i < $(".orderdedetail").length ; i++){
	
		var secondMemo = encodeURI($('[name="secondMemo"]').eq(i).val());
		if($.trim(secondMemo).length == 0){
			jsErrAlert("追加评价内容必须输入！");
			return;
		}
		
		if($('[name="secondMemo"]').val().length > 500){
			jsErrAlert("追加评价内容最多只能输入500个字。");
			return;
		}
		
		var orderId = $("#orderId"+i).val();
		var orderDetailId = $("#orderDetailId"+i).val();
		var scoreId = $("#scoreId"+i).val();
		var modifyDate = $("#modifyDate"+i).val();
		
		if(i == $(".orderdedetail").length-1 && $("#secondgroupimg"+i+" input").length == 0){
			str += "\"list["+i+"].memo\":\""+secondMemo+"\",\"list["+i+"].modifyDate\":\""+modifyDate+"\",\"list["+i+"].scoreId\":\""+scoreId+"\"";
		}
		if(i != $(".orderdedetail").length-1 ){
			str += "\"list["+i+"].memo\":\""+secondMemo+"\",\"list["+i+"].modifyDate\":\""+modifyDate+"\",\"list["+i+"].scoreId\":\""+scoreId+"\",";
		}
		if(i == $(".orderdedetail").length-1 && $("#secondgroupimg"+i+" input").length != 0){
			str += "\"list["+i+"].memo\":\""+secondMemo+"\",\"list["+i+"].modifyDate\":\""+modifyDate+"\",\"list["+i+"].scoreId\":\""+scoreId+"\",";
		}
		
		for(var j = 0 ; j < $("#secondgroupimg"+i+" input").length ; j++){
		
			var scorePicture = $("#secondgroupimg"+i+" input").eq(j).val();
			
			if(j == $("#secondgroupimg"+i+" input").length-1 && i == $(".orderdedetail").length-1){
				str += "\"list["+i+"].secondScorePictureFormList["+j+"].picUrl\":\""+scorePicture+"\",\"list["+i+"].secondScorePictureFormList["+j+"].scoreOrder\":\"2\"";
			}
			if(j != $("#secondgroupimg"+i+" input").length-1 ){
				str += "\"list["+i+"].secondScorePictureFormList["+j+"].picUrl\":\""+scorePicture+"\",\"list["+i+"].secondScorePictureFormList["+j+"].scoreOrder\":\"2\",";
			}
			if(j == $("#secondgroupimg"+i+" input").length-1 && i != $(".orderdedetail").length-1){
				str += "\"list["+i+"].secondScorePictureFormList["+j+"].picUrl\":\""+scorePicture+"\",\"list["+i+"].secondScorePictureFormList["+j+"].scoreOrder\":\"2\",";
			}
		}
	}
	
	str += "}";
	
	console.log(str);
	json_data=eval("("+str+")");
	
	jsConfirm("确定发表评价吗?",{callback:function(result){
			if(result){
	//遮罩
	var $target=$('.bottom-button');
	$.dm.block($target);
	
	callService('${ctx}/score/submitSecondScore.ajax', json_data, {
		callSuccess:function(data){
			if(data=="success"){
	    		window.location.href="${ctx}/score/toScoreSecondSuccess.jhtml";
	    	}else if(data=="error"){
	    		jsErrAlert("提交失败");
	    	}else{
	    		jsErrAlert("您的评价中有敏感词汇:"+data+" 请重新输入");
	    	}
	    	$.dm.unblock($target);
	},callValidFailed:function(error){
		var errMsg = error.errMsg||'';
		for(var i = 0; i < error.businessErrAttachs.length; i++){
			if(i==0){
				errMsg = error.businessErrAttachs[i][0].defaultMessage;
			}else{
				errMsg += error.businessErrAttachs[i][0].defaultMessage;
			}
		}
		jsErrAlert(errMsg);
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

function deleteimghide(){
	$(".cx2").fadeOut();
}

</script>


</#macro>

