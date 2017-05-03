// JavaScript Document
    $(function() {
        $('.function-demo').raty({
    	  	number:5,//多少个星星设置		
    		targetType: 'hint',//类型选择，number是数字值，hint，是设置的数组值
            path      : '/resources/img/common',
    		hints     : ['收到的商品质量很差，与商家的描述严重不符，很不满意','收到的商品质量较差，与商家的描述不符，不满意','收到的商品质量一般，与商家的描述有一定差距','收到的商品质量不错，与商家的描述基本一致，挺满意','收到的商品质量非常好，与商家的描述完全一致，非常满意'],
            cancelOff : 'x_off.jpg',
            cancelOn  : 'x_on.jpg',
            size      : 19,
            starOff   : 'x_off.jpg',
            starOn    : 'x_on.jpg',
            target    : '#function-hint',
            cancel    : false,
            targetKeep: true,
            space : false,
    		targetText: '点击星星就能打分',
          });    
        $('.function-score').raty({
    	  	number:5,//多少个星星设置		
            path      : '/resources/img/common',
            cancelOff : 'x_off.jpg',
            cancelOn  : 'x_on.jpg',
            hints     : ['很不满意','不满意','一般','挺满意','非常满意'],
            size      : 19,
            starOff   : 'x_off.jpg',
            starOn    : 'x_on.jpg',
            cancel    : false,
            space : false,
            targetKeep: false,
          });    
    });
