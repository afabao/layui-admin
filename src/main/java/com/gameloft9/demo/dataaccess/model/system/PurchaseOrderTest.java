package com.gameloft9.demo.dataaccess.model.system;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class PurchaseOrderTest {

    private String id;//订单id

    private String number;//订单编号

    private String goodsId;//购买原料id

    private String goodsName;//原料名称

    private String goodsNumber;//购买原料数量

    private String applyUser;//订单申请人

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date applyTime;//订单申请时间

    private String state;//订单状态

    private String orderAuditUser;//订单审核人

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date orderAuditTime;//订单审核时间

    private String payAuditUser;//订单支付人

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date payAuditTime;//订单支付时间

    private String applyDescribe;//申请原因

    private String auditDescribe;//审核信息
}
