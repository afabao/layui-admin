package com.gameloft9.demo.dataaccess.pagevo;

import lombok.Data;

/**
 * 封装supplier分页查询需要的数据
 */
@Data
public class SysSupplierPageVO {


    private int start;//开始行数

    private int end;//取出条数

    private String supplierName;//名字

    private String phone;//电话
}
