package com.etc.service;

import com.etc.entity.User;
import com.github.pagehelper.PageInfo;

public interface UserService {

    //分页查询所有用户
    public PageInfo<User> queryUser(User u, Integer pageNum, Integer pageSize);

    //根据邮箱查询用户
    public User getUserByEmail(String email);

    //根据用户号删除用户
    public void delUser(Integer userId);

    //保存注册用户
    public void saveUser(User u);


}
