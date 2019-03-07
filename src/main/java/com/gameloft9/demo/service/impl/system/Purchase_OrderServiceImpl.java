package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.Purchase_OrderTestMapper;
import com.gameloft9.demo.dataaccess.dao.system.SysMeterialTestMapper;
import com.gameloft9.demo.dataaccess.dao.system.SysSupplierTestMapper;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.gameloft9.demo.dataaccess.model.system.UserTest;
import com.gameloft9.demo.service.api.system.Purchase_OrderService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.StatePayInfo;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class Purchase_OrderServiceImpl implements Purchase_OrderService {


    @Autowired
    Purchase_OrderTestMapper purchase_orderMapper;
    @Autowired
    SysMeterialTestMapper sysMeterialTestMapper;
    @Autowired
    SysSupplierTestMapper sysSupplierTestMapper;
    //根据供应商id查找原料
    public List<String> getGoodsTypeBySupplierId(String supplierId) {
        return purchase_orderMapper.getGoodsTypeBySupplierId(supplierId);
    }

    //分页查询订单
    public List<PurchaseOrderTest> getAll(Date startTime, Date endTime, String page, String limit, String auditState) {
        PageRange pageRange = new PageRange(page,limit);
        return purchase_orderMapper.getAll(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),auditState);

    }

    //查询总条数
    public Integer getCount(Date startTime, Date endTime, String state) {
        return purchase_orderMapper.getCount(startTime,endTime,state);
    }

    public String addPurchaseOrder(PurchaseOrderTest purchaseOrderTest) {
        /*已有数据PurchaseOrderTest
        (id=null,,
        number=null,,
         goodsId=1c3da2c5d97e4c28bf9404346d3a3997,,
         goodsName=null,,
         supplierId=25ef61dbca5841dd9e35214500194876,,
         supplierName=null,,
         goodsNumber=10,,
         totalPrice=130.0,,
         applyUser=null,,
         applyTime=null,,
         state=null,,
         orderAuditUser=null,
         orderAuditTime=null,
         payAuditUser=null,
         payAuditTime=null,
         payState=null,,
         applyDescribe=请问,,
         auditDescribe=null),
         */
        //设置订单id
        purchaseOrderTest.setId(UUIDUtil.getUUID());
        //设置和订单编号number
        purchaseOrderTest.setOrderNumber(UUIDUtil.getUUID());
        //设置原料名称goodsName
        purchaseOrderTest.setGoodsName(sysMeterialTestMapper.getNameById(purchaseOrderTest.getGoodsId()));
        //设置供应商名称supplierName
        purchaseOrderTest.setSupplierName(sysSupplierTestMapper.getNameById(purchaseOrderTest.getSupplierId()));
        //设置申请人applyUser，
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String loginName = (String) request.getSession().getAttribute("sysUser");
        purchaseOrderTest.setApplyUser(loginName);
        //设置申请时间applyTime，
        purchaseOrderTest.setApplyTime(new Date());
        //审核状态，
        purchaseOrderTest.setAuditState(StatePayInfo.APPLY_INFO_WAITING);
        //支付状态，
        purchaseOrderTest.setPayState(StatePayInfo.PAY_INFO_WATING);
        //申请原因，
        purchaseOrderTest.setApplyDescribe(purchaseOrderTest.getApplyDescribe());

        purchase_orderMapper.addPurchaseOrder(purchaseOrderTest);
        return purchaseOrderTest.getId();
    }


}
