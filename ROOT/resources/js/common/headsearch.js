// JavaScript Document
var top = $().offset().top;
$(document).scroll(function () {
  var scroll = $(window).scrollTop();
  console.log(top);
  if (top <= scroll) {
    
  }
})
