package com.gameloft9.demo.utils;


import java.util.ArrayList;
import java.util.List;

public class StatePayInfo {
    private static List<String> notContain = new ArrayList<String>();
    private static String contain = null;
    public static final String APPLY_INFO_NO_SUBMIT="未提交";
    public static final String APPLY_INFO_WAITING= "待审核";
    public static final String APPLY_INFO_WAITING_BY_REPOSITRY= "待审核(仓库)";
    public static final String APPLY_INFO_NOT_PASS= "审核未通过(采购部)";
    public static final String APPLY_INFO_NOT_PASS_REPOSITRY= "审核未通过(仓库)";
    public static final String PAY_INFO_WATING= "待付款";
    public static final String PAY_INFO_BACK= "被驳回(财务)";
    public static final String PAY_INFO_FINISH= "已付款";
    public static final String APPLY_INFO_PAST= "审核通过";

    public static List<String> repository(){
        notContain.add(APPLY_INFO_NO_SUBMIT);
        notContain.add(APPLY_INFO_NOT_PASS);
        notContain.add(APPLY_INFO_WAITING);
        return notContain;
    }

    public static String finance(){
        contain=APPLY_INFO_PAST;
        return contain;
    }

}
