layui.config({
    base: $config.resUrl+'layuicms/common/js/'//定义基目录
}).extend({
    ajaxExtention:'ajaxExtention',//加载自定义扩展，每个业务js都需要加载这个ajax扩展
    $tool:'tool',
    $api:'api'
}).use(['form', 'layer','$api', 'jquery','ajaxExtention','$tool'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        laypage = layui.laypage,
        $ = layui.jquery,
        $tool = layui.$tool,
        $api = layui.$api;

    /**
     * 同意和不同意按钮
     */
    function initBtn(){

        var auditDescribeByRepository = $("#auditDescribeByRepository").val()
        console.log($("#auditDescribeByRepository").val())
        if(auditDescribeByRepository != null && auditDescribeByRepository != ''){
            $("#agree").remove();
            $("#disagree").remove();
            $("#auditDescribeByRepository").attr("readonly","readonly");
            form.render();
        }
    }

    function initTestarea(){
        var queryArgs = $tool.getQueryParam();//获取查询参数
        var id = queryArgs['id'];
        var req = {
            id:id
        };
        $api.GetPurchase_Order(req,function (res) {
            var data = res.data;
            if(data.auditState == "待审核(仓库)"){
                $('#reasonByFinanceM').remove();

            }
        });
    }
    initTestarea()

    /**
     * 初始化页面
     * */
    function init() {
        //alert(1)
        //初始化供应商名称下拉框
        initSupplierName();
        initGoodsType();

        /**
         * 初始化供应商名称下拉框
         * */
        function initSupplierName() {
            $api.GetSupplierName(null,function (res) {
                var data = res.data;
                if (data.length > 0) {
                    var html = '<option value="">--请选择--</option>';
                    for (var i = 0; i < data.length; i++) {
                        html += '<option value="' + data[i].id + '">' + data[i].supplierName + '</option>>';
                    }
                    $('#supplierName').append($(html));
                    form.render();
                }
            });
        }



        /**
         * 初始化货品类型
         * */

        function initGoodsType() {
            $api.GetGoodsTypeBySupplierId(req, function (res) {
                var data = res.data;
                if (data.length > 0) {
                    var html = '<option value="">--请选择--</option>';
                    for (var i = 0; i < data.length; i++) {
                        html += '<option value="' + data[i] + '">' + data[i] + '</option>>';
                    }
                    $('#goodsType').append($(html));

                    form.render();
                }

            });

        }

        /**
         * 初始化货品名称
         */
        function initGoodsName(haha) {

            var goodsType = $('#goodsType option:selected').val();
            var req={
                goodsType:goodsType
            }

            $api.InitGoodsName(req, function (res) {
                var data = res.data;

                if (data.length > 0) {

                    var html = '<option value="">--请选择--</option>';
                    for (var i = 0; i < data.length; i++) {
                        html += '<option value="' + data[i].id + '">' + data[i].goodsName + '</option>>';
                    }
                    $('#goodsName').append($(html));

                    form.render();
                }
                $("[name='goodsName']").val(haha);
                form.render();

            });
        }



        /**
         * 监听select（initGoodsType）
         *
         *
         * 点击供应商名称初始化货品类型下拉框
         * */
        form.on('select(initGoodsType)',function(data) {
            //form.render();
            $('#goodsType option').remove();
            $('#goodsName option').remove();
            form.render();
            var req={
                supplierId:data.value
            }

            $api.GetGoodsTypeBySupplierId(req, function (res) {
                var data = res.data;
                if (data.length > 0) {
                    var html = '<option value="">--请选择--</option>';
                    for (var i = 0; i < data.length; i++) {
                        html += '<option value="' + data[i] + '">' + data[i] + '</option>>';
                    }
                    $('#goodsType').append($(html));
                    form.render();
                }

            });
        });

        /**
         * 监听select
         * 点击原料类型初始化原料名称下拉框
         */
        form.on('select(initGoodsName)',function(data){
            $('#goodsName option').remove();
            form.render();
            var req={
                goodsType:data.value
            }

            $api.InitGoodsName(req,function (res) {
                var data = res.data;
                if (data.length > 0) {

                    var html = '<option value="">--请选择--</option>';
                    for (var i = 0; i < data.length; i++) {
                        html += '<option value="' + data[i].id + '">' + data[i].goodsName + '</option>>';
                    }
                    $('#goodsName').append($(html));
                    form.render();
                }

            });
        });

        /**
         * 监听数量书总价
         *
         */
        $("#number").bind('input propertychange',function () {
            var supplierId = $("#supplierName option:selected").val()
            var goodsId = $("#goodsName option:selected").val()
            var number =  $("#number").val()
            var req={
                goodsId : goodsId,
                number : number,
                supplierId : supplierId
            }
            //方法在原料商品内
            $api.getPrice(req,function (data) {
                //自动计算总价

                var price = data.data;
                console.log(number)
                var totalPrice = number*price;
                $('#totalPrice').val(totalPrice);
            });
        });


        var queryArgs = $tool.getQueryParam();//获取查询参数
        var id = queryArgs['id'];
        var req = {
            id:id
        };


        $api.GetPurchase_Order(req,function (res) {
            var data = res.data;
            var audit = data.auditDescribe;
            var str = audit.split("&&");
            $("[name='supplierId']").val(data.supplierId);
            $("[name='goodsType']").val(data.goodsType);
            $("[name='goodsNumber']").val(data.goodsNumber);
            $("[name='totalPrice']").val(data.totalPrice);
            $("[name='auditDescribe']").val(str[0]);
            $("[name='auditDescribeByRepository']").val(str[1]);
            $("[name='auditDescribeByFinanceM']").val(str[2]);
            $("[name='applyDescribe']").val(data.applyDescribe);
            initGoodsName(data.goodsId);/*********************/
            /*if('1' === data.isSuper){
                var c=document.editRoleForm.isSuper;
                c.checked = true;
            }*/
            initBtn();
            form.render();//重新绘制表单，让修改生效
        });
    }

    init();



    /**
     * 审核结果
     * */
    form.on("submit(purchase_orderFilter_agree)", function (data) {
        var auditDescribe = data.field.auditDescribeByRepository;
        // isSuper = $tool.isBlank(isSuper)?'0':isSuper;
        var queryArgs = $tool.getQueryParam();//获取查询参数
        var agree = $(this).html();
        //请求
        var req = {
            id:queryArgs['id'],
            auditDescribe:auditDescribe,
            agree:agree
        };


        $api.ApplyBy_RepositoryM(req,function (data) {
            layer.msg("审核完成！",{time:1000},function () {
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            });
        });

        return false;
    })

});


