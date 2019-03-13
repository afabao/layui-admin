package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.Supplier_Goods;

import java.util.List;

public interface ChartMapper {

    /**
     * 获取原料商品所有数据
     * @return
     *      返回原料商品列表
     */
    List<Supplier_Goods> getAll();
}
