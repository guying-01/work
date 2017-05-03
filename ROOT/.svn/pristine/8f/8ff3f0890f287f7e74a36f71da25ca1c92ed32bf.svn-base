/**
 * Created by Administrator on 2016/8/23.
 */
function banner_left_nav() {
    /*banner���nav hoverЧ��*/
    (function () {
        $(".classification_lv1_middle_banner_left li").hover(function () {
            $(this).addClass("left_nav_active");
            $(".classification_lv1_middle_banner_left_nav_item").hide().css("top", -(30 * $(this).index() + 1));//�������ݿ�λ��
            $(".classification_lv1_middle_banner_left_nav_item").eq($(this).index()).show();
        }, function () {
            $(this).removeClass("left_nav_active");
            $(".classification_lv1_middle_banner_left_nav_item").eq($(this).index()).hide();
        })
    })();
    /*����banner_nav��a��title*/
    (function () {
        $(".c_lv1_middle_banner_left_nav_item_main_left p a").each(function () {
            $(this).attr("title", $(this).text());
            $(this).addClass("fn_text_overflow");
        })
    })();
    //每7个添加类名,去除右边框
    (function () {
        $(".c_lv1_middle_banner_left_nav_item_main_left>p").each(function () {
            var aLength = $(this).find("a").length;
            if (aLength > 6) {
                $(this).find("a").last().addClass('item_main_left_noborder');
            }
        });
    })();
    /*促销活动兼容IE滑动效果*/
    function ZhsSales(obj, num) {
        if (obj.length <= 0) return;
        obj.mouseover(function () {
            $(this).stop().animate({"padding-left": "1em"}, num);
        });
        obj.mouseout(function () {
            $(this).stop().animate({"padding-left": "0em"}, num);
        });
    }

    ZhsSales($(".salesPromotion-right-1 a"), 400);
}

