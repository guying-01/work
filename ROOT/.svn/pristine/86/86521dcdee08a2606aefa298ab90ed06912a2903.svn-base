<#include "/common/common_var_definds.ftl" />
<#macro render>
<!--layer.js-->
<style>
    .layer::selection { background:transparent; }
    .layer::-moz-selection { background:transparent; }
</style>
<script src="${resources}/basepage/seller/js/layer.js" type="text/javascript"></script>

<style>
    /*共通*/
    .block {
        display: block;
    }
    .none {
        display: none;
    }

    .fl {
        float: left;
    }
    .fr {
        float: right;
    }

    .table_cell {
        display: table-cell;
        vertical-align: middle;
    }
    /**/
    .swiper-wrapper {
        overflow: hidden;
    }
    .only_book_content_dangan .swiper-container {
        width: 4.38rem;
        height:7.8rem;
        overflow: hidden;
        position: relative;
    }
	.lunbo{
		width: 4.38rem;
		height: 7.8rem;
		text-align: center;
	}
    .only_book_content_dangan .swiper-slide {
    	width: 4.38rem;
        float: left;
        text-align: center;
        height: 100%;
    }

    .slider_btn {
        position: absolute;
        top: 50%;
        width:0.5rem;
        height: 1rem;
        font-size:0.5rem;
        font-family: simsun;
        font-weight: 500;
        line-height:1rem;
        text-align: center;
        color: #fff;
        background: gray;
        background: rgba(0, 0, 0, 0.2);
        cursor: pointer;
    }

	.swiper-button-next{
		right: -0.5rem;
	}
	.swiper-button-prev{
		left: -0.5rem;
	}
    /*模态层*/
    .motaicheng {
        width: 100%;
        height: 100%;
        position: fixed;
        z-index: 1000;
        background: #000;
        background: rgba(0, 0, 0, 0.8);
        top: 0;
        left: 0;
    }

    .mtc_img_box {
        width:6.4rem;
        height:100%;
    }

    .mtc_img_WH {
    	width:6.4rem;
    	height:100%;
    	text-align: center;
    	position: absolute;
    }

    .mtc_img_box img {
        max-width: 100%;
        max-height: 100%;
    }
    .mtc_img_box .imgbgColor {
        background: #fff;
    }

    .mtc_button {
        width:0.5rem;
        height:0.5rem;
        /*background: #2c2c2c;*/
        background: #000;
        position: absolute;
        top: 0;
        right: 0px;
        color: #f1f1f1;
        font-size: 0.5rem;
        line-height: 0.45rem;
        text-align: center;
        cursor: pointer;
        z-index:11 ;
    }
    .mtc_btn {
       position: absolute;
        top: 50%;
        width: 0.5rem;
        height:1rem;
        margin-top: -50px;
        font-size:0.5rem;
        font-family: simsun;
        font-weight: 500;
        line-height: 1rem;
        text-align: center;
        color: #fff;
        background: gray;
        background: rgba(0, 0, 0, 0.2);
        cursor: pointer;
        z-index: 11;
    }

    .mtc_left {
        left: 0px;
    }
    .mtc_right {
        right: 0px;
    }

    .slider_btn::selection { background:transparent; }
    .slider_btn::-moz-selection { background:transparent; }
    .mtc_btn::selection { background:transparent; }
    .mtc_btn::-moz-selection { background:transparent; }


</style>
<!-- Slider -->
<div class="swiper-container">
    <div class="swiper-wrapper swiper-no-swiping">
    </div>
</div>
<div class="slider_btn swiper-button-next">&gt;</div>
<div class="slider_btn swiper-button-prev">&lt;</div>

