package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.dataaccess.pagevo.SysSupplierPageVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysSupplierTestMapper {


    /**
     * 分页查询supplier信息
     * @param supplierPageVO 封装supplier分页查询需要的数据
     * @return list
     */
    List<SysSupplierTest> getAll(SysSupplierPageVO supplierPageVO);

    /**
     *
     * @return 返回总条数
     */
    Long getCount(SysSupplierPageVO supplierPageVO);

}
