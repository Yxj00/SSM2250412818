
<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/5/14
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <style>
        table{
            width: 600px;
        }
        table tr td img{
            width: 100px;
            height: 100px;
        }
        .div1{
            position: relative;
            margin-left: 650px;
    }
        .div1 img{
            border-radius: 50%;
            width: 35px;
            height: 35px;
        }
    </style>
</head>
<body>
<div class="div1"><img src="${pageContext.request.contextPath}/img/upload/${user.photo}" alt="">${user.username}

</div>
<div>
<table  align="center" border="1">
    <tr>
        <th>图片</th>
        <th>名称</th>
        <th>价格</th>
        <th>数量</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${pageInfo.list}" var="goods">
        <tr align="center">
            <td><img src="${pageContext.request.contextPath}/img/${goods.img}">
            </td>
            <td>${goods.goodsname}</td>
            <td>${goods.price}</td>
            <td>1</td>
            <td><form action="${pageContext.request.contextPath}/user/${goods.goodsid}" method="post" style="margin-block-end: 0em">
                <input type="hidden" name="_method" value="delete">
                <button type="submit" style="text-align: center;border: none;background-color: transparent"> <span class="glyphicon glyphicon-trash" style="color: red;text-align: center"></span></button>
            </form></td>
        </tr>
    </c:forEach>
</table>
</div>
<div style="margin-top: 20px;text-align: center">
    <ul class="pagination">
        <%--        设置上一页--%>
        <c:if test="${pageInfo.pageNum==1}">
            <li class="disabled"><a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
        </c:if>
        <c:if test="${pageInfo.pageNum!=1}">
            <li class="disabled"><a href="${pageContext.request.contextPath}/user/list1/${pageInfo.pageNum-1}/5" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
        </c:if>
        <c:forEach begin="1" end="${pageInfo.pages}" var="num">
            <c:if test="${num==pageInfo.pageNum}">
                <li class="active"><a href="javascript:void(0)">${num} <span class="sr-only">(current)</span></a></li>
            </c:if>
            <c:if test="${num!=pageInfo.pageNum}">
                <li><a href="${pageContext.request.contextPath}/user/list1/${num}/5">${num} <span class="sr-only">(current)</span></a></li>
            </c:if>
        </c:forEach>
        <c:if test="${pageInfo.pageNum==pageInfo.pages}">
            <li class="disabled"><a href="javascript:void(0)" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
        </c:if>
        <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
            <li class="disabled"><a href="${pageContext.request.contextPath}/user/list1/${pageInfo.pageNum+1}/5" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
        </c:if>
    </ul>
</div>
</body>
</html>
