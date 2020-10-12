<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/11
  Time: 3:26 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/memberPurchaseEnd.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${empty sessionScope.id}" >
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<div class="purMain">
    <div class="purMain1">
        <div class="topSub1">THANK YOU!!</div>
        <div class="topSub2">ORDER COMPLETE</div>
        <hr>
        <div class="topSub3">구매완료</div>
        <c:forEach var="i" begin="${0}" end="${fn:length(size)-1}">
            <div class="purCon">
                <div class="purCon1">
                    <div>${fn:substringBefore(thumbnail[i],"style")}></div>
                </div>
                <div class="purCon2">
                    <div class="purCon2-1">
                        <div>${productName[i]} ${productColor[i]}</div>
                    </div>
                    <div class="purCon3">
                        <div class="purCon3-1">SIZE</div>
                        <div>${size[i]}</div>
                    </div>
                    <div class="purCon3">
                        <div class="purCon3-1">STOCK</div>
                        <div>${stock[i]}</div>
                    </div>
                    <div class="purCon3">
                        <div class="purCon3-1">SUM</div>
                        <div>${stock[i] * productPrice}</div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="sum_price">
            <div class="sum_price1">SUM</div>
            <div>${sumPrice}</div>
        </div>
        <div class="mainPost">
            <div>ADDRESS</div>
            <div>${postCode}</div>
            <div>${adress}</div>
        </div>
        <div class="payBtn">
            <input type="button" value="MAIN" onclick="location.href='../index.jsp'">
            <input type="button" value="LIST" onclick="location.href='memberProductsListPro.jsp'">
        </div>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
