// JavaScript Document
var now ;
$(document).ready(function () {
    var isOver = 0, num = $('.banner ul.min-banner>li').length;

    $("ul.tabT li").click(function () {
        $(this).addClass("on")
            .siblings().removeClass("on");
        $(this)
    });


    $('.banner').on('toggle', function (e, idx) {

        $('.min-banner li').eq(idx).show().siblings().hide()

    }).on('click', ' .banner_num li.btnListOn', function (e) {

        $(e.delegateTarget).trigger('toggle', [$(this).index()])

    }).on('mouseover', 'ul.min-banner,ul.banner_num', function () {

        isOver = 1;

    }).on('mouseout', 'ul.min-banner,ul.banner_num', function () {

        isOver = 0;

    }).trigger('toggle', [0]);

    var count = 0;

    setInterval(function () {

//        console.info('count1===',count)

        if (isOver) {

            return;
        }

//        console.info('count2===',count)

        var _c = count++ % num;

        $('.banner').trigger('toggle', _c);

        //_c > 0 && (count = 0);

    }, 1000);

    var startTime = new Date();
//    var d = startTime.getHours();
//    $(".seckillTitle").find("li").removeClass("on");
//    switch (true) {
//        case d >= 0 && d < 4:
//            $($(".seckillTitle").find("li")[0]).addClass("on");
//            ChangeDiv('0','JKDiva_',6);
//            break;
//        case d >= 4 && d < 8:
//            $($(".seckillTitle").find("li")[1]).addClass("on");
//            ChangeDiv('1','JKDiva_',6);
//            break;
//        case d >= 8 && d < 12:
//            $($(".seckillTitle").find("li")[2]).addClass("on");
//            ChangeDiv('2','JKDiva_',6);
//            break;
//        case d >= 12 && d < 16:
//            $($(".seckillTitle").find("li")[3]).addClass("on");
//            ChangeDiv('3','JKDiva_',6);
//            break;
//        case d >= 16 && d < 20:
//            $($(".seckillTitle").find("li")[4]).addClass("on");
//            ChangeDiv('4','JKDiva_',6);
//            break;
//        case d >= 20 && d < 24:
//            $($(".seckillTitle").find("li")[5]).addClass("on");
//            ChangeDiv('5','JKDiva_',6);
//            break;
//    }

    window.setInterval("time()", 1000);


    var addTimer = function () {
        var list = [],
            interval;

        return function (obj,startTime,endTime,nowTime) {
        	now = nowTime;
            if (!interval)
                interval = setInterval(go, 1000);
            list.push({ ele: $(obj),startTime:startTime,endTime:endTime});
        }

        function go() {
            for (var i = 0; i < list.length; i++) {
            	 var time;
                 var nowTime = new Date((new Date(now)).getTime()+1000);
                 now = nowTime;
//                var nowTime =new Date();
                if(nowTime<list[i].startTime){
                    time=list[i].startTime-nowTime;
                }else if(nowTime>=list[i].startTime&&nowTime<=list[i].endTime){
                    time=list[i].endTime-nowTime;
                }else {
                    time=nowTime;
                }
//                console.info('count3===',time);
                list[i].ele.html(getTimerString(time ? time -= 1 : 0,list[i].startTime,list[i].endTime,nowTime));
                if (!time)
                    list.splice(i--, 1);
            }
        }

        function getTimerString(time,startTime,endTime,nowTime) {
        		d = Math.floor(time / (1000 * 60 * 60 * 24))
                h = Math.floor(time / (1000 * 60 * 60)) % 24;
                m = Math.floor(time / (1000 * 60)) % 60;
                s = Math.floor(time / 1000) % 60;
                //var nD = Math.floor(nMS / (1000 * 60 * 60 * 24));
                //var nH = Math.floor(nMS / (1000 * 60 * 60)) % 24;
                //var nM = Math.floor(nMS / (1000 * 60)) % 60;
                //var nS = Math.floor(nMS / 1000) % 60;
            if (time>0){
                if(nowTime<startTime){
                    return "剩余 "+d+"天" +h + "时" + m + "分" + s+"秒开始";
                }else if(nowTime>=startTime&&nowTime<=endTime){
                    return "剩余 "+d+"天" +h + "时" + m + "分" + s+"秒结束";
                }else if(nowTime>endTime){
                    return "秒杀已结束!";
                }
            }
            else return "";
        }
    } ();

    $(".promotionTimer").each(function () {
        var startTime=$(this).attr("data-startTime");
        startTime = startTime.replace(/-/g,"/");
        var startTime0 = new Date(startTime);
        var endTime=$(this).attr("data-endTime");
        endTime = endTime.replace(/-/g,"/");
        var endTime0 = new Date(endTime);
        var nowTime=$(this).attr("data-nowTime")+":00";
        nowTime = nowTime.replace(/-/g,"/");
        var nowTime0 = new Date(nowTime);
        addTimer(this,startTime0,endTime0,nowTime0);
      
        var nowTime =nowTime0;
         if(nowTime>endTime){
             if($(this).hasClass("on")){
                 $(this).removeClass("on");
             }
        }else{
             if(!$(this).hasClass("on")){
                 $(this).addClass("on");
             }
         }
    })



    var width=$(".banner_num").children().first().css("width");
    var marginWidth=$(".banner_num").children().first().css("margin-left");
    var paddingWidth=$(".banner_num").css("padding-left");
    var num=$(".banner_num").children().length;
    var sumWidth=(parseInt(width)+parseInt(marginWidth)*2)*parseInt(num)+(parseInt(paddingWidth)*2);
    $(".banner_num").css("margin-left",-sumWidth/2);
    $($(".title5")[0]).click();

    //隐藏活动专区
    promotiondisplay();
})
function promotiondisplay(){
	$("[name='promotiondisplay']").each(function(e){
		if($(this).find("ul li").length<1){
			$(this).css("display","none");
			$("#promotionTabRight"+$(this).attr("data_promotionType")+"").css("display","none");
//			$(".active-tool-top").css("height",'auto');
			
		}
	});
}
//function timeOne() {
//    var html = $("#timer").html();
//    $(".promotionTimer").each(function () {
//        var startTime=$(this).attr("data-startTime");
//        var endTime=$(this).attr("data-endTime");
//        var nowTime =new Date();
//        if(nowTime<startTime){
//            var data = GetRTime(startTime);
//            var template = Handlebars.compile(html);
//            var strHtml = template(data);
//            var htmlStr = "离秒杀开始还有: " + strHtml;
//            $(this).html(htmlStr);
//        }else if(nowTime>=startTime&&nowTime<=endTime){
//            var data = GetRTime();
//            var template = Handlebars.compile(html);
//            var strHtml = template(data);
//            var htmlStr = "离秒杀结束还有: " + strHtml;
//            $(this).html(htmlStr);
//        }else if(nowTime>endTime){
//            var htmlStr = "秒杀已结束! ";
//            $(this).html(htmlStr);
//        }
//    })
//}


