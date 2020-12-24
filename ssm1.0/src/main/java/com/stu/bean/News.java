package com.stu.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author Lee
 * @Description //新闻类
 * @Date 22:00 2020/9/24
 * @Param
 * @return
 **/
public class News implements Serializable {

  static final long serialVersionUID = 1L;

  //ID
  private long id;
  private long channelId;
  private String newsTitle;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date publishTime;
  private String newsUrl;
  private Date createTime;

  //频道名称(映射)
  private String channelName;

  public News() {
  }

  public News(long channelId, String newsTitle, Date publishTime, String newsUrl) {
    this.channelId = channelId;
    this.newsTitle = newsTitle;
    this.publishTime = publishTime;
    this.newsUrl = newsUrl;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getChannelId() {
    return channelId;
  }

  public void setChannelId(long channelId) {
    this.channelId = channelId;
  }


  public String getNewsTitle() {
    return newsTitle;
  }

  public void setNewsTitle(String newsTitle) {
    this.newsTitle = newsTitle;
  }


  public Date getPublishTime() {
    return publishTime;
  }

  public void setPublishTime(Date publishTime) {
    this.publishTime = publishTime;
  }


  public String getNewsUrl() {
    return newsUrl;
  }

  public void setNewsUrl(String newsUrl) {
    this.newsUrl = newsUrl;
  }


  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  public String getChannelName() {
    return channelName;
  }

  public void setChannelName(String channelName) {
    this.channelName = channelName;
  }

  @Override
  public String toString() {
    return "News{" +
            "id=" + id +
            ", channelId='" + channelId + '\'' +
            ", newsTitle='" + newsTitle + '\'' +
            ", publishTime=" + publishTime +
            ", newsUrl='" + newsUrl + '\'' +
            ", createTime=" + createTime +
            '}';
  }
}
