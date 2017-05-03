<#include "/common/common_var_definds.ftl" />
<#macro render>
<script src="${resources}/js/common/hover.js"></script>
<script src="${resources}/js/common/hideshow.js"></script>
<script type="text/javascript">	
	var d,h,m,s,dstr,hstr,mstr,sstr,timestr;
	var etime=5;
	$(document).ready(function () {
		if(etime!=-1){
			window.setInterval('timer()',1000);
		}
		showTime();
		clearLocalData();
	});
function timer(){
if(etime > -1){
	var itime=0;
    d = Math.floor(etime / (3600*24));
    itime = etime - d*3600*24;
	s = Math.floor(itime % 60);	
	s <0? s = 0 : s = s;
	s.toString().length < 2 ? sstr = s.toString() : sstr = s;	
	timestr = sstr ;
	$('#timekeep').html(timestr);
	
		etime = etime - 1;
	}else{
		timestr =00 + "天" + 00 + ":" +00 + ":" + 00;
	}
}

	//设定倒数秒数  
	var t = 7;  
	//显示倒数秒数  
	function showTime(){  
	    t -= 1;   
	    if(t==0){  
	        //location.href='${ctx}/index.jhtml';  
	        location.href='${ctx}/order/toOrderList.jhtml?';
	    }  
	    //每秒执行一次,showTime()  
	    setTimeout("showTime()",1000);  
	}
	function clearLocalData(){
		localStorage.browsePage='';
		localStorage.index='';
	}
</script>
</#macro>