$(document).ready(function () {
if ($('.search_box').length != 0) {

  var top = $('.search_box').offset().top;
  $(document).scroll(function () {
    var scroll = $(window).scrollTop();
    if (top <= scroll) {
       $('.search_box').css({
         'position': 'fixed',
         'top': '0',
         'z-index': '999'
       })
    }else {
      $('.search_box').css({
        'position': 'absolute',
        'z-index': '999'

      })
    }
  })
}

  $(".search_box  .btn").on("click", function () {
    var keyword = html_encode($(".search_box  .searchContent").val().replace(new RegExp("(onclick|onfocus|<|>)+","g"),""));
    location.href = "/FSgoodsSearch.jhtml?from=gd-search&keyword=" + encodeURIComponent(keyword);
    localStorage.browsePage='';
    localStorage.scrollTop='';
  });

  function getSessionName() {
    $.ajax({
      type: 'post',
      url: '/loginStatus/getLoginStatus.ajax',
      success: function (data) {
        if($.isEmptyObject(data)){
          $(".gohome").removeClass('b_wid');
          $('.login_link').css('visibility','visible');
          $('.login_link').html("登录");
          $('.login_link').parent('a').attr('href','/toLogin.jhtml')
        }
        else{
          if(data.data.userCode != "") {
            $('.login_link').css('visibility','hidden');
            //$(".gohome").addClass('b_wid');
          }
        }
      }
    })
  }
  getSessionName();
});
