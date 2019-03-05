package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.SysSupplierTestMapper;
import com.gameloft9.demo.dataaccess.model.system.SysRoleTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.dataaccess.pagevo.SysSupplierPageVO;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.SysSupplierService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
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

    public Boolean updateSupplier(SysSupplierTest supplier) {
        CheckUtil.notBlank(supplier.getId(),"角色id为空");

        //角色名称不能重复
        SysSupplierTest supplierTest = supplierTestMapper.getBySupplierName(supplier.getSupplierName());
        CheckUtil.check(supplierTest == null || supplierTest.getSupplierName().equals(supplier.getSupplierName()),"该角色名称已经存在");
        supplierTestMapper.updateSupplier(supplier);

        return true;
    }

    public SysSupplierTest getById(String id) {
        CheckUtil.notBlank(id,"角色id为空");
        return supplierTestMapper.getById(id);
    }

    public Boolean deleteSupllierById(String id) {
        CheckUtil.notBlank(id,"角色id为空");
        supplierTestMapper.deleteSupllierById(id);
        return true;
    }


}
