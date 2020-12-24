<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/5 0005
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>大学毕业生就业信息管理平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 新 Bootstrap3 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static.bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static.bootstrap/css/bootstrap-theme.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/resources/static.bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap3 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/resources/static.bootstrap/js/bootstrap.min.js"></script>

    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        /* body 样式 */
        body {
            font-family: Arial;
            margin: 0;
        }

        /* 标题 */
        .header {
            padding: 40px;
            text-align: center;
            background: #1abc9c;
            color: white;
        }

        /* 标题字体加大 */
        .header h1 {
            font-size: 40px;
        }

        /* 导航 */
        .navbar {
            overflow: hidden;
            background-color: #333;
            margin-bottom: 10px;
        }

        /* 导航栏样式 */
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        /* 右侧链接*/
        .navbar a.right {
            float: right;
        }

        /* 鼠标移动到链接的颜色 */
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        /* 列容器 */
        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
        }

        /* 主要的内容区域 */
        .main {
            -ms-flex: 70%; /* IE10 */
            flex: 70%;
            background-color: white;
            padding: 20px;
        }

        /* 测试图片 */
        .fakeimg {
            background-color: #aaa;
            width: 100%;
            padding: 20px;
        }

        /* 底部 */
        .bottom-div{
            color: #EB7347;
            font-weight: bold;
            font-size: 1em;
            padding: 20px;
            text-align: center;
            background: #2C3E50;
        }
        /* 响应式布局 - 在屏幕设备宽度尺寸小于 700px 时, 让两栏上下堆叠显示 */
        @media screen and (max-width: 700px) {
            .row {
                flex-direction: column;
            }
        }

        /* 响应式布局 - 在屏幕设备宽度尺寸小于 400px 时, 让导航栏目上下堆叠显示 */
        @media screen and (max-width: 400px) {
            .navbar a {
                float: none;
                width: 100%;
            }
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 110%;
            background-color: #D0D0D0;
            position: relative;
            right: 10px;
            height: 100%;
            overflow: auto;
        }

        li{
            margin-bottom: 30px;
        }

        li a {
            width: 100%;
            display: block;
            color: #000;
            padding: 16px 28px;
            text-decoration: none;
            font-size: 1.4em;
            font-weight: bold;
            text-align: left;
        }

        li a.active {
            background-color: #4CAF50;
            color: white;
        }

        li a:hover:not(.active) {
            background-color: #333;
            color: white;
        }

        .iframe{
            width: 110%;
            height: 100%;
            overflow: hidden;
            border: none;
        }
    </style>
</head>
<body>
    <div id="main">
        <div class="header">
            <h1 style="font-weight: bold;">大学毕业生就业信息管理平台</h1>
        </div>

        <div class="navbar">
            <a href="#" style="background-color: #4CAF50;">主页</a>
            <a href="#">新闻</a>
            <a href="#">关于我们</a>
            <a href="#" class="right" style="color: #00CCFF">退出</a>
            <a class="right" style="color: snow;">Admin</a>
        </div>

        <div id="middle" class="row col-lg-12" style="background-color: snow;height: 900px;">
            <div  id="left" class="col-lg-2 left">
                    <ul>
                        <li><a href="#home;">招聘信息</a></li>
                        <li><a href="../../index.jsp" target="iframe">企业信息</a></li>
                        <li><a href="#contact">就业推荐</a></li>
                        <li><a href="#about">就业分析</a></li>
                        <li><a href="#about">就业信息</a></li>
                        <li><a href="#about">个人中心</a></li>
                        <li><a href="#about">账号管理</a></li>
                    </ul>
            </div>

            <div id="right" class="col-lg-10 right" style="background-color: snow;position: relative;left:20px;overflow: hidden;">
                <iframe id="iframe" name="iframe" class="iframe" src="">


                </iframe>
            </div>
        </div>


        <div id="footer" class="col-lg-12 bottom-div">
            <p style="font-size: 14px;text-align: center">©Nuist BinJiang  大学毕业生就业信息管理平台 Version1.0 2020-01-01</p>
            <p style="font-size: 12px;text-align: center">-2016软工二 20162344068-</p>
        </div>
    </div>
</body>
</html>
