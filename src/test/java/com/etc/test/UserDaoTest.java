package com.etc.test;

import com.etc.dao.UserDao;
import com.etc.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "classpath:spring-mybatis.xml")
public class UserDaoTest {

    @Resource
    private UserDao userDao;

    //查询用户测试
    @Test
    public void queryUserTest(){
        List<User> list = userDao.queryUser(null);
        for(User u:list){
            System.out.println("userId:"+u.getUserId()+",userName:"+u.getUserName()+",phone:"+u.getPhone()+"email:"+u.getEmail());
        }
    }

    //用户详情测试
    @Test
    public void getUserTest(){
        User u = userDao.getUser(11);
        System.out.println("userId:"+u.getUserId()+",userName:"+u.getUserName()+",email:"+u.getEmail()+",phone:"+u.getPhone());
    }

    //新加用户测试
    @Test
    public void addUserTest(){
        User u = new User();
        u.setUserName("你好");
        u.setEmail("100@qq.com");u.setPassword("123abc");
        userDao.saveUser(u);
        System.out.println("新加成功！");
    }

    //删除用户测试
    @Test
    public void delUserTest(){
        userDao.delUser(1);
    }
}
