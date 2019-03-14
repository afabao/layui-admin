package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.FinanceMapper;
import com.gameloft9.demo.dataaccess.dao.system.Purchase_OrderTestMapper;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.FinanceService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.DateFormatUtil;
import com.gameloft9.demo.utils.GetCurrentUserUtils;
import com.gameloft9.demo.utils.StatePayInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class FinanceServiceImpl implements FinanceService {

    @Autowired
    FinanceMapper financeMapper;
    @Autowired
    Purchase_OrderTestMapper purchase_orderTestMapper;

    //分页显示
    public List<PurchaseOrderTest> getAllByfinanceM(String startTime1, String endTime1, String page, String limit, String allState) {
        PageRange pageRange = new PageRange(page,limit);
        Date startTime = null;
        Date endTime = null;
        String contain = StatePayInfo.finance();
        if(startTime1 != null && !"".equals(startTime1)){
            startTime = DateFormatUtil.convert(startTime1);
            endTime = DateFormatUtil.convert(endTime1);
            return financeMapper.getAllByfinanceM(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),allState,contain);
        }
        return financeMapper.getAllByfinanceM(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),allState,contain);
    }

    //查询条数
    public Integer getCountByfinanceM(String startTime1, String endTime1, String allState) {
        Date startTime = null;
        Date endTime = null;
        String contain = StatePayInfo.finance();
        if(startTime1 != null && !"".equals(startTime1)){
            startTime = DateFormatUtil.convert(startTime1);
            endTime = DateFormatUtil.convert(endTime1);
            return financeMapper.getCountByfinanceM(startTime,endTime,allState,contain);
        }
        return financeMapper.getCountByfinanceM(startTime,endTime,allState,contain);
    }

    //财务审核订单申请
    public Boolean applyCheckByFinance(String id,String auditDescribe,String agree) {
        CheckUtil.notBlank(id,"订单id为空");
        //根据id查找purchase_order
        PurchaseOrderTest purchaseOrderTest = purchase_orderTestMapper.getById(id);
        //设置付款人orderAuditUser，
        String payAuditUser = GetCurrentUserUtils.getCurrentUser();
        purchaseOrderTest.setPayAuditUser(payAuditUser);
        //根据同意或不同意设置订单状态
        if("付款".equals(agree)){
            purchaseOrderTest.setPayState(StatePayInfo.PAY_INFO_FINISH);
        }else{
            purchaseOrderTest.setPayState(StatePayInfo.PAY_INFO_BACK);
        }
        //设置审批时间
        purchaseOrderTest.setPayAuditTime(new Date());
        //设置审核信息
        purchaseOrderTest.setAuditDescribe(purchaseOrderTest.getAuditDescribe() + auditDescribe + "&&");

        financeMapper.applyCheckByFinance(purchaseOrderTest);
        return true;
    }


}
