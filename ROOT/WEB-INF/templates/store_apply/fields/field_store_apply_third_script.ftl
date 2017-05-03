<#include "/common/common_var_definds.ftl" />
<#macro render>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${resources}/js/common/validation.js"></script>
<script type="text/javascript" src="${resources}/js/lib/plupload/moxie.js"></script>
<script type="text/javascript" src="${resources}/js/lib/plupload/plupload.dev.js"></script>
<script type="text/javascript" src="${resources}/js/store/store_into.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script>
<script>
//上传控件的封装
	function initUpload(id)
	{
		var uploader = new plupload.Uploader({
			browse_button : id,
			url : '${ctx}/sai/upload.ajax',
			filters: {
				  mime_types : [ //只允许上传图片类型
				    { title : "Image files", extensions : system_vars.upload_file_types_imgs }
				  ],
				  max_file_size : system_vars.upload_max_size_3m, //限制上传大小

				},
			multi_selection:false,
			begin_select:function(){
				var dom=$("#"+id);
				var arr=dom.attr("upload").split(",");
				var num=arr.length;
				if(dom.siblings('.groupimg').find("li").length>=num)
				{
					jsErrAlert("文件不可多于"+num+"个");
					return false;
				}
				return true;
			}
		});
		$("#"+id)[0]["upload_implement"]=uploader;
		uploader.init(); //初始化
		uploader.bind("FileFiltered",function(uploader,files){
			var dom=$("#"+id);
			var arr=dom.attr("upload").split(",");
			var num=arr.length;
			if(dom.siblings('.groupimg').find("li").length>=num)
			{
				jsErrAlert("文件不可多于"+num+"个");
				this.removeFile(files);
			}
		});
		uploader.bind('FilesAdded',function(uploader,files){
			uploader.start(); //开始上传
		});
		uploader.bind('Error',function(uploader,errObject){
			if(errObject.code == '-600'){
				jsErrAlert("上传文件的大小不能超过3M");
			}
			if(errObject.code == '-601'){
				jsErrAlert("上传文件的类型只能是jpg,gif,png");
			}
		});
		uploader.bind('FileUploaded',function(uploader,file,responseObject){
				var dom=$("#"+id);
				var arr=dom.attr("upload").split(",");
				var num=arr.length;
				if(dom.siblings('.groupimg').find("li").length>=num)
					jsErrAlert("文件不可多于"+num+"个");
				else{
					var data=JSON.parse(responseObject.response);
					if(data.result)
					{
						var data=data.content;
						var dom=$('<li><img width="500" height="304">'+
						'<div class="goodsoperation">'+
						'<span title="放大" class="bigimg">放大</span>'+
						'<span title="删除" class="goodsdelete">删除</span>'+
						'<input type="hidden"/></div></li>');
						dom.find('img').attr("src",data);
						dom.find("input").val(data);
						dom.find(".goodsdelete").click(function(){
							dom.remove();
						})
						dom.prependTo($("#"+id).siblings('.groupimg'));
						validateUpload($("#"+id));
						uploader.disableBrowse(false);
					}else
					{
						alert(data.content);
					}
				}
		});
	}
	$(function(){
		$(".div3_radio").change(function(){
			var self=this;
			var arr=getShowDiv();
			$(".showDiv").hide();
			$.each(arr,function(i,v){
				if(($("#"+v).attr("id")!="huazhuang"&&$("#"+v).attr("id")!="xiaodu")||$("#companyType").val()=="${getConstant('dictionary.COMPANY_TYPE_00')!''}"){
					
						$("#"+v).show().find(".myUpLoadClass").filter(":visible").each(function(i,v){
							var id=$(v).attr("id");
							if(id)
							{
								if(v["upload_implement"])
									v["upload_implement"].refresh();
								else
									initUpload(id);
							}
						})
					
				}
			});
		}).each(function(i,v){
			$(v).change();
		})
		function getShowDiv()
		{
			var arr=[];
			$(".div3_radio:checked").each(function(){
				$.each(eval($(this).attr("divs")),function(){
					arr.push(this);
				})
			})
			return arr;
		}
		
		//提示
		$(".textareaaddress").focus(function(){
			$(this).siblings(".form-labe").fadeOut();
		}).blur(function(){
			if($(this).val().length<1)
			{
				$(this).siblings(".form-labe").fadeIn();
			}
		}).each(function(i,v){
			var dom=$('<div class="form-labe" style="top:50px;" >详细地址</div>');
			<#if storeEdit?exists>
			dom.hide();
			</#if>
			$(v).after(dom);
		})
	})
</script>
</#macro>