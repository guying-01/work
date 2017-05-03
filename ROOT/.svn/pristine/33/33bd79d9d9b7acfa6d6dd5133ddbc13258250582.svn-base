<#include "/common/common_var_definds.ftl" />
<!DOCTYPE html>
<html lang="en">
<#--微信公众号【饭饭服务】页面-->
<head>
    <meta charset="UTF-8">
    <title>饭饭服务</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if(deviceWidth>768){
            deviceWidth=768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
    <style>
        body{
            padding: 0;
            margin: 0;
            font-family: "微软雅黑", "Microsoft Yahei", "simsun";
        }
        a{
            text-decoration: none;
        }
        .title{
            color: #fff;
            font-size: 0.36rem;
            line-height: 0.8rem;
            height: 0.8rem;
            text-align: center;
            font-weight: 600;
            background: url("${resources}/basepage/store/default/promotion/img/call_tel/title.jpg") top center no-repeat;
            background-size: 100%;
        }
        .tel_box{
            width: 5.6rem;
            min-height: 1rem;
            margin: auto;
        }
        .tel_box>img{
            display: block;
            width: 2.8rem;
            vertical-align: middle;
        }
        .tel_box .tel>a{
            display: block;
            font-size: 0.36rem;
            line-height: 0.8rem;
            height: 0.8rem;
            color: #0a0a0a;
            padding-left: 1rem;
        }
        .tel_box .tel>a>img{
            vertical-align: middle;
            width: 1.5rem;
            padding-bottom: 0.1rem;
        }
        .tel_box .tel>a>span{
            display: inline-block;
            width: 3rem;
        }
        .ask{
            padding-top: 0.3rem;
        }
        .clo{
            font-size: 0.3rem;
            line-height: 0.4rem;
            height: 0.4rem;
            background: #b5191a;
            color: #fff;
            padding: 0.2rem;
            width: 3rem;
            margin: auto;
            text-align: center;
            border-radius: 0.1rem;
        }
        .logo{
            display: block;
            width: 3rem;
            margin: auto;
            padding-bottom: 0.2rem;
            padding-top: 0.2rem;
        }
    </style>
</head>
<body>
<div class="title"></div>
<div class="ask tel_box">
    <img src="${resources}/basepage/store/default/promotion/img/call_tel/ask_tel.png">
    <div class="tel"><a href="tel:0411-39883978"><span>0411-39883978</span><img src="${resources}/basepage/store/default/promotion/img/call_tel/bt_call.png" /></a></div>
    <div class="tel"><a href="tel:0411-39883987"><span>0411-39883987</span><img src="${resources}/basepage/store/default/promotion/img/call_tel/bt_call.png" /></a></div>
</div>
<div class="complain tel_box">
    <img src="${resources}/basepage/store/default/promotion/img/call_tel/complain_tel.png">
    <div class="tel"><a href="tel:0411-39663968"><span>0411-39663968</span><img src="${resources}/basepage/store/default/promotion/img/call_tel/bt_call.png" /></a></div>
</div>
<div class="emergency tel_box">
    <img src="${resources}/basepage/store/default/promotion/img/call_tel/emergency_tel.png">
    <div class="tel"><a href="tel:13504091008"><span>13504091008</span><img src="${resources}/basepage/store/default/promotion/img/call_tel/bt_call.png" /></a></div>
</div>
<img class="logo" src="${resources}/basepage/store/default/common_img/logo.png">
<div class="clo" onclick="clo()">点此返回公众号</div>
<script>
    function clo() {
        WeixinJSBridge.invoke('closeWindow', {}, function (res) {
        });
    }
</script>
</body>
</html>