package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.SysSupplierTestMapper;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.dataaccess.pagevo.SysSupplierPageVO;
import com.gameloft9.demo.service.api.system.SysSupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysSupplierServiceImpl implements SysSupplierService {

    @Autowired
    SysSupplierTestMapper supplierTestMapper;

    public List<SysSupplierTest> getAll(SysSupplierPageVO supplierPageVO) {
        return supplierTestMapper.getAll(supplierPageVO);
    }

    public Long getCount(SysSupplierPageVO supplierPageVO) {
        return supplierTestMapper.getCount(supplierPageVO);
    }
}
