package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.dataaccess.pagevo.SysSupplierPageVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

public interface SysSupplierService {

    /**
     * 分页查询supplier信息
     * @return list
     */
    List<SysSupplierTest> getAll(String page ,String limit ,String supplierName ,String phone);

    /**
     *
     * @return 返回总条数
     */
    Integer getCount(String supplierName ,String phone);

    /**
     * 添加供应商
     * @param supplier 供应商信息
     */
    String addSupplier(SysSupplierTest supplier);

    /**
     * 修改供应商
     * @param supplier 供应商信息
     * @return
     */
    Boolean updateSupplier(SysSupplierTest supplier);

    /**
     * 根据名称查找供应商
     * @param id 供应商名称
     * @return
     */
    SysSupplierTest getById(String id);

    /**
     * 根据id删除供应商
     * @param id 供应商id
     */
    Boolean deleteSupllierById(String id);

}
