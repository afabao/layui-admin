package com.gameloft9.demo.dataaccess.dao.system;


import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysMeterialTestMapper {


    /**
     *获取原料分页
     */
    List<MeterialTest> getAll(
            @Param("start") int start,
            @Param("end") int end,
            @Param("goodsName") String goodsName,
            @Param("goodsType") String goodsType
    );

    /**
     * 获取原料总条数
     * @return
     */
    Integer getCount(
            @Param("goodsName") String goodsName,
            @Param("goodsType") String goodsType
    );

    /**
     * 添加原料
     * @param meterialTest
     */
    void addMeterial(MeterialTest meterialTest);

    /**
     * 根据名称查找原料
     *
     */
    MeterialTest getByGoodsName(String goodsName);

    /**
     * 根据id查找原料
     */
    MeterialTest getById(String id);

    /**
     * 修改原料
     */
    void updateMeterial(MeterialTest meterialTest);

    /**
     * 删除原料
     */
    void deleteMeterial(String id);


}
