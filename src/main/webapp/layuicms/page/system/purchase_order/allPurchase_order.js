layui.config({
    base: $config.resUrl+'layuicms/common/js/'//定义基目录
}).extend({
    ajaxExtention: 'ajaxExtention',//加载自定义扩展，每个业务js都需要加载这个ajax扩展
    $tool: 'tool',
    $api:'api'
}).use(['form', 'layer', 'laydate', 'jquery', 'table', 'laypage', 'ajaxExtention', '$tool','$api'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery,
        laypage = layui.laypage,
        $tool = layui.$tool,
        laydate = layui.laydate,
        table = layui.table,
        $api = layui.$api;

    var laydate = layui.laydate;

    //执行一个laydate实例
    laydate.render({
        elem: '#startTime' //指定元素
    });

    var tableIns;//表格实例

    /**
     * 页面初始化
     * */
    function init() {
        initDate();//初始化日期选择框
        initState();
        initCommit()
    }

    init();

    function initCommit(){
        var a = 'a'
        $('#barDemo').append($(a))
    }

    /**
     * 初始化日期选择
     * */
    function initDate() {
        laydate.render({
            elem: '#operDate'
            , type: 'datetime'
            , range: '&'
            , format: 'yyyy-MM-dd HH:mm:ss'
        });
    }

    /**
     * 初始化状态查询
     */
    function initState(){
                var html1 = '<option value="">--请选择--</option>';
                html1 += '<option value="未提交">未提交</option>>';
                html1 += '<option value="待审核">待审核</option>>';
                html1 += '<option value="审核中">审核中</option>>';
                html1 += '<option value="审核通过">审核通过</option>>';
                html1 += '<option value="审核未通过">审核未通过</option>>';
                html1 += '<option value="待付款">待付款</option>>';
                html1 += '<option value="被驳回">被驳回</option>>';
                html1 += '<option value="已付款">已付款</option>>';

                $('#allState').append($(html1));
                form.render();
    }
        //TODO.......
        $(document).on('click','.layui-table-cell',function(){
            // $("p").css({"background-color":"blue","font-size":"14px"});
            var x=$(this).offset(),
                left=x.left,
                top=x.top;
            var w=$(this).width(),
                h=$(this).height();
            $('.hoverDiv').css({
                "width":w,
                "left":left+"px",
                "top":top+h+'px',
                "display":'block',
                "background":'pink',
            }).slideDown();
        });

    function defineTable() {
        tableIns = table.render({
            elem: '#supplier_goods'
            , height: 415
            , url: $tool.getContext() + 'purchase_order/purchase_orderList.do' //数据接口
            , method: 'post'
            , page: true //开启分页
            , cols: [[ //表头
                {type: 'numbers', title: '序号', fixed: 'left'},
                {field: 'orderNumber', title: '订单编号', width: '10%', fixed: 'left'}
                , {field: 'goodsName', title: '购买货品', width: '10%', fixed: 'left'}
                , {field: 'goodsNumber', title: '购买数量', width: '10%'}
                , {field: 'totalPrice', title: '货品总价(单位：元)', width: '15%'}
                , {field: 'supplierName', title: '货品所属供应商', width: '17%'}
                , {field: 'applyUser', title: '订单申请人', width: '10%'}
                , {field: 'applyTime', title: '订单申请时间', width: '13%'}
                , {field: 'auditState', title: '订单状态', width: '10%'}
                , {field: 'orderAuditUser', title: '订单审核人', width: '10%'}
                , {field: 'orderAuditTime', title: '订单审核时间', width: '10%'}
                , {field: 'payAuditUser', title: '订单支付人', width: '10%'}
                , {field: 'payAuditTime', title: '订单支付时间', width: '10%'}
                , {field: 'payState', title: '支付状态', width: '10%'}
                , {field: 'applyDescribe', title: '申请原因', width: '10%'}
                , {field: 'auditDescribe', title: '审核信息', width: '10%'}
                , {fixed: 'right', title: '操作', width: 260, align: 'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
            , done: function (res, curr, count) {//请求完毕后的回调
                //如果是异步请求数据方式，res即为你接口返回的信息.curr：当前页码

                var that = this.elem.next();
                res.data.forEach(function (item, index) {
                    //console.log(item)
                    if (item.auditState == "审核通过"&&item.payState == "已付款") {
                        var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#7eff83");
                    } else if (item.auditState == "审核通过"&&item.payState == "被驳回(财务)") {
                        var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#ff5d5f");
                    } else if (item.auditState == "待审核") {
                        var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#feff63");
                    }
                    else if (item.auditState == "待审核") {
                        var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#feff63");
                    }

                });
            }
        });

        //为toolbar添加事件响应
        table.on('tool(purchase_orderFilter)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var row = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            //区分事件
            if (layEvent === 'del') { //删除
                delPurchase_Order(row.id);
            } else if (layEvent === 'edit') { //编辑
                //do something
                editPurchase_Order(row.id);
            } else if(layEvent === 'commit') {
                //var a = $(this).html("<i class=\"layui-icon\">&#xe605;</i>提交")
                buyerCommit(row.id);
            } else if(layEvent === 'back') {
                recall(row.id);
            } else if(layEvent === 'lookBack'){
                lookBack(row.id,"a");
            } else if(layEvent === 'receive'){
                receive(row.id);
            }
        });
    }
    defineTable();


    //查询
    form.on("submit(queryMenu)", function (data) {
        var allState = data.field.allState;
        var operDate = data.field.operDate;
        var time = operDate.split('&');
        var startTime = time[0];
        var endTime = time[1];

        //表格重新加载
        tableIns.reload({
            where:{
                allState:allState,
                startTime:startTime,
                endTime : endTime
            }
        });

        return false;
    });

    //添加供应商
    $(".purchase_orderAdd_btn").click(function () {
        var index = layui.layer.open({
            title: "原料商品",
            type: 2,
            content: "addPurchase_order.html",
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回供应商列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }
        });

        //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
        $(window).resize(function () {
            layui.layer.full(index);
        });
        layui.layer.full(index);
    });

    //删除
    function delPurchase_Order(id){
        layer.confirm('确认删除吗？', function (confirmIndex) {
            layer.close(confirmIndex);//关闭confirm
            //向服务端发送删除指令
            var req = {
                id: id
            };

            $api.DeletePurchase_Order(req,function (data) {
                layer.msg("删除成功",{time:1000},function(){
                    //obj.del(); //删除对应行（tr）的DOM结构
                    //重新加载表格
                    tableIns.reload();
                });
            });
        });
    }

    //收货
    function receive(id){
        layer.confirm('确认收货吗？', function (confirmIndex) {
            layer.close(confirmIndex);//关闭confirm
            //向服务端发送删除指令
            var req = {
                id: id
            };

            $api.receive(req,function (data) {
                layer.msg("确认收货吗？",{time:1000},function(){
                    //obj.del(); //删除对应行（tr）的DOM结构
                    //重新加载表格
                    //TODO...友情提示
                    layer.confirm('认收货吗？', function (confirmIndex){
                        layer.close(confirmIndex);//关闭confirm
                    })
                    tableIns.reload();
                });
            });
        });
    }

    //编辑
    function editPurchase_Order(id){
        var index = layui.layer.open({
            title: "编辑申请",
            type: 2,
            content: "editPurchase_order.html?id="+id,
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }
        });


        //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
        $(window).resize(function () {
            layui.layer.full(index);
        });
        layui.layer.full(index);
    }

    //查看
    function lookBack(id,auditState){
        var index = layui.layer.open({
            title: "查看申请",
            type: 2,
            content: "editPurchase_order.html?id="+id+"&auditState="+auditState,
            success: function (layero, index) {
                console.log(layero)
                setTimeout(function () {
                    layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }
        });


        //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
        $(window).resize(function () {
            layui.layer.full(index);
        });
        layui.layer.full(index);
    }

    //提交
    function buyerCommit(id){
        layer.confirm('确认提交吗？', function (confirmIndex) {
            layer.close(confirmIndex);//关闭confirm
            //向服务端发送删除指令
            var req = {
                id: id
            };

            $api.buyerCommit(req,function (data) {

                layer.msg("提交成功",{time:1000},function(){
                    //obj.del(); //删除对应行（tr）的DOM结构
                    //重新加载表格
                    tableIns.reload();
                });
            });

        });
    }

    //撤回
    function recall(id){
        layer.confirm('确认撤回吗？', function (confirmIndex) {
            layer.close(confirmIndex);//关闭confirm
            //向服务端发送删除指令
            var req = {
                id: id
            };

            $api.recall(req,function (data) {

                layer.msg("撤回成功",{time:1000},function(){
                    //obj.del(); //删除对应行（tr）的DOM结构
                    //重新加载表格
                    tableIns.reload();
                });
            });

        });
    }

});