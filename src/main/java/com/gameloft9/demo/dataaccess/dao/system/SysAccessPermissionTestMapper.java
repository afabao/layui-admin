package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.SysAccessPermissionTest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysAccessPermissionTestMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_ACCESS_PERMISSION_TEST
     *
     * @mbggenerated Mon Dec 04 11:17:43 CST 2017
     */
    int deleteByPrimaryKey(String id);

    int deleteByRequestUrl(@Param("requestUrl") String requestUrl);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_ACCESS_PERMISSION_TEST
     *
     * @mbggenerated Mon Dec 04 11:17:43 CST 2017
     */
    int insert(SysAccessPermissionTest record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_ACCESS_PERMISSION_TEST
     *
     * @mbggenerated Mon Dec 04 11:17:43 CST 2017
     */
    int insertSelective(SysAccessPermissionTest record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_ACCESS_PERMISSION_TEST
     *
     * @mbggenerated Mon Dec 04 11:17:43 CST 2017
     */
    SysAccessPermissionTest selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_ACCESS_PERMISSION_TEST
     *
     * @mbggenerated Mon Dec 04 11:17:43 CST 2017
     */
    int updateByPrimaryKeySelective(SysAccessPermissionTest record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_ACCESS_PERMISSION_TEST
     *
     * @mbggenerated Mon Dec 04 11:17:43 CST 2017
     */
    int updateByPrimaryKey(SysAccessPermissionTest record);

    /**
     * 获取所有访问权限配置
     * */
    List<SysAccessPermissionTest> selectAll();

    /**
     * 根据url获取记录
     * @param url 请求路径
     * */
    SysAccessPermissionTest selectByUrl(@Param("url") String url);
}