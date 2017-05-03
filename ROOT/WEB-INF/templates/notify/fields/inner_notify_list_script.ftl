<#include "/common/common_var_definds.ftl" />
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<#macro render >
    <#escape x as x?html>
        <@scrollTop.render />
    <script src="${resources}/js/common/page.js"></script>
    <script src="${resources}/js/common/tab.js"></script>
    <script type="text/javascript" src="${resources}/js/lib/jquery/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${resources}/js/lib/jquery/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${resources}/js/lib/jquery/dt-operation-commons.js"></script>
    <script type="text/javascript" src="${resources}/js/lib/jquery/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${resources}/js/lib/jquery/dt-operation-commons.js"></script>
    <script type="text/javascript" src="${resources}/js/lib/handlebars/handlebars-v2.0.0.js"></script>
    <script type="text/javascript" src="${resources}/js/common/pager.js"></script>
    <script>

        var mapping={<#if dicList?exists><#list dicList as dic>'${dic.code}':'${dic.name}'<#if dic_index+1!=dicList?size>,</#if></#list></#if>};
        $(function() {
            if(!localStorage.index){
                localStorage.index=0;
                changeBtnState("");
            }
            else{
                var num=JSON.parse(localStorage.index);
                switch (num){
                    case 0:changeBtnState('');
                        break;
                    case 1:changeBtnState('00');
                        break;
                    case 2:changeBtnState('20');
                        break;
                    case 3:changeBtnState('30');
                        break;
                }

            }
//            }
            $('.messageCenter').on('click','.message',function () {
                var messageId=$(this).attr("message-id");
                $(this).removeClass('unread').addClass('read');
                $.post('/notify/statusChange.ajax',{id:messageId},function (data) {
                    if(data==1){
                        $.post('/notify/findThreeNotifyNum.ajax',{templateType:stateNum},function(data){
                             $("#monthMsg3").html(data.content)
                        })

                    }
                })
            })


//            直接去看看到对应的页面
            $('.messageCenter').on('click', 'div[templateType=30]', function () {
                console.log(111)
            })
   })

        //    点击选项卡切换状态开始
        var stateNum;
        var index;
        function changeBtnState(codeNum,ele,num){
            switch (codeNum){
                case '':index=0;
                    break;
                case '00':index=1;
                    break;
                case '20':index=2;
                    break;
                case '30':index=3;
                    break;
            }
            localStorage.index=JSON.stringify(index);
            $('.message-gy li').removeClass('on').eq(index).addClass('on')
            stateNum=codeNum;
            if(!num){
                num=1
            }
            //获取未读条数Url
            var requestUrl="/notify/findThreeNotifyNum.ajax";
            var param={templateType:codeNum,
                length:10
            }
            var requestUrlMes="/notify/findNotifyList.ajax";
            var paramMes={
                "params[templateType]":codeNum,
                "length":10*num
            }
            var requestUrlCode="/notify/statusChangeByCode.ajax";
            var paramCode={
                code:codeNum,
                "length":10
            };
            var requestUrlFindMes="/notify/findMessage.ajax";
            var paramFindMes={
                "templateType":codeNum
            }

            callService(requestUrlMes,paramMes,{"async" : false,
                callSuccess:function(data){
                    if(data.data.length == 0){
                        $("#noneOrder").show()
                    }
                    else{
                        $("#noneOrder").hide()
                    }
                    callService(requestUrl,param,{"async" : false,
                        callSuccess:function(data){
                            $("#monthMsg3").html(data.content)

                        }})
                    $("#allReadCode").on("click", function () {
                        callService(requestUrlCode,paramCode,{"async" : false,
                            callSuccess:function(data){
                                location.reload()
                            }})
                    });
                    var dataArr = [];
//                数据处理
                    data.data.forEach(function (item,index) {
                        dataArr.push(item)
                    });
                    Handlebars.registerHelper("messageContent", function (i) {
                        if(i){
                            return new Handlebars.SafeString(i)
                        }
                    })
                    Handlebars.registerHelper("statu", function (i) {
                        if(i.messageState=='10'){
                            return new Handlebars.SafeString('unread')
                        }
                        else if(i.messageState=='20'){
                            return new Handlebars.SafeString('read')
                        }
                    })
                    Handlebars.registerHelper("assignMore", function (i) {
                        var str="<div class='assignMore' onclick='assignMore()'>加载更多</div>";
                        if(i){
                            if(i.data.root.length<10){
                                return
                            }
                            else{
                                return  new Handlebars.SafeString(str)

                            }
                        }
                        else{
                            return
                        }
                    })
                    var orderListTmp = Handlebars.compile($('#messageCenter').html());
                    // 装载数据
                    var orderListHtml = orderListTmp(dataArr)
                    // 插入基础html
                    $(".messageCenter").html(orderListHtml);
                    if(num*10>dataArr.length){
                        $(".assignMore").html("没有更多了").attr("onclick","").addClass('no_more_mes');
                    }

                }})
        }

        //    点击选项卡切换状态结束
        var num=1
        function assignMore(){
            num++
            changeBtnState(stateNum,"",num)
        }
    </script>

    </#escape>

</#macro>
