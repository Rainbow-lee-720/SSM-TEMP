package com.stu.mapper;

import com.stu.bean.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "userMapper")
public interface IUserMapper {
    @Select(value = "select * from User")
    List<User> findAll();
}
