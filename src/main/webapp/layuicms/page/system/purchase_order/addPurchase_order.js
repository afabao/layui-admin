layui.config({
    base: $config.resUrl+'layuicms/common/js/'//定义基目录
}).extend({
    ajaxExtention: 'ajaxExtention',//加载自定义扩展，每个业务js都需要加载这个ajax扩展
    $tool: 'tool',
    $api:'api'
}).use(['form', 'layer', 'jquery', 'ajaxExtention', '$tool','$api'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        laypage = layui.laypage,
        $ = layui.jquery,
        $tool = layui.$tool ,
        $api = layui.$api;
    /**
     * 页面初始化
     * */
    function init() {
        //初始化供应商名称下拉框
        initSupplierName();
    }

    init();


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
     * 监听select（initGoodsType）
     *
     *
     * 点击供应商名称初始化货品类型下拉框
     * */
    form.on('select(initGoodsType)',function(data) {
        //console.log(data.value)
        //form.render();
        $('#goodsType option').remove();
        $('#goodsName option').remove();
        form.render();
        var req={
            supplierId:data.value
        }

        $api.GetGoodsTypeBySupplierId(req, function (res) {
            var data = res.data;
            console.log(res)
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
        // $('#supplierName').html('<option value="">--请选择--</option>');
        //alert(1);
        $('#goodsName option').remove();
        //console.log(data.value)
        form.render();
        var req={
            goodsType:data.value
        }

        $api.InitGoodsName(req,function (res) {
            var data = res.data;

            console.log(res)
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
        console.log(supplierId)
        var req={
            goodsId : goodsId,
            number : number,
            supplierId : supplierId
        }

        //方法在原料商品内
        $api.getPrice(req,function (data) {
            //自动计算总价
            var price = data.data;
            var totalPrice = number*price;
            $('#totalPrice').val(totalPrice);
        });
    });


    /**
     * 表单提交
     * */
    form.on("submit(addPurchase_Order)", function (data) {
        var supplierId = data.field.supplierId;
        var goodsId = data.field.goodsId;
        var goodsType = data.field.goodsType;
        var goodsNumber = data.field.goodsNumber;
        var totalPrice = data.field.totalPrice;
        var applyDescribe = data.field.applyDescribe;

        //console.log(data)
        /*var parentMenuId = data.field.parentMenuId;
        var requestUrl = data.field.requestUrl;
        var sort = data.field.sort;*/

        //请求
        var req = {
            supplierId:supplierId,
            goodsId:goodsId,
            goodsNumber: goodsNumber,
            goodsType: goodsType,
            totalPrice: totalPrice,
            applyDescribe: applyDescribe
        };

        $api.AddPurchaseOrder(req,function (data) {
            //top.layer.close(index);(关闭遮罩已经放在了ajaxExtention里面了)
            layer.msg("供应商添加成功！", {time: 1000}, function () {
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            });
        });

        return false;
    })

});


