package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.ChartMapper;
import com.gameloft9.demo.dataaccess.model.system.Supplier_Goods;
import com.gameloft9.demo.service.api.system.ChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ChartServiceImpl implements ChartService {

    @Autowired
    ChartMapper chartMapper;

    public List<Supplier_Goods> getAll() {
        return chartMapper.getAll();
    }
}
