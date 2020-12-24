package com.stu.service.impl;

import com.stu.bean.User;
import com.stu.mapper.IUserMapper;
import com.stu.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "userService")
public class UserService implements IUserService {

//    @Autowired
    @Resource(name = "userMapper")
    private IUserMapper userMapper;

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }
}
