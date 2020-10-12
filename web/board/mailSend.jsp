<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/07
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
    <script src="../ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="css/mailSend.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
<script>
    function registry() {
        if ($('#adminEmail').val() != 'kcpooh0202@naver.com') {
            alert('메일을 잘 못 작성하셨습니다.');
            return;
        }
        ;
        var content = CKEDITOR.instances['p_content'].getData();
        $('#p_content').val(content);
        var form = $("#sandForm").serialize();
        $.ajax({
            type: "post",
            url: "mailSendProc.jsp",
            data: form,
            dataType: "text",
            success: function (data, textStatus) {
                var result = data;
                if (result == 1) {
                    alert("MAIL complete!!");
                    location.href = 'mailList.jsp';
                } else {
                    alert("MAIL failure!!");
                }
            },
            error: function (data, textStatus) {
                alert("error");
            }
        });
    }

    $(function () {
        CKEDITOR.replace('p_content', {
            height: 350,
            removePlugins: 'resize'
        });
    });
</script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${sessionScope.grade != 3}" >
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<c:set var="contactBean" value="${contactBean}"/>
<div class="sendSection">
    <div class="sendSection1">
        <div class="topSub1">MAIL</div>
        <div class="topSub2">MAIL</div>
        <hr>
        <div class="topSub3">문의메일</div>
        <form id="sandForm" method="post">
            <div class="sendSub1-1">
                <div class="sendSub1-2">ID</div>
                <div class="sendSub1-3">${sessionScope.id}</div>
            </div>
            <div class="sendSub2-1">
                <div class="sendSub2-2">ADMINEMAIL</div>
                <div class="sendSub2-3"><input type="email" name="adminEmail" id="adminEmail" placeholder="EMAIL"></div>
            </div>
            <div class="sendSub1-1">
                <div class="sendSub1-2">USERID</div>
                <div class="sendSub1-3">${contactBean.memberId}</div>
            </div>
            <input type="hidden" name="id" value="${contactBean.memberId}">
            <input type="hidden" name="num" value="${contactBean.num}">
            <div class="sendSub1-1">
                <div class="sendSub1-2">USEREMAIL</div>
                <div class="sendSub1-3">${contactBean.email}</div>
            </div>
            <input type="hidden" name="email" value="${contactBean.email}">
            <div class="sendSub2-1">
                <div class="sendSub2-2">SUBJECT</div>
                <div class="sendSub2-3"><input type="text" name="subject" placeholder="SUBJECT" size="30"></div>
            </div>
            <div class="sendCon">CONTENT</div>
            <textarea id="p_content" name="p_content"></textarea>
            <div class="sendBtn">
                <input type="button" onclick="registry()" value="SEND">
                <input type="button" onclick="location.href='mailList.jsp'" value="CANCLE">
            </div>
        </form>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
