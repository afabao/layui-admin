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
        //初始化货品类型下拉框
        initGoodsType();
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
     * 初始化货品类型下拉框
     * */
    function initGoodsType() {
        $api.GetGoodsType(null,function (res) {
            var data = res.data;

            //console.log(res)
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
         * 监听select
         */
        form.on('select(initPhone)',function(data){
            $('#supllierPhoe').val("");
            var req={
                supplierId:data.value
            }
            $api.InitPhone(req,function(res) {
                var data = res;
                //console.log(data);
                $('#supllierPhoe').val(data.data);
            });
        });

    /**
     * 监听select
     */
    form.on('select(initGoodsName)',function(data){
        // $('#supplierName').html('<option value="">--请选择--</option>');
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
     * 表单提交
     * */
    form.on("submit(addSupplier_Goods)", function (data) {
        var supplierName = data.field.supplierNameId;
        var phone = data.field.phone;
        var goodsType = data.field.goodsType;
        var goodsName = data.field.goodsName;
        var goodsPrice = data.field.goodsPrice;

        //console.log(data)
        /*var parentMenuId = data.field.parentMenuId;
        var requestUrl = data.field.requestUrl;
        var sort = data.field.sort;*/

        //请求
        var req = {
            supplierName:supplierName,
            phone:phone,
            goodsType: goodsType,
            goodsName: goodsName,
            goodsPrice: goodsPrice
            /*parentMenuId:parentMenuId,
            requestUrl:requestUrl,
            sort:sort*/
        };

        $api.AddSupplier_Goods(req,function (data) {
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


