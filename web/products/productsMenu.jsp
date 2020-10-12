<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/30
  Time: 11:23 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
    <h1>상품관리</h1>
    <ul>
        <li><a href="allProductsListPro.jsp">전체보기</a></li>
        <li><a href="productsRegistry.jsp">상품등록</a></li>
        <li><a href="thumbnail.jsp">썸네일등록</a></li>
    </ul>
</body>
</html>
