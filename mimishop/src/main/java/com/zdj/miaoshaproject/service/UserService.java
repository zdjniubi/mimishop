package com.zdj.miaoshaproject.service;

import com.zdj.miaoshaproject.dataobject.UserDO;
import com.zdj.miaoshaproject.error.BusinessException;
import com.zdj.miaoshaproject.service.model.UserModel;

import java.util.List;


public interface UserService {
    //通过用户ID获取用户对象的方法
    UserModel getUserById(Integer id);

    //通过缓存获取用户对象
    UserModel getUserByIdInCache(Integer id);

    int register(UserModel userModel) throws BusinessException;

    /*
    telphone:用户注册手机
    password:用户加密后的密码
     */
    UserModel validateLogin(String telphone,String encrptPassword) throws BusinessException;

    List<UserDO> listUsers();
}
