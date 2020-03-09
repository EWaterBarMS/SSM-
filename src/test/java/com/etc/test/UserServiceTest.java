package com.etc.test;

import com.etc.entity.User;
import com.etc.service.impl.UserServiceImpl;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "classpath:spring-mybatis.xml")
public class UserServiceTest {

    @Resource
    private UserServiceImpl userService;

    //查询用户测试
    @Test
    public void queryUserTest(){
        PageInfo<User> list = userService.queryUser(null,1,3);
        System.out.println("页数："+list.getPageNum());
    }

    //用户详情测试
    @Test
    public void getUserTest(){
        User u = userService.getUser(11);
        System.out.println("userId:"+u.getUserId()+",userName:"+u.getUserName()+",email:"+u.getEmail()+",phone:"+u.getPhone());
    }


    //新加用户测试
    @Test
    public void addUserTest(){
        User u = new User();
        u.setUserName("ta");
        u.setEmail("120@qq.com");u.setPassword("123abc");
        userService.saveUser(u);
        System.out.println("新加成功！");
    }

    //删除用户测试
    @Test
    public void delUserTest(){
        userService.delUser(10);
    }
}
