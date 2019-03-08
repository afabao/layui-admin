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


}
