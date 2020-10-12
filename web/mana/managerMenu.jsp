<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/27
  Time: 4:36 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="managerside/listSide.css">
    <link rel="stylesheet" href="css/managerMenu.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<jsp:include page="managerside/listSide.jsp"/>
<c:if test="${sessionScope.grade != 3}" >
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<div class="menu1">
    <div class="menu1-1">
        <div class="menu1-2">
            <div>오늘의 매출현황</div>
            <div>총 매출현황</div>
        </div>
        <hr>
        <div class="menu1-3">
            <div>${today}</div>
            <div>${gross}</div>
        </div>
        <div class="topsub">Top10</div>
        <div class="topSale">
            <div class="topSale2">
            <c:set var="count" value="${0}"/>
            <c:forEach var="topTen" items="${topTen}">
                <div class="topSale1">

                    <div>
                        ${fn:substringBefore(topTen.thumbnail,"style")}>
                    </div>
                    <div id="sub">
                        <div id="sub1">${topTen.purchaseitem}</div>
                        <div id="sub1">${topTen.purchaseColor}</div>
                        <div id="sub1">${topTen.productPrice}</div>
                    </div>
                </div>
                <c:set var="count" value="${count+1}"/>
                <c:if test="${count%5 == 0}">
                    <br>
                </c:if>
            </c:forEach>
        </div>
    </div>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
