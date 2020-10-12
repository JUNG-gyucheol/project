<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/22
  Time: 2:03 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MAIL</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/findPasswordMail.css">
    <script>
        $(function () {
            $('#numberSend').on('click', function () {
                var email = $('#email').val();
                if (email.trim() == '') {
                    alert('이메일을 입력해주세요!!');
                    return;
                }
                $('#numberCheck').empty();
                $('#numberCheck').append('<div><input type="text" id="numberCheck1" placeholder="NUMBER"></div>'
                    + '<div><input type="button" id="numberCheck2" onclick="numberCheck()" value="NUMBER CHECK"></div>');

                $.ajax({
                    type: 'post',
                    url: 'findPasswordMailPro.jsp',
                    data: {email: email},
                    dataType: 'text',
                    success: function (data, textStatus) {
                        $('#numberCheck').append("<input type='hidden' value='" + data + "' id='numberMail'>");
                    },
                    error: function (data, textStatus) {

                    }
                })
            })
        });

        function numberCheck() {
            var enterNumber = $('#numberCheck1').val();
            var mailNumber = $('#numberMail').val().trim();
            var id = $('#userID').val();
            console.log(enterNumber);
            console.log(mailNumber);
            if (enterNumber === mailNumber) {
                alert("일치합니다.");
                location.href = 'passwordChange.jsp?id=' + id;
            } else {
                alert("불일치");
                return;
            }
        }
    </script>
</head>
<body>
<div class="main_pass">
    <div class="main_pass1">
        <div class="sub_pass1">Certification Number</div>
        <div><input id='email' type="email" name="email" placeholder="EMAIL"></div>
        <div><input id="numberSend" type="button" value="SEND"></div>
        <div id="numberCheck"></div>
        <input type="hidden" value="${param.id}" id="userID">
    </div>
</div>
</body>
</html>
