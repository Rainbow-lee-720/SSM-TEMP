package com.stu.task;

import com.stu.bean.Channel;
import com.stu.bean.News;
import com.stu.exception.MyException;
import com.stu.service.IChannelService;
import com.stu.service.INewsService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @ClassName NewsTask
 * @Description
 * @Author Lee
 * @Date 2020/9/24 18:35
 * @Version 1.0
 **/
@Component("NewsTask")
public class NewsTask {

    @Autowired
    private INewsService newsService;

    @Autowired
    private IChannelService channelService;

    //每隔一分钟抓取一次
    @Scheduled(cron = "0 */1 * * * ?")
    public void TimeTask() throws Exception{
        System.out.println("------每隔一分钟抓取一次------");
        //receiveNews();
    }

    //Dom解析网页Html标签 获取相关页面元素内容
    public void receiveNews() throws Exception{
        String YZWB_URL = "http://www.yangtse.com/";
        //获取当前网页的DOM模型对象 用于操作DOM元素
        Document document = Jsoup.connect(YZWB_URL).get();
        //获取第一个channel---'扬子频道'
        Element channelElement = document.getElementsByClass("channel-name").first();
        //找出扬子频道下的所有频道
        Elements liList = channelElement.children();
        //先清空之前的新闻表记录---定时任务
        newsService.truncateNews();
        //遍历子节点 找出每一个频道(排除最后一个div元素 防止空指针异常)
        for (int i = 0; i < liList.size() - 1; i ++) {
            Element nodes = liList.get(i);
            //获取子频道名称
            Element aElement = nodes.getElementsByTag("a").first();
            String channelName = aElement.text();
            //将获取的频道数据持久化
            Channel channel = new Channel(channelName);
            channelService.addChannel(channel);
            //获取频道ID
            long cId = channel.getCId();

            //获取每一个频道的新闻详情的URL后缀
            String newsUrl = aElement.attr("href");
            //拼接出每一个新闻的完整URL(校验其中包含Http链接)
            String YZWB_NEWS_URL = newsUrl.startsWith("http") ? newsUrl : YZWB_URL + newsUrl;
            //获取详情页DOM对象
            Document newsDocument = Jsoup.connect(YZWB_NEWS_URL).get();
            //获取每一条新闻的HTML元素
            Elements newsBoxList = newsDocument.getElementsByClass("box");
            for (int j = 0; j < newsBoxList.size(); j ++) {
                Element boxNodes = newsBoxList.get(j);
                //获取新闻标题
                Element titleBoxElement = boxNodes.getElementsByClass("box-text-title").first();
                if (titleBoxElement == null) {
                    throw new MyException("系统出错！");
                }
                //获取超链接元素
                Element aBoxElement = titleBoxElement.getElementsByTag("a").first();
                //获取当前新闻的详情URL
                String newsInfoUrl = YZWB_URL + aBoxElement.attr("href");
                //获取新闻标题
                String newsInfoTitle = aBoxElement.text();
                //获取新闻发布时间
                Element timeBoxElement = boxNodes.getElementsByClass("box-text-time").first();
                Element spanBoxElement = timeBoxElement.getElementsByTag("span").first();
                String newsInfoTime = spanBoxElement.text();
                Date date=new Date(newsInfoTime);
                //将获取的新闻数据持久化
                News news = new News(cId,newsInfoTitle,date,newsInfoUrl);
                newsService.addNews(news);
            }
        }
    }

}
