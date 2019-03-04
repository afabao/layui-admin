package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.SysSupplierTestMapper;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.dataaccess.pagevo.SysSupplierPageVO;
import com.gameloft9.demo.service.api.system.SysSupplierService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysSupplierServiceImpl implements SysSupplierService {

    @Autowired
    SysSupplierTestMapper supplierTestMapper;

    public List<SysSupplierTest> getAll(String page ,String limit ,String supplierName ,String phone) {
        PageRange pageRange = new PageRange(page,limit);
        return supplierTestMapper.getAll(pageRange.getStart(),pageRange.getEnd(),supplierName,phone);
    }

    public Integer getCount(String supplierName ,String phone) {
        return supplierTestMapper.getCount(supplierName,phone);
    }

    public String addSupplier(SysSupplierTest supplier) {
        supplier.setId(UUIDUtil.getUUID());
        supplierTestMapper.addSupplier(supplier);

        return supplier.getId();
    }
}
