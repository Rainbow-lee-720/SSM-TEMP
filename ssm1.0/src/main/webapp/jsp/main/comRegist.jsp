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
    <title>企业注册</title>
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
            padding: 0;
            margin: 0;
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
        $(function () {
            //返回上一级
            $("#back").click(function () {
                history.go(-1);
            });

            //校验表单数据
            $("#submit").click(function() {
                //获取表单值
                var comNo = $.trim($("#comNo").val());
                var comPwd = $.trim($("#comPwd").val());
                var confirmComPwd = $.trim($("#confirmComPwd").val());
                var comName = $.trim($("#comName").val());
                var comPhone = $.trim($("#comPhone").val());
                var comAddress = $.trim($("#comAddress").val());
                //企业权限
                var comPower = $.trim($("#comPower").val());

                //非空校验
                if(comNo == "" || comNo == null){
                    $("#errComNo").html("请输入企业编号");
                    $("#comNo").focus(function () {
                        $("#errComNo").html("");
                    });
                }if(comPwd == "" || comPwd == null){
                    $("#errComPwd").html("请输入密码");
                    $("#comPwd").focus(function () {
                        $("#errComPwd").html("");
                    });
                }if(confirmComPwd == "" || confirmComPwd == null){
                    $("#errConfirmComPwd").html("请确认密码");
                    $("#confirmComPwd").focus(function () {
                        $("#errConfirmComPwd").html("");
                    });
                }if(comName == "" || comName == null){
                    $("#errComName").html("请输入企业名称");
                    $("#comName").focus(function () {
                        $("#errComName").html("");
                    });
                }if(comPhone == "" || comPhone == null){
                    $("#errComPhone").html("请输入企业电话");
                    $("#comPhone").focus(function () {
                        $("#errComPhone").html("");
                    });
                }if(comAddress == "" || comAddress == null){
                    $("#errComAddress").html("请填写企业地址");
                    $("#comAddress").focus(function () {
                        $("#errComAddress").html("");
                    });
                }
                //正则表达式校验
                if(isNaN(comNo)){
                    alert("企业编号必须为数字!");
                }if(isNaN(comPhone)){
                    alert("企业电话号码必须为数字!");
                }
                var regxPattern = /^1[34578]\d{9}$/;
                if(!(regxPattern.test(comPhone))){
                    alert("企业电话号码为数字1开头的11位数字组成!")
                }
                //校验密码
                if(comPwd != confirmComPwd){
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
            <h2 style="color: snow;">企业注册</h2>
            <hr/>
        </div>

        <form class="form-horizontal">
            <div class="container">
                <div class="row" style="padding: 20px 0">
                    <h3 style="color: #EB7347;">请填写您的企业信息>></h3>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="comNo">企业编号：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="comNo" id="comNo" type="text" placeholder="请输入企业编号(企业编号即用户名)">
                        <div id="errComNo" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="comPwd">登录密码：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="comPwd" id="comPwd" type="password" placeholder="请输入您的登录密码(密码由6-10位数字、字母或下划线组成)">
                        <div id="errComPwd" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="confirmComPwd">确认密码：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="confirmComPwd" id="confirmComPwd" type="password" placeholder="请确认您的登录密码(密码由6-10位数字、字母或下划线组成)">
                        <div id="errConfirmComPwd" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="comName">企业名称：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="comName" id="comName" type="text" placeholder="请输入您的企业名称">
                        <div id="errComName" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="comPhone">企业电话：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" name="comPhone" id="comPhone" type="text" placeholder="请输入您的企业电话号码">
                        <div id="errComPhone" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="comAddress">企业地址：</label>
                    <div class="col-lg-7 col-md-6">
                        <textarea class="form-control" rows="5" name="comAddress" id="comAddress" placeholder="请填写您的企业真实地址"></textarea>
                        <div id="errComAddress" style="color: orange;"></div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-2" for="comPower">企业权限(公司)：</label>
                    <div class="col-lg-7 col-md-6">
                        <input class="form-control" rows="5" name="comPower" id="comPower" value="2" readonly="readonly"></input>
                        <div id="errComPower" style="color: #c9302c">(提示：注册时系统默认提供企业权限)</div>
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
