package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.Supplier_Goods;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.api.system.ChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;

@Controller
@RequestMapping("/chart")
public class ChartController {

    @Autowired
    ChartService chartService;

    @RequestMapping(value = "/getBearingHistogramData.do",method = RequestMethod.POST)
    @ResponseBody
    public IResult getBearingHistogramData(){
        return new ResultBean<Collection<Supplier_Goods>>(chartService.getAll());
    }

}
