<%@ page import="com.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.ProductBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/02
  Time: 1:33 오전
  To change this template use File | Settings | File Templates.
--%>
<script src="../ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../header/header.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="productslist/listSide.css">
    <link rel="stylesheet" href="css/allProductsList.css">
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<jsp:include page="productslist/listSide.jsp"/>
<c:if test="${sessionScope.grade != 3}">
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<c:if test="${count != 0}">
<div id="maincon">
        <c:set var="cnt" value="0"/>
    <div class="conG">
        <div class="products1">PRODUCTS</div>
        <div class="products2">PRODUCTS LIST</div>
        <hr>
        <div class="products3">상품리스트</div>
        <c:forEach var="list" items="${list}">
            <div id="con">
                <div><a class="a1"
                        href="productViewPro.jsp?productNum=${list.productNum}">${fn:substringBefore(list.thumbnail,"style")}</a>
                </div>
                <div class="con1"><a class="a2"
                                     href="productViewPro.jsp?productNum=${list.productNum}">${list.productName}</a>
                </div>
                <div class="con1">${list.productColor}</div>
                <div class="con1">${list.productPrice}</div>
            </div>
            <c:set var="cnt" value="${cnt + 1}"/>
            <c:if test="${(cnt%5) == 0}">
                <br>
            </c:if>
        </c:forEach>
        <div class="pageNum">
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <a href="allProductsListPro.jsp?pageNum=${i}">[${i}]</a>
            </c:forEach>
        </div>
        <hr>
        </c:if>
        <c:if test="${count == 0}">
            <div class="no_list">NO LIST❌</div>
        </c:if>
    </div>
    <jsp:include page="../footer/footer.jsp"/>
</body>
</html>
