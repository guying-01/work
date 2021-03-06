if (typeof console == 'undefined')
{
	console={
			log:function(){
			},
			info:function(){
			},
			warn:function(){
			},
			err:function(){
			},
			error:function(){
			}
	};
}
//请求服务
var callService = function(url, params, options) {
	var opts = {
		autoUnlock:true,
		type : "POST",
		url : url,
		data : params,
		beforeSend : function(XHR) {
			if (!opts || !opts.noShowWaiting) {
				jsWaiting(true);
			}
		},
		success : function(data, textStatus, jqXHR) {
			if(data){
				try{
					data=JSON.parse(data);

					if( data.error && $.type(data.error.businessErrCode)!=='undefined'){
						console.log('callService error:',url, textStatus, data);
						if(opts.autoUnlock){
							//需要自动解除锁定
							jsWaiting(false);
						}
						//失败
						if(data.error.businessErrCode==='er_validate_failed'){
							//输入值不符合规范
							if(opts.callValidFailed){
								options.callValidFailed(data.error);
								return;
							}
						}
						if(opts.callError){
							opts.callError(textStatus, null, data.error);
						} else {
							jsWaiting(false);
							if(data.error.errMsg){
								jsErrAlert(data.error.errMsg);
							} else {
								console.log("Service 请求失败", textStatus);
							}
						}

						return;
					}
				}catch (e) {

				}
			}
			if (opts && opts.callSuccess) {
				//成功
				try{
					data=JSON.parse(data);

				}catch (e) {
				}
				opts.callSuccess(data);
			}
		},
		complete : function(XHR, TS) {

		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			if(errorThrown==='601' || XMLHttpRequest.status=='601'){
				jsErrAlert("请勿重复提交");
				return;
			}
			
			console.log('callService error:',url, textStatus);
			if (options && options.callError) {
				options.callError(textStatus, errorThrown);
			} else {
				jsWaiting(false);
				//jsAlert("请求失败");
				console.log("Service 请求失败", textStatus);
			}
		}
	};

	if (options) {
		$.extend(opts, options);
	}
	return $.ajax(opts);
};
//默认一个按钮 对号
var jsAlert = function(message, options) {
	options=options||{};
	var alertContainer='[dm-container="alert-message-container"]';
	var msgContainer='[dm-container="alert-message-contents-container"]';
	var alertOk='[dm-actor="alert-message-ok"]';
	var msgHtml='<div class="pop_up cx1" style="z-Index:20000" dm-container="alert-message-container">'
		+'<div class="pop_up_A" style="margin: -0.9rem 0 0 -2rem;width: 4rem;border-radius: 0.5rem;" dm-container="alert-message-box-container"> '
		// +'<h2>'
		// // +'<a href="javascript:void(0)" class="shut" dm-actor="alert-message-close" >'
		// // +'<img src="/resources/img/common/shutB.png"></a>'
		// +'<span dm-info="alert-message-title">操作提示</span>'
		// +'</h2>'
		+'<div class="pop_bg" dm-container="confirm-message-container-bg">'
		+'<div class="pop_note">'
		// +'<i><img src="/resources/img/common/popico1.png" width="32" height="33"></i>'
		+'<ul dm-container="alert-message-contents-container" style="word-break:break-all;word-wrap:break-word;"></ul>'
		+'</div>'
		+'<div class="pop_up_button">'
		+'<a href="javascript:void(0)" dm-actor="alert-message-ok" class="ture">确定</a></div>'
		+'</div>'
		+'</div>'
		+'</div>';

	var $alertContainer=$(alertContainer);
	//关闭消息框
	var closeAlert=function(){
		$alertContainer.fadeOut();
		$alertContainer.remove();
		$('a').unbind('focus');
		if(options.callback){
			//回调
			options.callback();
		}
	};
	if($alertContainer.length<=0){
		//已经存在消息框
		$('body').append(msgHtml);
		$alertContainer=$(alertContainer);
		//确认按钮
		$('[dm-actor="alert-message-ok"]').click(function(){
			closeAlert();
		});
		//关闭按钮
		$('[dm-actor="alert-message-close"]').click(function(){
			closeAlert();
		});
	}
	var $msgContainer=$(msgContainer);
	if(message!==undefined && message!==null && message!==''){
		//添加消息
		var $li=$('<li>');
		$li.append(message);
		$msgContainer.append($li);
	}
	//重计算高度
	var calcHeight=function(){
		var $boxContainer=$('[dm-container="alert-message-box-container"]');
		var $boxPopBg=$('[dm-container="confirm-message-container-bg"]');
		var msgHeight=$msgContainer.height();
		var baseHeight=85;
		var targetHeight=$boxContainer.height();
		// if((targetHeight-msgHeight)<baseHeight){
		// 	targetHeight=msgHeight+baseHeight;
		// 	$boxContainer.css('cssText', $boxContainer.attr('style')+'height:'+targetHeight+'px !important;');
			$($boxContainer).css({'margin-top':-targetHeight/2});
		// 	$($boxPopBg).css({'height':targetHeight-35});
		// 	$('.pop_note i').css({'top':(msgHeight-33)/2});
		// }
	};
	calcHeight();
	//显示消息
	$alertContainer.fadeIn();
	$(alertOk).focus();
	$('a').bind('focus', function(){
		$('a').blur();
	})
};
//默认一个按钮 错号
var jsErrAlert = function(message, options) {
	options=options||{};
	var alertContainer='[dm-container="alert-message-container"]';
	var msgContainer='[dm-container="alert-message-contents-container"]';
	var alertOk='[dm-actor="alert-message-ok"]';
	var msgHtml='<div class="pop_up cx1" style="z-Index:20000" dm-container="alert-message-container">'
		+'<div class="pop_up_A" style="margin-top:-0.9rem;margin-left: -2rem;height: 1.7rem;border-radius: 0.25rem;height: 1.8rem;" dm-container="alert-message-box-container"> '
		// +'<h2>'
		// +'<a href="javascript:void(0)" class="shut" dm-actor="alert-message-close" >'
		// +'<img src="/resources/img/common/shutB.png"></a>'
		// +'<span dm-info="alert-message-title">操作提示</span>'
		// +'</h2>'
		+'<div class="pop_bg" dm-container="confirm-message-container-bg">'
		+'<div class="pop_note">'
		// +'<i><img src="/resources/img/common/popico3.png" width="32" height="33"></i>'
		+'<ul dm-container="alert-message-contents-container" style="word-break:break-all;word-wrap:break-word;"></ul>'
		+'</div>'
		+'<div class="pop_up_button">'
		+'<a href="javascript:void(0)" dm-actor="alert-message-ok" class="true">确定</a></div>'
		+'</div>'
		+'</div>'
		+'</div>';

	var $alertContainer=$(alertContainer);
	//关闭消息框
	var closeAlert=function(){
		$alertContainer.fadeOut();
		$alertContainer.remove();
		$('a').unbind('focus');
		if(options.callback){
			//回调
			options.callback();
		}
	};
	if($alertContainer.length<=0){
		//已经存在消息框
		$('body').append(msgHtml);
		$alertContainer=$(alertContainer);
		//确认按钮
		$('[dm-actor="alert-message-ok"]').click(function(){
			closeAlert();
		});
		//关闭按钮
		$('[dm-actor="alert-message-close"]').click(function(){
			closeAlert();
		});
	}
	var $msgContainer=$(msgContainer);
	if(message!==undefined && message!==null && message!==''){
		//添加消息
		var $li=$('<li>');
		$li.append(message);
		$msgContainer.append($li);
	}
	//重计算高度
	var calcHeight=function(){
		var $boxContainer=$('[dm-container="alert-message-box-container"]');
		var $boxPopBg=$('[dm-container="confirm-message-container-bg"]');
		var msgHeight=$msgContainer.height();
		var baseHeight=85;
		var targetHeight=$boxContainer.height();
		// if((targetHeight-msgHeight)<baseHeight){
		// 	targetHeight=msgHeight+baseHeight;
		// 	$boxContainer.css('cssText', $boxContainer.attr('style')+'height:'+targetHeight+'px !important;');
			$($boxContainer).css({'margin-top':-targetHeight/2});
		// 	$($boxPopBg).css({'height':targetHeight-35});
		// 	$('.pop_note i').css({'top':(msgHeight-33)/2});
		// }
	};
	calcHeight();
	//显示消息
	$alertContainer.fadeIn();

	$(alertOk).focus();

	$('a').bind('focus', function(){
		$('a').blur();
	})
};
try{
	//重载了alert
	alert=jsErrAlert;
}catch(ex){

}

