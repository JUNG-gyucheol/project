<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/07
  Time: 9:04 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="boardSide/listSide.css">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/mailView.css">
    <link rel="stylesheet" href="../footer/footer.css">
<script>
    function IDCHECK() {
        if(${sessionScope.grade != 3}){
            alert("권한이 없습니다!!!");
            return;
        }
        var num = $("#contectNum").val()
        location.href='mailSendPro.jsp?contactNum='+num;
    }
</script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
    <c:set var="contactBean" value="${contactBean}"/>
<c:if test="${(sessionScope.grade == 3) or (sessionScope.id eq contactBean.memberId) }">
<div class="bigContent">
<div class="content">
    <div class="content1">CONTACT</div>
    <div class="content2">CONTACT</div>
    <hr>
    <div class="content3">문의</div>
    <div class="sub1">
    <div class="sub1-1">NUM</div>
    <div class="sub1-2">${contactBean.num}</div>
        <input type="hidden" id="contectNum" value="${contactBean.num}">
    <div class="sub1-3">DATE</div>
    <div class="sub1-4">${fn:substring(contactBean.date,0 ,16)}</div>
    </div>
    <div class="sub2">
    <div class="sub2-1">ID</div>
    <div class="sub2-2">${contactBean.memberId}</div>
    <div class="sub2-3">EMAIL</div>
    <div class="sub2-4">${contactBean.email}</div>
    </div>
    <div class="sub3">CONTENT</div>
    <div>${contactBean.content}</div>
    <div class="sub4">
    <button onclick="IDCHECK()">MAIL</button>
    <button onclick="location.href='mailList.jsp'">CANCLE</button>
    </div>
</div>
</div>
</c:if>
<c:if test="${(sessionScope.grade != 3) && (sessionScope.id != contactBean.memberId)}">
<script>
    alert('권한이없습니다.');
    location.href='mailList.jsp';
</script>
</c:if>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
