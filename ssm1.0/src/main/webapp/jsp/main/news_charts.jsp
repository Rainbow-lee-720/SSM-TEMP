<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/25 0012
  Time: 08:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>新闻报表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 响应式布局 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 新 Bootstrap3 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static.bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static.bootstrap/css/bootstrap-theme.css">

    <!-- 字体文件 -->
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- jQuery文件 务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/resources/static.bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap3 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/resources/static.bootstrap/js/bootstrap.min.js"></script>

    <!-- highcharts 文件 -->
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</head>
<style type="text/css">
    #div1{
        border: 0px solid lightgray;
        width : 100%;
        height: 100%;
        overflow: auto;
        overflow-x: hidden;
    }
    #div2{
        height : 50px;
        background-color: #2C3E50;
    }
    #div3{
        float: left;
        color: white;
        font-size: 18px;
        font-weight: bold;
        position: relative;
        top : 10px;
        left: 12px;
    }
    #div4{
        width : 1500px;
        height: 80px;
        position: relative;
        top : 20px;
        left: 18px;
        margin-bottom: 30px;
    }
    #div5{
        float: right;
        position: relative;
        top : 7px;
        right: 9px;
    }
    .span{
        color: #26A65B;
    }
    .span2{
        border:0px;
        border-bottom:3px solid lightseagreen;
    }
</style>

<body>
    <div id="div1">
        <div id="div2">
            <div id="div3"><span class="glyphicon glyphicon-stats"></span><span>&nbsp;新闻Charts</span></div>
        </div>

        <div id="div4">
            <div class="alert alert-success">
                <a href="#" class="close" data-dismiss="alert">
                    <span class="glyphicon glyphicon-remove-sign"></span>
                </a>
                <strong>提示：</strong>可视化新闻Charts
            </div>
        </div>

        <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
        <div id="container3" style="width: 950px; height: 650px; margin-top: 100px;"></div>

        <div class="table-responsive" style="margin-top: 60px;">
            <table class="table table-striped table-bordered table-hover" id="tableId">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>频道名称</th>
                    <th>新闻标题</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${newsList}" var="news">
                    <tr>
                        <td>${news.id}</td>
                        <td>${news.channelName}</td>
                        <td>${news.newsTitle}</td>
                        <td><fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td class="td_a">
                            <a href="#" onclick="queryNewsInfo('${news.id}')" data-toggle="modal" data-target="#myModal2">
                                <span class="glyphicon glyphicon-tag"></span>
                            </a>
                            <!-- 模态框（Modal） -->
                            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                <span class="glyphicon glyphicon-remove-sign"></span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel2" style="color: lightseagreen;font-weight: bold;">
                                                新闻详情
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">新闻编号：</label>
                                                <div class="col-sm-10">
                                                    <p class="form-control-static" id="id"></p>
                                                </div>
                                                <label class="col-sm-2 control-label">频道名称：</label>
                                                <div class="col-sm-10">
                                                    <p class="form-control-static" id="channelName"></p>
                                                </div>
                                                <label class="col-sm-2 control-label">新闻标题：</label>
                                                <div class="col-sm-10">
                                                    <p class="form-control-static" id="newsTitle"></p>
                                                </div>
                                                <label class="col-sm-2 control-label">发布时间：</label>
                                                <div class="col-sm-10">
                                                    <p class="form-control-static" id="publishTime"></p>
                                                </div>
                                                <label class="col-sm-2 control-label">新闻链接：</label>
                                                <div class="col-sm-10">
                                                    <p class="form-control-static" id="newsUrl"></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-warning" data-dismiss="modal">
                                                关闭
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

<%--        <div id="container" style="width: 800px; height: 400px; margin-top: 100px;position:relative;left: 20px;float: left;"></div>--%>
<%--        <div id="container2" style="width: 1350px; height: 500px; position:relative;left: 20px;top: 100px;"></div>--%>
    </div>
    <script language="JavaScript">
        $(document).ready(function() {
            <!-- 新闻分布图 -->
            var chart3 = {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            };
            var title3 = {
                text: '新闻分布图'
            };
            var tooltip3 = {
                pointFormat: '{series3.name}: <b>{point.percentage:.1f}%</b>'
            };
            var plotOptions3 = {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}%</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    },
                    showInLegend: true
                }
            };
            var series3= [{
                type: 'pie',
                name: '占比',
                data : []
            }];

            var json3 = {};
            json3.chart = chart3;
            json3.title = title3;
            json3.tooltip = tooltip3;
            json3.series = series3;
            json3.plotOptions = plotOptions3;

            /* 发送ajax请求 */
            $.ajax({
                type: "GET",
                //当发送json数据时添加：
                contentType: "application/json; charset=utf-8",
                url: "${pageContext.request.contextPath}/News/newsPie",
                success: function (data) {
                    //对echarts模板进行数据填充
                    series3[0].data = data
                    //重新加载图表显示
                    $('#container3').highcharts(json3);
                }
            });
        });

        //新闻详情
        function queryNewsInfo(id) {
            $.ajax({
                type : "get",
                async : false,
                cache : false,
                contentType : "application/json;charset=UTF-8",
                url : "${pageContext.request.contextPath}/News/queryNewsInfo?id=" + id,
                success : function (resp) {
                    //处理查询结果
                    if(resp.result) {
                        //将数据填充到模态框中
                        $("#id").html(resp.content.id);
                        $("#channelName").html(resp.content.channelName);
                        $("#newsTitle").html(resp.content.newsTitle);
                        $("#newsUrl").html(resp.content.newsUrl);
                        $("#publishTime").html(resp.content.publishTime);
                    }
                }
            });
        }

    </script>
</body>
</html>
