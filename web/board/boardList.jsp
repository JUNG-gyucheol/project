<%@ page import="java.util.ArrayList" %>
<%@ page import="com.board.BoardBean" %>
<%@ page import="com.board.BoradDAO" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/28
  Time: 2:43 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/boardList.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function idCheck() {
            $.ajax({
                type:"post",
                url:"idCheck.jsp",
                data:"text",
                success:function (data , status) {
                    var result = data;
                    if(result == 1){
                        location.href='boardWrite.jsp';
                    } else {
                        alert("권한이 없습니다🤬!");
                    }
                },
                error:function () {
                    alert('에러발생!!');
                }
            });
        }
        function boardSearch(i) {
            var subject = $("#boardSearch").val();
            // if($.trim(subject) == ""){
            //     alert('제목을 입력해주세요!!');
            //     return;
            // }
            $.ajax({
                type: "post",
                url:"boardSearchPro.jsp",
                data:{subject : subject,
                    pageNum : i },
                dataType:"text",
                success:function (data, status) {
                    var result = eval('('+data+')');
                    var board = result.board;
                    $("#numList").empty();
                    $("#pageBlock").empty();
                    if(board.length != 0) {
                        for (var i = 0; i < board.length; i++) {
                            $("#numList").append(
                                "<div class='subList1'><div class='num' id='num'>" + board[i].boardNum + "</div>"
                                + "<div class='subject'><a href='boardView.jsp?boardNum=" + board[i].boardNum + "&commentPage=null'>" + board[i].subject + "</a></div>"
                                + "<div class='id'>" + board[i].memberId + "</div>"
                                + "<div class='date'>" + board[i].date + "</div>"
                                + "<div class='count'>" + board[i].count + "</div></div><hr>");
                        }
                        for (var i = board[0].startPage; i <= board[0].endPage; i++) {
                            $("#pageBlock").append("<a onclick='boardSearch(" + i + ")'>" + "[" + i + "]" + "</a>");
                        }
                    } else{
                        $("#numList").append("<div class='subList2'> NO LIST😱!!!</div>");
                    }
                },
                error:function () {
                    alert('에러발생!');
                }
            });
        }
        function allList(){
            if($("#boardSearch").val() == ""){
                boardSearch();
            }
        }

        $(function () {
            boardSearch();
        })
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<%--<%--%>
<%--    String pageNum = request.getParameter("pageNum");--%>
<%--    int pageSize = 10;--%>

<%--    if(pageNum == null){--%>
<%--        pageNum = "1";--%>
<%--    }--%>

<%--    int currentPage = Integer.parseInt(pageNum);--%>


<%--    int startRow = (currentPage - 1) * pageSize ;--%>
<%--    int endRow = pageSize;--%>
<%--    BoradDAO boradDAO = new BoradDAO();--%>
<%--    ArrayList<BoardBean> list = boradDAO.getAllBoard(startRow , endRow);--%>
<%--    int count = boradDAO.boardCount();--%>
<%--%>--%>
<div class="boardList">
        <div class="topBoard">BOARD</div>
        <div class="topBoard1">BOARD</div>
        <hr>
        <div class="topBoard2">게시판</div>
    <div class="boardList1">
          <div class="subList">
                <div id="num">NUM</div>
                <div class="subject">SUBJECT</div>
                <div>WRITER</div>
                <div>DATE</div>
                <div>COUNT</div>
          </div>
        <div id="numList"></div>
<%--            <%--%>
<%--                for(int i=0; i<list.size(); i++){--%>
<%--             %>--%>
<%--                <tr>--%>
<%--                    <td><%=list.get(i).getBoardNum()%></td>--%>
<%--                    <td><a href="boardContent.jsp?boardNum=<%=list.get(i).getBoardNum()%>"><%=list.get(i).getSubject()%></a></td>--%>
<%--                    <td><%=list.get(i).getMemberId()%></td>--%>
<%--                    <td><%=list.get(i).getDate()%></td>--%>
<%--                    <td><%=list.get(i).getCount()%></td>--%>
<%--                </tr>--%>
<%--            <%--%>
<%--                }--%>
<%--            %>--%>
<%--<%--%>
<%--    int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);--%>
<%--    int pageBlock = 10;--%>
<%--    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;--%>
<%--    int endPage = startPage + pageBlock - 1 ;--%>
<%--    if(endPage>pageCount)endPage=pageCount;--%>
<%--%>--%>
<%--<%--%>
<%--    for(int i=startPage; i<=endPage; i++){--%>
<%--%>--%>
<%--        <a href="boardList.jsp?pageNum=<%=i%>">[<%=i%>]</a>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<div class="pageBlock" id="pageBlock"></div>
    <div class="search">
        <div class="search1">SEARCH</div>
<input class="search2" type="text" id="boardSearch" onkeyup="allList()" placeholder="SEARCH">
<input class="search3" type="button" value="SEARCH" onclick="boardSearch()">
    </div>
    <div class="bottomButton">
<button  class="bottomButton1" onclick="idCheck()">REGISTRY</button>
<button class="bottomButton2" onclick="location.href='../index.jsp'">MAIN</button>
    </div>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
<script src="../header/header.js"></script>
</body>
</html>
