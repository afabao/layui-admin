package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface RepositoryService {

    /**
     * 仓库分页显示订单列表
     */
    List<PurchaseOrderTest> getAllByRepositoryM(
            String startTime,//查询开始时间
            String endTime,//查询终止时间
            String page,
            String limit,
            String allState//订单状态

    );

    /**
     * 仓库领导获取总条数
     */
    Integer getCountByRepositoryM(
            String startTime,//查询开始时间
            String endTime,//查询终止时间
            String allState//订单状态

    );

    /**
     * 仓库审核订单申请
     */
    Boolean applyCheckByRepository(String id,String auditDescribe,String agree);
}
