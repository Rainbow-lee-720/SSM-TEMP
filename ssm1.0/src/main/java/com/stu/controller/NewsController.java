package com.stu.controller;

import com.stu.bean.News;
import com.stu.exception.MyException;
import com.stu.mapper.NewsMapper;
import com.stu.service.INewsService;
import com.stu.util.ResultAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ClassName NewsController
 * @Description
 * @Author Lee
 * @Date 2020/9/24 18:34
 * @Version 1.0
 **/
@RestController
@RequestMapping("/News")
public class NewsController {

    @Autowired
    private INewsService newsService;

    @Autowired
    private com.stu.task.NewsTask newsTask;

    @Autowired
    private NewsMapper newsMapper;

    @GetMapping(value = "/findAll")
    public List<String> findAll() throws Exception {
        //newsTask.receiveNews();
        List<String> successInfo = new ArrayList<>();
        successInfo.add("hello！");
        successInfo.add("扬子晚报！");
        return successInfo;
    }


    /**
     * @Author Lee
     * @Description //新闻饼图接口
     * @Date 11:43 2020/9/25
     * @Param []
     * @return
     **/
    @GetMapping(value = "/newsPie")
    public List newsPie() throws Exception {
        List<Map<String,Object>> mapList = newsMapper.newsPercentPie();
        List retList = new ArrayList();
        List wrapperList = null;
        for (Map<String,Object> map : mapList) {
            String cName = (String) map.get("cName");
            BigDecimal percent = (BigDecimal) map.get("percent");
            wrapperList = new ArrayList<>();
            wrapperList.add(cName);
            wrapperList.add(percent);
            retList.add(wrapperList);
        }
        return retList;
    }

    /**
     * @Author Lee
     * @Description //按照时间由近及远的顺序显示各新闻接口
     * @Date 11:43 2020/9/25
     * @Param []
     * @return
     **/
    @GetMapping(value = "/queryNewsWeek")
    public ModelAndView queryNewsWeek() throws Exception {
        List<News> newsList = newsMapper.queryNewsWeek();
        //将模型数据存储在modelAndView中
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("newsList",newsList);
        modelAndView.setViewName("main/news_charts");
        return modelAndView;
    }

    /**
     * @Author Lee
     * @Description //新闻详情
     * @Date 11:43 2020/9/25
     * @Param [request]
     * @return
     **/
    @RequestMapping(value = {"/queryNewsInfo"})
    @ResponseBody
    public ResultAction queryNewsInfo(HttpServletRequest request) throws MyException {
        ResultAction resultAction = null;
        //获取前端传来的ID
        String id = request.getParameter("id");
        News news = newsMapper.queryNewsInfo(Long.valueOf(id));
        //保存数据 页面跳转
        if(news == null){
            resultAction = new ResultAction(false,"该新闻详情不存在");
        }else{
            resultAction = new ResultAction(true,news);
        }
        return resultAction;
    }


}
