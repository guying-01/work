// JavaScript Document
$(document).ready(function() {
	 var text = ('<div class="order-adress-selected"><p>配送至：</p><div class="left"></div><a href="javascript:void(0);">删除</a><a href="javascript:void(0);" class="cx1">修改</a><a href="javascript:void(0);" id="setAdress">设为默认</a><div class=" clear"></div></div>')
    $(".order-adress li  input").click(function() {
        if ($(this).parents().parent().hasClass("order-adress-selected")) {} else {
            $(this).parents().siblings().children(".order-adress-selected").remove();
            $(this).parents().siblings().children(".order-adress-list").show();
            $(this).parents("li").append(text);
		   
            $(this).parents().children(".order-adress-list").clone().appendTo(".order-adress-selected .left");
            $(this).parents().children(".order-adress-list").hide();
        }

    });
    $(".useintegral").click(function() {
        if ($(this).is(':checked')) {

            $(this).siblings("div").show()
        } else {
            $(this).siblings("div").hide()
        }

    })
})