//默认2个按钮 问号
var jsConfirm = function(message, options) {
	options=options||{};
	var confirmContainer='[dm-container="confirm-message-container"]';
	var msgContainer='[dm-container="confirm-message-contents-container"]';
	var confirmOk='[dm-actor="confirm-message-ok"]';
	var confirmCancel='[dm-actor="confirm-message-cancel"]';
	var confirmClose='[dm-actor="confirm-message-close"]';
	var msgHtml='<div class="pop_up cx1" style="z-Index:20000" dm-container="confirm-message-container">'
		+'<div class="pop_up_A" style="margin-top:-0.9rem;margin-left: -2rem;height: 1.7rem;border-radius: 0.25rem" dm-container="confirm-message-box-container"> '
		// +'<h2>'
		// +'<a href="javascript:void(0)" class="shut" dm-actor="confirm-message-close" >'
		// +'<img src="/resources/img/common/shutB.png"></a>'
		// +'<span dm-info="confirm-message-title">操作提示</span>'
		// +'</h2>'
		+'<div class="pop_bg" dm-container="confirm-message-container-bg">'
		+'<div class="pop_note">'
		// +'<i><img src="/resources/img/common/popico2.png" width="33" height="33"></i>'
		+'<ul dm-container="confirm-message-contents-container" style="word-break:break-all;word-wrap:break-word;"></ul>'
		+'</div>'
		+'<div class="pop_up_button">'
		+'<a href="javascript:void(0)" dm-actor="confirm-message-ok"  class="aLeft">确定</a>'
		+'<a href="javascript:void(0)" dm-actor="confirm-message-cancel" class=" shut aRight">取消</a></div>'
		+'</div>'
		+'</div>'
		+'</div>';

	var $confirmContainer=$(confirmContainer);

	//关闭消息框
	var closeConfirm=function(result){
		$confirmContainer.fadeOut();

		$confirmContainer.remove();

		$('a').unbind('focus');

		if(options.callback){
			//回调
			options.callback(result);
		}
	};
	if($confirmContainer.length<=0){
		//已经存在消息框
		$('body').append(msgHtml);
		$confirmContainer=$(confirmContainer);
		//确认按钮
		$(confirmOk).click(function(){
			closeConfirm(true);
		});
		//关闭按钮
		$(confirmCancel).click(function(){
			closeConfirm(false);
		});
		//关闭按钮
		$(confirmClose).click(function(){
			closeConfirm(false);
		});
	} else {
		//如果对话框正在打开中，则不再继续执行显示以及回调处理
		return;
	}
	var $msgContainer=$(msgContainer);
	if(message!==undefined && message!==null && message!==''){
		//添加消息
		var $li=$('<li>');
		$li.append(message);
		$msgContainer.append($li);
	}
	//重计算高度
	var calcHeight=function(){
		var $boxContainer=$('[dm-container="confirm-message-box-container"]');//pop_up_A
		var $boxPopBg=$('[dm-container="confirm-message-container-bg"]');
		var msgHeight=$msgContainer.height();//ul 高度
		// var baseHeight=85;
		var targetHeight=$boxContainer.height();//pop_up_A 高度
		// if((targetHeight-msgHeight)<baseHeight){
		// 	targetHeight=msgHeight+baseHeight;
		// 	$boxContainer.css('cssText', $boxContainer.attr('style')+'height:'+targetHeight+'px;');
			$($boxContainer).css({'margin-top':-targetHeight/2});
			// $($boxPopBg).css({'height':targetHeight-35});
		// 	$('.pop_note i').css({'top':(msgHeight-33)/2});
		// }
	};
	calcHeight();
	//显示消息
	$confirmContainer.fadeIn();
	$(confirmOk).focus();
	$('a').bind('focus', function(){
		$('a').blur();
	})
};
//默认2个按钮 叹号
var jsWarConfirm = function(message, options) {
	options=options||{};
	var confirmContainer='[dm-container="confirm-message-container"]';
	var msgContainer='[dm-container="confirm-message-contents-container"]';
	var confirmOk='[dm-actor="confirm-message-ok"]';
	var confirmCancel='[dm-actor="confirm-message-cancel"]';
	var confirmClose='[dm-actor="confirm-message-close"]';
	var msgHtml='<div class="pop_up cx1" style="z-Index:20000" dm-container="confirm-message-container">'
		+'<div class="pop_up_A" style="margin-top:-0.9rem;margin-left: -2rem;height: 1.7rem;border-radius: 0.25rem;height: 1.8rem;" dm-container="confirm-message-box-container"> '
		// +'<h2>'
		// +'<a href="javascript:void(0)" class="shut" dm-actor="confirm-message-close" >'
		// +'<img src="/resources/img/common/shutB.png"></a>'
		// +'<span dm-info="confirm-message-title">操作提示</span>'
		// +'</h2>'
		+'<div class="pop_bg" dm-container="confirm-message-container-bg">'
		+'<div class="pop_note">'
		// +'<i><img src="/resources/img/common/popico4.png" width="33" height="33"></i>'
		+'<ul dm-container="confirm-message-contents-container" style="word-break:break-all;word-wrap:break-word;"></ul>'
		+'</div>'
		+'<div class="pop_up_button">'
		+'<a href="javascript:void(0)" dm-actor="confirm-message-ok"  class="aLeft">确定</a>'
		+'<a href="javascript:void(0)" dm-actor="confirm-message-cancel" class="shut aRight">取消</a></div>'
		+'</div>'
		+'</div>'
		+'</div>';

	var $confirmContainer=$(confirmContainer);

	//关闭消息框
	var closeConfirm=function(result){
		$confirmContainer.fadeOut();

		$confirmContainer.remove();

		$('a').unbind('focus');

		if(options.callback){
			//回调
			options.callback(result);
		}
	};
	if($confirmContainer.length<=0){
		//已经存在消息框
		$('body').append(msgHtml);
		$confirmContainer=$(confirmContainer);
		//确认按钮
		$(confirmOk).click(function(){
			closeConfirm(true);
		});
		//关闭按钮
		$(confirmCancel).click(function(){
			closeConfirm(false);
		});
		//关闭按钮
		$(confirmClose).click(function(){
			closeConfirm(false);
		});
	} else {
		//如果对话框正在打开中，则不再继续执行显示以及回调处理
		return;
	}
	var $msgContainer=$(msgContainer);
	if(message!==undefined && message!==null && message!==''){
		//添加消息
		var $li=$('<li>');
		$li.append(message);
		$msgContainer.append($li);
	}
	//重计算高度
	var calcHeight=function(){
		var $boxContainer=$('[dm-container="confirm-message-box-container"]');//pop_up_A
		var $boxPopBg=$('[dm-container="confirm-message-container-bg"]');
		var msgHeight=$msgContainer.height();//ul 高度
		var baseHeight=85;
		var targetHeight=$boxContainer.height();//pop_up_A 高度
		// if((targetHeight-msgHeight)<baseHeight){
		// 	targetHeight=msgHeight+baseHeight;
		// 	$boxContainer.css('cssText', $boxContainer.attr('style')+'height:'+targetHeight+'px;');
			$($boxContainer).css({'margin-top':-targetHeight/2});
		// 	$($boxPopBg).css({'height':targetHeight-35});
		// 	$('.pop_note i').css({'top':(msgHeight-33)/2});
		// }
	};
	calcHeight();
	//显示消息
	$confirmContainer.fadeIn();
	$(confirmOk).focus();
	$('a').bind('focus', function(){
		$('a').blur();
	})
};
try{
	//重载了alert  jsAlert  jsErrAlert  jsConfirm  jsWarConfirm
	alert=jsWarConfirm;
}catch(ex){

}
var jsWaiting = function(isShow) {
	if(isShow){
		//遮罩
	} else {
		//取消遮罩
		try{
			if($('.blockUI').parent().data('blockUI.isBlocked')){
				$('.blockUI').parent().unblock();
			} else {
				$.unblockUI();
			}

		}catch(ex){
		}
	}
};

