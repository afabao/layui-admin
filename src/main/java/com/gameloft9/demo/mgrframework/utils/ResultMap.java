package com.gameloft9.demo.mgrframework.utils;

import java.util.List;

public class ResultMap<T> {

    private String code;
    private String msg;
    private Long count;
    private List<T> data;

    //返回列表
    public ResultMap(String code, String msg, Long count, List<T> data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public static ResultMap getAll(Long count,List data){
        return new ResultMap("0000","success",count,data);
    }


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
