<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/13
  Time: 10:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/stockShoesList.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function shoesSearch() {
            var shoesName = $("#shoesSearch").val();
            location.href = 'stockShoesListPro.jsp?shoesName=' + shoesName;
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
<div class="shoesStock">
    <div class="shoesStock1">
        <div class="shoesSub1">SHOES STOCK</div>
        <div class="shoesSub2">SHOES STOCK LIST</div>
        <hr>
        <div class="shoesSub3">신발 재고리스트</div>
        <div class="shoes_search">
            <div>MODEL</div>
            <div><input type="text" id="shoesSearch" placeholder="MODEL"></div>
            <div>
                <button onclick="shoesSearch()">SEARCH</button>
            </div>
        </div>
        <div class="category">
            <div><a href="stockTopListPro.jsp">TOP</a></div>
            <div><a href="stockBottomListPro.jsp">BOTTOM</a></div>
            <div><a href="stockShoesListPro.jsp">SHOES</a></div>
        </div>
        <hr>
        <div class="shoes_sub">
            <div class="shoes_sub1">NUM</div>
            <div class="shoes_sub2">MODEL</div>
            <div class="shoes_sub3">COLOR</div>
            <div class="shoes_sub1">220SIZE</div>
            <div class="shoes_sub1">230IZE</div>
            <div class="shoes_sub1">240SIZE</div>
            <div class="shoes_sub1">250SIZE</div>
            <div class="shoes_sub1">260SIZE</div>
            <div class="shoes_sub1">270SIZE</div>
            <div class="shoes_sub1">280SIZE</div>
            <div class="shoes_sub1">290SIZE</div>
        </div>
        <c:if test="${conut != 0}">
            <c:forEach var="shoes" items="${shoes}">
                <div id="stockList">
                    <div class="shoes_sub1">${shoes.productNum}</div>
                    <div class="shoes_sub2">${shoes.productName}</div>
                    <div class="shoes_sub3">${shoes.color}</div>
                    <div class="shoes_sub1">${shoes.size220}</div>
                    <div class="shoes_sub1">${shoes.size230}</div>
                    <div class="shoes_sub1">${shoes.size240}</div>
                    <div class="shoes_sub1">${shoes.size250}</div>
                    <div class="shoes_sub1">${shoes.size260}</div>
                    <div class="shoes_sub1">${shoes.size270}</div>
                    <div class="shoes_sub1">${shoes.size280}</div>
                    <div class="shoes_sub1">${shoes.size290}</div>
                </div>
            </c:forEach>
            <div class="pageBlock">
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <a href="stockShoesListPro.jsp?pageNum=${i}">[${i}]</a>
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
