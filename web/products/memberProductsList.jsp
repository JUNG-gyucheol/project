<%@ page import="com.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.ProductBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/02
  Time: 1:33 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../ckeditor/ckeditor.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="listSide/listSide.css">
    <link rel="stylesheet" href="css/memberProductsList.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">

</head>

<body>
<jsp:include page="../header/header.jsp"/>
<jsp:include page="listSide/listSide.jsp"/>
<div id="maincon">
    <div class="allList">
        <div class="allList1">ALL</div>
        <div class="allList2">ALL LIST</div>
        <hr>
        <div class="allList3">전체상품</div>
 <c:if test="${count != 0}">
<c:set var="cnt" value="0"/>
<c:forEach var="list" items="${list}">
    <div id="con">
        <div class="allListthumb">
    <div><a class="a1" href="memberProductViewPro.jsp?productNum=${list.productNum}">${fn:substringBefore(list.thumbnail,"style")}</a></div>
        </div>
        <div class="allListSub">
    <div><a class="a2" href="memberProductViewPro.jsp?productNum=${list.productNum}">${list.productName}</a></div>
    <div>COLOR : ${list.productColor}</div>
    <div class="d1">PRICE : ${list.productPrice}</div>
        </div>
    </div>
    <c:set var="cnt" value="${cnt + 1}"/>
    <c:if test="${(cnt%4) == 0}">
        <br>
    </c:if>
</c:forEach>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <div class="pageNum"><a href="memberProductsListPro.jsp?pageNum=${i}">[${i}]</a> </div>
    </c:forEach>
        <hr>
    </div>
 </c:if>
    <c:if test="${count == 0}">
        <div>NO LIST❌</div>
    </c:if>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
