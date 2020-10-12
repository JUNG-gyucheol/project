<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/12
  Time: 12:47 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="myPageSide/myPageSide.css">
    <link rel="stylesheet" href="css/orderProduct.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<jsp:include page="myPageSide/myPageSide.jsp"/>
<c:if test="${empty sessionScope.id}">
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<div id="orderList svar">
    <div class="orderList3">
        <div class="orderMain">ORDER LIST</div>
        <div class="orderMain1">ORDER LIST</div>
        <hr>
        <div class="orderMain2">구매내역</div>
        <div class="orderSub">
            <div class="orderSub1">
                <div>PRODUCTINFO</div>
                <div>ORDERDATE</div>
                <div>ORDERPRICE</div>
                <div>ORDERSTOCK</div>
                <div>OREDERINFO</div>
            </div>
        </div>
        <c:if test="${count != 0}">
        <c:forEach var="list" items="${list}">
        <div class="orderList1">
            <div class="orderList2">
                <div id="order${list.num}">
                    <div class="thumb1"><a
                            href='../products/memberProductViewPro.jsp?productNum=${list.productNum}'>${fn:substringBefore(list.thumbnail,"style")}></a>
                    </div>
                    <div id="info">
                        <div><a
                                href='../products/memberProductViewPro.jsp?productNum=${list.productNum}'>${list.purchaseitem}</a>
                        </div>
                        <div>COLOR : ${list.purchaseColor}</div>
                        <div>PRICE : ${list.productPrice}</div>
                        <div class="size">SIZE : ${list.purchaseSize}</div>
                    </div>
                    <div class="date">${fn:substring(list.date,0,16)}</div>
                    <div class="price">${list.purchasePrice}</div>
                    <div class="stock">${list.purchaseStock}</div>
                    <div id="orderinfo">
                        <div class="pay">${list.payment}</div>
                        <div>
                            <button id="refund${list.num}" onclick="">REFUND</button>
                        </div>
                    </div>
                    <script>
                        $("#refund${list.num}").on("click", function () {
                            $("#order${list.num}").remove('div');
                            var num = ${list.num};
                            var productNum = ${list.productNum};
                            var size = '${list.purchaseSize}';
                            var stock = ${list.purchaseStock};
                            var cate = '${list.purchaseCategory}';
                            $.ajax({
                                type: "post",
                                url: "orderRefundPro.jsp",
                                data: {
                                    num: num,
                                    productNum: productNum,
                                    size: size,
                                    stock: stock,
                                    cate: cate,
                                },
                                dataType: "text",
                                success: function (data, textStatus) {
                                    console.log(data);
                                    if (data == 1) {
                                        alert('Refund');
                                    } else {
                                        alert('fail');
                                    }
                                },
                                error: function (data, textStatus) {
                                    alert('error');
                                }
                            });
                        });
                    </script>
                        <%--                <div class="address">--%>
                        <%--                    <div>${list.postcode}</div>--%>
                        <%--                    <div>${list.address}</div>--%>
                        <%--                </div>--%>
                </div>
            </div>
        </div>
            </c:forEach>
            <div id="pageBlock">
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <div class="page"><a href="orderProductPro.jsp?pageNum=${i}">[${i}]</a></div>
                </c:forEach>
            </div>
            </c:if>
            <c:if test="${count == 0}">
                <div class="noList">NO LIST❌</div>
            </c:if>

    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
