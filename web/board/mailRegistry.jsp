<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/30
  Time: 11:27 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../ckeditor/ckeditor.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/sideMenu.css">
    <link rel="stylesheet" href="../header/header.js">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/mailRegistry.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function registry() {
            var content = CKEDITOR.instances['p_content'].getData();
            $('#p_content').val(content);
            var form = $("#mailFrm").serialize();
            console.log(form);
            $.ajax({
                type: "post",
                url: "mailRegistryPro.jsp",
                data: form,
                dataType: "text",
                success: function (data, textStatus) {
                    console.log(data);
                    var result = data;
                    if (result == 1) {
                        alert("contact complete!!");
                        location.href = 'mailList.jsp';
                    } else {
                        alert("contact failure!!");
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
<c:if test="${empty sessionScope.id}">
    <script>
        alert("로그인 해주세요!");
        location.href = 'memberLogin.jsp';
    </script>
</c:if>
<div class="mailRegiContainer">
    <div class="mailContact">CONTACT</div>
    <div class="mailContact1">*이메일은 반드시 입력해주세요.</div>
    <hr>
    <form method="post" id="mailFrm" name="mailFrm">
        <div class="mailId">
            <div class="mailId1">ID</div>
            <div class="mailId2">${sessionScope.id}</div>
            <div class="mailId3">EMAIL</div>
            <div class="mailId4"><input type="email" placeholder="email" name="email"></div>
        </div>
        <div class="mailSubject">
            <div class="mailSubject1">SUBJECT</div>
            <div class="mailSubject2"><input type="text" placeholder="SUBJECT" name="subject"></div>
        </div>
        <div class="mailContent">CONTENT
            <div>
                <div class="mailContent1">
                    <textarea id="p_content" name="content"></textarea>
                </div>
                <div class="mailButton">
                    <input type="button" value="REGISTRY" onclick="registry()">
                    <input type="button" value="CANCLE" onclick="location.href='mailList.jsp'">
                </div>
            </div>
        </div>
    </form>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
