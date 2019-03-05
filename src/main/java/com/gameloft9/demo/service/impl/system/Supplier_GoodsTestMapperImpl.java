package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.SysSupplier_GoodsTestMapper;
import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.Supplier_GoodsTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.service.api.system.Supplier_GoodsService;
import com.gameloft9.demo.service.beans.system.PageRange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class Supplier_GoodsTestMapperImpl implements Supplier_GoodsService {

    @Autowired
    SysSupplier_GoodsTestMapper supplier_goodsTestMapper;
    //分页原料商品
    public List<Supplier_GoodsTest> getAll(String page, String limit, String goodsType, String supplierName) {
        PageRange pageRange = new PageRange(page,limit);
        return supplier_goodsTestMapper.getAll(pageRange.getPage(),pageRange.getLimit(),goodsType,supplierName);
    }

    //原料商品总条数
    public Integer getCount(String goodsType, String supplierName) {
        return supplier_goodsTestMapper.getCount(goodsType,supplierName);
    }

    //初始化供应商名称
    public List<SysSupplierTest> getSupplierName() {
        return supplier_goodsTestMapper.getSupplierName();
    }

    //初始化货品类型
    public List<MeterialTest> getGoodsType() {
        return supplier_goodsTestMapper.getGoodsType();
    }
}
