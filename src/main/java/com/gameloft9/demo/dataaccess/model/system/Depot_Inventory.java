package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

@Data
public class Depot_Inventory {

    private String id;//id

    private int type;//类型

    private String goodsId;//原料id

    private String goodsNumber;//获评数量

}
