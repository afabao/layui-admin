package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.dao.system.SysSupplier_GoodsTestMapper;
import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.Supplier_Goods;
import com.gameloft9.demo.dataaccess.model.system.Supplier_GoodsTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;

import java.util.List;

public interface Supplier_GoodsService {

    /**
     *获取原料商品信息
     */
    List<Supplier_GoodsTest> getAll(String page, String limit, String goodsType, String supplierName);

    /**
     * 获取原料商品总条数
     */
    Integer getCount(String goodsType,String supplierName);

    /**
     * 初始化供应商名称下拉框
     * */
    List<SysSupplierTest> getSupplierName();

    /**
     * 初始化货品类型下拉框
     * */
    List<String> getGoodsType();

    /**
     * 初始化供应商电话
     *
     */
    String getPhone(String supplierId);

    /**
     * 初始化原料名称
     */
    List<MeterialTest> initGoodsName (String goodsType);

    /**
     * 添加原料商品
     */
    String addSupplier_Goods(Supplier_Goods supplier_goods);

    /**
     * 根据原料id查询单价
     */
    String getPrice(String goodsId,String supplier);

    /**
     * 根据id查找原料商品
     */
    Supplier_GoodsTest getById(String id);
}
