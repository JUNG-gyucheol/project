<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/13
  Time: 9:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/stockListTop.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function topSearch() {
            var topName = $("#topSearch").val();
            location.href = 'stockTopListPro.jsp?topName=' + topName;
        }

        $(function () {
            if ('${count}' == '0') {
                $("#noList").append("NOLIST!!");
            }
        });
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${sessionScope.grade != 3}" >
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<div class="topStock">
    <div class="topStock1">
        <div class="topSub1">TOP STOCK</div>
        <div class="topSub2">TOP STOCK LIST</div>
        <hr>
        <div class="topSub3">상의 재고리스트</div>
        <div class="top_search">
            <div>MODEL</div>
            <div><input type="text" id="topSearch" placeholder="MODEL"></div>
            <div>
                <button onclick="topSearch()">SEARCH</button>
            </div>
        </div>
        <div class="category">
            <div><a href="stockTopListPro.jsp">TOP</a></div>
            <div><a href="stockBottomListPro.jsp">BOTTOM</a></div>
            <div><a href="stockShoesListPro.jsp">SHOES</a></div>
        </div>
        <hr>
        <div class="top_sub">
            <div class="top_sub1">NUM</div>
            <div class="top_sub2">MODEL</div>
            <div class="top_sub3">COLOR</div>
            <div class="top_sub1">SMALL</div>
            <div class="top_sub1">MEDIUM</div>
            <div class="top_sub1">LARGE</div>
            <div class="top_sub1">XLARGE</div>
        </div>
        <c:if test="${count != 0}">
            <c:forEach var="top" items="${top}">
                <div id="stockList">
                    <div class="top_sub1">${top.productNum}</div>
                    <div class="top_sub2">${top.productName}</div>
                    <div class="top_sub3">${top.color}</div>
                    <div class="top_sub1">${top.small}</div>
                    <div class="top_sub1">${top.medium}</div>
                    <div class="top_sub1">${top.large}</div>
                    <div class="top_sub1">${top.XLarge}</div>
                </div>
            </c:forEach>
            <div class="pageBlock">
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <a href="stockTopListPro.jsp?pageNum=${i}">[${i}]</a>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${count == 0}">
            <div id="noList"></div>
        </c:if>
        <div class="back_btn">
            <button onclick="history.back()">BACK</button>
        </div>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
