package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.DepotOrderMapper;
import com.gameloft9.demo.dataaccess.dao.system.SysMeterialTestMapper;
import com.gameloft9.demo.dataaccess.dao.system.SysSupplier_GoodsTestMapper;
import com.gameloft9.demo.dataaccess.model.system.DepotOrderTest;
import com.gameloft9.demo.service.api.system.DepotOrderService;
import com.gameloft9.demo.utils.OrderTypeUtil;
import com.gameloft9.demo.utils.StatePayInfo;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Service
@Transactional
public class DepotOrderServiceImpl implements DepotOrderService {

    @Autowired
    DepotOrderMapper depotOrderMapper;

    @Autowired
    SysSupplier_GoodsTestMapper sysSupplier_goodsTestMapper;

    @Autowired
    SysMeterialTestMapper meterialTestMapper;



    /**
     * 初始化入库单
     */

    public String initDepotOrder(DepotOrderTest depotOrderTest,String supplier_material_id) {
        //id
        depotOrderTest.setId(UUIDUtil.getUUID());
        //订单类型，原料入库
        depotOrderTest.setOrderType(OrderTypeUtil.GOODS_INBOUND);
        //原料商品id
        depotOrderTest.setGoodsId(supplier_material_id);
        //供应商名称
        String supplierName = sysSupplier_goodsTestMapper.findSupplierNameById(supplier_material_id);
        depotOrderTest.setSupplierName(supplierName);
        //TODO....
        //货物类型

        //TODO....
        //货物名称
        //TODO....
        //购买数量
        //TODO....
        //订单申请者
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String username = (String) request.getSession().getAttribute("sysUser");
        depotOrderTest.setApplyUser(username);
        //审核状态
        depotOrderTest.setState(StatePayInfo.APPLY_INFO_WAITING);
        return depotOrderTest.getId();
    }
}
