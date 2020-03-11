package com.etc.controller;

import com.etc.entity.User;
import com.etc.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/index")
public class IndexController {

    @Resource
    private UserServiceImpl userService;

    //登录验证
    @RequestMapping("/logincheck")
    public ModelAndView checkLogin(String email,String pwd){
        ModelAndView mv = new ModelAndView("redirect:/index.jsp");
        User user = userService.getUserByEmail(email);
        if(user!=null && user.getPassword().equals(pwd)){
            mv.setViewName("userManage");
        }
        return mv;
    }

    //注册保存
    @RequestMapping("/register")
    public ModelAndView register(String username,String password,String email){
        ModelAndView mv = new ModelAndView("redirect:/index.jsp");
        User u = new User();
        if (email.matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+")){
            u.setUserName(username);u.setPassword(password);u.setEmail(email);
            userService.saveUser(u);
        }
        return mv;
    }
}
