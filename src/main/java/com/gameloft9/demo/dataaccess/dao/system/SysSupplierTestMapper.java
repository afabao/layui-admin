package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.SysRoleTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.dataaccess.pagevo.SysSupplierPageVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysSupplierTestMapper {


    /**
     * 获取所有角色
     * @param start 开始
     * @param end 结束
     * */
    List<SysSupplierTest> getAll(
            @Param("start") int start,
            @Param("end") int end,
            @Param("supplierName") String supplierName,
            @Param("phone") String phone);

    /**
     *
     * @return 返回总条数
     */
    Integer getCount(
           @Param("supplierName") String supplierName,
           @Param("phone") String phone
    );

    /**
     * 添加供应商
     * @param supplier 供应商信息
     */
    void addSupplier(SysSupplierTest supplier);

}
