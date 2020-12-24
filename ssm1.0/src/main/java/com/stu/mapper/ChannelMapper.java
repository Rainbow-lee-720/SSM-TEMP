package com.stu.mapper;

import com.stu.bean.Channel;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName ChannelMapper
 * @Description TODO
 * @Author Lee
 * @Date 2020/9/24 19:05
 * @Version 1.0
 **/
@Repository(value = "ChannelMapper")
public interface ChannelMapper {

    // 返回主键字段id值
    @Options(useGeneratedKeys = true, keyProperty = "cId", keyColumn = "cId")
    @Insert("INSERT INTO Channel(channelName,createTime) VALUES(#{channelName},now())")
    void addChannel(Channel channel);

    @Select(value = "SELECT * FROM Channel")
    List<Channel> findAll();
}