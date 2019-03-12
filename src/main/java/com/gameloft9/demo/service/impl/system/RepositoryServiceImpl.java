package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.Purchase_OrderTestMapper;
import com.gameloft9.demo.dataaccess.dao.system.RepositoryMapper;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.RepositoryService;
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
public class RepositoryServiceImpl implements RepositoryService {

    @Autowired
    RepositoryMapper repositoryMapper;
    @Autowired
    Purchase_OrderTestMapper purchase_orderTestMapper;

    /**
     * 分页显示（不包含未提交，待审核，审核未通过(采购部)）
     *
     */
    public List<PurchaseOrderTest> getAllByRepositoryM(String startTime1, String endTime1, String page, String limit, String allState) {
        PageRange pageRange = new PageRange(page,limit);
        Date startTime = null;
        Date endTime = null;
        List<String> notContain = StatePayInfo.repository();
        if(startTime1 != null && !"".equals(startTime1)){
            startTime = DateFormatUtil.convert(startTime1);
            endTime = DateFormatUtil.convert(endTime1);
            return repositoryMapper.getAllByRepositoryM(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),allState,notContain);
        }
        return repositoryMapper.getAllByRepositoryM(startTime,endTime,pageRange.getStart(),pageRange.getEnd(),allState,notContain);
    }


    /**
     * 总条数
     *
     */
    public Integer getCountByRepositoryM(String startTime1, String endTime1, String allState) {
        Date startTime = null;
        Date endTime = null;
        List<String> notContain = StatePayInfo.repository();
        if(startTime1 != null && !"".equals(startTime1)){
            startTime = DateFormatUtil.convert(startTime1);
            endTime = DateFormatUtil.convert(endTime1);
            return repositoryMapper.getCountByRepositoryM(startTime,endTime,allState,notContain);
        }

        return repositoryMapper.getCountByRepositoryM(startTime,endTime,allState,notContain);
    }

    /**
     * 仓库审核订单申请
     */
    public Boolean applyCheckByRepository(String id,String auditDescribe,String agree) {
        //TODO...仓库审批字符串拼接
        CheckUtil.notBlank(id,"订单id为空");
        //根据id查找purchase_order
        PurchaseOrderTest purchaseOrderTest = purchase_orderTestMapper.getById(id);
        //设置审批人orderAuditUser，
        String orderAuditUser = GetCurrentUserUtils.getCurrentUser();
        purchaseOrderTest.setOrderAuditUser(orderAuditUser);
        //根据同意或不同意设置订单状态
        if("同意".equals(agree)){
            purchaseOrderTest.setAuditState(StatePayInfo.APPLY_INFO_PAST);
        }else{
            purchaseOrderTest.setAuditState(StatePayInfo.APPLY_INFO_NOT_PASS_REPOSITRY);
        }
        //设置审批时间
        purchaseOrderTest.setOrderAuditTime(new Date());
        //设置审核信息
        purchaseOrderTest.setAuditDescribe(auditDescribe + "&&");

        repositoryMapper.applyCheckByRepository(purchaseOrderTest);
        return true;
    }
}
