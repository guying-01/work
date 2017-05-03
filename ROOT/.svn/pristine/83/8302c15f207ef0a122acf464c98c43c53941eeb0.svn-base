/**
 * Created by ldy on 2016/12/18.
 */

// layer
function layer(str) {
    if ($('.layer').length > 0) return;

    var winW = innerWidth,
        winH = innerHeight,
        layerHtm = '<div class="layer-box"><p class="layer">'+str+'</p></div>';
    $('body').append(layerHtm);
    $('.layer-box').show();
    var layerBox = $('.layer-box');
    var layers = $('.layer');
    // 弹出层样式
    layerBox.css({
        position: 'fixed',
        top: 0,
        left: 0,
        'z-index': 9999,
        width: '100%',
        height: '100%'
    });
    layers.css({
        position: 'absolute',
        top: '50%',
        left: '50%',
        width: '0px',
        height: '0px',
        'border-radius': '2px',
        'font-size': '18px',
        'line-height': '99999px',
        'text-align': 'center',
        color: '#fff',
        background: 'rgb(201, 22, 34)',
        background: 'rgba(201, 22, 34, 0.9)',
        'white-space': 'nowrap',
        'word-break': 'break-all',
        'text-overflow': 'ellipsis',
        overfow: 'hidden'
    });

    var x = 65,y = 25,
        more = 10,
        w = 190,h = 50;

    var W = w/more,
        H = h/more;
    var size = 0;

    layers.$layer_timerId = setInterval(function(){
        var isx = 0, isy = 0;
        x += W;
        y += H;
        if (x <= w) {
            layers.css({
                width: x,
                marginLeft: -x/2
            });
        } else {
            isx=1;
        }
        if (y <= h) {
            layers.css({
                height: y,
                marginTop: -y/2,
                lineHeight: y + 'px'
            });
        } else {
            isy=1;
        }
        if (size < 18) {
            size+=3;
            layers.css({
                fontSize: size + 'px'
            });
        }
        if (isx==1 && isy==1) {
            clearInterval(layers.$layer_timerId);
            setTimeout(function(){
                reset();
                $('.layer-box').hide();
            }, 1000);
        }

        function reset() {
            layers.css({
                width: 0,
                height: 0,
                marginLeft: 0,
                marginTop: 0,
                top: '50%',
                left: '50%',
                lineHeight: '0px'
            });
            $('.layer-box').remove();
        }
    },18);

}