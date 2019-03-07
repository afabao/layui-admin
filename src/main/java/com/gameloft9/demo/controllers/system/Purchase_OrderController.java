package com.gameloft9.demo.controllers.system;


import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrderTest;
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
    @RequestMapping(value = "/purchase_orderList",method = RequestMethod.POST)
    @ResponseBody
    public IResult getAll(Date startTime,Date endTime,String page,String limit,String state){
        return new PageResultBean<Collection<PurchaseOrderTest>>(purchase_orderService.getAll(startTime,endTime,page,limit,state),purchase_orderService.getCount(startTime,endTime,state));
    }

    //添加订单
    @RequestMapping(value = "/add.do",method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "添加订单")
    public IResult addPurchaseOrder(PurchaseOrderTest purchaseOrderTest){
        return new ResultBean<String>(purchase_orderService.addPurchaseOrder(purchaseOrderTest));

    }
}
