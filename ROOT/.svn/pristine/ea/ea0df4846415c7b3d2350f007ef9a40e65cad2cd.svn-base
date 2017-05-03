/**
 * @秒杀页
 * Created by zyc on 2017/2/21.
 */


var params = {page:1};
    /**
     * 收藏商品事件绑定
     * Created by WW on 2016/10/12.
     */


    /**
     * 活动倒计时
     */
    class countDown{
        constructor(){
       }
        static formatTime ($time){
            var time = {};
            time.hour = parseInt($time / (1000 * 60 * 60));
            $time = $time % (1000 * 60 * 60);
            time.minute = parseInt($time / (1000 * 60));
            $time = $time % (1000 * 60);
            time.second = parseInt($time / (1000));
            return time;
        }
        getTimeData(){
            let data={"activityType": "06", "date": (new Date()).Format("yyyy-MM-dd hh:mm:ss")}
            $.post('/fsActivity/activityInfo.ajax',data, function (data) {
                data=JSON.parse(data)
                let beginTime=data.promotionBeginDate;
                let endTime=data.promotionEndDate;
                let nowTime=data.promotionNowDate;
                let result=nowTime-endTime;
                let g=setInterval(function () {
                    nowTime=nowTime+1000
                    result=nowTime-endTime
                    if(result>0){                      //活动结束

                        $(".timeItem").html('活动已结束，期待您的下次参与!')
                            clearInterval(g)
                        }
                    else{                         //正在进行或准备开始
                        let timeNum=endTime-nowTime
                        let templateData=countDown.formatTime(timeNum)
                        if(nowTime>beginTime){    //活动正在进行
                            let template = Handlebars.compile($("#underway").html())
                            let templateHtml = template(templateData);
                            $(".timeItem").html(templateHtml)
                            }
                        else{                    //活动准备开始
                            let template = Handlebars.compile($("#prepareStart").html())
                            let templateHtml = template(templateData);
                            $(".timeItem").html(templateHtml)
                        }
                        }
                },1000)
            })
        }
    }


