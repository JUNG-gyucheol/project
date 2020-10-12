<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/13
  Time: 8:48 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/refundList.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${sessionScope.grade != 3}" >
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<div class="re_main">
    <div class="re_main1">
        <div class="re_top1">REFUND</div>
        <div class="re_top2">REFUND LIST</div>
        <hr>
        <div class="re_top3">환불 리스트</div>
        <div class="re_sub">
        <div  class="re_sub1">PRODUCT INFO</div>
        <div  class="re_sub2">CUSTOMER</div>
        <div  class="re_sub3">REFUND DATE</div>
        </div>
        <c:if test="${count != 0}">
        <c:forEach var="refund" items="${refund}">
            <div class="re_all">
                <div class="re_thumb">
                    <div>${fn:substringBefore(refund.thumbnail,"style")}></div>
                </div>
                <div class="re_info">
                    <div>${refund.purchaseitem}</div>
                    <div class="re_info1">
                        <div>COLOR</div>
                    <div>${refund.purchaseColor}</div>
                    </div>
                    <div class="re_info1">
                        <div>CATEGORY</div>
                    <div >${refund.purchaseCategory}</div>
                    </div>

                    <div class="re_info1">
                        <div>SIZE</div>
                    <div >${refund.purchaseSize}</div>
                    </div>
                    <div class="re_info1">
                        <div>STOCK</div>
                    <div >${refund.purchaseStock}</div>
                    </div>
                    <div class="re_info1">
                        <div>SUM</div>
                    <div>${refund.purchasePrice}</div>
                    </div>
                </div>
                <div class="re_id">
                    <div>${refund.purchaseId}</div>
                </div>
                <div class="re_date">
                    <div>${fn:substring(refund.date,0,16)}</div>
                </div>
            </div>
        </c:forEach>

                <div class="pageNum">
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <a href="refundListPro.jsp?pageNum=${i}">[${i}]</a>
            </c:forEach>
                </div>
        </c:if>
        <c:if test="${count == 0}">
            <div class="no_list">NO LIST❌</div>
        </c:if>
        <div class="back_btn">
            <button type="button" onclick="history.back()">BACK</button>
        </div>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
