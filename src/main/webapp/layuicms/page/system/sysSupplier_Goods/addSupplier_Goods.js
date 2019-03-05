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
            console.log(data)
            if (data.length > 0) {
                var html = '<option value="">--请选择--</option>';
                for (var i = 0; i < data.length; i++) {
                    html += '<option value="' + data[i].id + '">' + data[i].goodsType + '</option>>';
                }
                $('#goodsType').append($(html));
                form.render();
            }
        });
    }

    /**
     * 监听radio选择
     * */
    form.on('radio(menuTypeFilter)', function (data) {
        //console.log(data.elem); //得到radio原始DOM对象
        var value = data.value;
        if ('2' === value) {//二级菜单
            $('.parent-menu').removeClass('layui-hide');
            $('.parent-menu').addClass('layui-anim-up');
        }else{
            $('.parent-menu').addClass('layui-hide');
            $('.parent-menu').removeClass('layui-anim-up');
        }
    });

    /**
     * 表单提交
     * */
    form.on("submit(addMenu)", function (data) {
        var supplierName = data.field.supplierName;
        var supplierDescribe = data.field.supplierDescribe;
        var phone = data.field.phone;
        /*var parentMenuId = data.field.parentMenuId;
        var requestUrl = data.field.requestUrl;
        var sort = data.field.sort;*/

        //请求
        var req = {
            supplierName:supplierName,
            supplierDescribe: supplierDescribe,
            phone: phone,
            /*parentMenuId:parentMenuId,
            requestUrl:requestUrl,
            sort:sort*/
        };

        $api.AddSupplier(req,function (data) {
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


