package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.SysMeterialTestMapper;
import com.gameloft9.demo.dataaccess.model.system.MeterialTest;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.MeterialService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MeterialServiceImpl implements MeterialService {

    @Autowired
    SysMeterialTestMapper meterialTestMapper;

    //原料分页
    public List<MeterialTest> getAll(String page, String limit, String goodsName, String goodsType) {
        PageRange pageRange = new PageRange(page,limit);
        return meterialTestMapper.getAll(pageRange.getStart(), pageRange.getEnd(), goodsName, goodsType);
    }

    //原料总条数
    public Integer getCount(String goodsName, String goodsType) {
        return meterialTestMapper.getCount(goodsName, goodsType);
    }

    //添加原料
    public String addMeterial(MeterialTest meterialTest) {
        //UUID的id
        meterialTest.setId(UUIDUtil.getUUID());
        meterialTestMapper.addMeterial(meterialTest);
        return meterialTest.getId();
    }

    //id查找原料
    public MeterialTest getById(String id) {
        //id是否存在
        CheckUtil.notBlank(id,"角色id为空");
        return meterialTestMapper.getById(id);
    }

    //更新原料
    public Boolean updateMeterial(MeterialTest meterialTest) {
        CheckUtil.notBlank(meterialTest.getId(),"原料id为空");

        //原料名不能重复
        MeterialTest meterialTest1 = meterialTestMapper.getByGoodsName(meterialTest.getGoodsName());
        CheckUtil.check(meterialTest1 == null || meterialTest.getGoodsName().equals(meterialTest.getGoodsName()),"该原料名已经存在");
        meterialTestMapper.updateMeterial(meterialTest);
        return true;
    }

    //删除原料
    public Boolean deleteMeterail(String id) {
        //id是否存在
        CheckUtil.notBlank(id,"角色id为空");
        meterialTestMapper.deleteMeterial(id);
        return true;
    }


}
