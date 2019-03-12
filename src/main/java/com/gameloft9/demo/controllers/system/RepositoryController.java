package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.gameloft9.demo.mgrframework.annotation.BizOperLog;
import com.gameloft9.demo.mgrframework.beans.constant.OperType;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.api.system.RepositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.Request;

import java.util.Collection;
import java.util.List;

@Controller
@RequestMapping("/repository")
public class RepositoryController {

    @Autowired
    RepositoryService repositoryService;

    /**
     * 分页显示
     */
    @RequestMapping(value = "/repositoryListByRepositoryM.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getAll(String page, String limit, String startTime, String endTime, String allState){
        return new PageResultBean<Collection<PurchaseOrderTest>>(repositoryService.getAllByRepositoryM(startTime,endTime,page,limit,allState),repositoryService.getCountByRepositoryM(startTime,endTime,allState));
    }

    /**
     * 仓库审核
     */
    @RequestMapping(value = "/repositoryCheck.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "采购部领导审核订单")
    public IResult repositoryCheck(String id,String auditDescribe,String agree){
        return new ResultBean<Boolean>(repositoryService.applyCheckByRepository(id,auditDescribe,agree));
    }

}
