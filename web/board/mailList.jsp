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
    <link rel="stylesheet" href="boardSide/listSide.css">
    <script src="../header/header.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/mailList.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function contactSearch(i) {
            var subject = $("#idSearch").val();
            $.ajax({
                type: "post",
                url: "mailListSearchPro.jsp",
                data: {
                    subject: subject,
                    pageNum: i
                },
                dataType: "text",
                success: function (data, status) {
                    console.log(data);
                    var result = JSON.parse(data);
                    var contact = result.contact;
                    $("#centerMail").empty();
                    $("#pageBlock").empty();
                    console.log(contact.length)
                    if (contact.length != 0) {
                        for (var i = 0; i < contact.length; i++) {
                            $("#centerMail").append(
                                "<div class='topMail'><div class='topMail1'>" + contact[i].num + "</div>"
                                + "<div class='topMail2'><a href='mailViewPro.jsp?mailNum=" + contact[i].num + "'>" + contact[i].subject + "</a></div>"
                                + "<div class='topMail1'>" + contact[i].memberId + "</div>"
                                + "<div class='topMail1'>" + contact[i].date + "</div></div><hr>");
                        }
                        for (var i = contact[0].startPage; i <= contact[0].endPage; i++) {
                            $("#pageBlock").append("<a onclick='contactSearch(" + i + ")'>" + "[" + i + "]" + "</a>");
                        }
                    } else {
                        $("#centerMail").append("<div class='noMailList'> NO LIST😱!!!</div>");
                    }
                },
                error: function () {
                    alert('에러발생!');
                }
            });
        }

        function idSearch1() {
            var id = $("#idSearch").val();
            if (id == '') {
                contactSearch();
            }
        }

        function idCheck() {
            if (${empty sessionScope}) {
                alert('로그인해주세요.');
                location.href = '../Member/memberLogin.jsp';
            } else {
                location.href = 'mailRegistry.jsp';
            }
        }

        $(function () {
            contactSearch();
        })
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<div class="mailListContainer">
    <div class="topMailCon">CONTACT</div>
    <div class="topMailCon1">CONTACT LIST</div>
    <hr>
    <div class="topMailCon2">문의하실 글을 등록해주시면 메일로 답장드리겠습니다.</div>
    <div class="topMailSub">
        <div class="topMailSub1">NUM</div>
        <div class="topMailSub2">SUBJECT</div>
        <div class="topMailSub3">WRITER</div>
        <div class="topMailSub4">DATE</div>
    </div>
    <div class="centerMail" id="centerMail"></div>
    <div id="pageBlock" class="pageBlock"></div>
    <div class="idSearchBar">
        <div class="idSearchBar1">ID</div>
        <input type="text" id="idSearch" placeholder="ID" onkeydown="idSearch1()">
        <button onclick="contactSearch()">SEARCTH</button>
    </div>
    <div class="bottomContact">
        <button onclick="idCheck()">CONTACT</button>
        <button onclick="idCheck()">MAIN</button>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
