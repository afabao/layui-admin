/**
 * api接口列表
 * Created by gameloft9 on 2018/7/19.
 */
layui.define(['$tool','jquery'], function (exports) {

    var $tool = layui.$tool,
        $ = layui.jquery;// 拿到模块变量

    /**
     * 封装一个post
     * */
    function doPost(url,req,successCallback,errorCallback) {
        $.ajax({
            url:url,
            data:req,
            method:"post",
            success:function (data) {
                successCallback(data);
            },
            error:function (error) {
                errorCallback(error);
            }
        });
    }

    /**
     * 封装一个get
     * */
    function doGet(url,req,successCallback,errorCallback) {
        $.ajax({
            url:url,
            data:req,
            method:"get",
            success:function (data) {
                successCallback(data);
            },
            error:function (error) {
                errorCallback(error);
            }
        });
    }

    /**
     * 封装一个支持更多参数的post
     * */
    function doComplexPost(url,req,config,successCallback,errorCallback) {
        var defaultConfig = {
            url:url,
            data:req,
            method:"post",
            success:function (data) {
                successCallback(data);
            },
            error:function (error) {
                errorCallback(error);
            }
        };
        var ajaxConfig = $.extend({},config,defaultConfig); // 合并参数

        $.ajax(ajaxConfig);
    }

    // API列表,工程庞大臃肿后可以将API拆分到单独的模块中
    var API = {
        Login: function(req,successCallback,errorCallback){ // 登录
            doPost($tool.getContext() + "login",req,successCallback,errorCallback);
        },
        LogOut:function(req,successCallback,errorCallback){ // 登出
            doPost($tool.getContext() + 'logout.do',req,successCallback,errorCallback);
        },
        ChangePwd:function(req,successCallback,errorCallback){ // 更改密码
            doPost($tool.getContext() + 'personCenter/changePwd.do',req,successCallback,errorCallback);
        },
        GetRoleList:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'personCenter/roleList.do',req,successCallback,errorCallback);
        },
        DeleteLog:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'log/delete.do',req,successCallback,errorCallback);
        },
        BatchDeleteLog:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext() + 'log/batchDelete.do',req,config,successCallback,errorCallback);
        },
        GetFirstClassMenus:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'menu/firstClassMenus.do',req,successCallback,errorCallback);
        },
        AddMenu:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'menu/add.do',req,successCallback,errorCallback);
        },
        DeleteMenu:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'menu/delete.do',req,successCallback,errorCallback);
        },
        GetMenu:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'menu/get.do',req,successCallback,errorCallback);
        },
        UpdateMenu:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext()+'menu/update.do',req,config,successCallback,errorCallback);
        },
        GetAllOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/getAll.do',req,successCallback,errorCallback);
        },
        GetOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/get.do',req,successCallback,errorCallback);
        },
        AddOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/add.do',req,successCallback,errorCallback);
        },
        UpdateOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/update.do',req,successCallback,errorCallback);
        },
        DeleteOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/delete.do',req,successCallback,errorCallback);
        },
        AddRole:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'role/add.do',req,successCallback,errorCallback);
        },
        DeleteRole:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'role/delete.do',req,successCallback,errorCallback);
        },
        GetRole:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'role/get.do',req,successCallback,errorCallback);
        },
        UpdateRole:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'role/update.do',req,successCallback,errorCallback);
        },
        AddUser:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext() + 'sysUser/add.do',req,config,successCallback,errorCallback);
        },
        DeleteUser:function(req,config,successCallback,errorCallback){
            doPost($tool.getContext() + 'sysUser/delete.do',req,config,successCallback,errorCallback);
        },
        InitPwd:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'sysUser/initPwd.do',req,successCallback,errorCallback);
        },
        GetUser:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'sysUser/get.do',req,successCallback,errorCallback);
        },
        UpdateUser:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext() + 'sysUser/update.do',req,config,successCallback,errorCallback);
        },
        GetUserInfo:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'personCenter/get.do',req,successCallback,errorCallback);
        },
        UpdateUserInfo:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext() + 'personCenter/update.do',req,config,successCallback,errorCallback);
        },


        /*Supplier*/
        //添加供应商
        AddSupplier:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'supplier/add.do',req,successCallback,errorCallback);
        },
        //修改供应商
        UpdateSupplier:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'supplier/update.do',req,successCallback,errorCallback);
        },
        //根据id查找供应商
        GetSupplier:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'supplier/get.do',req,successCallback,errorCallback);
        },
        //根据id删除供应商
        DeleteSupplier:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'supplier/delete.do',req,successCallback,errorCallback);
        },


        /*Meterial*/
        //添加原料
        AddMeterial:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'meterial/add.do',req,successCallback,errorCallback);
        },
        //修改原料
        UpdateMeterial:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'meterial/update.do',req,successCallback,errorCallback);
        },
        //根据id查找原料
        GetMeterial:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'meterial/get.do',req,successCallback,errorCallback);
        },
        //根据id删除原料
        DeleteMeterial:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'meterial/delete.do',req,successCallback,errorCallback);
        },


        /*Supplier_goods*/
        //添加原料商品
        AddSupplier_Goods:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'supplier_goods/add.do',req,successCallback,errorCallback);
        },
        //修改原料商品
        UpdateSupplier_Goods:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'supplier_goods/update.do',req,successCallback,errorCallback);
        },
        //根据id查找原料商品
        GetSupplier_Goods:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'supplier_goods/get.do',req,successCallback,errorCallback);
        },
        //根据id删除原料商品
        DeleteSupplier_Goods:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'supplier_goods/delete.do',req,successCallback,errorCallback);
        },
        //初始化供应商名称下拉框
        GetSupplierName:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'supplier_goods/getSupplierName.do',req,successCallback,errorCallback);
        },
        //初始化货品类型下拉框
        GetGoodsType:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'supplier_goods/getGoodsType.do',req,successCallback,errorCallback);
        },
        //初始化供应商电话
        InitPhone:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'supplier_goods/getPhone.do',req,successCallback,errorCallback);
        },
        //初始货品名称
        InitGoodsName:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'supplier_goods/getGoodsName.do',req,successCallback,errorCallback);
        },
        //单价乘以数量=总价
        getPrice:function(req,successCallback,errorCallback){
        doPost($tool.getContext() + 'supplier_goods/getPrice.do',req,successCallback,errorCallback);
        },


        /*订单*/
        //点击供应商名称后初始化原料类型
        GetGoodsTypeBySupplierId:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/getGoodsTypeBySupplierId.do',req,successCallback,errorCallback);
        },
        //添加订单
        AddPurchaseOrder:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/add.do',req,successCallback,errorCallback);
        },
        //根据id获取订单
        GetPurchase_Order:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/get.do',req,successCallback,errorCallback);
        },
        //修改订单申请
        UpdatePurchase_Order:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/update.do',req,successCallback,errorCallback);
        },
        //删除订单申请
        DeletePurchase_Order:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/delete.do',req,successCallback,errorCallback);
        },
        //提交订单申请
        buyerCommit:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/buyerCommit.do',req,successCallback,errorCallback);
        },
        //查询订单状态
        findState:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/findState.do',req,successCallback,errorCallback);
        },
        //审核订单结果（本部门）
        ApplyBy_M:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/applyPassInfo.do',req,successCallback,errorCallback);
        },
        //撤回申请（本部门）
        recall:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'purchase_order/recall.do',req,successCallback,errorCallback);
        },

    };




    //输出扩展模块
    exports('$api', API);
});


