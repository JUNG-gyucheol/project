<%@ page import="com.board.BoradDAO" %>
<%@ page import="com.board.BoardBean" %>
<%@ page import="javafx.scene.control.Alert" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/28
  Time: 10:56 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/sideMenu.css">
    <link rel="stylesheet" href="css/boardView.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <script src="javascript/boardView.js"></script>
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<%
    request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("id");
    if(id == null){
        out.println("<script>");
        out.println("alert('로그인 해주세요...')");
        out.println("location.href='../Member/memberLogin.jsp'");
        out.println("</script>");

    }

    int boardNum = Integer.parseInt(request.getParameter("boardNum"));



    BoradDAO boradDAO = new BoradDAO();
    BoardBean boardBean = boradDAO.getBoard(boardNum);

%>
<div class="viewContainer">
    <div class="contactContent">CONTACT CONTENT</div>
    <hr>
    <div class="topView">
        <div class="topView1">NUM</div>
        <div class="topView2"><%=boardBean.getBoardNum()%></div>
        <div class="topView3">WRITER</div>
        <div class="topView4"><%=boardBean.getMemberId()%></div>
        <input type="hidden" value="<%=boardBean.getMemberId()%>" id="memberId">
        <div class="topView5">COUNT</div>
        <div class="topView6"><%=boardBean.getCount()%></div>
    </div>
    <div class="centerView">
        <div class="centerView1">SUBJECT</div>
        <div class="centerView2"><%=boardBean.getSubject().replace("<","&lt;").replace(">","&gt;").replace(" ","&nbsp;")%></div>
        <div class="centerView3">DATE</div>
        <div class="centerView4"><%=boardBean.getDate().substring(0,16)%></div>
    </div>
        <div class="contentView">CONTENT</div>
        <div class="contentView1"><%=boardBean.getContent().replace("<","&lt;").replace(">","&gt;").replace(" ","&nbsp;").replace("\r\n","<br>")%></div>
    <hr>
    <div class="bottomView">
    <input type="button" value="UPDATE" onclick="reWrite()">
    <input type="button" value="DELETE" onclick="boardDelete()">
    <input type="button" value="BOARDLIST" onclick="location.href='boardList.jsp'">
    </div>
<div class="commList" id="commentList"></div>
<div class="pageNum" id="commentPageBlock"></div>
<div class="commId" ><%=id%></div>
<input type="hidden" id="currentId" value="<%=id%>">
<div class="commRegi"><textarea class="commRegi" cols="30" rows="6" style="resize: none;" id="comment"></textarea></div>
<div class="commRegi1"><button onclick="commentRegistry()">댓글등록</button></div>
<input type="hidden" id="boardNum" value="<%=boardBean.getBoardNum()%>">
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
