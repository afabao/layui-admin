package com.gameloft9.demo.controllers.system;


import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;

import com.gameloft9.demo.mgrframework.annotation.BizOperLog;
import com.gameloft9.demo.mgrframework.beans.constant.OperType;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;

import com.gameloft9.demo.service.api.system.SysSupplierService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;

@Controller
@Slf4j
@RequestMapping("/supplier")
public class SysSupplierController {

    @Autowired
    SysSupplierService supplierService;

    /**
     *
     * 获取供应商列表
     */
    @RequestMapping(value = "/supplierList" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult supplierList(String page , String limit , String supplierName , String phone){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new PageResultBean<Collection<SysSupplierTest>>(supplierService.getAll(page,limit,supplierName,phone),supplierService.getCount(supplierName,phone));
    }

    /**
     * 添加供应商
     */
    @RequestMapping(value = "/add.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "添加供应商")
    public IResult addSupplier(SysSupplierTest supplierTest){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new ResultBean<String>(supplierService.addSupplier(supplierTest));
    }

    /**
     *修改供应商
     */
    @RequestMapping(value = "/update.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "修改供应商")

    public IResult editSupplier(SysSupplierTest supplierTest){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new ResultBean<Boolean>(supplierService.updateSupplier(supplierTest));
    }

    /**
     *修改供应商
     */
    @RequestMapping(value = "/get.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getSupplier(String id){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new ResultBean<SysSupplierTest>(supplierService.getById(id));
    }

}
