$(document).ready(function () {
$("#numbox").keyup(function(){     
	  var emptynum=$(this).val();     
	  $(this).val(emptynum.replace(/\D|^/g,''));     
  })	
$("#add").click(function(){
  var n=$("#numbox").val()
  var num=parseInt(n)+1
  if(num>=31){
	  jsErrAlert("您选择的数量大于库存量");
	  $(this).removeClass("add_1");
	  $(this).addClass("add_0");
	  $("#reduce").removeClass("reduce_0");
	  $("#reduce").addClass("reduce_1");
	  }
	  else{ 
	  $("#numbox").val(num);
	  $(this).removeClass("add_0");
	  $(this).addClass("add_1");}

});
$("#reduce").click(function(){
  var n=$("#numbox").val()
  var num=parseInt(n)-1
  if(num<=0){
	  //jsErrAlert("请选择购买数量");
	  $(this).removeClass("reduce_1");
	  $(this).addClass("reduce_0");
	  }
});
  
  })



