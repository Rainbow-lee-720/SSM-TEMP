package com.stu.mapper;

import com.stu.bean.News;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @ClassName NewsMapper
 * @Description TODO
 * @Author Lee
 * @Date 2020/9/24 18:26
 * @Version 1.0
 **/
@Repository(value = "NewsMapper")
public interface NewsMapper {
    @Insert(" INSERT INTO News(channelId,newsTitle,publishTime,newsUrl,createTime) VALUES(#{channelId},#{newsTitle},#{publishTime},#{newsUrl},now()) ")
    void addNews(News news);

    @Update(" TRUNCATE TABLE News ")
    void truncateNews();

    @Select(value = " SELECT * FROM News ")
    List<News> findAll();

    /**
     * @Author Lee
     * @Description //新闻分布图
     * @Date 11:22 2020/9/25
     * @Param []
     * @return java.util.List<java.lang.String>
     **/
    @Select(value = " SELECT c.channelName as cName,COUNT(*)/(SELECT COUNT(*) FROM News) AS percent FROM News n " +
            " LEFT JOIN Channel c ON n.channelId = c.cId " +
            " WHERE c.cId NOT IN (521) AND DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(n.publishTime) " +
            " GROUP BY n.channelId ")
    List<Map<String,Object>> newsPercentPie();

    /**
     * @Author Lee
     * @Description //按照时间由近及远的顺序显示各新闻
     * @Date 11:41 2020/9/25
     * @Param []
     * @return java.util.List<java.lang.String>
     **/
    @Select(value = " SELECT n.id,c.channelName as channelName,n.newsTitle,DATE_FORMAT(n.publishTime,'%Y-%m-%d %H:%i:%s') as publishTime FROM News n " +
            " LEFT JOIN Channel c ON c.cId = n.channelId " +
            " ORDER BY n.publishTime DESC ")
    List<News> queryNewsWeek();

    /**
     * @Author Lee
     * @Description //新闻详情
     * @Date 11:45 2020/9/25
     * @Param []
     * @return
     **/
    @Select(value = " SELECT n.id,c.channelName as channelName,n.newsTitle,n.newsUrl,DATE_FORMAT(n.publishTime,'%Y-%m-%d %H:%i:%s') as publishTime FROM News n " +
            " LEFT JOIN Channel c ON c.cId = n.channelId " +
            " WHERE n.id = #{id}")
    News queryNewsInfo(@Param(value = "id") long id);
}