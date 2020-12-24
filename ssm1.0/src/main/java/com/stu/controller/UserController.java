package com.stu.controller;

import com.stu.bean.User;
import com.stu.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

//    @Autowired
    @Resource(name = "userService")
    private IUserService userService;

    @RequestMapping(value = "/findAll")
    @ResponseBody
    public List<User> findAll() {
        List<User> list = userService.findAll();
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("list",list);
//        modelAndView.setViewName("user/allUser");
        return list;
    }
}
