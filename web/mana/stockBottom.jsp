<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/13
  Time: 10:16 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/stockBottom.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function bottomSearch() {
            var bottomName = $("#bottomSearch").val();
            location.href = 'stockBottomListPro.jsp?bottomName=' + bottomName;
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
<div class="bottomStock">
    <div class="bottomStock1">
        <div class="bottomSub1">BOTTOM STOCK</div>
        <div class="bottomSub2">BOTTOM STOCK LIST</div>
        <hr>
        <div class="bottomSub3">하의 재고리스트</div>
        <div class="bottom_search">
            <div>MODEL</div>
            <div><input type="text" id="bottomSearch" placeholder="MODEL"></div>
            <div>
                <button onclick="bottomSearch()">SEARCH</button>
            </div>
        </div>
        <div class="category">
            <div><a href="stockTopListPro.jsp">TOP</a></div>
            <div><a href="stockBottomListPro.jsp">BOTTOM</a></div>
            <div><a href="stockShoesListPro.jsp">SHOES</a></div>
        </div>
        <hr>
        <div class="bottom_sub">
            <div class="bottom_sub1">NUM</div>
            <div class="bottom_sub2">MODEL</div>
            <div class="bottom_sub3">COLOR</div>
            <div class="bottom_sub1">26SIZE</div>
            <div class="bottom_sub1">27SIZE</div>
            <div class="bottom_sub1">28SIZE</div>
            <div class="bottom_sub1">29SIZE</div>
            <div class="bottom_sub1">30SIZE</div>
            <div class="bottom_sub1">31SIZE</div>
            <div class="bottom_sub1">32SIZE</div>
            <div class="bottom_sub1">33SIZE</div>
        </div>
        <c:if test="${count != 0}">
            <c:forEach var="bottom" items="${bottom}">
                <div id="stockList">
                    <div class="bottom_sub1">${bottom.productNum}</div>
                    <div class="bottom_sub2">${bottom.productName}</div>
                    <div class="bottom_sub3">${bottom.color}</div>
                    <div class="bottom_sub1">${bottom.size26}</div>
                    <div class="bottom_sub1">${bottom.size27}</div>
                    <div class="bottom_sub1">${bottom.size28}</div>
                    <div class="bottom_sub1">${bottom.size29}</div>
                    <div class="bottom_sub1">${bottom.size30}</div>
                    <div class="bottom_sub1">${bottom.size31}</div>
                    <div class="bottom_sub1">${bottom.size32}</div>
                    <div class="bottom_sub1">${bottom.size33}</div>
                </div>
            </c:forEach>
            <div class="pageBlock">
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <a href="stockBottomListPro.jsp?pageNum=${i}">[${i}]</a>
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
