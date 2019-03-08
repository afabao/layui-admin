package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.Supplier_Goods;
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
import java.util.List;

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
    public IResult getAll(String page,String limit,String supplierName,String goodsType){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new PageResultBean<Collection<Supplier_GoodsTest>>(supplier_goodsService.getAll(page,limit,supplierName,goodsType),supplier_goodsService.getCount(supplierName,goodsType));
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
        return new ResultBean<Collection<String>>(supplier_goodsService.getGoodsType());
    }

    /**
     * 初始化供应商电话
     */
    @RequestMapping(value = "/getPhone.do",method = RequestMethod.POST)
    @ResponseBody
    public IResult getPhone(String supplierId){
        return new ResultBean<String>(supplier_goodsService.getPhone(supplierId));
    }

    /**
     * 初始化原料名称
     */
    @RequestMapping(value = "/getGoodsName.do",method = RequestMethod.POST)
    @ResponseBody
    public IResult initGoodsName(String goodsType){
        return new ResultBean<Collection<MeterialTest>>(supplier_goodsService.initGoodsName(goodsType));
    }

    /**
     * 添加原料商品
     */
    @RequestMapping(value = "/add.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult addSupplier_Goods(Supplier_Goods supplier_goods){
        return new ResultBean<String>(supplier_goodsService.addSupplier_Goods(supplier_goods));
    }

    /**
     * 根据原料id查询单价
     */

    @RequestMapping(value = "/getPrice.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getPrice(String goodsId,String supplierId){
        return new ResultBean<String>(supplier_goodsService.getPrice(goodsId,supplierId));
    }

    /**
     * 根据id获取原料商品
     */
    @RequestMapping(value = "/get.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getById(String id){
        return new ResultBean<Supplier_GoodsTest>(supplier_goodsService.getById(id));
    }

}
