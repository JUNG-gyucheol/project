<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.nio.channels.SeekableByteChannel" %>
<%@ page import="javafx.scene.control.Alert" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/28
  Time: 3:06 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/boardWrite.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <script src="javascript/boardWrite.js"></script>
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${empty sessionScope.id}">
    <script>
        alert("로그인을 해주세요!!");
        location.href='../Member/memberLogin.jsp';
    </script>

</c:if>
<div class="sidemenu">
    <ul>
        <li>문의게시판</li>
        <li>문의메일</li>
        <li>갤러리게시판</li>
    </ul>
</div>
<div class="whiteBox">
<form method="post" name="form1" id="form1">
    <div class="CONTACT">CONTACT BOARD</div>
        <div class="whiter1">
            <div class="whiter2">WRITER</div>
            <div class="whiter3">${sessionScope.id}</div>
        </div>
        <hr>
        <div class="subject">
            <div class="subject1">SUBJECT</div>
           <input class="subject2" type="text" name="subject" id="subject" placeholder="SUBJECT">
            </div>

            <div class="content1">CONTENT</div>
            <textarea class="content2" rows="10" cols="30" style="resize: none" maxlength="500" name="content" id="content" placeholder="CONTENT"></textarea>
    <input type="hidden" name="memberId" value="${sessionScope.id}">
        <div class="button1">
        <input class="submit" type="button" onclick="boardRegistry()" value="REGISTRY">
        <input class="cancle" type="button" onclick="location.href='boardList.jsp'" value="CANCLE">
        </div>
    </form>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
