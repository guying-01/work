// JavaScript Document
var now ;
$(document).ready(function () {

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
        var startTime=$(this).attr("data-startTime")+":00";
        startTime = startTime.replace(/-/g,"/");
        var startTime0 = new Date(startTime);
        var endTime=$(this).attr("data-endTime")+":00";
        endTime = endTime.replace(/-/g,"/");
        var endTime0 = new Date(endTime);
        var nowTime=$(this).attr("data-nowTime")+":00";
        nowTime = nowTime.replace(/-/g,"/");
        var nowTime0 = new Date(nowTime);
        addTimer(this,startTime0,endTime0,nowTime0);
    })



})


