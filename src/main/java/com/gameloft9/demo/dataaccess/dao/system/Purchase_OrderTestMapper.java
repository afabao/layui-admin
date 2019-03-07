package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface Purchase_OrderTestMapper {

    /**
     *根据供应商id查找原料
     */
    List<String> getGoodsTypeBySupplierId(String supplierId);

    /**
     * 分页显示订单列表
     */
    List<PurchaseOrderTest> getAll(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("start") int start,
            @Param("end") int end,
            @Param("auditState") String auditState//订单状态
            );

    /**
     * 获取总条数
     */
    Integer getCount(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("auditState") String auditState//订单状态
    );

    /**
     * 添加订单
     */
    void addPurchaseOrder(PurchaseOrderTest purchaseOrderTest);
}