//格式化金钱
var fmoney=function (s, n,showFlag) {
	n = n > 0 && n <= 20 ? n : 2;
	s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
	var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
	t = "";
	for (i = 0; i < l.length; i++) {
		t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? (showFlag?",":"") : "");
	}
	return t.split("").reverse().join("") + "." + r;
};

(function($) {
	if(!$.dm){
		$.dm={};
	}
	//获取url中路径部分数据
	$.dm.getPathNames=function(){
		var pathnames=location.pathname.split('/');
		return pathnames;
	};
	// 获取url参数
	$.dm.getUrlParams = function() {
		var args = {};
		var query = location.search.substring(1);
		var pairs = query.split('&');

		for(var i=0;i<pairs.length; i++){
			var pos = pairs[i].indexOf('=');
			if(pos == -1){
				continue;
			}
			var argname = pairs[i].substring(0, pos);
			var value = pairs[i].substring(pos + 1);
			args[argname] = decodeURIComponent(value);
		}
		return args;
	};

	// 创建url参数
	$.dm.createUrlParams = function(params) {
		var url='?';
		if(params){
			var value;
			for(var key in params){
				value='';
				if(params[key]!=undefined && params[key]!=null){
					value=encodeURIComponent(params[key]);
				}
				url+=key+'='+value+'&';
			}
		}
		return url;
	};

	//遮罩
	$.dm.block = function($target,options) {
		options=options||{};
		var opt={message:null,overlayCSS:{opacity: 0.3,backgroundColor:'#ccc'}};
		$.extend(opt, options);
		if($target){
			$target.block(opt);
		}else{
			opt.message='请等待.....';
			$.blockUI(opt);
		}
	};
	//解除遮罩
	$.dm.unblock = function($target) {
		if($target){
			$target.unblock();
		}else{
			$.unblockUI();
		}
	};

	//通过form传值并跳转页面
	$.dm.jumpTo=function(url, params, options){
		var opt={method:'post', target:'_self'};

		if(options){
			$.extend(opt,options);
		}

	    // 创建Form
	    var form = $('<form></form>');
	    // 设置属性
	    form.attr('action', url);
	    form.attr('method', opt.method);
	    // form的target属性决定form在哪个页面提交
	    // _self -> 当前页面 _blank -> 新页面
	    form.attr('target', '_self');
		if(params){
			for(var key in params){
				var my_input = $('<input type="hidden" name="'+key+'" />');
				my_input.attr('value', params[key]);
				// 附加到Form
				form.append(my_input);
			}
		}
		$('body').append(form);
	    // 提交表单
	    form.submit();
	    // 注意return false取消链接的默认动作
	    return false;
	};



	//通过form传值并跳转页面
	$.dm.msJumpTo2=function(url, params, options){
		var opt={method:'get', target:'_self'};

		if(options){
			$.extend(opt,options);
		}

	    // 创建Form
	    var form = $('<form></form>');
	    // 设置属性
	    form.attr('action', url);
	    form.attr('method', opt.method);
	    // form的target属性决定form在哪个页面提交
	    // _self -> 当前页面 _blank -> 新页面
	    form.attr('target', opt.target);

		if(params){
			for(var key in params){
				var my_input = $('<input type="hidden" name="'+key+'" />');
				my_input.attr('value', params[key]);
				// 附加到Form
				form.append(my_input);
			}
		}
		$('body').append(form);
	    // 提交表单
	    form.submit();
	    // 注意return false取消链接的默认动作
	    return false;
	};

	$.dm.widgetCache={};

	//载入widget
	$.dm.loadWidget=function(container,widget,options){
		options=options||{};

		$.dm.widget=$.dm.widget||{};

		var opt={replace:true,append:false};
		$.extend(opt, options);
		var url='/resources'+'/widget/'+widget+'.wgt';

		$.dm.widgetCache[widget]=false;

		var callback=function(result){
			if(opt.callSuccess){
				opt.callSuccess(container,widget,result);
			}else{
				var target=$.dm.widget[widget];
				if(target){
					target().init(opt);
				}

			}
		};
		var callSuccess=function(result){
			if(!result){
				callback(result);
				return;
			}
			$.dm.widgetCache[widget]=result;//缓存小部件
			var $container=null;
			if(container){
				//设置了小部件容器的场合
				$container=$(container);
			} else {
				callback(result);
				return;
			}

			if(opt.replace){
				//整体替换
				$container.replaceWith(result);
			} else if(opt.append){
				//添加到容器内部
				$container.append(result);
			} else {
				//整体替换到容器内部
				$container.html(result);
			}
			callback(result);
		};
		callService(url,{},{type:'get', callSuccess:callSuccess});
	};
	$.dm.msgJump=function (self,url,param,option){
		/*var id=$(self).attr("num");
		callService("/notify/statusChange.ajax",{id:id},{callSuccess:function(data){*/
		var opt={'target' : '_self'};
		// 去看看跳到推应的tab位置
		if (url == '/return/toReturnOrderList.jhtml') {
			url += '#tab2';
		}
 			$.dm.msJumpTo2(url,param,opt);
	/*	}})*/
	};
	//载入式样表文件
	$.dm.loadStyle=function(url,id,options){

		var $style=$('link[href$="'+url+'"]');
		if ($style.length > 0){
			if(options.unique){
				$style.remove();
			}
		}

		if($.browser.msie){
			document.createStyleSheet(url);
		}else{
			$style=$('<link />').attr({'type':'text/css','rel':'stylesheet','href':url,'media':'screen'});
			$style.appendTo($('head'));
		}

	};
	//跳转到商城商品搜索页面
	$.dm.jumpToGoodsSearch=function(from,searchWord,itemCat1,itemCat2,itemCat3){
		var urlParams=$.dm.createUrlParams({from:from,s:searchWord
			,itemCat1:itemCat1,itemCat2:itemCat2,itemCat3:itemCat3});
		location.href='/goodsSearch.jhtml?'+urlParams;
	};
	//跳转到店铺商品搜索页面
	$.dm.jumpToStoreGoodsSearch=function(from,storeId,searchWord){
		var urlParams=$.dm.createUrlParams({from:from,ss:searchWord});
		location.href='/st/'+storeId+'/search.jhtml?'+urlParams;
	};
})(jQuery);

