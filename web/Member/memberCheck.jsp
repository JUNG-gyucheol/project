<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/09
  Time: 2:56 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <link rel="stylesheet" href="../header/header.css">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="css/memberCheck.css">
    <script src="../header/header.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
</head>
<script>
    function updateIdCheck() {
        var pass = $("#password1").val().trim();
        var id = '${sessionScope.id}';
        if (pass == '') {
            alert('비밀번호를 입력해주세요.');
            return;
        }
        $.ajax({
            type: "post",
            url: "memberPWCheckPro.jsp",
            data: {
                pass: pass,
                id: id
            },
            dataType: "text",
            success: function (data, textStatus) {
                var result = data;
                if (result == 1) {
                    alert('비밀번호 일치~!🤩');
                    location.href = 'memberUpdatePro.jsp?id=${sessionScope.id}';
                } else if (result == 2) {
                    alert('비밀번호가 틀림😡!');
                }
            },
            error: function (data, textStatus) {
                alert("Error");
            }
        });
    }
</script>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${empty sessionScope.id}" >
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<article class="svar">
    <div class="section">
        <div>
            <ul class="sidemenu">
                <li><a href="memberCheck.jsp">INFOUPDATE</a></li>
                <li><a href="orderProductPro.jsp">ORDERLIST</a></li>
                <li><a href="memberCart.jsp">CART</a></li>
            </ul>
        </div>
        <div class="update">
            <div class="update1">UPDATE</div>
            <div class="update1-1">CUSTOMER UPDATE</div>
            <hr>
            <div class="update2">회원정보 수정하시려면 비밀번호를 입력해주세요.</div>
            <div class="update3">${sessionScope.id}</div>
            <div><input class="userpw" type="password" name="password1" id="password1" placeholder="PASSWORD"></div>
            <div><input class="button1" type="button" value="CHECK" onclick="updateIdCheck()"></div>
            <div><input class="button2" type="button" value="MAIN" onclick="location.href='../index.jsp'"></div>
        </div>
    </div>
</article>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
