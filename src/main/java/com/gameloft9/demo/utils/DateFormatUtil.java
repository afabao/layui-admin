package com.gameloft9.demo.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {

    public static Date convert(String startTime1 ){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startTime = null;
        try {
           startTime = format.parse(startTime1);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return startTime;
    }
}