//用于字数统计的方法，并且显示出可输入的剩余字数
var textCounter = function(count, targetId){
	var target = event.currentTarget || event.srcElement;
	var txtArea = $(target).val();
	var result = count-txtArea.length < 0 ? 0 : count-txtArea.length;
	$(targetId).text(result);
};

/**
 * 载入店铺装修数据
 */
var loadStoreLayoutDatas=function(storeId,callback){
	try{
		var query = {"subSystemId":"00","pageId":"page0002","storeId":storeId};
		// 查询布局数据url
		var url = "/tpl/findPageLayoutDataList.ajax";
		// 参数
		// 调用后台，获取数据并加载模板
		callService(url,query,{callSuccess:function(result){
			callback(result);
		},callError:function(){
			callback(null);
		}
		});
	}catch(ex){
		callback(null);
	}
};

/**
 * 判断店铺是否有指定栏位的布局数据
 */
var isStoreHasRangeById = function(storeId,rangeId,callback){
	var rangeId=rangeId;
	loadStoreLayoutDatas(storeId,function(result){
		if(!result){
			callback(false,{});
			return;
		}
		var targetRange = {};
		var hasRange = false;
		for(var key in result){
			var range = result[key];
			var rangeData = {};
			if(range["rangeExtendData"]){
				rangeData = eval("("+range["rangeExtendData"]+")");
				range["rangeData"] = rangeData;
			}
			if(range["rangeId"]==rangeId){
				targetRange = range;
				hasRange = true;
			}
		}
		callback(hasRange,targetRange);
	});
};

