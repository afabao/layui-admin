package com.gameloft9.demo.service.api.system;


import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface Purchase_OrderService {

    /**
     *根据供应商id查找原料
     */
    List<String> getGoodsTypeBySupplierId(String supplierId);

    /**
     * 分页显示订单列表
     */
    List<PurchaseOrderTest> getAll(String startTime,
                                   String endTime,
                                   String page,
                                   String limit,
                                   String allState
    );

    /**
     * 获取总条数
     */
    Integer getCount(
            String startTime,//查询开始时间
            String endTime,//查询终止时间
            String allState//订单状态
    );

    /**
     * 添加订单
     */
    String addPurchaseOrder(PurchaseOrderTest purchaseOrderTest);

    /**
     * 根据id获取申请信息
     */
    PurchaseOrderTest getById(String id);

    /**
     * 修改订单申请
     *
     */
    Boolean updatePurchase_Order(PurchaseOrderTest purchaseOrderTest);

    /**
     * 删除订单
     */
    Boolean deletePurchase_Order(String id);

    /**
     * 提交订单
     */
    Boolean buyerCommit(PurchaseOrderTest purchaseOrderTest);

    /**
     * 查询订单状态
     */
    String findState(String id);

    /**
     * 采购领导分页显示订单列表
     */
    List<PurchaseOrderTest> getAllByBuyerM(String startTime1, String endTime1, String page, String limit, String allState,String notCommit);

    /**
     * 采购领导获取总条数
     */
    Integer getCountByBuyerM(String startTime1, String endTime1, String allState, String notCommit);

    /**
     * 采购部领导审批结果
     * id:queryArgs['id'],
     *             auditDescribe:auditDescribe,
     *             agree:agree,
     *             disagree:disagree
     */
    Boolean applyByM(String id,String auditDescribe,String agree);

    /**
     * 撤回申请
     */
    Boolean recall(String id);


}
