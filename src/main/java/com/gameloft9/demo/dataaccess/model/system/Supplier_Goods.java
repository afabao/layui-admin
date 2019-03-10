package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

/**
 * 封装了供应商和原料的包装类
 */
@Data
public class Supplier_Goods {

    private String id;

    private String materialId;

    private String goodsType;//商品类型

    private String goodsName;//商品名称

    private String goodsPrice;//原料单价

    private String supplierId;

    private String supplierName;//供应商名称

    private String phone;//供应商电话

}