/**
 * 判断商城是否有指定栏位的布局数据
 */
var isMallHasRangeById = function(rangeId,callback){
	try{
		var query = {"pageId":"page0001","subSystemId":"00"};
		// 查询布局数据url
		var url = "/tpl/findPageLayoutDataList.ajax";
		// 参数
		// 调用后台，获取数据并加载模板
		callService(url,query,{callSuccess:function(result){
			var targetRange = {};
			var hasRange = false;
			for(var key in result){
				var range = result[key];
				var rangeData = {};
				if(range["rangeExtendData"]){
					rangeData = eval("("+range["rangeExtendData"]+")");
					range["rangeData"] = rangeData;
				}
				if(range["rangeId"]==rangeId){
					targetRange = range;
					hasRange = true;
				}
			}
			callback(hasRange,targetRange);
		},callError:function(){
			callback(false,{});
		}
		});
	}catch(ex){
		console.log(ex);
	}
};

/**
 * 查找当前栏位在那个栏位之前，如果本栏位不再任何栏位之前，直接返回null
 * gridId 网格ID
 * rangeId 栏位ID
 * currentOrder 当前栏位的order
 */
$.dmFindRangLocationBefore = function(gridId,rangeId,currentOrder){
	try{
		var beforeObj = null;
		$_grid = $("[dm-layout-grid='"+gridId+"']");
		$_ranges = $_grid.children("[dm-layout-range]");
		$_ranges.each(function(index,item){
			var orders = $(item).attr("order");
			if(orders > currentOrder){
				beforeObj =  $(item);
				return false;
			}
		});
		return beforeObj;
	}catch(ex){
		console.log(ex);
	}
};

