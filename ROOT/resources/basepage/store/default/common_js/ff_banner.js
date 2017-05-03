/**
 * Created by kuban on 2016/11/2.
 * �������ְ�
 */
function banner_run(){
    (function () {
        var ff_banner;
        var ff_banner_index_1 = 12;
        var ff_banner_index_2 = 11;
        var tiemer, li_time;
        $(".ff_banner").attr("active_index", 1);
        $(".ff_banner").attr("ifho", "0");//bannerС����hover�жϱ��
        $(".ff_banner").each(function () {
            $(this).find(".ff_banner_img_box").eq(0).css("z-index", 11);
        })
        $(".ff_banner_ul").each(function () {
            $(this).find("li").eq(0).addClass("b_nav_li_on");//С����ʼ��
        });
        function li_hover() {
            var inde = $(this).parents(".ff_banner").find(".b_nav_li_on").index();
            $(this).addClass("b_nav_li_on").siblings().removeClass("b_nav_li_on");
            var img_box=$(this).parents(".ff_banner").find(".ff_banner_img_box");
            img_box.css("z-index", ff_banner_index_2);
            img_box.eq(inde).css("z-index", ff_banner_index_1);
            img_box.stop(true,true).fadeOut("slow").eq($(this).index()).fadeIn("slow");
            var active_index = $(this).index() + 1;
            $(this).parents(".ff_banner").attr("active_index", $(this).index() + 1);
            /*li_hover_fun();*/
        }
        $(".ff_banner_ul li").hover(li_hover, function () {
        });
        /*������ťһ��ֻ��Ӧһ��*/
        /*function li_hover_fun() {
            $(".ff_banner_ul li").unbind("mouseenter").unbind("mouseleave");
            li_time = setTimeout(function () {
                $(".ff_banner_ul li").hover(li_hover, function () {
                });
            }, 100);
        }
        li_hover_fun();*/

        /*���Ұ�ť�л�banner����*/
        function pre_click() {
            var inde = $(this).parents(".ff_banner").find(".b_nav_li_on").index();
            var pre_inde;
            if (inde == 0) {
                pre_inde = $(this).parents(".ff_banner").find(".ff_banner_img_box").length - 1;
            }
            else {
                pre_inde = inde - 1;
            }
            var img_box=$(this).parents(".ff_banner").find(".ff_banner_img_box");
            img_box.css("z-index", ff_banner_index_2);
            $(this).parents(".ff_banner").find(".ff_banner_ul li").eq(pre_inde).addClass("b_nav_li_on").siblings().removeClass("b_nav_li_on");
            img_box.eq(inde).css("z-index", ff_banner_index_1);
            img_box.stop(true,true).fadeOut("slow").eq(pre_inde).fadeIn("slow");
            $(this).parents(".ff_banner").attr("active_index", inde);
            /*bClick();*/
        }
        function nex_click() {
            var inde = $(this).parents(".ff_banner").find(".b_nav_li_on").index();
            var nex_inde;
            if (inde == $(this).parents(".ff_banner").find(".ff_banner_img_box").length - 1) {
                nex_inde = 0;
            }
            else {
                nex_inde = inde + 1;
            }
            var img_box= $(this).parents(".ff_banner").find(".ff_banner_img_box");
            img_box.css("z-index", ff_banner_index_2);
            $(this).parents(".ff_banner").find(".ff_banner_ul li").eq(nex_inde).addClass("b_nav_li_on").siblings().removeClass("b_nav_li_on");
            img_box.eq(inde).css("z-index", ff_banner_index_1);
            img_box.stop(true,true).fadeOut("slow").eq(nex_inde).fadeIn("slow");
            if (nex_inde == $(this).parents(".ff_banner").find(".ff_banner_img_box").length - 1) {
                nex_inde = 0;
            }
            else {
                nex_inde = nex_inde + 1;
            }
            $(this).parents(".ff_banner").attr("active_index", nex_inde);
            /*bClick();*/
        }
        $(".ff_banner_pre").click(pre_click);
        $(".ff_banner_nex").click(nex_click);
        /*������ťһ��ֻ��Ӧһ��*/
        /*function bClick() {
            $(".ff_banner_pre").unbind("click");
            $(".ff_banner_nex").unbind("click");
            tiemer = setTimeout(function () {
                $(".ff_banner_pre").click(pre_click);
                $(".ff_banner_nex").click(nex_click);
            }, 100);
        }*/

        /*bClick();*/
        function ff_banner_ran(obj) {
            var active_index = $(".ff_banner").eq(obj).attr("active_index");
            var now_index = active_index - $(".ff_banner").eq(obj).find(".ff_banner_ul li").siblings().length;
            if (now_index >= 0) {
                active_index = 0;
            }//�ж����һҳ
            $(".ff_banner").eq(obj).find(".ff_banner_ul li").eq(active_index).addClass("b_nav_li_on").siblings().removeClass("b_nav_li_on");
            $(".ff_banner").eq(obj).find(".ff_banner_img_box").css("z-index", ff_banner_index_2);
            if (active_index > 0) {
                $(".ff_banner").eq(obj).find(".ff_banner_img_box").eq(active_index - 1).css("z-index", ff_banner_index_1);
            }
            $(".ff_banner").eq(obj).find(".ff_banner_img_box").fadeOut("slow").eq(active_index).fadeIn("slow");
            active_index = parseInt(active_index) + 1;
            $(".ff_banner").eq(obj).attr("active_index", active_index);
        }

        function banner_bt() {
            $(".ff_banner").hover(function () {
                $(this).attr("ifho", "1");
                $(this).find(".ff_banner_pre").fadeIn();
                $(this).find(".ff_banner_nex").fadeIn();
            }, function () {
                $(this).attr("ifho", "0");
                $(this).find(".ff_banner_pre").fadeOut();
                $(this).find(".ff_banner_nex").fadeOut();
            });//ifho��hover�жϱ��
        }

        banner_bt();
        setInterval(function () {//ȫҳ��banner��ʱ��
            var item_index = 0;
            $(".ff_banner").each(function () {
                if ($(this).attr("ifho") == 0) {//hover�ĵ���banner���л�
                    ff_banner_ran(item_index);
                }
                item_index += 1;
            });
            banner_bt();
        }, 5000)
    })();
}
$(function(){
    banner_run();
});