<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/5/7
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/regstyle.css">
    <style>
        .div1 img {
            width: 150px;
            border-radius: 50%;
        }
        .form1 {
            text-align: center;
        }

        .form1 input {
            margin-top: 5px;
        }

        .form1 textarea {
            margin-top: 5px;
            width: 175px;
        }
    </style>
</head>
<body>
<form method="post" enctype="multipart/form-data" class="form1" action="${pageContext.request.contextPath}/user/upload">
    <div id="login_box">
        <div id="input_box">
    <input type="file" name="file" placeholder="上传头像" style="margin-left: 0px"><br>
        </div>
        <div class="input_box">
     <input type="text" name="username" placeholder="请设置用户名"><br>
        </div>
        <div class="input_box">
     <input type="password" name="password" id="password1" placeholder="请设置密码"><br>
        </div>
        <div class="input_box">
    <input type="password" name="passwd2" id="passwd2" placeholder="请确认密码" onblur="check()"><br>
        </div>
        <div class="input_box">
    <input type="text" name="tel" placeholder="请输入电话"><br>
        </div>
        <div class="input_box">
     <input type="text" name="pid" placeholder="请输入身份证号码"><br>
        </div>
        <div class="input_box">
     <textarea name="address" placeholder="请输入家庭住址"></textarea><br>
        </div>
    <button type="submit">注册</button>
    </div>
</form>
</body>
<script>
    function check() {
        if (password1.value !== passwd2.value) {
            alert("两次输入密码不一致,请重新输入！")
            // password1.value = "";
            passwd2.value = "";
        }
    }

</script>
</html>
