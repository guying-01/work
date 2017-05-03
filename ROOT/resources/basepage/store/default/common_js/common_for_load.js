/**
 * 动态数据绑定通用函数
 * Created by WW on 2016/08/25.
 */

/**
 * Handlebars模板编译
 * Params：
 *  template:模板
 *  data:数据
 * Return:
 *  html:返回编译加载完成的html片段
 * Created by WW on 2016/08/25.
 */
var loadHandlebarsTemplate = function (template, data) {
    var template = Handlebars.compile(template);
    var html = template(data == null ? {} : data);
    return html;
};

/**
 * ajax数据请求
 * Params：
 *  url:模板
 *  async:数据
 * Created by WW on 2016/08/25.
 */
var requestDataWithAJAX = function (url, type, async, option) {
    var options = {
        url: url,
        async: async,
        type: type,
        cache: true
    };
    $.extend(options, option);
    $.ajax(options);
};

/**
 * 特殊字符转义处理
 * Params：
 *  str:处理前字符串
 * Return:
 *  result:处理后字符串
 * Created by WW on 2016/09/05.
 */
var html_encode = function (str) {
    var result = "";
    if (str.length == 0) return "";
    result = str.replace(/&/g, "&gt;");
    result = result.replace(/</g, "&lt;");
    result = result.replace(/>/g, "&gt;");
    result = result.replace(/%/g, "&#37;");
    result = result.replace(/ /g, "&nbsp;");
    result = result.replace(/\'/g, "&#39;");
    result = result.replace(/\"/g, "&quot;");
    result = result.replace(/\n/g, "<br>");
    return result;
}

/**
 * 获取当前页面url中参数信息
 * Return:
 *  params:包含所有url中参数信息的对象
 * Created by WW on 2016/09/08.
 */
var getURLParameters = function () {
    var params = {};
    var url = location.href;
    //var reg = /^[a-zA-z]+:\/\/[^\s]*\?[a-zA-z0-9_]*=[a-zA-z0-9_]*(&[a-zA-z0-9_]*=[a-zA-z0-9_]*)*$/;
    var reg = /^[a-zA-z]+:\/\/[^\s]*\?.*=.*(&.*=.*)*$/;
    if (reg.test(url)) {
        var paramsStr = url.substring(url.indexOf("?") + 1).split("&");
        for (var i = 0; i < paramsStr.length; i++) {
            var key = paramsStr[i].substring(0, paramsStr[i].indexOf("="));
            var value = paramsStr[i].substring(paramsStr[i].indexOf("=") + 1);
            params[key] = value;
        }
    }
    return params;
};

/**
 * 设置当前页面url添加参数信息
 * Params：
 *  param：需要添加的参数
 * Return:
 *  url:添加参数后的url
 * Created by WW on 2016/09/08.
 */
var setURLParameters = function (params) {
    var keys = [], _length = 0;
    for (var key in params) {
        if (params.hasOwnProperty(key)) {
            keys[_length++] = key;
        }
    }
    var url = location.href;
    url = url.substring(0, url.indexOf("?") + 1);
    for (var i = 0; i < keys.length; i++) {
        if (i == 0) {
            url += keys[i] + "=" + params[keys[i]];
        } else {
            url += "&" + keys[i] + "=" + params[keys[i]];
        }
    }
    return url;
};

/**
 * 裁剪方法中模板的html代码片段外包裹
 * Params：
 *  functionName：存放模板html代码片段的方法名
 * Return:
 *  :拆掉包裹后的html片段
 * Created by WW on 2016/09/20.
 */
function cutTemplateWrap(functionName) {
    return functionName.toString().match(/\/\*{5}\s*([\s\S]*)\s*\*{5}\//)[1];
}

/*
$(function () {
    $("img.lazy").lazyload({effect: "fadeIn", threshold: 180});
});
*/


/**
 * 日期格式化
 * 对Date的扩展，将 Date 转化为指定格式的String
 * 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
 *
 * Params：
 *  fmt：需要的日期格式
 * Return:
 *  fmt:格式化后的时间
 *
 * 例子：
 * (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
 * (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
 *
 * Copied from meizz on 2016/09/20.
 */
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

/**
 * Handlebars调试
 * Created by WW on 2016/09/26.
 */
Handlebars.registerHelper("debug", function (optionalValue) {
    console.log("====================");
    console.log("Current Context");
    console.log(this);
    console.log("====================");
    if (optionalValue) {
        console.log("====================");
        console.log("Value");
        console.log(optionalValue);
        console.log("====================");
    }
});

/**
 * 通过form传值并跳转页面
 * Created by WW on 2016/09/30.
 */
(function ($) {
    if (!$.ww) {
        $.ww = {};
    }
    //表单提交跳转
    $.ww.jumpTo = function (url, params, options) {
        var opt = {method: 'post', target: '_self'};
        if (options) {
            $.extend(opt, options);
        }
        // 创建Form
        var form = $('<form></form>');
        // 设置属性
        form.attr('action', url);
        form.attr('method', opt.method);
        // form的target属性决定form在哪个页面提交
        // _self -> 当前页面 _blank -> 新页面
        form.attr('target', opt.target);
        if (params) {
            for (var key in params) {
                var my_input = $('<input type="hidden" name="' + key + '" />');
                my_input.attr('value', params[key]);
                // 附加到Form
                form.append(my_input);
            }
        }
        $('body').append(form);
        // 提交表单
        form.submit();
        // 注意return false取消链接的默认动作
        return false;
    };

    //登陆校验
    $.ww.getLoginStatus = function (successCallback, failureCallBack) {
        var currentUrl = window.location.pathname;
        requestDataWithAJAX('/loginStatus/getLoginStatus.ajax', "post", true, {
            "data": {"currentUrl": currentUrl},
            success: function (data) {
                try {
                    if (data != undefined && !$.isEmptyObject(data)) {
                        successCallback(data.data);
                    } else {
                        failureCallBack();
                    }
                } catch (ex) {
                }
            }
        });
    };

    //获取对象属性Key的数组
    $.ww.getObjKeys = function (obj) {
        var result = [];
        try {
            for (var key in obj) {
                result.push(key);
            }
        } catch (ex) {
        }
        return result;
    };

    //小数位保留
    $.ww.formatDecimal = function (num, limit) {
        var result = "0.00";
        if (!isNaN(num) && !isNaN(limit)) {
            if (typeof num == "number" && typeof limit == "number") {
                result = parseFloat(num.toFixed(parseInt(limit) >>> 0));
                var temp = result.toString().split(".");
                if (temp.length == 1) {
                    result += ".";
                    for (var i = 0; i < limit; i++) {
                        result += "0";
                    }
                } else {
                    if (temp[1].length < limit) {
                        for (var i = 0; i < limit - temp[1].length; i++) {
                            result += "0";
                        }
                    }
                }
            } else {
                try {
                    result = parseFloat(num).toFixed(parseInt(limit) >>> 0);
                    var temp = result.toString().split(".");
                    if (temp.length == 1) {
                        result += ".";
                        for (var i = 0; i < limit; i++) {
                            result += "0";
                        }
                    } else {
                        if (temp[1].length < limit) {
                            for (var i = 0; i < limit - temp[1].length; i++) {
                                result += "0";
                            }
                        }
                    }
                } catch (ex) {
                }
            }
        }
        return result;
    };
})(jQuery);

/**
 * 为IE8 添加数组indexOf方法
 * Created by WW on 2016/10/11.
 */
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function (str) {
        var len = this.length >>> 0;
        var from = Number(arguments[1]) || 0;
        from = (from < 0)
            ? Math.ceil(from)
            : Math.floor(from);
        if (from < 0)
            from += len;
        for (; from < len; from++) {
            if (from in this &&
                this[from] === str)
                return from;
        }
        return -1;
    };
}