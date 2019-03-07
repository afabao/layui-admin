package com.gameloft9.demo.service.api.system;


import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
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
    List<PurchaseOrderTest> getAll(Date startTime,
                                   Date endTime,
                                   String page,
                                   String limit,
                                   String state
    );

    /**
     * 获取总条数
     */
    Integer getCount(
            Date startTime,//查询开始时间
            Date endTime,//查询终止时间
            String state//订单状态
    );

    /**
     * 添加订单
     */
    String addPurchaseOrder(PurchaseOrderTest purchaseOrderTest);
}