//刷新上 右两侧工具栏
var refreshTool = function(options){
	try {
		options=options||{};
		//刷新顶部
		if($("#tool").dmLoadToolBar){
			var opt1={"type":"html"};
			$.extend(opt1, options);
			$("#tool").dmLoadToolBar(opt1);
		}
		// 刷新右侧工具栏
		if($(".topnav").dmHeaderBar){
			var opt2={"type":"replaceWith"};
			$.extend(opt2, options);
			$(".topnav").dmHeaderBar(opt2);
		}
	} catch (e) {
		console.log(e);
	}
};
//格式化日期
Date.prototype.format = function(fmt)
{
  var o = {
    "M+" : this.getMonth()+1,                 //月份
    "d+" : this.getDate(),                    //日
    "h+" : this.getHours(),                   //小时
    "m+" : this.getMinutes(),                 //分
    "s+" : this.getSeconds(),                 //秒
    "q+" : Math.floor((this.getMonth()+3)/3), //季度
    "S"  : this.getMilliseconds()             //毫秒
  };
  if(/(y+)/.test(fmt))
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
  for(var k in o)
    if(new RegExp("("+ k +")").test(fmt))
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
  return fmt;
};
//计算日期的差值（通过判断isBegin，可以知道是否已经开始）
var formatDateDiff=function(diff){
	var result={isBegin:false};
	if(diff<0){
		//已经开始
		diff=-(diff);
		result.isBegin=true;
	}
	var days = Math.floor(diff / (1000 * 60 * 60 * 24));
	var hours = Math.floor((diff-days*(1000 * 60 * 60 * 24))/(1000* 60 * 60));
	var minutes = Math.floor((diff-days*(1000 * 60 * 60 * 24)-hours*(1000* 60 * 60))/(1000* 60));
	var seconds = Math.floor((diff-days*(1000 * 60 * 60 * 24)-hours*(1000* 60 * 60)-minutes*1000* 60)/1000);

	result.days=days;
	result.hours=hours;
	result.minutes=minutes;
	result.seconds=seconds;

	return result;
};
//解析日期
var parseDate=function(value){
//	var year=parseInt(value.substring(0,4));
//	var month=parseInt(value.substring(4,6))-1;
//	var day=parseInt(value.substring(6,8));
//	var hour=parseInt(value.substring(8,10));
//	var minute=parseInt(value.substring(10,12));
//	var second=parseInt(value.substring(12,14));
//	return new Date(year,month,day,hour,minute,second);
	if(value!=null){
	return new Date(Date.parse(value.replace(/-/g, "/")));}
};

