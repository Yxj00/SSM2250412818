<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/5/8
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>详情页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
    <style>
        a{
            text-decoration: none;
        }
    </style>
</head>
<body>
<body>
<div id="all">
    <span><a href="${pageContext.request.contextPath}/">返回首页</a></span>
<%--    <div style="clear: both;"></div>--%>
    <div id="content">
        <div class="a1">
            <img class="big" src="${pageContext.request.contextPath}/img/${byId.img}">
            <div class="a11">
                <ul>
                    <li><img src="${pageContext.request.contextPath}/img/${byId.img}"></li>
                    <li><img src="${pageContext.request.contextPath}/img/${byId.img}"></li>
                    <li><img src="${pageContext.request.contextPath}/img/${byId.img}"></li>
                    <li><img src="${pageContext.request.contextPath}/img/${byId.img}"></li>
                </ul>
            </div>
        </div>
        <div class="a2">
            <h3>${byId.goodsname}</h3>
            <div class="a21">
                <div class="a211">
                    <span class="color">售价</span>
                    <span class="prices">￥${byId.price}</span>
                    <span class="yis">已售6264件</span>
                </div>
                <div class="a22">
                    <p></p>
                    <span class="color">类别</span>
                    <span class="neir">${byId.kind}</span>

                </div>
                <div class="a23">
                    <p></p>
                    <span class="color">描述</span>
                    <p style="width: 300px">${byId.detail}</p>
<%--                    <span class="color">配送至</span>--%>
<%--                    <p>郑州</p>--%>
<%--                    <span class="color">说明</span>--%>
<%--                    <p>深圳大鹏新区暂不配送</p>--%>
                </div>
                <div class="a24">
                    <span class="color">型号</span>
                    <p></p>
                    <span class="bang">128G</span>
                    <span class="bang">256G</span>
<%--                    <span class="bang">4磅</span>--%>
                </div>
                <div class="a25">
<%--                    <a href="#"><button class="a25color1">加入购物车</button></a>--%>
                    <a href="#"><button class="a25color2">加入购物车</button></a>
                </div>
            </div>
        </div>
    </div>
<%--    <div style="clear: both;"></div>--%>
<%--    <iframe class="ifooter" src="footer.html"></iframe>--%>
<%--</div>--%>
</body>
</body>
</html>
