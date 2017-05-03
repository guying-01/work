/**pie 2017-4-15*/
'use strict';

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

$(function () {
    var gy = new getData();
    gy.start();
});

var getData = (function () {
    function getData() {
        _classCallCheck(this, getData);

        this.adsParam = {
            type: 'list',
            rangeId: 'goods_list',
            serialId: 'luckypie'
        };
    }

    _createClass(getData, [{
        key: 'getTime',
        value: function getTime() {
            var time = new Date().Format('yyyy年MM月dd日');
            $(".time").html(time);
        }
    }, {
        key: 'rangeAds',
        value: function rangeAds() {
            $.post('/fsajax/getAdsPic.ajax', this.adsParam, function (data) {
                var dataG = JSON.parse(data);
                getData.rangeTemplate('rangeAds', dataG);
            });
        }
    }, {
        key: 'start',
        value: function start() {
            this.getTime();
            this.rangeAds();
        }
    }], [{
        key: 'rangeTemplate',
        value: function rangeTemplate(ele, data) {
            var template = Handlebars.compile($('#' + ele).html());
            var templateHtml = template(data);
            $('.' + ele).html(templateHtml);
        }
    }]);

    return getData;
})();