/**
 * 验证专用JS
 */
(function($) {
	$.validator.addMethod("timeval", function(value, element) {
		var check = false;
		var re = /^(([0-1][0-9])|([2][0-3]))([0-5][0-9])$/;
		if(value==null&&value==""){
			check=true;
		}else{
			if( re.test(value)) {
				check=true;
			} else {
				check =false;
			}
		}
		return this.optional(element) || check;
	}, "请输入正确时间格式");
	 
	$.validator.addMethod("maxWords", function(value, element, params) {
		return this.optional(element) || stripHtml(value).match(/\b\w+\b/g).length <= params;
	}, jQuery.validator.format("最多只能输入{0}个字。"));
	
	$.validator.addMethod("minWords", function(value, element, params) {
		return this.optional(element) || stripHtml(value).match(/\b\w+\b/g).length >= params;
	}, jQuery.validator.format("最少只能输入{0}个字。"));
	
	$.validator.addMethod("alphanumeric", function(value, element) {
		return this.optional(element) || /^\w+$/i.test(value);
	}, "英文字母，数字或者下划线");
	
	$.validator.addMethod("lettersonly", function(value, element) {
		return this.optional(element) || /^[a-z]+$/i.test(value);
	}, "英文字母");
	
	$.validator.addMethod("nowhitespace", function(value, element) {
		return this.optional(element) || /^\S+$/i.test(value);
	}, "非空白字符");
 
	$.validator.addMethod("integer", function(value, element) {
		return this.optional(element) || /^-?\d+$/.test(value);
	}, "整数");
	
	$.validator.addMethod("time", function(value, element) {
		return this.optional(element) || /^([01]\d|2[0-3])(:[0-5]\d){1,2}$/.test(value);
	}, "请输入时间, 00:00 到 23:59");
	
	$.validator.addMethod("ipv4", function(value, element, param) {
		return this.optional(element) || /^(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)$/i.test(value);
	}, "请输入IP v4 格式");
	
	$.validator.addMethod("ipv6", function(value, element, param) {
		return this.optional(element) || /^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$/i.test(value);
	}, "请输入IP v6 格式");
	
	//使用正则表达式校验
	$.validator.addMethod("pattern", function(value, element, param) {
		if (this.optional(element)) {
			return true;
		}
		if (typeof param === 'string') {
			param = new RegExp('^(?:' + param + ')$');
		}
		return param.test(value);
	}, "格式不正确。");
	
	jQuery.validator.addMethod("extension", function(value, element, param) {
		param = typeof param === "string" ? param.replace(/,/g, '|') : "png|jpe?g|gif";
		return this.optional(element) || value.match(new RegExp(".(" + param + ")$", "i"));
	}, $.validator.format("请输入正确类型的文件（png，jpg/jpeg，gif）"));
	
	// 年龄验证
	$.validator.addMethod("age", function(value, element, params) {
		return this.optional(element) || (/^\d{1,2}$/).test(value);
	}, "请正确填写年龄");
	
	// 手机号码验证
	$.validator.addMethod("mobile", function(value, element, params) {
		return this.optional(element) || (/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/).test(value);
	}, "请正确填写手机号码");
	
	// 电话号码验证
	$.validator.addMethod("phone", function(value, element, params) {
		return this.optional(element) || ( /^(?:(?:0\d{2,3})-)?(?:\d{7,8})(-(?:\d{3,}))?$/).test(value);
	}, "请正确输入手机号码，例如XXXX-XXXXXXXX-XXX");
	$.validator.addMethod("checkNumber",function(value,element,params){
	    return this.optional(element) || (/^[0-9]*$/).test(value);
	},"只能输入数字")
	$.validator.addMethod("checkAllNumber",function(value,element,params){
	    return this.optional(element) || (/^([0-9])*$|^([0-9]+\.?(\d){2})*$/).test(value);
	},"");
	
	$.validator.addMethod("isZipCode", function(value, element,params) {   
	    var tel = /^[0-9]{6}$/;
	    return this.optional(element) || (tel.test(value));
	}, "请正确填写您的邮政编码");
	$.validator.addMethod("webUrl", function(value, element, params) {
		var url=/^(https?|ftp):\/\/(((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)*(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i;
		return this.optional(element) || url.test(value);
	}, "请正确填写您的网址");
	
	//身份证号码
	$.validator.addMethod("isIdCardNo", function (value, element,params) {
	    return this.optional(element) || isIdCardNo(value);
	}, "请正确输入您的身份证号码");

	//过期时间验证
	$.validator.addMethod("checkBegDate", function(value) {
		if(daysBetween(value,fomateDate(new Date(), 'YYYY-MM-DD'))>0) return false ;
		return true ;
	}, "选择时间已过期！");
	//过期时间验证
	$.validator.addMethod("checkEndDate", function(value) {
		if(daysBetween(value,fomateDate(new Date(), 'YYYY-MM-DD'))<=0) return false ;
		return true ;
	}, "选择时间已过期！");
	//校验货币的
	$.validator.addMethod("money", function(value, element,params) {
		var opts={noZero:true, integer:20, fraction:'2'};//不允许为0/整数位/小数位数
		if(params && $.type(params)==='object'){
			$.extend(opts, params);
		}
		var pattern='^\\d{1,'+opts.integer+'}(?:\\.\\d{1,'+opts.fraction+'})?$';
		var money=new RegExp(pattern);
		
		var result=this.optional(element) || money.test(value);
		if(result && opts.noZero){
			var zeroReg=new RegExp('^0+(\\.0+)?$');
			var result2=zeroReg.test(value);
			if(result2){
				result=false;
			}
		}
		return result;
	}, "请输入正确金额");
	//校验两个日期范围必填的，params是另一个范围的对象
	$.validator.addMethod("requiredDate", function(value, element,params) {
		return value.length>0&&$(params).val().length>0 ;
	}, "请输入日期范围");
	//校验隐藏域中必须有值，params是隐藏于的对象，例如是否上传的校验
	$.validator.addMethod("requiredHidden", function(value, element,params) {
		return $(params).val().length>0
	}, "该项目不可为空");
	
	//校验当前使用积分不能大于可使用积分
	$.validator.addMethod("points22", function(value, element, params) {
		return value<=params ;
	}, "本次使用积分不能大于平台可用积分");
	
	//复合校验方法(or的关系)
	$.validator.addMethod("complexValidOr", function(value, element,params) {
		if(params && $.type(params)==='array'){
			//参数必须为数组
			var tempMethod;
			var paramItem;
			var tempParams;
			var result=false;
			var tempResult=true;
			for(var i in params){
				paramItem=params[i];
				tempParam=null;
				if($.type(paramItem)==='string'){
					//只定义了校验方法名
					tempMethod=$.validator.methods[paramItem];
				} else if($.type(paramItem)==='object'){
					//定义了校验方法对象，结构为{name,params}
					tempMethod=$.validator.methods[paramItem.name];
					tempParams=paramItem.params;
				}
				
				if(tempMethod){
					tempResult=tempMethod.call(this,value,element,tempParams);
					
					if(tempResult){
						//校验成功
						result=true;
						return result;
					}
				}
			}
		}
		return false;//默认校验失败
	}, "该项目不符合指定格式");
})(jQuery);

function stripHtml(value) {
	// remove html tags and space chars
	return value.replace(/<.[^<>]*?>/g, ' ').replace(/&nbsp;|&#160;/gi, ' ')
	// remove punctuation
	.replace(/[.(),;:!?%#$'"_+=\/\-]*/g,'');
}
		
//增加身份证验证
function isIdCardNo(num) {
    var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
    var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
    var varArray = new Array();
    var intValue;
    var lngProduct = 0;
    var intCheckDigit;
    var intStrLen = num.length;
    var idNumber = num;
    // initialize
    if ((intStrLen != 15) && (intStrLen != 18)) {
        return false;
    }
    // check and set value
    for (i = 0; i < intStrLen; i++) {
        varArray[i] = idNumber.charAt(i);
        if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
            return false;
        } else if (i < 17) {
            varArray[i] = varArray[i] * factorArr[i];
        }
    }
    if (intStrLen == 18) {
        //check date
        var date8 = idNumber.substring(6, 14);
        if (isDate8(date8) == false) {
            return false;
        }
        // calculate the sum of the products
        for (i = 0; i < 17; i++) {
            lngProduct = lngProduct + varArray[i];
        }
        // calculate the check digit
        intCheckDigit = parityBit[lngProduct % 11];
        // check last digit
        if (varArray[17] != intCheckDigit) {
            return false;
        }
    }
    else {        //length is 15
        //check date
        var date6 = idNumber.substring(6, 12);
        if (isDate6(date6) == false) {
            return false;
        }
    }
    return true;
}
function isDate6(sDate) {
    if (!/^[0-9]{6}$/.test(sDate)) {
        return false;
    }
    var year, month, day;
    year = sDate.substring(0, 4);
    month = sDate.substring(4, 6);
    if (year < 1700 || year > 2500) return false
    if (month < 1 || month > 12) return false
    return true
}
/**
* 判断是否为“YYYYMMDD”式的时期
*
*/
function isDate8(sDate) {
    if (!/^[0-9]{8}$/.test(sDate)) {
        return false;
    }
    var year, month, day;
    year = sDate.substring(0, 4);
    month = sDate.substring(4, 6);
    day = sDate.substring(6, 8);
    var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if (year < 1700 || year > 2500) return false
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1] = 29;
    if (month < 1 || month > 12) return false
    if (day < 1 || day > iaMonthDays[month - 1]) return false
    return true
}

//| 求两个时间的天数差 日期格式为 YYYY-MM-dd
//+---------------------------------------------------
function daysBetween(DateOne,DateTwo)
{
	var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));
	var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);
	var OneYear = DateOne.substring(0,DateOne.indexOf ('-'));
	
	var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));
	var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);
	var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));
	
	var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000);
	return cha;
}
//自定义当前日期的格式 如：YYYY-MM-DD
//调用方式：fomateDate(new Date(), 'YYYY-MM-DD')
function fomateDate(oDate, sFomate, bZone)
{
	sFomate = sFomate.replace("YYYY", oDate.getFullYear());
	sFomate = sFomate.replace("YY", String(oDate.getFullYear()).substr(2))
	sFomate = sFomate.replace("MM", oDate.getMonth()+1)
	sFomate = sFomate.replace("DD", oDate.getDate());
	sFomate = sFomate.replace("dd", oDate.getDate());
	sFomate = sFomate.replace("hh", oDate.getHours());
	sFomate = sFomate.replace("mm", oDate.getMinutes());
	sFomate = sFomate.replace("ss", oDate.getSeconds());
	if (bZone) sFomate = sFomate.replace(/\b(\d)\b/g, '0$1');
	return sFomate;
}