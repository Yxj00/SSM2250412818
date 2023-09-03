package com.icss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 专门用来刷新页面
@Controller
public class PageController {
    @RequestMapping("/")
    public String index(){
        return "jump";
//        return "index";
    }

    // 跳转到登录页面
    @RequestMapping("page/login")
    public String toLogin(){
        return "login";
    }
    // 跳转到注册页面
    @RequestMapping("page/register")
    public String toList(){
        return "register";
    }

    @RequestMapping("page/detail1")
    public String toDetails(){
        return "detail1";
    }
}
