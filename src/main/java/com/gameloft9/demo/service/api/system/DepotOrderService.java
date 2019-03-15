package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.model.system.DepotOrderTest;

public interface DepotOrderService {

    /**
     * 初始化入库单
     */
    String initDepotOrder(DepotOrderTest depotOrderTest,String supplier_material_id);
}
