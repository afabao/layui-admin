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
     * 采购员工分页显示订单列表
     */
    List<PurchaseOrderTest> getAll(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("start") int start,
            @Param("end") int end,
            @Param("allState") String allState//订单状态
            );

    /**
     * 采购员工获取总条数
     */
    Integer getCount(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("allState") String allState//订单状态
    );

    /**
     * 添加订单
     */
    void addPurchaseOrder(PurchaseOrderTest purchaseOrderTest);

    /**
     * 根据id获取申请信息
     */
    PurchaseOrderTest getById(String id);

    /**
     * 修改订单申请
     */
    void updatePurchase_Order(PurchaseOrderTest purchaseOrderTest);

    /**
     * 删除订单
     */
    void deletePurchase_Order(String id);

    /**
     * 提交订单
     */
    void buyerCommit(PurchaseOrderTest purchaseOrderTest);

    /**
     * 查询订单状态
     */
    String findState(String id);

    /**
     * 采购领导分页显示订单列表
     */
    List<PurchaseOrderTest> getAllByBuyerM(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("start") int start,
            @Param("end") int end,
            @Param("allState") String allState,//订单状态
            @Param("notCommit") String notCommit//未提交
    );

    /**
     * 采购领导获取总条数
     */
    Integer getCountByBuyerM(
            @Param("startTime") Date startTime,//查询开始时间
            @Param("endTime") Date endTime,//查询终止时间
            @Param("allState") String allState,//订单状态
            @Param("notCommit") String notCommit//未提交
    );

    /**
     * 采购部领导审批
     */
    void applyByM(PurchaseOrderTest purchaseOrderTest);

    /**
     * 撤回申请
     */
    void recall(PurchaseOrderTest purchaseOrderTest);



}
