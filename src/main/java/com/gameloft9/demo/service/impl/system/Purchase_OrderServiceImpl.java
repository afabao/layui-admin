package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.Purchase_OrderTestMapper;
import com.gameloft9.demo.dataaccess.dao.system.SysMeterialTestMapper;
import com.gameloft9.demo.dataaccess.dao.system.SysSupplierTestMapper;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    public List<PurchaseOrderTest> getAll(String startTime1, String endTime1, String page, String limit, String allState) {
        PageRange pageRange = new PageRange(page,limit);
        Date startTime = null;
        Date endTime = null;
        if(startTime1 != null && !"".equals(startTime1)){
            startTime = new Date();
            endTime = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            try {
                startTime = format.parse(startTime1);
                endTime = format.parse(endTime1);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return purchase_orderMapper.getAll(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),allState);
        }

        return purchase_orderMapper.getAll(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),allState);

    }

    //查询总条数
    public Integer getCount(String startTime1, String endTime1, String allState) {
        Date startTime = null;
        Date endTime = null;
        if(startTime1 != null && !"".equals(startTime1)){
            startTime = new Date();
            endTime = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            try {
                startTime = format.parse(startTime1);
                endTime = format.parse(endTime1);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return purchase_orderMapper.getCount(startTime,endTime,allState);
        }

        return purchase_orderMapper.getCount(startTime,endTime,allState);
    }

    //添加订单申请
    public String addPurchaseOrder(PurchaseOrderTest purchaseOrderTest) {
        /*已有数据PurchaseOrderTest
        (id=null,,
        number=null,,
         goodsId=1c3da2c5d97e4c28bf9404346d3a3997,,
         goodsType=null,
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
        /*purchaseOrderTest.setApplyTime(new Date());*/
        //审核状态，
        purchaseOrderTest.setAuditState(StatePayInfo.APPLY_INFO_NO_SUBMIT);
        //支付状态，
        purchaseOrderTest.setPayState(StatePayInfo.PAY_INFO_WATING);
        //申请原因，
        purchaseOrderTest.setApplyDescribe(purchaseOrderTest.getApplyDescribe());

        purchase_orderMapper.addPurchaseOrder(purchaseOrderTest);
        return purchaseOrderTest.getId();
    }

    //根据id查找订单申请
    public PurchaseOrderTest getById(String id) {
        return purchase_orderMapper.getById(id);
    }

    //修改订单申请
    public Boolean updatePurchase_Order(PurchaseOrderTest purchaseOrderTest) {
        CheckUtil.notBlank(purchaseOrderTest.getId(),"订单id为空");
        purchase_orderMapper.updatePurchase_Order(purchaseOrderTest);
        return true;
    }

    /**
     * 删除订单
     */
    public Boolean deletePurchase_Order(String id) {
        CheckUtil.notBlank(id,"订单id为空");
        purchase_orderMapper.deletePurchase_Order(id);
        return true;
    }

    /**
     * 提交订单
     *
     */
    public Boolean buyerCommit(PurchaseOrderTest purchaseOrderTest) {
        CheckUtil.notBlank(purchaseOrderTest.getId(),"订单id为空");
        purchaseOrderTest.setAuditState(StatePayInfo.APPLY_INFO_WAITING);
        purchase_orderMapper.buyerCommit(purchaseOrderTest);
        return true;
    }

    /**
     * 查询订单状态
     *
     */
    public String findState(String id) {
        CheckUtil.notBlank(id,"订单id为空");
        return purchase_orderMapper.findState(id);
    }

    /**
     * 采购领导分页显示订单列表
     */
    public List<PurchaseOrderTest> getAllByBuyerM(String startTime1, String endTime1, String page, String limit, String allState,String notCommit) {
        PageRange pageRange = new PageRange(page,limit);
        notCommit = StatePayInfo.APPLY_INFO_NO_SUBMIT;
        Date startTime = null;
        Date endTime = null;
        if(startTime1 != null && !"".equals(startTime1)){
            startTime = new Date();
            endTime = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            try {
                startTime = format.parse(startTime1);
                endTime = format.parse(endTime1);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return purchase_orderMapper.getAllByBuyerM(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),allState,notCommit);
        }

        return purchase_orderMapper.getAllByBuyerM(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),allState,notCommit);

    }


    /**
     * 采购领导获取总条数
     */
    public Integer getCountByBuyerM(String startTime1, String endTime1, String allState, String notCommit) {
        Date startTime = null;
        Date endTime = null;
        if(startTime1 != null && !"".equals(startTime1)){
            startTime = new Date();
            endTime = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            try {
                startTime = format.parse(startTime1);
                endTime = format.parse(endTime1);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return purchase_orderMapper.getCountByBuyerM(startTime,endTime,allState,notCommit);
        }

        return purchase_orderMapper.getCountByBuyerM(startTime,endTime,allState,notCommit);
    }


}
