(function($){
	
	$.fn.pager = function(data, opt){
		var option={
			rows : [10,25,50,100]
		};
		
		if(opt){
			$.extend(option, opt);
		}
		
		var rows = $('#rows').val();
		$('.bottom').remove();
		$('#rows').val(rows);
		var from = parseInt(data.startIndex) + 1;
		var to = parseInt(data.startIndex) + parseInt(rows);
		if(to > parseInt(data.recordsTotal)){
			to = parseInt(data.recordsTotal);
		}
		var strDiv = '<table class="bottom" style="width:100%; background:#fff; margin:10px auto;"><tr>';
		strDiv += '<td>';
		strDiv += '<div class="dataTables_info" id="datatable_info" role="status" aria-live="polite" style="float: left;">';
		if(data.data.length != 0){
			strDiv += '显示第 ' + from + ' 至 ' + to + ' 项记录 , ';
			strDiv += '共 ' + data.recordsTotal + ' 项';
		}else{
			strDiv += '没有匹配的记录';
		}
		strDiv += '</div>';
		strDiv += '<div class="dataTables_length" id="datatable_length"><label style="margin-left:10px;"><select name="datatable_length" id="rows" aria-controls="datatable" class="form-control input-sm">';

		var rowScorpe = option.rows;
		for(var i = 0; i < rowScorpe.length; i++){
			if(rowScorpe[i] == rows){
				strDiv += '<option value="'+ rowScorpe[i] +'" selected>'+ rowScorpe[i] +'</option>';
			}else{
				strDiv += '<option value="'+ rowScorpe[i] +'">'+ rowScorpe[i] +'</option>';
			}
		}
		
		//获取总页数
		var totalPage = parseInt(data.recordsTotal)/parseInt(rows);
		totalPage = Math.floor(totalPage);
		if(parseInt(data.recordsTotal)%parseInt(rows) != 0){
			totalPage += 1;	
		}
		
		var totalBtnList = [];
		var currentPage = parseInt($("#currentPage").val());
		
		strDiv += '</select> 记录/页</label></div>';
		strDiv += '</td>';
		strDiv += '<td>';
		strDiv += '<div class="dataTables_paginate paging_full_numbers" id="datatable_paginate" style="float: right;text-align: right;padding-top: 0.25em;margin-right:15px;">';
		strDiv += '<ul class="pagination" style="display: block;">';
		if(currentPage == 1){
			strDiv += '<li class="paginate_button first disabled" aria-controls="datatable" tabindex="0"  id="datatable_first">';
			strDiv += '<a href="javascript:void(0);" style="color:#ccc;">首页</a>';
			strDiv += '</li>';
			strDiv += '<li class="paginate_button previous disabled" aria-controls="datatable" tabindex="0"  id="datatable_previous">';
			strDiv += '<a href="javascript:void(0);" style="color: #ccc;">上页</a>'
		}else{
			strDiv += '<li class="paginate_button first" aria-controls="datatable" tabindex="0" id="datatable_first">';
			strDiv += '<a href="javascript:void(0);">首页</a>';
			strDiv += '</li>';
			strDiv += '<li class="paginate_button previous" aria-controls="datatable" tabindex="0" id="datatable_previous">';
			strDiv += '<a href="javascript:void(0);">上页</a>'
		}
		strDiv += '</li>';
		
		if(totalPage < 8){
			for(var i = 1 ; i < totalPage + 1; i++){
				if(i == currentPage){
					strDiv += '<li class="paginate_button " style="border: solid 1px #c60401;" aria-controls="datatable" tabindex="0">';
				}else{
					strDiv += '<li class="paginate_button " aria-controls="datatable" tabindex="0">';
				}
				strDiv += '<a href="javascript:void(0);">' + i + '</a>';
			}
		}else{
			var totalBtnList = [];
			if(currentPage < 5){
				for(var i = 1 ; i < 6; i++){
					var str = '<li class="paginate_button " aria-controls="datatable" tabindex="0">';
					if(i == currentPage){
						str = '<li class="paginate_button " style="border: solid 1px #c60401;" aria-controls="datatable" tabindex="0">';
					}
					str += '<a href="javascript:void(0);">' + i + '</a>';
					totalBtnList.push(str);
				}
				var str = '<li class="ellipsis disabled" aria-controls="datatable" tabindex="0" id="datatable_ellipsis"><a href="javascript:void(0);">…</a></li>';
				totalBtnList.push(str);
				str = '<li class="paginate_button " aria-controls="datatable" tabindex="0">';
				if(totalPage == currentPage){
					str = '<li class="paginate_button " style="border: solid 1px #c60401;" aria-controls="datatable" tabindex="0">';
				}
				str += '<a href="javascript:void(0);">' + totalPage + '</a>';
				totalBtnList.push(str);
			}else if(currentPage > totalPage - 4){
				var str = '<li class="paginate_button " aria-controls="datatable" tabindex="0">';
				str += '<a href="javascript:void(0);">' + 1 + '</a>';
				totalBtnList.push(str);
				str = '<li class="ellipsis disabled" aria-controls="datatable" tabindex="0" id="datatable_ellipsis"><a href="javascript:void(0);">…</a></li>';
				totalBtnList.push(str);
				for(var i = totalPage - 4 ; i <= totalPage; i++){
					if(i == currentPage){
						str = '<li class="paginate_button active" style="border: solid 1px #0a876b;" aria-controls="datatable" tabindex="0">';
					}else{
						str = '<li class="paginate_button" aria-controls="datatable" tabindex="0">';
					}
					str += '<a href="javascript:void(0);">' + i + '</a>';
					totalBtnList.push(str);
				}
			}else{
				var str = '<li class="paginate_button " aria-controls="datatable" tabindex="0">';
				str += '<a href="javascript:void(0);">' + 1 + '</a>';
				totalBtnList.push(str);
				str = '<li class="ellipsis disabled" aria-controls="datatable" tabindex="0" id="datatable_ellipsis"><a href="javascript:void(0);">…</a></li>';
				totalBtnList.push(str);
				str = '<li class="paginate_button " aria-controls="datatable" tabindex="0">';
				str += '<a href="javascript:void(0);">' + (currentPage - 1) + '</a>';
				totalBtnList.push(str);
				str = '<li class="paginate_button " style="border: solid 1px #c60401;" aria-controls="datatable" tabindex="0">';
				str += '<a href="javascript:void(0);">' + (currentPage) + '</a>';
				totalBtnList.push(str);
				str = '<li class="paginate_button " aria-controls="datatable" tabindex="0">';
				str += '<a href="javascript:void(0);">' + (currentPage + 1) + '</a>';
				totalBtnList.push(str);
				str = '<li class="ellipsis disabled" aria-controls="datatable" tabindex="0" id="datatable_ellipsis"><a href="javascript:void(0);">…</a></li>';
				totalBtnList.push(str);
				str = '<li class="paginate_button " aria-controls="datatable" tabindex="0">';
				str += '<a href="javascript:void(0);">' + totalPage + '</a>';
				totalBtnList.push(str);
			}
			for(var i = 0; i < totalBtnList.length; i++){
				strDiv += totalBtnList[i];
			}
		}
		if(currentPage == totalPage || totalPage == 0){
			strDiv += '<li class="paginate_button next disabled" aria-controls="datatable" tabindex="0"  id="datatable_next">';
			strDiv += '<a href="javascript:void(0);" style="color:#ccc;">下页</a>';
			strDiv += '</li>';
			strDiv += '<li class="paginate_button last disabled" aria-controls="datatable" tabindex="0"  id="datatable_last">';
			strDiv += '<a href="javascript:void(0);" style="color:#ccc;">末页</a>';
		}else{
			strDiv += '<li class="paginate_button next" aria-controls="datatable" tabindex="0" id="datatable_next">';
			strDiv += '<a href="javascript:void(0);">下页</a>';
			strDiv += '</li>';
			strDiv += '<li class="paginate_button last" aria-controls="datatable" tabindex="0" id="datatable_last">';
			strDiv += '<a href="javascript:void(0);">末页</a>';
		}
		strDiv += '</li>';
		strDiv += '</ul>';
		strDiv += '</div>';
		strDiv += '</td></tr></table>';
		$('#rows').remove();
		$(this).after(strDiv);
		
		$('[name="datatable_length"]').change(function(event){
			$('#rows').val($('[name="datatable_length"]').val());
			$("#currentPage").val('1');
			eval(option.searchMethod + '(1)');
		});

		$('.paginate_button').click(function(event){
			var currentPage = $("#currentPage").val();
			var target = event.target || event.srcElement;
			var targetId = $(target).attr('id') || $(target).parent().attr('id');
			if(targetId == 'datatable_first'){		//首页
				if(currentPage != '1'){
					eval(option.searchMethod + '(1)');
					$("#currentPage").val('1');
				}
			}else if(targetId == 'datatable_previous'){	//上一页
				if(currentPage != '1'){
					currentPage = parseInt(currentPage) - 1;
					eval(option.searchMethod + '('+ currentPage +')');
					$("#currentPage").val(currentPage);
				}
			}else if(targetId == 'datatable_next'){   //下一页
				if(currentPage != totalPage && totalPage != 0){
					currentPage = parseInt(currentPage) + 1; 
					eval(option.searchMethod + '('+ currentPage +')');
					$("#currentPage").val(currentPage);
				}
			}else if(targetId == 'datatable_last'){   //最后一页
				if(currentPage != totalPage && totalPage != 0){
					eval(option.searchMethod + '('+ totalPage +')');
					$("#currentPage").val(totalPage);
				}
			}else{
				var page = $(target).text();
				if(page != currentPage){
					eval(option.searchMethod + '('+ page +')');
					$("#currentPage").val(page);
				}
			}
		});
		
//		$('.paginate_button').mouseover(function(event){
//			var target = event.target || event.srcElement;
//			if(totalPage == 0){
//				$(target).css({'background':'white', 'border-color': 'white'});
//			}
//			var currentPage = $("#currentPage").val();
//			if($(target).attr('id') == 'datatable_first'){		//首页
//				if(currentPage == '1'){
//					$(target).css({'background':'white', 'border-color': 'white'});
//				}
//			}else if($(target).attr('id') == 'datatable_previous'){	//上一页
//				if(currentPage == '1'){
//					$(target).css({'background':'white', 'border-color': 'white'});
//				}
//			}else if($(target).attr('id') == 'datatable_next'){   //下一页
//				if(currentPage == totalPage){
//					$(target).css({'background':'white', 'border-color': 'white'});
//				}
//			}else if($(target).attr('id') == 'datatable_last'){   //最后一页
//				if(currentPage == totalPage){
//					$(target).css({'background':'white', 'border-color': 'white'});
//				}
//			}
//		});
		
		if(typeof(option.drawAfter) != "undefined"){
			$.extend({'drawAfter':option.drawAfter});
			$.drawAfter();
		}
	}
})(jQuery);
