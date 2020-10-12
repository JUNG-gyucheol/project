<%@ page import="java.nio.channels.SelectableChannel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/26
  Time: 5:09 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../header/header.css">
    <script src="../header/header.js"></script>
    <script src="join.js"></script>
    <link rel="stylesheet" href="css/join.css">
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${empty sessionScope.id}">
<div class="joinContainer svar">
    <div class="joinContainer1">
    <div class="createAccount">CREATE ACCOUNT</div>
    <div class="createAccount1">CREATE ACCOUNT</div>
    <hr>
    <form  method="post"  id="form1" name="form1">
        <div class="loginCheck">
        <input class="loginCheck1" type="text" id="userID" placeholder="아이디" onkeydown="reId()" name="userID">
        <input class="loginCheck2" type="button" id="idCheck" value="IDCHECK" onclick="idCheck1()" style="font-size: 16px">
        <input type="hidden" id="id_Check" value="fal">
        </div>
        <div class="loginCheck3">아이디(4~12자리 영어와 숫자혼합)</div>
        <div class="password">
        <input class="password1" type="password" id="userPW1" placeholder="비밀번호" name="userPW">
        <input class="password2" type="password" id="userPW2" placeholder="비밀번호재확인">
        </div>
        <div class="password3">비밀번호(6~20자리 영어소대문자와 숫자혼합)</div>
        <div class="name">
        <input class="name1" type="text" id="userName" placeholder="이름(한글 2~5글자)" name="userName">
        <input class="gender" type="radio" name="gender" id="남자" checked value="남자">MAN
        <input type="radio" name="gender" id="여자" value="여자">WOMAN
        </div>
        <div class="birth">
        <input class="birth1" type="text" id="testDatepicker" placeholder="생년월일" name="birth">
        <input class="email" type="email"id="userEamil" placeholder="이메일" name="userEmail">
        </div>
        <div class="phone">
        <input class="phone1" type="text" id="phone1" size="8" name="p1" placeholder="010"> - <input class="phone1" type="text" id="phone2" size="8" name="p2" placeholder="1234"> - <input class="phone1" type="text" id="phone3" name="p3" size="8" placeholder="5678">
        </div>
        <div class="postCode">
        <input class="postCode1" type="text" id="sample6_postcode" placeholder="우편번호" readonly="readonly" name="postCode">
        <input class="postCode2" type="button" onclick="sample6_execDaumPostcode()" value="POSTCODE" style="font-size: 16px">
        </div>
        <div class="adress">
        <input class="adress1" type="text" id="sample6_address" placeholder="주소" size="25" readonly="readonly" name="adress">
        </div>
        <div class="adress2">
        <input class="adress3" type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress">
        <input class="adress4" type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress">
        </div>
        <div>
        <input class="submit" type="button" value="JOIN" onclick="Check(); return false;" style="font-size: 25px">
        </div>
        <input class="cancle" type="button" value="CANCLE" onclick="location.href='../index.jsp'">
    </form>
    </div>
</div>
</c:if>
<c:if test="${sessionScope.id != null}">
    <script>
        alert('이미 로그인되어 있습니다.');
        location.href='../index.jsp';
    </script>
</c:if>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>