package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface FinanceMapper {
    /**
     * 仓库分页显示订单列表
     */
    List<PurchaseOrderTest> getAllByfinanceM(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("start") int start,
            @Param("end") int end,
            @Param("allState") String allState,//订单状态
            @Param("contain") String contain//包含的订单状态
    );


    /**
     * 仓库领导获取总条数
     */
    Integer getCountByfinanceM(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("allState") String allState,//订单状态
            @Param("contain") String contain//包含的订单状态
    );

    /**
     * 仓库审核订单
     */
    void applyCheckByFinance(PurchaseOrderTest purchaseOrderTest);
}
