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
     * 初始化页面
     * */

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
            $("[name='goodsNameId']").val(haha);
            //alert(haha)
            form.render();

        });
    }

    function init() {
        initSupplierName();
        initGoodsType();

        var queryArgs = $tool.getQueryParam();//获取查询参数
        var id = queryArgs['id'];
       // console.log(queryArgs)
        var req = {
            id:id
        };



        $api.GetSupplier_Goods(req,function (res) {
            var data = res.data;
            console.log(data)
            $("[name='supplierNameId']").val(data.supplierId);
            $("[name='phone']").val(data.phone);
            $("[name='goodsType']").val(data.goodsType);
            initGoodsName(data.materialId);
            //$("[name='goodsName']").val(data.materialId);
            $("[name='goodsPrice']").val(data.goodsPrice);
            /*if('1' === data.isSuper){
                var c=document.editRoleForm.isSuper;
                c.checked = true;
            }*/
            form.render();//重新绘制表单，让修改生效
        });
    }
    init();

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
    form.on("submit(editSupplier_Goods)", function (data) {
        var supplierId = data.field.supplierNameId;
        var materialId = data.field.goodsNameId;
        var goodsPrice = data.field.goodsPrice;
        /*var phone = data.field.phone;*/
        // isSuper = $tool.isBlank(isSuper)?'0':isSuper;

        var queryArgs = $tool.getQueryParam();//获取查询参数

        //请求
        var req = {
            id:queryArgs['id'],
            supplierId:supplierId,
            materialId:materialId,
            goodsPrice:goodsPrice,
            /*phone:phone,*/
            /*isSuper:isSuper*/
        };

        $api.UpdateSupplier_Goods(req,function (data) {
            layer.msg("修改成功！",{time:1000},function () {
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            });
        });

        return false;
    })

});


