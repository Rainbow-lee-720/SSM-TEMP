package com.stu.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author Lee
 * @Description //频道类
 * @Date 22:00 2020/9/24
 * @Param
 * @return
 **/
public class Channel   implements Serializable {

  static final long serialVersionUID = 1L;

  //ID
  private long cId;
  private String channelName;
  private Date createTime;

  public Channel() {
  }

  public Channel(String channelName) {
    this.channelName = channelName;
  }

  public long getCId() {
    return cId;
  }

  public void setCId(long cId) {
    this.cId = cId;
  }


  public String getChannelName() {
    return channelName;
  }

  public void setChannelName(String channelName) {
    this.channelName = channelName;
  }


  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  @Override
  public String toString() {
    return "Channel{" +
            "cId=" + cId +
            ", channelName='" + channelName + '\'' +
            ", createTime=" + createTime +
            '}';
  }
}
