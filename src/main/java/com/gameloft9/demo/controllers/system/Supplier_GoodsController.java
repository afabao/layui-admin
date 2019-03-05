package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.Supplier_GoodsTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.mgrframework.beans.response.IResult;

import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.api.system.Supplier_GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;

@Controller
@RequestMapping("/supplier_goods")
public class Supplier_GoodsController {

    @Autowired
    Supplier_GoodsService supplier_goodsService;

    /**
     *
     * 原料商品分页信息
     */
    @RequestMapping(value = "/supplier_goodsList" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getAll(String page,String limit,String goodsType,String supplierName){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new PageResultBean<Collection<Supplier_GoodsTest>>(supplier_goodsService.getAll(page,limit,goodsType,supplierName),supplier_goodsService.getCount(goodsType,supplierName));
    }

    /**
     * 初始化供应商名称
     */
    @RequestMapping(value = "/getSupplierName.do",method = RequestMethod.POST)
    @ResponseBody
    public IResult getSupplierName(){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new ResultBean<Collection<SysSupplierTest>>(supplier_goodsService.getSupplierName());
    }

    /**
     * 初始化货品类型
     */
    @RequestMapping(value = "/getGoodsType.do",method = RequestMethod.POST)
    @ResponseBody
    public IResult getGoodsType(){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new ResultBean<Collection<MeterialTest>>(supplier_goodsService.getGoodsType());
    }
}
