/**
 * Created by WW on 2016/11/1.
 */

/**
 * 通用商铺模板产品列表页面加载
 * Created by WW on 2016/11/01.
 */
$(function () {
    var storeId = $("#pageInfo").attr("store_id");   //获取当前页面storeId;
    var storeTemplateCode = $("#pageInfo").attr("store_template_code");   //获取当前页面模板编号;
    var categoryId = "*";
	var paramsSearch = getURLParameters();
    if(paramsSearch.keyword != undefined){
    	 $(".search_input1").val(decodeURIComponent(paramsSearch.keyword));
    }
   	$(".search_input1").on("focus",function(){
   		$(this).val("");
   	})
   	
   	$(".price-search input").on("focus",function(){
   		$(this).val("");
   	})



    $(".category_list").on("click", '.parentCategory', function () {
        if ($(this).siblings('.pop_catetory_item').css('display') == 'none') {
            $(this).siblings('.pop_catetory_item').slideDown();
            $(this).siblings('.arrow').css({
                'transform': 'rotate(0deg)',
                'transition': 'All 0.1s'
            })
        }else {
            $(this).siblings('.pop_catetory_item').slideUp();
            $(this).siblings('.arrow').css({
                'transform': 'rotate(-90deg)',
                'transition': 'All 0.1s'
            })
        }
    });




    var tab = location.href.indexOf("#tab") != -1 ? location.href.substring(location.href.indexOf("#tab") + 4) : 0; //根据url中tab标签显示分类商品
    var params = {};
    var urlParams = getURLParameters();
    //分类加载
    (function () {
        var success = function (data) {
            data = JSON.parse(data);
            var template_data = categoryDataFormat(data);
            var html = "";
            var template = "";
            for (var i in template_data) {
                if (template_data[i].lv2_obj.length) {
                    template = cutTemplateWrap(template_category_list_2);
                    html += loadHandlebarsTemplate(template, template_data[i]);
                } else {
                    template = cutTemplateWrap(template_category_list_1);
                    html += loadHandlebarsTemplate(template, template_data[i]);
                }
            }
            $(".category_list").on("click", "h5:not('.parentCategory')", function () {
                categoryId = $(this).attr("category_id");
                params.page = 1;
                params.minPrice = $(".price-search .price_min").val() != "" ? $(".price-search .price_min").val() : "0";
            	params.maxPrice = $(".price-search .price_max").val() != "" ? $(".price-search .price_max").val() : "*";
            	params.categoryName = $(this).attr("title");
                loadGoods(categoryId,"filter");
                $(window).scrollTop(0);
                $(this).parents(".category_menu").slideUp();
            });
            $(".all_category").on("click", function () {
                categoryId = "*";
                params.page = 1;
                params.categoryName = $(this).text();
                params.minPrice = $(".price-search .price_min").val() != "" ? $(".price-search .price_min").val() : "0";
            	params.maxPrice = $(".price-search .price_max").val() != "" ? $(".price-search .price_max").val() : "*";
                loadGoods(categoryId,"filter");
                $(window).scrollTop(0);
                $(this).parents(".category_menu").slideUp();
            });
            $(".category_list").append(html);

            var index1 = 0, index2 = 0;
            if (urlParams.ctg_lv1 && !isNaN(urlParams.ctg_lv1)) {
                index1 = parseInt(urlParams.ctg_lv1) < template_data.length ? urlParams.ctg_lv1 : 0;
                if (template_data[index1].lv2_obj.length) {
                    if (urlParams.ctg_lv2 && !isNaN(urlParams.ctg_lv2)) {
                        index2 = parseInt(urlParams.ctg_lv2) < template_data[index1].lv2_obj.length ? urlParams.ctg_lv2 : 0;
                        if (template_data[index1].lv2_obj[index2]) {
                            categoryId = template_data[index1].lv2_obj[index2].lv2_id;
                            loadGoods(categoryId,"filter");
                        } else {
                            categoryId = template_data[index1].lv2_obj[0].lv2_id;
                            loadGoods(categoryId,"filter");
                        }
                    } else {
                        categoryId = template_data[index1].lv2_obj[0].lv2_id;
                        loadGoods(categoryId,"filter");
                    }
                } else {
                    categoryId = template_data[index1].lv1_id;
                    loadGoods(categoryId,"filter");
                }
            } else {
                loadGoods(categoryId,"loadmore");
            }
        };
        $.ajax({
            "url": "/fsajax/sellerStoreCategoryByCode.ajax",
            "type": "post",
            "async": true,
            "data": {"storeId": storeId},
            "success": success
        });
    })();

    function categoryDataFormat(data) {
        var result = [];
        for (var i in data) {
            if (1 == data[i].grade) {
                var tempObj = {"lv1_id": data[i].id, "lv1_name": data[i].name, "orders": data[i].orders, "lv2_obj": []};
                result.push(tempObj);
            }
        }
        for (var i = 0; i < result.length - 1; i++) {
            for (var j = 0; j < result.length - i - 1; j++) {
                if (result[j].orders > result[j + 1].orders) {
                    var temp = result[j];
                    result[j] = result[j + 1];
                    result[j + 1] = temp;
                }
            }
        }
        for (var i in result) {
            delete result[i].orders;
        }
        for (var i in data) {
            if (2 == data[i].grade) {
                var tempObj = {"lv2_id": data[i].id, "lv2_name": data[i].name};
                for (var j in result) {
                    if (data[i].parentId == result[j].lv1_id) {
                        result[j].lv2_obj.push(tempObj);
                    }
                }
            }
        }
        //我竟然用了六个for循环...蠢哭..(=@__@=)
        return result;
    }

    function loadGoods(categoryId,source) {
        params.minPrice = $(".price-search .price_min").val() != "" ? $(".price-search .price_min").val() : "0";
        params.maxPriceTi = $(".price-search .price_max").val() != "" ? $(".price-search .price_max").val() : "任意";
    	params.searchText =  $(".search_input1").val();
    	if(params.categoryName == "" || params.categoryName == undefined){
    		params.categoryName = "全部分类"
    	}
    	if(params.searchText == ""){
    		params.searchText = "暂无"
    	}  	
    	var source = source;
        var list_params = {"pageRows":10, "pageStart": 1, "filterQueryMap": {"store_id": [storeId], "store_category_id_2": [categoryId]}, "searchText": "", "sorts": {}, "minPrice": "", "maxPrice": "", "queryOption": {"catCondItems": true, "condItems": true, "sort": true, "price": true}, "queryData": {}};

        list_params.filterQueryMap.store_category_id_2[0] = categoryId;
         list_params.searchText = $(".search_input1").val();;
        //获得url中排序方式
        if (params.sorts == undefined || params.sorts == "" || params.sorts == "default") {
            list_params.sorts = {};
        } else {
            list_params.sorts[params.sorts] = params[params.sorts];
        }
        list_params["minPrice"] = params["minPrice"] != undefined ? params["minPrice"] : "0";    //价格区间_最低价格
        list_params["maxPrice"] = params["maxPrice"] != undefined ? params["maxPrice"] : "*";    //价格区间_最高价格
        if (list_params["minPrice"] != "" && list_params["maxPrice"] != "") {
            list_params.filterQueryMap["item_sales_min_price_mall"] = ["[" + list_params["minPrice"] + " TO " + list_params["maxPrice"] + "]"]; //添加价格区间参数
        }
        list_params.pageStart = (params.page = (params.page != undefined & params.page > 0) ? params.page : 1); //当前页码
        var exp = new Date();
        exp.setTime(exp.getTime() + 5*60*1000);
        var requestData = {"condition": JSON.stringify(list_params)};
        var success = function (data) {
            data = JSON.parse(data.replace(/\t/g, ""));
            var totalPage = Math.ceil(data.rows_total / 10);
            var template_data = data.data.dataList;
            var template = cutTemplateWrap(template_goods_list);
            var html = "";
            
            var allgoodsnum ={goodsnum:data.data.pagerMap.rows_total != undefined? data.data.pagerMap.rows_total : 0};
            var template_all_goods_num = cutTemplateWrap(template_allgoodsnum);
            var html_all_goods_num ="";
            html_all_goods_num = loadHandlebarsTemplate(template_all_goods_num, allgoodsnum);
            $(".all-goods-num-box").html(html_all_goods_num)
            
            
            var template_now_choose = cutTemplateWrap(now_choose);
            var html_now_choose ="";
            html_now_choose = loadHandlebarsTemplate(template_now_choose,params);
            $(".now_choose_box").html(html_now_choose)

            var flag = true;
            if (template_data.length==10) {
                html = loadHandlebarsTemplate(template, template_data);
                flag = true;
                $("#loadmore").text("加载更多").removeClass("noGoodsTip");
            }
            else if(template_data.length<10&&template_data.length!=0){
            		  $("#loadmore").text("已经看到最后啦~").addClass("noGoodsTip");

                html = loadHandlebarsTemplate(template, template_data);
                flag = false;
            }
            else if(template_data.length==0){
                if(source == "filter"){
                    $("#loadmore").text("没有筛选到符合的商品~").addClass("noGoodsTip");
                }
                if(source == "loadmore"){
                    $("#loadmore").text("已经看到最后啦~").addClass("noGoodsTip");
                }
                flag = false;
            }
           
            if(source == "filter"){
        		 $(".product_items").html(html);
        	}
        	if(source == "loadmore"){
        		  $(".product_items").append(html);
        	}
            if (flag) {
                loadMore(data.data.pagerMap);

            }else{
                loadMore({page_num: "1", page_rows: "10", rows_total: "0"});

            }

        };
        $.ajax({
            "url": "/fsajax/goodsSearch.ajax",
            "type": "post",
            "async": true,
            "data": requestData,
            "success": success
        });
    }

    //排序功能事件绑定
    (function () {
        $("#contentRight-nav .left .btn_sort").on("click", function () {
            $(this).siblings().find("u").removeClass("sorting_bot");
            //初始化参数
            params.page=1;
         	$(".product_items").html("");
            delete params.sorts;
            delete params.sales_amount;
            delete params.item_sales_min_price_mall;
            delete params.sales_score;
            delete params.goods_create_date;
            //初始化排序
            $(this).siblings().attr("order", "desc");
            $(this).siblings("[name='search_sort_default']").removeAttr("order");
            //按键绑定
            switch ($(this).attr("name")) {
                case "search_sort_default":
                    params["sorts"] = "default";
                    break;
                case "search_sort_sales":
                    params["sorts"] = "sales_amount";
                    if ($(this).attr("order") == "asc") {
                        $(this).attr("order", "desc");
                        $(this)[0].lastChild.className = "";
                    } else {
                        $(this).attr("order", "asc");
                        $(this)[0].lastChild.className = "sorting_bot";
                    }
                    params["sales_amount"] = $(this).attr("order");
                    break;
                case "search_sort_price":
                    params["sorts"] = "item_sales_min_price_mall";
                    if ($(this).attr("order") == "asc") {
                        $(this).attr("order", "desc");
                        $(this)[0].lastChild.className = "";
                    } else {
                        $(this).attr("order", "asc");
                        $(this)[0].lastChild.className = "sorting_bot";
                    }
                    params["item_sales_min_price_mall"] = $(this).attr("order");
                    break;
                case "search_sort_popularity":
                    params["sorts"] = "sales_score";
                    if ($(this).attr("order") == "asc") {
                        $(this).attr("order", "desc");
                        $(this)[0].lastChild.className = "";
                    } else {
                        $(this).attr("order", "asc");
                        $(this)[0].lastChild.className = "sorting_bot";
                    }
                    params["sales_score"] = $(this).attr("order");
                    break;
                case "search_sort_new":
                    params["sorts"] = "goods_create_date";
                    if ($(this).attr("order") == "asc") {
                        $(this).attr("order", "desc");
                        $(this)[0].lastChild.className = "";
                    } else {
                        $(this).attr("order", "asc");
                        $(this)[0].lastChild.className = "sorting_bot";
                    }
                    params["goods_create_date"] = $(this).attr("order");
                    break;
            }
            $(this).siblings().removeClass("sorting_foc");
            $(this).addClass("sorting_foc");
            loadGoods(categoryId,"filter");
        });

        //价格区间筛选
        $(".price-search .small-button").on("click", function () {
            //初始化参数
            delete params.minPrice;
            delete params.maxPrice;
            //按键绑定
            params.minPrice = $(".price-search .price_min").val() != "" ? $(".price-search .price_min").val() : "0";
            params.maxPrice = $(".price-search .price_max").val() != "" ? $(".price-search .price_max").val() : "*";
            loadGoods(categoryId,"filter");
            if($(".price_min").val() != "" || $(".price_max").val() != ""){
            	$(window).scrollTop(0);            	
            }
            $(this).parents(".price-menu").slideUp();
        });
    })();

    Handlebars.registerHelper({
        showPrice: function (price) {
            var result = "";
            if (!isNaN(price) && price != null && price != undefined) {
                result = $.ww.formatDecimal(price, 2)
            } else {
                result = "0.00"
            }
            return result;
        }
    });

    function template_category_list_1() {
        /*****
         <li>
         <h5 title="{{lv1_name}}" category_id="{{lv1_id}}">{{lv1_name}}</h5>
         </li>
         *****/
    }

    function template_category_list_2() {
        /*****
         <li>
         <h5 class="parentCategory" title="{{lv1_name}}" category_id="{{lv1_id}}">{{lv1_name}}</h5>
         <div class="arrow"></div>
         <ul class="pop_catetory_item">
         {{#each lv2_obj}}
         <li>
         <h5 title="{{lv2_name}}" category_id="{{lv2_id}}">{{lv2_name}}</h5>
         </li>
         {{/each}}
         </ul>
         </li>
         *****/
    }

    function template_goods_list() {
        /*****
         {{#each this}}
          <li>
   				<a href="/fsgd/{{goods_id}}.jhtml">
   					<img src="{{item_pic}}" alt="{{goods_name}}" class="goods_pic lazy">
   					<p class="goods_name">{{goods_name}}</p>
   					<div class="goods_price_box">
   						<span class="goods_price">￥{{showPrice item_saleprice}}</span>
   						<div class="btn">
   							<span>立即购买</span>
   							<i></i>
   						</div>
   					</div>
   				</a>
   			</li>
         {{/each}}
         *****/
    }
    function template_allgoodsnum() {
        /*****
          <div class="all-goods-num">全部商品{{goodsnum}}件</div>
         *****/
    }
    
    function now_choose() {
        /*****
         <div class="now_choose_tips">
			<span>分类：{{categoryName}}</span>
			<span>价格：{{minPrice}} - {{maxPriceTi}}</span>
		</div>
         *****/
    }
    
    function loadMore(data) {
    	var totalPage = Math.ceil(data.rows_total / 10);
        $("#loadmore").off("click");
        $("#loadmore").on("click", function () {
        	if($(this).text()=="没有更多商品了"){
        		return;
        	}
        	params.page++;
            if(params.page >totalPage){
        		params.page = totalPage;
        		$("#loadmore").text("已经看到最后啦~").addClass("noGoodsTip");
        		return;
        	}

            loadGoods(categoryId,"loadmore");
        });
    }


	$(".search_button_local_store").on("click",function(){
		 loadGoods(categoryId,"filter");
	})
});

$(function(){
	$(".store-tab-category").on("click",function(){
		$(".price-menu").css("display","none")
		$(".category_menu").slideDown(300);			
	})
	$(".store-tab-price").on("click",function(){
		$(".category_menu").css("display","none")
		$(".price-menu").slideDown(100);
	})
	$(".close-menu").on("click",function(){
		$(this).parent().parent().slideUp();
	})
})
