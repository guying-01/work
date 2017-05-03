// JavaScript Document
!function(){
	laydate.skin('yalan');
	laydate({elem: '#demo'});
}();
//初始化企业营业执照营业期限
var businessLicenceStart = {
    elem: '#businessLicenceStart',
    format: 'YYYY-MM-DD',
    //min:  '1000-06-16', //设定最小日期为当前日期
//    min: laydate.now(), //最大日期
    istime: false,
    istoday: false,
    choose: function(datas){
    	businessLicenceEnd.min = datas;//开始日期选好后，结束日期的最小日期就是开始日期
    },
    delFunc:function(opts)
    {
    	businessLicenceEnd.min=opts.min;
    }
};
var businessLicenceEnd = {
    elem: '#businessLicenceEnd',
    format: 'YYYY-MM-DD',
    //min: '1000-06-16',
    istime: false,
    istoday: false,
    choose: function(datas){
    	businessLicenceStart.max = datas;
    },delFunc:function(opts){
    	businessLicenceStart.max=opts.max;
    }
};
laydate(businessLicenceStart);
laydate(businessLicenceEnd);

//组织机构代码证有效期
var organizationStart = {
	    elem: '#organizationStart',
	    format: 'YYYY-MM-DD',
	    istime: false,
	    istoday: false,
	    choose: function(datas){
	    	organizationEnd.min = datas;
	    },
	    delFunc:function(opts)
	    {
	    	organizationEnd.min=opts.min;
	    }
	};
	var organizationEnd = {
	    elem: '#organizationEnd',
	    format: 'YYYY-MM-DD',
	    istime: false,
	    istoday: false,
	    choose: function(datas){
	    	organizationStart.max = datas;
	    },delFunc:function(opts){
	    	organizationStart.max=opts.max;
	    }
	};
laydate(organizationStart);
laydate(organizationEnd);

//税务登记证发证日期
var	taxRegistrationStart = {
    elem: '#taxRegistrationStart',
    format: 'YYYY-MM-DD',
    istime: false,
    istoday: false,
};
laydate(taxRegistrationStart);
function daimayunxing(start,end)
{
	var daima= "J"+start+" = {"+
    "elem: '#"+start+"',"+
    "format: 'YYYY-MM-DD',"+
    "istime: false,"+
    "istoday: false,"+
    "choose: function(datas){"+
    	"J"+end+".min = datas;"+
    "},"+
    "delFunc:function(opts)"+
    "{"+
    	"J"+end+".min=opts.min;"+
    "}"+
	"};"+
	"J"+end+" = {"+
	"elem: '#"+end+"',"+
	"format: 'YYYY-MM-DD',"+
	"istime: false,"+
	"istoday: false,"+
	"choose: function(datas){"+
		"J"+start+".max = datas;"+
	"},delFunc:function(opts){"+
		"J"+start+".max=opts.max;"+
	"}"+
	"};"+
	"laydate(J"+start+");"+
	"laydate(J"+end+");"
	if(window.attachEvent)
	{
		window.eval(daima);
	}else{
	var script=$(document.createElement('script'));
	script.attr("type","text/javascript");
	script.text(daima);
	$("head").append(script);
	}
}
daimayunxing("start3","end3");
daimayunxing("start4","end4");
daimayunxing("start5","end5");
daimayunxing("start6","end6");
daimayunxing("start7","end7");
daimayunxing("start8","end8");
daimayunxing("start9","end9");
daimayunxing("start10","end10");
