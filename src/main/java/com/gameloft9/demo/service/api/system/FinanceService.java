package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;

import java.util.List;

public interface FinanceService {

    /**
     * 仓库分页显示订单列表
     */
    List<PurchaseOrderTest> getAllByfinanceM(
            String startTime,//查询开始时间
            String endTime,//查询终止时间
            String page,
            String limit,
            String allState//订单状态
    );


    /**
     * 仓库领导获取总条数
     */
    Integer getCountByfinanceM(
            String startTime,//查询开始时间
            String endTime,//查询终止时间
            String allState//订单状态
    );

    /**
     * 仓库审核订单
     */
    Boolean applyCheckByFinance(String id,String auditDescribe,String agree);

}
