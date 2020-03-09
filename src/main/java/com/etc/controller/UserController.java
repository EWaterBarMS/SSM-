package com.etc.controller;

import com.etc.entity.User;
import com.etc.service.impl.UserServiceImpl;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserServiceImpl userService;

    //分页查询用户
    @RequestMapping("/query")
    @ResponseBody
    public PageInfo<User> ajaxpagequery(User u, @RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
                                           @RequestParam(value = "pageSize",required = true,defaultValue = "6") Integer pageSize){
        return userService.queryUser(u,pageNum,pageSize);
    }

    //删除用户
    @RequestMapping("/del")
    public void delUser(String userId, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer uid = Integer.valueOf(userId);
        userService.delUser(uid);
        User u = userService.getUser(uid);
        String result = "";
        String jsonp = "";
        if (u == null) {
            result = new Gson().toJson("true");
        } else {
            result = new Gson().toJson("false");
        }
        jsonp = req.getParameter("jsoncallback");
        if (jsonp != null) {
            result = jsonp + "(" + result + ")";
            resp.getWriter().write(result);
        } else {
            resp.getWriter().write(result);
        }
    }
}
