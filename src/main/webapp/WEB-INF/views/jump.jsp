<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/5/13
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/user/list/1/6" hidden ><span id="sp">查询所有</span></a>

</body>
<script>
    $(function(){
        $("#sp").trigger("click");
    });
</script>
</html>
