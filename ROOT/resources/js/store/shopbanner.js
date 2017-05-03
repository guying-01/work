function imgSelectBind(){
	var linum=$(".conBanner li").length
    var index = 0;
    var clonshow = function() {
        $(".next").trigger("click");
    }
    var autoshow
    function autoshow_show() {
        autoshow = setInterval(clonshow, 3000);
    }
    autoshow_show();
    function autoshow_hide() {
        clearInterval(autoshow)
    }
    $(".shopBanner").mouseout(function() {
		$('.sliderBtn').css({'width':'0px'})
        autoshow_show();
    });
    $(".shopBanner").mouseover(function() {
		$('.sliderBtn').css({'width':'30px'})
        autoshow_hide()
    });
    $(".next").click(function() {
        index = index + 1;
        if (index >= 1) {
            showPics()
        }
        if (index == linum) {
            index = 0;
            showPics()
        }
    });
    $(".prev").click(function() {
        index = index - 1;
        if (index <= linum) {
            showPics()
        }
        if (index == -1) {
            index = (linum-1);
            showPics()
        }
    });
    $(".banner_num li") .mouseover(function() {
        var bt_li = $(".banner_num li").index(this);
        index = bt_li;
        showPics()
    })
    //切换方法
    var showPics = function() {
        $(".conBanner li").hide();
        $(".conBanner li").eq(index).fadeIn();
        $(".banner_num li").removeClass("btnListOn");
        $(".banner_num li").eq(index).addClass("btnListOn");
    }
}