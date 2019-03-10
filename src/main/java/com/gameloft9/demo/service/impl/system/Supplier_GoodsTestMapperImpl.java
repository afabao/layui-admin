package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.SysSupplier_GoodsTestMapper;
import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.dataaccess.model.system.Supplier_Goods;
import com.gameloft9.demo.dataaccess.model.system.Supplier_GoodsTest;
import com.gameloft9.demo.dataaccess.model.system.SysSupplierTest;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.Supplier_GoodsService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
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
        return supplier_goodsTestMapper.getAll(pageRange.getStart(),pageRange.getEnd(),goodsType,supplierName);
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
    public List<String> getGoodsType() {
        return supplier_goodsTestMapper.getGoodsType();
    }

    //初始化供应商电话
    public String getPhone(String supplierId) {
        return supplier_goodsTestMapper.getPhone(supplierId);
    }

    //初始化原料名称
    public List<MeterialTest> initGoodsName(String goodsType) {
        return supplier_goodsTestMapper.initGoodsName(goodsType);
    }

    //添加原料商品
    public String addSupplier_Goods(Supplier_Goods supplier_goods) {

        Supplier_GoodsTest supplier_goodsTest = new Supplier_GoodsTest();
        supplier_goodsTest.setId(UUIDUtil.getUUID());
        supplier_goodsTest.setGoodsPrice(supplier_goods.getGoodsPrice());
        supplier_goodsTest.setSupplierId(supplier_goods.getSupplierName());
        supplier_goodsTest.setMaterialId(supplier_goods.getGoodsName());
        supplier_goodsTestMapper.addSupplier_Goods(supplier_goodsTest);

        return supplier_goodsTest.getId();
    }

    //根据原料id查询单价
    public String getPrice(String goodsId,String supplierId) {
        return supplier_goodsTestMapper.getPrice(goodsId,supplierId);
    }

    //根据id获取原料商品
    public Supplier_Goods getById(String id) {
        return supplier_goodsTestMapper.getById(id);
    }

    public Boolean updateSupplier_Goods(Supplier_GoodsTest supplier_goodsTest) {
        supplier_goodsTestMapper.updateSupplier_Goods(supplier_goodsTest);
        return true;
    }

    //删除原料商品
    public Boolean deleteSupplier_Goods(String id) {
        CheckUtil.notBlank(id,"id为空");
        supplier_goodsTestMapper.deleteSupplier_Goods(id);
        return true;
    }
}
