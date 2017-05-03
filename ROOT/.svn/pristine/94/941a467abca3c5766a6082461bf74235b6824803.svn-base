(function ($) {
	var tooltext=function(options){//swt我的购物车
		$("#tool").append('<div class="tool"><div class="left width40"><div class="tool_car"><P><span><i title="open"></i>打<br/>开<br/>编<br/>辑<br/>栏</span></P><div class="sidebar_car" id="sidebar_car"><div class="sidebar_cargoods"></div></div></div><div class="tool_other tool_favorite"></div><div class="tool_other scrollTop"></div></div><div class="tool_r tool_car_div"><div class="tool_h"></div><div class="tool_bottom"><div class="tool_r_car_sum"></div><div class="tool_btn"><P class="right"></P></div></div></div><div class="tool_r tool_favorites_div"><div class="tool_scrollbar"  id="base"><div class="tool_scrollbar_con"><ul class="tabT" ><li onclick="getGrid()" class="on">网页模板</li><li onclick="">栏位</li></ul><div id="JKDivb_0"><ul class="tool_r_favorites"><P class="clear"></P></ul></div><div id="JKDivb_1" style="display:none" ><ul class="tool_r_favorites"><P class="clear"></P></ul></div></div></div><div class="tool_bottom"><div class="tool_btn"><P><a href="javascript:void(0);">查看更多<i>&nbsp;</i></a></P></div></div></div></div>')}	
		//工具条通用效果
	var shortcutbar = function (options) {



		//工具条里滚动需要的高度
		options.body_h = $(window).height();
		options.tool_h = $(".tool_h").height();

	};
	//工具条购物车
	var toolcar = function (options) {
		//购物车的滚动条
		if ($(".tool_car_div").show()) {
			var car_tool_bottom = $(".tool_car_div .tool_bottom").height();
			var car_tool_scrollbar = options.body_h - options.tool_h - car_tool_bottom;
			$(".tool_car_div .tool_scrollbar").css({"height":car_tool_scrollbar + "px", "margin-top": options.tool_h + "px"});
		} else {
		}
		//面板滑出
		$(".tool_car p").click(function () {
			if($(".tool_car p span i").attr("title")=="open")//swt打开工具栏
				{
					load_templates();					
					$(".tool_car p span ").html('<i title="close"></i>关<br/>闭<br/>编<br/>辑<br/>栏');
				}
			else//关闭
				{
					$(".tool_favorites_div").animate({'margin-right': '-250px'}, 300);
					$(".tool_favorites_div").delay(0).hide(0);
					$(".tool_car p span ").html('<i title="open"></i>打<br/>开<br/>编<br/>辑<br/>栏');
				}
		}); 
	};
	//工具条我的足迹
	var toolfootprint = function (options) {
		//我的足迹 的滚动条
		if ($(".tool_footprint_div").show()) {
			var footprint_tool_bottom = $(".tool_footprint_div .tool_bottom").height()
			var footprint_tool_scrollbar = options.body_h - options.tool_h - footprint_tool_bottom - 10
			$(".tool_footprint_div .tool_scrollbar").css({"height": footprint_tool_scrollbar + "px", "margin-top": options.tool_h + "px"});
		} else {
		}
		//我的足迹面板滑出
		$(document).on("click",".tool_footprint",function(){
		    $('.tool_footprint_div .tool_scrollbar').perfectScrollbar();
			$(".tool_footprint_div").show().stop().animate({'margin-right': '0px'}, 300);
			$(".tool_favorites_div").animate({'margin-right': '-250px'}, 300)
			$(".tool_favorites_div").delay(0).hide(0)
			$(".tool_car_div").animate({'margin-right': '-250px'}, 300)
			$(".tool_car_div").delay(0).hide(0)
		//我的足迹 失效
			if ($(".tool_r_favorites h4").hasClass("tool_failure")) {
				$(".tool_r_favorites .tool_failure").parents("li").addClass("too_car_gray");
				$(".tool_r_favorites .tool_failure").parents("li").children("div").show();
				$(".tool_r_favorites .tool_failure").children("a").text("商品失效");
				$(".tool_r_favorites .tool_failure").siblings("p").children("span").remove();
			}
			})
		$(".tool_footprint_div .tool_shut").click(function () {
			$(".tool_footprint_div").animate({'margin-right': '-250px'}, 300)
			$(".tool_footprint_div").delay(0).hide(0)
		});
		};
	//工具条收藏夹
	var toolfavorite = function (options) {
		//我的收藏 的滚动条
		if ($(".tool_favorites_div").show()) {
			var favorites_tool_bottom = $(".tool_favorites_div .tool_bottom").height()
			var favorites_tool_scrollbar = options.body_h - options.tool_h - favorites_tool_bottom - 10
			$(".tool_favorites_div .tool_scrollbar").css({"height": favorites_tool_scrollbar + "px", "margin-top": options.tool_h + "px"});
		} else {
		}
		
	};

	
	$.fn.dmShortcutBar=function(options){
	 if(!options){
		 options={};
	 }
	 var opts={
		 tooltext:function(options){
			 tooltext(options);
			 },
		 shortcutbar:function(options){
			 shortcutbar(options);
			 },
		 toolcar:function(options){
			 toolcar(options);
		 },
		 toolfavorite:function(options){
			 toolfavorite(options);
		 },
		 toolfootprint:function(options){
			 toolfootprint(options);
		 },
		 needtext:true,
		 needshortcutbar:true,
		 needCar:true,
		 needFavorite:true,
		 needFootPrint:true
	 };
	 
	 var car_source = $("#car_list").html();
	 var favorites_source = $("#favorites_list").html();
	 
	 var buildCar=function(datas){
		 var car_template = Handlebars.compile(car_source);
		 var car_html=car_template(datas);
		 $('#tool_car').append($(car_html));
	 };
	 var buildFavorite=function(datas){
		 var favorites_template = Handlebars.compile(favorites_source);
		 var favorites_html=favorites_template(datas);
		 $('.tool_r_favorites .clear').before($(favorites_html));	
	 };
	 var buildFootPrint=function(datas){
		 var favorites_template = Handlebars.compile(favorites_source);
		 var favorites_html=favorites_template(datas);
		 $('.tool_r_favorites .clear').before($(favorites_html));	
	 };
	 var api={
		 buildCar:buildCar
		 ,buildFavorite:buildFavorite
		 ,buildFootPrint:buildFootPrint
	 }; 
	
	 shortcutbar(options);
	 
	 if(options){
		 $.extend(opts,options);
	 }
	 
	 if(opts.needtext){
		 opts.tooltext(options);
	 }
	 if(opts.needshortcutbar){
		 opts.shortcutbar(options);
	 }
	 if(opts.needCar){
		 opts.toolcar(options);
	 }
	 if(opts.needFavorite){
		 opts.toolfavorite(options);
	 }
	 if(opts.needFootPrint){
		 opts.toolfootprint(options);
	 }	 
	
	 return api;
	};
	
	})(jQuery);
