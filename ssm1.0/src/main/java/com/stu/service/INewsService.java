package com.stu.service;

import com.stu.bean.News;

import java.util.List;

/**
 * @ClassName INewsService
 * @Description TODO
 * @Author Lee
 * @Date 2020/9/24 18:32
 * @Version 1.0
 **/
public interface INewsService {

    void addNews(News news);

    void truncateNews();

    List<News> findAll();

}