<script>
$(document).ready(function() {

    // 轮播配置
    function slider() {
        var wrap = $('.only_book_content_dangan');
        // container容器
        var container = $('.only_book_content_dangan .swiper-wrapper');
        // list列表
        var list = $('.only_book_content_dangan .swiper-slide');
        // 左右箭头
        var prev = $('.only_book_content_dangan .swiper-button-prev');
        var next = $('.only_book_content_dangan .swiper-button-next');
        // 盒子宽度高度
        var imageWidth = $(".swiper-container").width();
        var imageHeight =$(".swiper-container").height();
        $(".swiper-slide img").css({
        	'maxWidth':$(".swiper-container").width(),
        	'maxHeight':$(".swiper-container").height()
        })
        // 计算盒子宽高
        function wh() {
            container.css({
                'width': $(".swiper-container").width()*list.length +list.length,
                'height': $(".swiper-container").height(),
                'position': 'absolute'
            }) //列表宽高
        }wh();
        // 索引
        var index = 0;
        /*左箭头单击事件*/
        prev.click(function(event) {
            // 判断是否动画运动中
            if ( container.is(':animated') )
                return;
            index --;
            if (index <= 0) {
                index = 0;
                layer('已经是第一页了!');
                return;
            }
            animate(imageWidth);

        });
        /*右箭头单击事件*/
        next.click(function(event) {

            // 判断是否动画运动中
            if ( container.is(':animated') )
                return;
            index ++;
            if (index+1 > list.length) {
                index = list.length;
                layer('已经到最后一页了!');
                return;
            }
            animate(-imageWidth);

        });

        /*运动函数*/
        function animate(offset) {
            // 动画过渡图片位置
            container.animate({left:'+='+offset}, 700,function(){
                var left = parseInt(container.css('left')); //获取当前的偏移距离
            });

        }

    }
    // 模态层配置
    function Active() {
        var motaicheng = $("#motaicheng2"); //模态层容器
        var lunbo = $(".only_book_content_dangan .swiper-slide"); //获取轮播下的图片
        var lunbo_img = $(".only_book_content_dangan .swiper-slide img");
        var lb_img_index = 0; //下标
        var mtc_img = $("#mtc_img2"); //模态层展示图

        $('body').append(motaicheng);
        lunbo.on("click", "img", function () {

            var lunbo_img_src = $(this).attr("src");
            motaicheng.removeClass("none").addClass("block");

            for (var i = 0; i < lunbo_img.length; i++) {
                var lunbo_img_sti = lunbo_img[i].src;
                var reg = lunbo_img[i].src.toString().match(new RegExp(lunbo_img_src));
                if (reg != null) {
                    lb_img_index = i;
                    MtcWH(lunbo_img[lb_img_index]);
                }
            }
            mtc_img.attr("src", lunbo_img_src);
			mtc_img.css({
            	"position":"absolute",
            	"top":($("body").height() - mtc_img.height()) / 2,
            	"left":($("body").width() - mtc_img.width()) / 2
            })
            
            Mtc();
            lb_img_index = $(this).parents('.swiper-slide').index();
            MtcLb(lunbo_img, lb_img_index);
        });
        function MtcLb(lunbo_img, lb_img_index) {
            var left = $("#mtc_left2");
            var right = $("#mtc_right2");
            var mtc_img = $("#mtc_img2"); //模态层展示图
            var index = lb_img_index;
            left.click(function () {
                index--;
                if (index < 0) {
                    index = 0;
                    layer('已经是第一页了!');
                    return;
                };
                var left = lunbo_img[index];
                mtc_img.attr("src", left.src);
                MtcWH(lunbo_img[index]);
                return false;
            });
            right.click(function () {
                index++;
                if (index > lunbo_img.length - 1) {
                    index = lunbo_img.length - 1;
                    layer('已经到最后一页了!');
                    return;
                };

                var left = lunbo_img[index];
                mtc_img.attr("src", left.src);
                return false;
            })
        }

        function MtcWH(LbWH) {
        	
            var mtc_img = $("#mtc_img2"); //模态层展示图
            var mtc_img_WH = 100;
            var lunbo_img_W = LbWH.width;
            var lunbo_img_H = LbWH.height;
            mtc_img.get(0).style.width = lunbo_img_W + mtc_img_WH + "px";
            mtc_img.get(0).style.height = lunbo_img_H + mtc_img_WH + "px";
        }

        function Mtc() {
            var mtc_button = $("#mtc_button2"); //模态层按钮
            var motaicheng = $("#motaicheng2"); //模态层容器

            mtc_button.click(function () {
                motaicheng.removeClass("block").addClass("none");
            })
        }
    }
    
    $.dangan = {}
    $.dangan.getSliderImg = function(loadImg) {
        var str = '';
        for (var i=0,length=loadImg.src.length; i<length; i++) {
            str += '<div class="swiper-slide"><div class="lunbo table_cell"><img data-upload="img1" src=' + loadImg.src[i] + '></div></div>'
        }
        $('.only_book_content_dangan .swiper-wrapper').html(str);
        slider(); //加载轮播
        Active(); 
        //加载模态层
    }
    
});
</script>
    <!-- 轮播js的插件结束 -->

<!--模态层开始-->
<div id="motaicheng2" class="motaicheng none">
    <div class="mtc_img_box">
        <div class="mtc_img_WH table_cell">
            <img id="mtc_img2" class="imgbgColor" src="" alt="">
        </div>        
    </div>
    <div id="mtc_button2" class="mtc_button">×</div>
    <div id="mtc_left2" class="mtc_btn mtc_left">&lt;</div>
    <div id="mtc_right2" class="mtc_btn mtc_right">&gt;</div>
</div>
<!--模态层结束-->

</#macro>