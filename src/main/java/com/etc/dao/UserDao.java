package com.etc.dao;

import com.etc.entity.User;

import java.util.List;

public interface UserDao {

    //查询所有用户
    public List<User> queryUser(User u);

    //根据邮箱查询用户
    public User getUserByEmail(String email);

    //根据用户号删除用户
    public void delUser(Integer userId);

    //保存注册用户
    public void saveUser(User u);

}
