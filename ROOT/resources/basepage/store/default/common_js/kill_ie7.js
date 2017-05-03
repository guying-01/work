/**
 * Created by Administrator on 2016/9/7.
 */


if (document.documentMode >= 8) // IE8
{
    //$("#show_for_ie").hide();
}
else if (document.documentMode < 8) // IE 5-7
{
    var template = $("#kill_ie_7").html();
    var html = loadHandlebarsTemplate(template, {});
    $("body").append(html);  //加载到html中
    $("body").css("overflow-y","hidden");
    //$("#show_for_ie").show();
}