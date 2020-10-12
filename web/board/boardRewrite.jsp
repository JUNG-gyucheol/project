<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.board.BoradDAO" %>
<%@ page import="com.board.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/29
  Time: 3:26 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <script src="../header/header.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/sideMenu.css">
    <link rel="stylesheet" href="css/boardReWrite.css">
    <script src="javascript/boardRewrite.js"></script>
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<body>
<%
    int boardNum = Integer.parseInt(request.getParameter("boardNum"));

    BoradDAO boradDAO = new BoradDAO();
    BoardBean boardBean =boradDAO.getReWriteBoard(boardNum);
%>
<jsp:include page="../header/header.jsp"/>
<jsp:include page="sideMenu.jsp"/>
<c:if test="${empty sessionScope.id}" >
    <script>
        alert("로그인 해주세요!");
        location.href='../Member/memberLogin.jsp';
    </script>
</c:if>
<div class="upDateContainer">
<form method="post" name="form1" id="form1">
    <div class="updateTop">BOARD UPDATE</div>
    <hr>
    <div class="topUpdate">
        <div class="topUpdate1">NUM</div>
        <div class="topUpdate2"> <%=boardBean.getBoardNum()%></div>
        <input type="hidden" value="<%=boardBean.getBoardNum()%>" name="boardNum">
        <div class="topUpdate3">WRITER</div>
        <div class="topUpdate4"><%=boardBean.getMemberId()%></div>
        <div class="topUpdate5">COUNT</div>
        <div class="topUpdate6"><%=boardBean.getCount()%></div>
    </div>
    <div class="centerUpdate">
        <div class="centerUpdate1">SUBJECT</div>
        <div class="centerUpdate2"><input type="text" name="subject" value="<%=boardBean.getSubject().replace("<","&lt;").replace(">","&gt;").replace(" ","&nbsp;")%>"></div>
        <div class="centerUpdate3">DATE</div>
        <div class="centerUpdate4"><%=boardBean.getDate().substring(0,16)%></div>
    </div>

        <div class="conentUpdate">CONTENT</div>
        <div class="conentUpdate1"><textarea rows="10" cols="30" style="resize: none;" name="content"><%=boardBean.getContent().replace("<","&lt;").replace(">","&gt;").replace(" ","&nbsp;").replace("<br>","\n")%></textarea></div>
    <div class="bottomUpdate">
    <input  type="button" value="UPDATE" onclick="reWrite()">
    <input   type="button" value="CANCLE" onclick="location.href='boardList.jsp'">
    </div>
</form>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
