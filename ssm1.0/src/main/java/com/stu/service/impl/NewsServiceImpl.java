package com.stu.service.impl;

import com.stu.bean.News;
import com.stu.mapper.NewsMapper;
import com.stu.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName NewsServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2020/9/24 18:33
 * @Version 1.0
 **/
@Service("NewsService")
public class NewsServiceImpl implements INewsService {

    @Autowired
    private NewsMapper newsMapper;

    public void addNews(News news){
        newsMapper.addNews(news);
    }

    public void truncateNews(){
        newsMapper.truncateNews();
    }

    @Override
    public List<News> findAll() {
        return newsMapper.findAll();
    }

}
