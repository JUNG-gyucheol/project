<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/05
  Time: 10:47 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
</head>
<body>
<header class="box header">
    <div class="pi">
    </div>
    <div class="main1">
        <a href="../index.jsp" class="mainlogo">G&nbsp;G&nbsp;Y&nbsp;Ü&nbsp;S&nbsp;T&nbsp;O&nbsp;R&nbsp;E</a>
    </div>
    <div class="main2">
        <ul class="nav1" id="close">
            <li class="ggyu"><a href="../index.jsp">GGYÜ</a></li>
            <li class="subnav1"><a href="../products/memberProductsListPro.jsp">CLOTHS</a>
                <ul class="subnav1-1" id="close">
                    <div class="subnav1-2">
                        <div>
                            <li><a href="../products/memberProductsListPro.jsp">ALL</a></li>
                            <li><a href="../products/memberTopListPro.jsp">TOP</a></li>
                            <li><a href="../products/memberBottomListPro.jsp">BOTTOM</a></li>
                            <li><a href="../products/memberShoesListPro.jsp">SHOES</a></li>
                        </div>
                    </div>
                </ul>
            </li>
            <li><a href="../board/mailList.jsp">CONTACT</a></li>
            <li><a href="../board/boardList.jsp">BOARD</a></li>
            <li><a href="../board/galleryList.jsp">GALLERY</a></li>
        </ul>
        <ul class="nav2">
            <li><a id="headerSearch">SEARCH</a></li>
            <li id="search1"><input type="text" id="enter" placeholder="SEARCH"></li>
            <c:if test="${empty sessionScope.id }">
                <li><a href="../Member/memberLogin.jsp">account</a></li>
                <li><a href="../Member/memberJoin.jsp">create account</a></li>
            </c:if>
            <c:if test="${sessionScope.id eq 'admin1' and sessionScope.id != null}">
                <li>admin login</li>
                <li><a onclick="logout()">logout</a></li>
                <li><a href="../Member/memberCheck.jsp">MYPAGE</a></li>
                <li><a href="../mana/managerMenuPro.jsp">adminpage</a></li>
            </c:if>
            <c:if test="${sessionScope.id != 'admin1' and sessionScope.id != null}">
                <li>${sessionScope.id} LOGIN</li>
                <li><a href="../Member/memberCheck.jsp">MYPAGE</a></li>
                <li><a href="../Member/memberCart.jsp">CART</a></li>
                <li><a onclick="logout()">LOGOUT</a></li>
            </c:if>
        </ul>
    </div>
</header>
</body>
</html>
