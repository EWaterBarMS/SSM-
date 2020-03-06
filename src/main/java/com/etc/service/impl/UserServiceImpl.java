package com.etc.service.impl;

import com.etc.dao.UserDao;
import com.etc.entity.User;
import com.etc.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    //分页查询用户业务实现
    @Override
    public PageInfo<User> queryUser(User u,Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list = userDao.queryUser(u);
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    //根据邮箱查询用户
    public User getUserByEmail(String email){
        return userDao.getUserByEmail(email);
    }

    //删除用户业务实现
    @Override
    public void delUser(Integer userId) {
        userDao.delUser(userId);
    }

    @Override
    public void saveUser(User u) {
        userDao.saveUser(u);
    }

}
