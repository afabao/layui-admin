package com.gameloft9.demo.controllers.system;


import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
import com.gameloft9.demo.dataaccess.model.system.UserTest;
import com.gameloft9.demo.mgrframework.annotation.BizOperLog;
import com.gameloft9.demo.mgrframework.beans.constant.OperType;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.api.system.Purchase_OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.Request;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.Date;

@Controller
@RequestMapping("/purchase_order")
public class Purchase_OrderController {

    @Autowired
    Purchase_OrderService purchase_orderService;

    //根据供应商id查找原料
    @RequestMapping(value = "/getGoodsTypeBySupplierId.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getGoodsTypeBySupplierId(String supplierId){
        return new ResultBean<Collection<String>>(purchase_orderService.getGoodsTypeBySupplierId(supplierId));
    }

    //订单分页显示
    //TODO......查询
    @RequestMapping(value = "/purchase_orderList.do",method = RequestMethod.POST)
    @ResponseBody
    public IResult getAll(String startTime,String endTime,String page,String limit,String allState){
        return new PageResultBean<Collection<PurchaseOrderTest>>(purchase_orderService.getAll(startTime,endTime,page,limit,allState),purchase_orderService.getCount(startTime,endTime,allState));
    }

    //添加订单
    @RequestMapping(value = "/add.do",method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "添加订单")
    public IResult addPurchaseOrder(PurchaseOrderTest purchaseOrderTest){
        return new ResultBean<String>(purchase_orderService.addPurchaseOrder(purchaseOrderTest));
    }

    //根据id查找订单申请(未提交)
    @RequestMapping(value = "/get.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getById(String id){
        return new ResultBean<PurchaseOrderTest>(purchase_orderService.getById(id));
    }

    //修改订单申请
    @RequestMapping(value = "update.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "修改订单申请")
    public IResult updatePurchase_Order(PurchaseOrderTest purchaseOrderTest){
        return new ResultBean<Boolean>(purchase_orderService.updatePurchase_Order(purchaseOrderTest));
    }

    /**
     * 删除订单
     *
     */
    @RequestMapping(value = "delete.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "删除订单申请")
    public IResult deletePurchase_Order(String id){
        return new ResultBean<Boolean>(purchase_orderService.deletePurchase_Order(id));
    }

    /**
     * 提交订单
     */
    @RequestMapping(value = "buyerCommit.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "提交订单申请")
    public IResult buyCommit(PurchaseOrderTest purchaseOrderTest){
        return new ResultBean<Boolean>(purchase_orderService.buyerCommit(purchaseOrderTest));
    }

    /**
     * 查询订单状态
     */
    @RequestMapping(value = "findState.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult findState(String id){
        return new ResultBean<String>(purchase_orderService.findState(id));
    }

    //订单分页显示(不包含未提交)
    @RequestMapping(value = "/purchase_orderListByBuyerM.do",method = RequestMethod.POST)
    @ResponseBody
    public IResult getAllBuyderM(String startTime,String endTime,String page,String limit,String allState,String notCommit){
        return new PageResultBean<Collection<PurchaseOrderTest>>(purchase_orderService.getAllByBuyerM(startTime,endTime,page,limit,allState,notCommit),purchase_orderService.getCountByBuyerM(startTime,endTime,allState,notCommit));
    }

    /**
     * 采购部领导审核
     */
    @RequestMapping(value = "/applyPassInfo.do",method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "采购部领导审核订单")
    public IResult applyPassInfo(String id,String auditDescribe,String agree){
        return new ResultBean<Boolean>(purchase_orderService.applyByM(id,auditDescribe,agree));
    }

    /**
     * 撤回
     */
    @RequestMapping(value = "/recall.do",method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "撤回申请")
    public IResult recall(String id){
        return new ResultBean<Boolean>(purchase_orderService.recall(id));
    }
}
