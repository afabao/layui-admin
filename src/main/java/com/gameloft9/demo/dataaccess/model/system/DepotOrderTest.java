package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

import java.util.Date;

@Data
public class DepotOrderTest {

    private String id;//id

    private int orderType;//订单类型

    private String goodsId;//原料id

    private String goodsNumber;//购买数量

    private String applyUser;//订单申请者

    private Date applyTime;//订单申请时间

    private String state;//审核状态

    private String orderAuditUser;//审核者

    private Date orderAuditTime;//审核时间

    private String applyDescribe;//申请原因

    private String auditDescribe;//审核信息

}
