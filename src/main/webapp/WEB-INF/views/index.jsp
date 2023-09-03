<%@ taglib prefix="bind" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/5/7
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <style>
        .div1 .div2{
            float: right;
            width: 320px;
            margin-left: 100px;
        }
        a{
            padding-left: 40px;
            text-decoration: none;
            color: black;
        }
        .div2 a:hover{
            color: red;
        }
        .div3{
            margin-left: 100px;
        }
        .div3 img{
            width: 200px;
            height: 200px;
        }
        table tr td{
            padding: 30px;
        }
    </style>
</head>
<body>

    <div class="div1">
        <form style="text-align: left;margin-left: 80px;margin-top: 10px;" action="${pageContext.request.contextPath}/user/conditions">
            <a href="${pageContext.request.contextPath}/user/list/1/6" > <span>类别&nbsp;</span></a>
            <input type="text" name="kind" placeholder="请选择类别"  id="txt">
            <select id="test" onchange="tt(this.id)">
                <option value="1">电脑</option>
                <option value="2">手机</option>
                <option value="3">平板</option>
            </select>
            <input type="submit" value="查询">

            <div class="div2">
                <c:if test="${empty user}">
<%--                    <a href="${pageContext.request.contextPath}/user/list/1/5" hidden ><span id="sp">查询所有用户</span></a>--%>
                <a href="${pageContext.request.contextPath}/page/register">注册</a>
                <a href="${pageContext.request.contextPath}/page/login">登录</a>
                </c:if>
                <c:if test="${!empty user}">
                    <a href="${pageContext.request.contextPath}/user/gwc">加入购物车</a>
                </c:if>
            </div>
        </form>
    </div>
<table align="center" border="0">
    <c:if test="${pageInfo!=null}">
        <c:set var="i" value="1"></c:set>
<c:forEach items="${pageInfo.list}" var="goods">
    <c:if test="${i%3==1}">
    <tr align="center">
    </c:if>
            <td class="div3">
                <img src="${pageContext.request.contextPath}/img/${goods.img}">
                    <h3>${goods.goodsname}</h3>
                    <p><a href="${pageContext.request.contextPath}/user/goods/${goods.goodsid}" class="btn btn-primary" role="button">加入购物车</a>
                        <a href="${pageContext.request.contextPath}/user/${goods.goodsid}" class="btn btn-default" role="button">查看详情</a></p>
            </td>
    <c:if test="${i%3==0}"></tr></c:if>
    <c:set var="i" value="${i+1}"></c:set>
</c:forEach>
    </c:if>
    <c:if test="${goodSList!=null}">
        <c:set var="i" value="1"></c:set>
        <c:forEach items="${goodSList}" var="goods">
            <c:if test="${i%3==1}">
                <tr align="center">
            </c:if>
                <td class="div3">
                    <img src="${pageContext.request.contextPath}/img/${goods.img}">
                    <h3>${goods.goodsname}</h3>
                    <p><a href="#" class="btn btn-primary" role="button">加入购物车</a>
                        <a href="${pageContext.request.contextPath}/user/${goods.goodsid}" class="btn btn-default" role="button">查看详情</a></p>
                </td>

            <c:if test="${i%3==0}"></tr></c:if>
            <c:set var="i" value="${i+1}"></c:set>
        </c:forEach>
    </c:if>
</table>
    <div style="margin-top: 20px;text-align: center">
        <ul class="pagination">
            <%--        设置上一页--%>
            <c:if test="${pageInfo.pageNum==1}">
                <li class="disabled"><a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=1}">
                <li class="disabled"><a href="${pageContext.request.contextPath}/user/list/${pageInfo.pageNum-1}/6" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:forEach begin="1" end="${pageInfo.pages}" var="num">
                <c:if test="${num==pageInfo.pageNum}">
                    <li class="active"><a href="javascript:void(0)">${num} <span class="sr-only">(current)</span></a></li>
                </c:if>
                <c:if test="${num!=pageInfo.pageNum}">
                    <li><a href="${pageContext.request.contextPath}/user/list/${num}/6">${num} <span class="sr-only">(current)</span></a></li>
                </c:if>
            </c:forEach>
            <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                <li class="disabled"><a href="javascript:void(0)" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                <li class="disabled"><a href="${pageContext.request.contextPath}/user/list/${pageInfo.pageNum+1}/6" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
        </ul>
    </div>
</body>
<script>
    function tt(id) {
        var aa = document.getElementById(id);
        var i = aa.selectedIndex;
        var text = aa.options[i].text;
        document.getElementById("txt").value = text;
    }


</script>
</html>
