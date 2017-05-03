<#include "/common/common_var_definds.ftl" /> <#macro render >
<script src="${resources}/js/lib/plupload/moxie.js"></script>
<script src="${resources}/js/lib/plupload/plupload.dev.js"></script>
<script>
	$(document)
			.ready(
					function() {

						var uploader = new plupload.Uploader(
								{
									browse_button : 'browse',
									multi_selection : false,
									url : '${ctx}/return/imgupload.ajax',
									filters : {
										mime_types : [ //只允许上传图片类型
										{
											title : "Image files",
											extensions : system_vars.upload_file_types_imgs
										} ],
										max_file_size : system_vars.upload_max_size_2m, //最大只能上传2M的文件
									},
									begin_select : function() {
										if ($("#groupimg" + " li").length >= '5') {
											jsWarConfirm("您最多可上传5张图片");
											return false;
										} else {
											return true;
										}
									}
								});
						uploader.init(); //初始化
						//绑定文件添加进队列事件
						uploader.bind('FilesAdded', function(uploader, files) {
							uploader.start(); //开始上传
						});
						//回调函数
						uploader
								.bind(
										'FileUploaded',
										function(uploader, file, responseObject) {
											var response = JSON
													.parse(responseObject.response);
											if (response.result) {
												var imgstr = "<li id='a'><img src='"+response.content+"' width='800' height='800' />"
														+ "<div class='goodsoperation'><span title='放大' class='bigimg' onclick='bigimg(this)'>放大</span><span title='删除' class='goodsdelete' onclick='deleteimgorno(this)'>删除</span></div>"
														+ "<input type='hidden' id='imgpicture' name='picture' value='"+response.content+"'/>"
														+ "</li>"
												$("#groupimg").append(imgstr);
											} else {
												jsAlert(response.content);
											}
										});
						//上传错误
						uploader.bind('Error', function(uploader, errObject) {
							if (errObject.code == '-600') {
								jsErrAlert("上传的图片超过允许的最大值，请选择其他图片！");
							}
							if (errObject.code == '-601') {
								jsErrAlert("上传的图片类型不正确，请选择其他图片！");
							}
						});
					});

	function imguplodehide() {

		$(".cx5").fadeOut();
	}

	function bigimg(obj) {

		var url = $(obj).parent().parent().children("img").attr("src");

		$(".bigimg_up").children().children().append(
				"<img src='"+url+"' width='800' height='800'>")

		$(".bigimg_up").fadeIn();

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
