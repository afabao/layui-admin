package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.dataaccess.pagevo.SysSupplierPageVO;
import com.gameloft9.demo.mgrframework.utils.ResultMap;
import com.gameloft9.demo.service.api.system.SysSupplierService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/supplier")
public class SysSupplierController {

    @Autowired
    SysSupplierService supplierService;

    @RequestMapping(value = "/supplierList" ,method = RequestMethod.POST)
    @ResponseBody
    public ResultMap<SysSupplierTest> supplierList(Integer page ,Integer limit ,String supplierName ,String phone){
        SysSupplierPageVO supplierPageVO = new SysSupplierPageVO();
        supplierPageVO.setSupplierName(supplierName);
        supplierPageVO.setPhone(phone);

        //如果page为1
        if(page == 1){
            supplierPageVO.setStart(0);
        }else{
            //如果page不为一
            supplierPageVO.setStart((page-1)*limit);
        }
        supplierPageVO.setEnd(limit);

        List<SysSupplierTest> list = supplierService.getAll(supplierPageVO);
        Long count = supplierService.getCount(supplierPageVO);

        return ResultMap.getAll(count,list);
    }
}
