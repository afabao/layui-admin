package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MeterialService {

    /**
     *获取原料分页
     */
    List<MeterialTest> getAll(String page, String limit, String goodsName, String goodsType);

    /**
     * 获取原料总条数
     * @return
     */
    Integer getCount(String goodsName, String goodsType);

    /**
     * 添加原料
     * @param meterialTest
     */
    String addMeterial(MeterialTest meterialTest);


    /**
     * 根据id查找原料
     */
    MeterialTest getById(String id);

    /**
     * 修改原料
     */
    Boolean updateMeterial(MeterialTest meterialTest);

    /**
     * 删除原料
     */
    Boolean deleteMeterail(String id);
}
