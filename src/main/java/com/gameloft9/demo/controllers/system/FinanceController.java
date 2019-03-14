package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.gameloft9.demo.dataaccess.model.system.Supplier_Goods;
import com.gameloft9.demo.mgrframework.annotation.BizOperLog;
import com.gameloft9.demo.mgrframework.beans.constant.OperType;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.api.system.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;

@Controller
@RequestMapping("/finance")
public class FinanceController {

    @Autowired
    FinanceService financeService;

    //分页
    @RequestMapping(value = "/financeList.do",method = RequestMethod.POST)
    @ResponseBody
    public IResult finanaList(String startTime,String endTime,String page,String limit,String allState){
        return new PageResultBean<Collection<PurchaseOrderTest>>(financeService.getAllByfinanceM(startTime,endTime,page,limit,allState),
                financeService.getCountByfinanceM(startTime,endTime,allState));
    }

    //审核采购的申请订单
    @RequestMapping(value = "/checkApplyByFinance",method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.UPDATE,memo = "财务审核订单申请")
    public IResult checkApplyByFinance(String id,String auditDescribe,String agree){
        return new ResultBean<Boolean>(financeService.applyCheckByFinance(id,auditDescribe,agree));
    }

}
