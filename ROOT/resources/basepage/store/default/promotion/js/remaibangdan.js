

function template_activity01() {
        /*****
         {{#each this}}
         <div class="eachGood">
         <a href="/fsgd/{{goods_id}}.jhtml" class="eachGoodA"></a>
   				<div class="goodPic"><img src="{{item_pic}}"/></div>
   				<p class="goodTitle">NO.{{#showIndex @index}}{{/showIndex}}&nbsp;{{goods_name}}</p>
   				<span class="goodTip">{{goods_description}}</span>
   				<span class="nowPrice"><em>￥{{#showPrice item_saleprice}}{{/showPrice}}</em><a href="javascript:;">马上抢</a></span>

   			</div>
         {{/each}}
         *****/
    }
    /*索引+1的Helper*/
    Handlebars.registerHelper('increases', function(person) {
        return ++person;
    });
var template_activity01 = cutTemplateWrap(template_activity01); //解析activity模板

request('307_00000000000000237_gic');  //这里是初始化界面


function select(i){   //这里是点击切换数据部分
    var postData=$(i).attr("lv1");
    if(postData==''){
        location.href='/others/comingSoon_3th.jhtml'
    }   //如果没有接口跳转页面
    else{
        request(postData)
    }
}

function request(postData){   //这里是不同接口切换部分
    var formatData = {"pageRows":12,"pageStart":1,"filterQueryMap":{"item_category_id_1":[postData],"item_sales_min_price_mall":["[0 TO *]"]},"searchText":"","sorts":{"sales_amount":"desc"},"minPrice":"0","maxPrice":"*","queryOption":{"catCondItems":true,"condItems":true,"sort":true,"price":false},"queryData":{}};
    var formatDataStr = {"condition": JSON.stringify(formatData)};  //这里是请求部分的data格式
    $.ajax({
        type: 'post',
        url: '/fsajax/goodsSearch.ajax',
        dataType: 'json',
        data :formatDataStr,
        success: function (data) {
            //data = JSON.parse(data.replace(/\t/g, ""));
            var template = Handlebars.compile(template_activity01);
            var content = template(data.data.dataList);
            $('.goodsList').html(content);
        }
    });
}

Handlebars.registerHelper({
    showPrice: function (data) {
        if (data != undefined && !isNaN(data)) {
            return $.ww.formatDecimal(data, 2);
        } else {
            return "0.00";
        }
    },
    showIndex:function(index){
        return ++index;
    }
});


