package com.gameloft9.demo.utils;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class GetCurrentUserUtils {

    public static String getCurrentUser(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String currentUser = (String) request.getSession().getAttribute("sysUser");
        return currentUser;
    }
}
