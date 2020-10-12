<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/27
  Time: 2:47 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>GGYÜ</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <script src="login.js"></script>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${empty sessionScope.id}">
    <div class="login_container svar">
        <div class="login_container1">
        <div class="account">ACCOUNT</div>
        <div class="newcustomers">NEW CUSTOMERS</div>
        <hr>
        <div class="detail">회원 가입 후 Account 를 생성하면 보다 편리한 쇼핑을 하실수 있습니다.</div>
        <button class="button1" onclick="location.href='memberJoin.jsp'">CREATE ACCOUNT</button>
        <div class="registered">REGISTERED CUSTOMERS</div>
        <hr>
        <form method="post" name="form1" id="form1">
            <div class="loginEnter">
                <input type="text" class="userid" name="userID" id="userID" placeholder="아이디"><br>
                <input type="password" class="userid" name="userPW" id="userPW" placeholder="비밀번호"><br>
            </div>
            <div>
                <input type="button" class="button2" value="LOGIN" onclick="login(); return false;">
                <div class="option">
                    <input class="button3" type="button" value="MAIN" onclick="location.href='../index.jsp'">
                    <div class="forgot"><a id='findPassword' onclick="findPassword()">Forgot Your Password?</a></div>
                </div>
            </div>
        </form>
    </div>
    </div>
</c:if>
<c:if test="${sessionScope.id != null}">
    <script>
        alert("이미 로그인되어 있습니다.");
        location.href = '../index.jsp';
    </script>
</c:if>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
