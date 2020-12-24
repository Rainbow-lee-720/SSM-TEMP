package com.stu.service.impl;

import com.stu.bean.Channel;
import com.stu.mapper.ChannelMapper;
import com.stu.service.IChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName NewsServiceImpl
 * @Description
 * @Author Lee
 * @Date 2020/9/24 18:33
 * @Version 1.0
 **/
@Service("ChannelService")
public class ChannelServiceImpl implements IChannelService {

    @Autowired
    private ChannelMapper channelMapper;

    public void addChannel(Channel channel){
        channelMapper.addChannel(channel);
    }

}
