package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface RepositoryMapper {

    /**
     * 仓库分页显示订单列表
     */
    List<PurchaseOrderTest> getAllByRepositoryM(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("start") int start,
            @Param("end") int end,
            @Param("allState") String allState,//订单状态
            @Param("notContain") List<String> notContain//不包含的订单状态
    );

    /**
     * 仓库领导获取总条数
     */
    Integer getCountByRepositoryM(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("allState") String allState,//订单状态
            @Param("notContain") List<String> notContain//不包含的订单状态
    );

    /**
     * 仓库领导审核订单申请
     */
    void applyCheckByRepository(PurchaseOrderTest purchaseOrderTest);
}