//系统常量定义
var system_vars={
		upload_file_types_imgs:'jpg,gif,png,bmp',
		upload_file_types_import:'xls,xlsx',
		upload_max_size_1m:'1024kb',
		upload_max_size_2m:'2048kb',
		upload_max_size_3m:'3072kb',
		upload_max_size_4m:'4096kb',
		upload_max_size_5m:'5120kb'
};

//将金额等数值型数据转化为111,111,111展示形式
var sansplid =function(num){
	return  (num+"").split("").reverse().join("").replace(/(\d{3})(?=[^$])/g, "$1,").split("").reverse().join("");
};

//qiang.li 添加全局捕捉 ajax 超时.
(function(){
	var flag=true;
	$.ajaxSetup({
		statusCode: {
			510: function (data,text,staus) {
				if(!flag){
					return
				}
                flag=false;
				var msg = $.parseJSON(data.responseText||'{}');
				jsErrAlert("登录超时,请重新登录!",{
					callback:function(){
						window.location.href="/toLogin.jhtml";
                        flag=true
					}
				});
			},
			500:function(){
				jsErrAlert("系统发生异常,请稍后再试!",{
					callback:function(){
					}
				});
			}
		}
	});
})()


function QQtalk(QQnum){
	if(QQnum==""){
		jsAlert("商家客服不在线!");
		return;
	}
	var Link = "http://wpa.qq.com/msgrd?v=3&uin="+'1739073619'+"&site=qq&menu=yes";
	window.open(Link);
}
$(function(){
	$("#login_popUp input").on("focus", function () {           //隐藏登录框获取焦点
		$(this).parent().css('border','1px solid #c3050f');
		$(this).parent().parent().parent().css({
			"position": "absolute"
		}).animate({top:parseInt($(window).scrollTop()) + 80 + 'px'},'slow');
	})
	$("#login_popUp input").on("blur", function () {           //隐藏登录框失去焦点
		$(this).parent().css('border','solid 1px #d0d0d0')
	});
    $('#login_popUp #btnSubmit').on('click',function(){
		$(this).parent().parent().css('position','fixed').animate({top:'30%'},'slow')

	})
});

(function () {
	if (typeof WeixinJSBridge == "object" && typeof WeixinJSBridge.invoke == "function") {

		handleFontSize();

	} else {
		if (document.addEventListener) {

			document.addEventListener("WeixinJSBridgeReady", handleFontSize, false);

		} else if (document.attachEvent) {

			document.attachEvent("WeixinJSBridgeReady", handleFontSize);

			document.attachEvent("onWeixinJSBridgeReady", handleFontSize);

		}

	}
	function handleFontSize() {

		// 设置网页字体为默认大小
		WeixinJSBridge.invoke('setFontSizeCallback', {

			'fontSize': 0

		});

		// 重写设置网页字体大小的事件
		WeixinJSBridge.on('menu:setfont', function () {

			WeixinJSBridge.invoke('setFontSizeCallback', {

				'fontSize': 0

			});

		});

	}
})()


