// JavaScript Document
!function(){
laydate.skin('yalan');
laydate({elem: '#demo'});
}();
//日期范围限制
var start = {
    elem: '#startDate',
    format: 'YYYY-MM-DD',
    //min:  '1000-06-16', //设定最小日期为当前日期
    max: laydate.now(), //最大日期
    istime: false,
    istoday: false,
    choose: function(datas){
        //end.start = datas //将结束日的初始值设定为开始日
        end.min = datas;//开始日期选好后，结束日期的最小日期就是开始日期
    },
    delFunc:function(opts)
    {
    	end.min=opts.min;
    }
};
var end = {
    elem: '#endDate',
    format: 'YYYY-MM-DD',
    //min: '1000-06-16',
    max: laydate.now(),
    istime: false,
    istoday: false,
    choose: function(datas){
    	start.max = datas;
        //start.max = datas; //结束日选好后，重置开始日的最大日期
    },delFunc:function(opts){
    	start.max=opts.max;
    }
};
laydate(start);
laydate(end);
