	$(document).ready(function(){
		if(IS_AUTH_Y == isPwProtectAuth){
			divDisplay_init("isPwProtectAuth", 2, IS_AUTH_Y)
		}
		if(IS_AUTH_Y == isMailAuth){
			divDisplay_init("isMailAuth", 2, IS_AUTH_Y)
		}
		if(IS_AUTH_Y == isMobileAuth){
			divDisplay_init("isMobileAuth", 2, IS_AUTH_Y)
		}
		if(PWD_STRENGTH_TWO == pwStrength){
			divDisplay_init("isPwdStrength", 3, PWD_STRENGTH_TWO);
		}else if(parseInt(PWD_STRENGTH_THREE) <= parseInt(pwStrength)){
			divDisplay_init("isPwdStrength", 3, PWD_STRENGTH_THREE);
		}
/*		var ip=$("#adressIP").val();
		callService("/member/findMemberAddress.ajax",{ip:ip},{callSuccess:function(result){
		
			var data1= eval(result);
			if(data1!=null && data1.data!=null && data1.data.region !=null&&data1.data.region !=""&&data1.data.city !=null&&data1.data.city !=""){
				$("#ipAdress").html("上次登录地点："+data1.data.region +data1.data.city)
			}else{
				$("#ipAdress").html("上次登录地点：未知")
			}
			
		}})*/
	});
	
	function divDisplay_init(divName, totalVal, currentVal){
		for(var i=1; i<= totalVal; i++){
			if(i == currentVal){
				$("#"+divName+i).css("display","inherit");
			}else{
				$("#"+divName+i).css("display","none");
			}
		}
	}
