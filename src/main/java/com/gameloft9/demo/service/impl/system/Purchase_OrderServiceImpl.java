package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.Purchase_OrderTestMapper;
import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.gameloft9.demo.service.api.system.Purchase_OrderService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import com.sun.xml.internal.bind.v2.TODO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class Purchase_OrderServiceImpl implements Purchase_OrderService {


    @Autowired
    Purchase_OrderTestMapper purchase_orderMapper;
    //根据供应商id查找原料
    public List<String> getGoodsTypeBySupplierId(String supplierId) {
        return purchase_orderMapper.getGoodsTypeBySupplierId(supplierId);
    }

    //分页查询订单
    public List<PurchaseOrderTest> getAll(Date startTime, Date endTime, String page, String limit, String state) {
        PageRange pageRange = new PageRange(page,limit);
        return purchase_orderMapper.getAll(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),state);

    }

    //查询总条数
    public Integer getCount(Date startTime, Date endTime, String state) {
        return purchase_orderMapper.getCount(startTime,endTime,state);
    }

    public String addPurchaseOrder(PurchaseOrderTest purchaseOrderTest) {
        /*已有数据PurchaseOrderTest
        (id=null,
        number=null,
         goodsId=1c3da2c5d97e4c28bf9404346d3a3997,
         goodsName=null,
         supplierId=25ef61dbca5841dd9e35214500194876,
         supplierName=null,
         goodsNumber=10,
         totalPrice=130.0,
         applyUser=null,
         applyTime=null,
         state=null,
         orderAuditUser=null,
         orderAuditTime=null,
         payAuditUser=null,
         payAuditTime=null,
         applyDescribe=请问,
         auditDescribe=null)*/
        purchaseOrderTest.setId(UUIDUtil.getUUID());
        purchaseOrderTest.setNumber(UUIDUtil.getUUID());

        purchase_orderMapper.addPurchaseOrder(purchaseOrderTest);
        return purchaseOrderTest.getId();
    }


}