function time() {
    var html = $("#timer").html();
    var startTime = new Date();
    //var startTime = new Date();
    //startTime.setFullYear(2016, 1, 25);
    //startTime.setHours(4);
    //startTime.setMinutes(59);
    //startTime.setSeconds(59);
    //startTime.setMilliseconds(999);
    var d = startTime.getHours();
    switch (true) {
        case d >= 0 && d < 4:
            startTime.setHours(3);
            startTime.setMinutes(59);
            startTime.setSeconds(59);
            var startTime4 = startTime.getTime();
            var data = GetRTime(startTime4);
            var template = Handlebars.compile(html);
            var strHtml = template(data);
            reTitle(0, strHtml);
            break;
        case d >= 4 && d < 8:
            startTime.setHours(7);
            startTime.setMinutes(59);
            startTime.setSeconds(59);
            var startTime8 = startTime.getTime();
            var data = GetRTime(startTime8);
            var template = Handlebars.compile(html);
            var strHtml = template(data);
            reTitle(1, strHtml);
            break;
        case d >= 8 && d < 12:
            startTime.setHours(11);
            startTime.setMinutes(59);
            startTime.setSeconds(59);
            var startTime12 = startTime.getTime();
            var data = GetRTime(startTime12);
            var template = Handlebars.compile(html);
            var strHtml = template(data);
            reTitle(2, strHtml);
            break;
        case d >= 12 && d < 16:
            startTime.setHours(15);
            startTime.setMinutes(59);
            startTime.setSeconds(59);
            var startTime16 = startTime.getTime();
            var data = GetRTime(startTime16);
            var template = Handlebars.compile(html);
            var strHtml = template(data);
            reTitle(3, strHtml);
            break;
        case d >= 16 && d < 20:
            startTime.setHours(19);
            startTime.setMinutes(59);
            startTime.setSeconds(59);
            var startTime20 = startTime.getTime();
            var data = GetRTime(startTime20);
            var template = Handlebars.compile(html);
            var strHtml = template(data);
            reTitle(4, strHtml);
            break;
        case d >= 20 && d < 24:
            startTime.setHours(23);
            startTime.setMinutes(59);
            startTime.setSeconds(59);
            var startTime23 = startTime.getTime();
            var data = GetRTime(startTime23);
            var template = Handlebars.compile(html);
            var strHtml = template(data);
            reTitle(5, strHtml);
            break;
    }
}

function reTitle(i, html) {
    $(".active-minute").css("display", "none");
    $(".seckillTitle").find("li").each(function (n, value) {
        if (n == i) {
            $(this).find(".active-title").html("抢购中");
            $(this).find(".active-minute").css("display", "block");
            $(this).find(".active-timer").html(html);
            //$(this).addClass("on");
        } else if (n < i) {
            var len=$("JKDiva_"+i).find(".on").length;
            if(len>0){
                $(this).find(".active-title").html("抢购中");
            }else {
                $(this).find(".active-title").html("开始抢购");
            }
        }
    })
}


function GetRTime(time) {
    var NowTime = new Date();
    var nMS = time - NowTime.getTime();
    var nD = Math.floor(nMS / (1000 * 60 * 60 * 24));
    var nH = Math.floor(nMS / (1000 * 60 * 60)) % 24;
    var nM = Math.floor(nMS / (1000 * 60)) % 60;
    var nS = Math.floor(nMS / 1000) % 60;
    var data = {};
    if (nS > 0) {
        data.sec = nS;
    } else {
        data.sec = 0;
    }
    if (nM > 0) {
        data.mini = nM;
    } else {
        data.mini = 0;
    }
    if (nH > 0) {
        data.hour = nH;
    } else {
        data.hour = 0;
    }
    if (nD > 0) {
        data.day = nD;
    } else {
        data.day = 0;
    }
    data.dataEndTime = time;
    return data;

}

//function ChangeDiv(divId, divName, zDivCount) {
//    for (var i = 0; i < zDivCount; i++) {
//        document.getElementById(divName + i).style.display = "none";
//    }
//    document.getElementById(divName + divId).style.display = "block";
//}

function ChangeTab(divId, divName) {
	
	var spikePurchase = $("[name='spikePurchase']");
	for (var i = 0; i < spikePurchase.length; i++) {
		$(spikePurchase[i]).css("display","none");
    }
	$("#"+divName+divId+"").css("display","block");
}
