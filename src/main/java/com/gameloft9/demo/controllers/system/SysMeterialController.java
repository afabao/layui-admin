package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.mgrframework.annotation.BizOperLog;
import com.gameloft9.demo.mgrframework.beans.constant.OperType;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.api.system.MeterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;

@Controller
@RequestMapping("/meterial")
public class SysMeterialController {

    @Autowired
    MeterialService meterialService;

    /**
     * 原料列表分页
     */
    @RequestMapping(value = "/meterialList" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getAll(String page, String limit, String goodsName, String goodsType){
        //返回json至前端的均返回ResultBean或者PageResultBean
        return new PageResultBean<Collection<MeterialTest>>(meterialService.getAll(page, limit, goodsName, goodsType),meterialService.getCount(goodsName, goodsType));
    }

    /**
     * 添加原料
     */
    @RequestMapping(value = "/add.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.ADD,memo = "添加原料")
    public IResult addMeterial(MeterialTest meterialTest){
        return new ResultBean<String>(meterialService.addMeterial(meterialTest));
    }

    /**
     * 根据id查找原料
     */
    @RequestMapping(value = "/get.do" ,method = RequestMethod.POST)
    @ResponseBody
    public IResult getById(String id){
        return new ResultBean<MeterialTest>(meterialService.getById(id));
    }

    /**
     * 修改原料
     */
    @RequestMapping(value = "/update.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.UPDATE,memo = "修改原料")
    public IResult updateMeterial(MeterialTest meterialTest){
        return new ResultBean<Boolean>(meterialService.updateMeterial(meterialTest));
    }

    /**
     * 删除原料
     */
    @RequestMapping(value = "/delete.do" ,method = RequestMethod.POST)
    @ResponseBody
    @BizOperLog(operType = OperType.DELETE,memo = "删除原料")
    public IResult deleteMeterial(String id){
        return new ResultBean<Boolean>(meterialService.deleteMeterail(id));
    }
}
