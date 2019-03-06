package com.gameloft9.demo.dataaccess.dao.system;


import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.Supplier_Goods;
import com.gameloft9.demo.dataaccess.model.system.Supplier_GoodsTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysSupplier_GoodsTestMapper {

    /**
     *获取原料商品信息
     */
    List<Supplier_GoodsTest> getAll(
            @Param("start") int start,
            @Param("end") int end,
            @Param("goodsType") String goodsType,
            @Param("supplierName") String supplierName
    );

    /**
     * 获取原料商品总条数
     */
    Integer getCount(
            @Param("goodsType") String goodsType,
            @Param("supplierName") String supplierName
    );

    /**
     * 初始化供应商名称下拉框
     * */
    List<SysSupplierTest> getSupplierName();

    /**
     * 初始化货品类型下拉框
     * */
    /*List<MeterialTest> getGoodsType();*/
    List<String> getGoodsType();

    /**
     * 初始化供应商电话
     */
    String getPhone(String supplierId);

    /**
     * 初始化原料名称
     */
    List<MeterialTest> initGoodsName (String goodsType);

    /**
     * 添加原料商品
     */
    void addSupplier_Goods(Supplier_GoodsTest supplier_GoodsTest);
}
