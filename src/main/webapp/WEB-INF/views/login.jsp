<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/5/7
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginstyle.css">
    <style>
        form{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-wrapper">
        <div class="header">欢迎登录
        </div>
        <div class="form-wrapper">
<div style="color: red;text-align: center">${loginInfo}</div>
<form action="${pageContext.request.contextPath}/user/login" method="post">
    <input type="text" name="username" class="input-item" placeholder="username"><br>
    <input type="password" name="password" class="input-item" placeholder="password"><br>
    <button type="submit">登录</button>

</form>
        </div>
    </div>
</div>
</body>
</html>
