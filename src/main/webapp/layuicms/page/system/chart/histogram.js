layui.config({
    base: $config.resUrl+'layuicms/common/js/'//定义基目录
}).extend({
    ajaxExtention: 'ajaxExtention',//加载自定义扩展，每个业务js都需要加载这个ajax扩展
    $tool: 'tool',
    $api:'api',
    $sha1:'../../lib/sha1/sha1'//加密工具
}).use(['form','layer','ajaxExtention','$tool','$sha1','$api'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery,
        $tool = layui.$tool,
        $sha1 = layui.$sha1,
        $api = layui.$api;

    /**
     * 主状态
     */
    function init(){
        histogramExample();

    }
    function histogramExample(){
        //基于准备好的dom，初始化echarts实例
        var histogramChart = echarts.init(document.getElementById("main"));
        //指定图表的配置项和数据
       /* histogramChart.setOption({
            title:{
                text:'各公司轴承价格柱状图'
            },

            tooltip:{},

            legend : {
                /!*data:['销量']*!/
            },

            xAxis : {
                data : [/!*"衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"*!/]
            },

            yAxis : {

            },

            series : [/!*{
                name : 'a',
                type : 'bar',
                data :[1]
            }*!/]
        });*/
        //return

        //异步加载数据
        $api.getBearingHistogramData(null,function (data) {
            var data1 = data.data;
            var supplierNameArr = ["supplierName"];
            var j1 = []
            var strs = []
            /*
            ['Matcha Latte', 43.3, 85.8, 93.7],
            ['Milk Tea', 83.1, 73.4, 55.1],
            ['Cheese Cocoa', 86.4, 65.2, 82.5],
            ['Walnut Brownie', 72.4, 53.9, 39.1]*/
            /*for(var i=0;i<data1.length;i++){

                for(var j=0;i<data1.length;j++){
                    break;
                }
            }*/


            console.log(data1)
            histogramChart.setOption({

                legend : {},
                tooltip:{},
                /*series : jsonDate,*/
                series: [
                    {type: 'bar'},
                    {type: 'bar'},
                    {type: 'bar'},
                    {type: 'bar'},
                    {type: 'bar'}
                ],

                dataset: {
                    /* ['product', '2015', '2016', '2017'],
            ['Matcha Latte', 43.3, 85.8, 93.7],
            ['Milk Tea', 83.1, 73.4, 55.1],
            ['Cheese Cocoa', 86.4, 65.2, 82.5],
            ['Walnut Brownie', 72.4, 53.9, 39.1]*/
                    source: [
                        supplierNameArr,//
                        ['Milk Tea', 83.1, 73.4, 55.1],
                        ['Cheese Cocoa', 86.4],
                        ['Walnut Brownie', 72.4, 53.9, 39.1, 55.1, 55.1],
                        ['Walnu Brownie', 72.4, 53.9, 39.1, 55.1, 55.1],
                        ['Waln Brownie', 72.4, 53.9, 39.1, 55.1, 55.1]
                    ]
                },


                xAxis : {
                    type: 'category'
                   /* data : supplierNameArr,
                    axisLabel: {
                        interval: 0,
                        formatter:function(value)
                        {
                            //debugger
                            var ret = "";//拼接加\n返回的类目项
                            var maxLength = 2;//每项显示文字个数
                            var valLength = value.length;//X轴类目项的文字个数
                            var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数
                            if (rowN > 1)//如果类目项的文字大于3,
                            {
                                for (var i = 0; i < rowN; i++) {
                                    var temp = "";//每次截取的字符串
                                    var start = i * maxLength;//开始截取的位置
                                    var end = start + maxLength;//结束截取的位置
                                    //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
                                    temp = value.substring(start, end) + "\n";
                                    ret += temp; //凭借最终的字符串
                                }
                                return ret;
                            }
                            else {
                                return value;
                            }
                        }
                    }*/
                },
                yAxis: {},
            })
        });

    }
    init();

});