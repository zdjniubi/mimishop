package com.zdj.miaoshaproject.dao;

import com.zdj.miaoshaproject.dataobject.DecreaseLog;

import java.util.List;

public interface DecreaseLogMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decrease_log
     *
     * @mbg.generated Thu May 27 14:11:06 AWST 2021
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decrease_log
     *
     * @mbg.generated Thu May 27 14:11:06 AWST 2021
     */
    int insert(DecreaseLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decrease_log
     *
     * @mbg.generated Thu May 27 14:11:06 AWST 2021
     */
    int insertSelective(DecreaseLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decrease_log
     *
     * @mbg.generated Thu May 27 14:11:06 AWST 2021
     */
    DecreaseLog selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decrease_log
     *
     * @mbg.generated Thu May 27 14:11:06 AWST 2021
     */
    int updateByPrimaryKeySelective(DecreaseLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decrease_log
     *
     * @mbg.generated Thu May 27 14:11:06 AWST 2021
     */
    int updateByPrimaryKey(DecreaseLog record);

    int updateByUserIdItemId(int userId, int itemId, double discount);

    List<DecreaseLog> selectByUserId(int userId);

    DecreaseLog selectByUserIdItemId(int userId, int itemId);
}