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
    function init() {
        var queryArgs = $tool.getQueryParam();//获取查询参数
        var id = queryArgs['id'];
        var req = {
            id:id
        };

        $api.GetMeterial(req,function (res) {
            var data = res.data;
            /*$("[name='roleName']").val(data.roleName);*/
            $("[name='goodsName']").val(data.goodsName);
            $("[name='goodsType']").val(data.goodsType);
            $("[name='goodsDescribe']").val(data.goodsDescribe);
            /*if('1' === data.isSuper){
                var c=document.editRoleForm.isSuper;
                c.checked = true;
            }*/
            form.render();//重新绘制表单，让修改生效
        });
    }
    init();


    /**
     * 表单提交
     * */
    form.on("submit(editMeterial)", function (data) {
        var goodsName = data.field.goodsName;
        var goodsType = data.field.goodsType;
        var goodsDescribe = data.field.goodsDescribe;
        // isSuper = $tool.isBlank(isSuper)?'0':isSuper;

        var queryArgs = $tool.getQueryParam();//获取查询参数

        //请求
        var req = {
            id:queryArgs['id'],
            goodsName:goodsName,
            goodsType:goodsType,
            goodsDescribe:goodsDescribe,
            /*isSuper:isSuper*/
        };

        $api.UpdateMeterial(req,function (data) {
            layer.msg("修改成功！",{time:1000},function () {
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            });
        });

        return false;
    })

});


