package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.SysRoleTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.dataaccess.pagevo.SysSupplierPageVO;
import com.gameloft9.demo.mgrframework.annotation.BizOperLog;
import com.gameloft9.demo.mgrframework.beans.constant.OperType;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.mgrframework.utils.ResultMap;
import com.gameloft9.demo.service.api.system.SysSupplierService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/supplier")
public class SysSupplierController {

    @Autowired
    SysSupplierService supplierService;

    @RequestMapping(value = "/supplierList" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult supplierList(String page , String limit , String supplierName , String phone){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new PageResultBean<Collection<SysSupplierTest>>(supplierService.getAll(page,limit,supplierName,phone),supplierService.getCount(supplierName,phone));
    }

    @RequestMapping(value = "/add.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "添加供应商")
    public IResult addSupplier(SysSupplierTest supplierTest){
        return new ResultBean<String>(supplierService.addSupplier(supplierTest));
    }
}
