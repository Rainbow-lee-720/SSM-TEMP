<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/4 0004
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生注册</title>
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

    <style type="text/css">
        body{
            width : 100%;
            height: 100%;
            overflow: auto;
            background-color: #2C3E50;
        }
        .main_div{
            width : 100%;
            height: 100%;
            overflow: auto;
        }
        label{
            font-size: 1em;
            font-weight: bold;
            color: snow;
        }
        .bottom-div{
            color: #EB7347;
            font-weight: bold;
            font-size: 1em;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            //返回上一级
            $("#back").click(function () {
                history.go(-1);
            });
            //校验表单数据
            $("#submit").click(function() {
                //获取表单值
                var stu = $.trim($("#stuNo").val());
                var stuNo = $.trim($("#stuNo").val());
                var stuPwd = $.trim($("#stuPwd").val());
                var confirmStuPwd = $.trim($("#confirmStuPwd").val());
                var stuName = $.trim($("#stuName").val());
                var stuAge = $.trim($("#stuAge").val());
                var stuSex = $.trim($("input[type='radio']:checked").val());
                var stuSchool = $.trim($("#stuSchool").val());
                var stuSpecialty = $.trim($("#stuSpecialty").val());
                var stuPhone = $.trim($("#stuPhone").val());
                var stuAddress = $.trim($("#stuAddress").val());
                //学生权限
                var stuPower = $.trim($("#stuPower").val());
                if(stuNo == "" || stuNo == null){
                    $("#errStuNo").html("请输入用户名");
                    $("#stuNo").focus(function () {
                        $("#errStuNo").html("");
                    });
                }if(stuPwd == "" || stuPwd == null){
                    $("#errStuPwd").html("请输入密码");
                    $("#stuPwd").focus(function () {
                        $("#errStuPwd").html("");
                    });
                }if(confirmStuPwd == "" || confirmStuPwd == null){
                    $("#errConfirmStuPwd").html("请确认密码");
                    $("#confirmStuPwd").focus(function () {
                        $("#errConfirmStuPwd").html("");
                    });
                }if(stuName == "" || stuName == null){
                    $("#errStuName").html("请输入姓名");
                    $("#stuName").focus(function () {
                        $("#errStuName").html("");
                    });
                }if(stuAge == "" || stuAge == null){
                    $("#errStuAge").html("请输入年龄");
                    $("#stuAge").focus(function () {
                        $("#errStuAge").html("");
                    });
                }if(stuSex == "" || stuSex == null){
                    $("#errStuSex").html("请选择性别");
                }if(stuSchool == "" || stuSchool == null){
                    $("#errStuSchool").html("请输入学校名称");
                    $("#stuSchool").focus(function () {
                        $("#errStuSchool").html("");
                    });
                }if(stuSpecialty == "" || stuSpecialty == null){
                    $("#errStuSpecialty").html("请输入专业名称");
                    $("#stuSpecialty").focus(function () {
                        $("#errStuSpecialty").html("");
                    });
                }if(stuPhone == "" || stuPhone == null){
                    $("#errStuPhone").html("请输入电话号码");
                    $("#stuPhone").focus(function () {
                        $("#errStuPhone").html("");
                    });
                }if(stuAddress == "" || stuAddress == null){
                    $("#errStuAddress").html("请填写您的地址");
                    $("#stuAddress").focus(function () {
                        $("#errStuAddress").html("");
                    });
                }
                //正则表达式校验
                if(isNaN(stuNo)){
                    alert("学号必须为数字!");
                }if(isNaN(stuAge)){
                    alert("年龄必须为数字!");
                }if(isNaN(stuPhone)){
                    alert("电话号码必须为数字!");
                }
                var regxPattern = /^1[34578]\d{9}$/;
                if(!(regxPattern.test(stuPhone))){
                    alert("手机号码为数字1开头的11位数字组成!")
                }
                //校验密码
                if(stuPwd != confirmStuPwd){
                    alert("两次输入的密码不一致！请重新输入！");
                }

                //提交表单数据

            });

        });

    </script>
</head>
<body>
    <div id="main_div">
        <div class="jumbotron text-center" style="margin-bottom:0;background-color: #26A65B;height: 200px;">
            <h1 style="color: snow;margin-top: -20px;">大学毕业生就业信息管理平台</h1><br>
            <h2 style="color: snow;">学生注册</h2>
            <hr/>
        </div>

        <form class="form-horizontal">
            <div class="container">
                <div class="row" style="padding: 20px 0">
                    <h3 style="color: #EB7347;">请填写您的个人信息>></h3>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuNo">学号：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="stuNo" id="stuNo" type="text" placeholder="请输入您的学号(学号即用户名)">
                        <div id="errStuNo" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuPwd">登录密码：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="stuPwd" id="stuPwd" type="password" placeholder="请输入您的登录密码(密码由6-10位数字、字母或下划线组成)">
                        <div id="errStuPwd" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="confirmStuPwd">确认密码：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="confirmStuPwd" id="confirmStuPwd" type="password" placeholder="请确认您的登录密码(密码由6-10位数字、字母或下划线组成)">
                        <div id="errConfirmStuPwd" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuName">学生姓名：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="stuName" id="stuName" type="text" placeholder="请输入您的学生姓名">
                        <div id="errStuName" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuAge">年龄：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="stuAge" id="stuAge" type="text" placeholder="请输入您的年龄">
                        <div id="errStuAge" style="color: orange"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" style="position: relative;top: -7px;">性别：</label>
                    <div class="col-lg-7 col-md-6" style="color: white">
                        <input class="stuSex" name="stuSex" type="radio" value="男">男</input>&nbsp;&nbsp;&nbsp;
                        <input class="stuSex" name="stuSex" type="radio" value="女">女</input>
                        <div id="errStuSex" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuSchool">学校：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="stuSchool" id="stuSchool" type="text" placeholder="请输入您的学校">
                        <div id="errStuSchool" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuSpecialty">专业：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="stuSpecialty" id="stuSpecialty" type="text" placeholder="请输入您的专业">
                        <div id="errStuSpecialty" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuPhone">手机号：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="stuPhone" id="stuPhone" type="text" placeholder="请输入您的手机号">
                        <div id="errStuPhone" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuAddress">个人地址：</label>
                    <div class="col-lg-7 col-md-6">
                        <textarea class="form-control" rows="5" name="stuAddress" id="stuAddress" placeholder="请填写您的个人真实地址"></textarea>
                        <div id="errStuAddress" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="stuPower">用户权限(学生)：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" rows="5" name="stuPower" id="stuPower" value="1" readonly="readonly"></input>
                        <div id="errStuPower" style="color: orange;color: #c9302c">(提示：注册时系统默认提供学生权限)</div>
                    </div>
                </div>

                <div class="row form-group" style="margin: 50px auto;">
                    <button type="button" id="submit" class="btn btn-success" style="position:relative;left: 380px;">提交</button>
                    <button type="reset" id="reset" class="btn btn-warning" style="position:relative;left: 430px;">重置</button>
                    <button type="button" id="back" class="btn btn-danger" style="position:relative;left: 480px;">返回</button>
                </div>
            </div>
        </form>

        <div class="bottom-div">
            <p style="font-size: 14px;text-align: center">©Nuist BinJiang  大学毕业生就业信息管理平台 Version1.0 2020-01-01</p>
            <p style="font-size: 12px;text-align: center">-2016软工二 20162344068-</p>
        </div>
    </div>
</body>
</html>
