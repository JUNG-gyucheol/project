<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/22
  Time: 12:37 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CHANGE PASSWORD</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="css/passwordChange.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <script>
        $(function () {
            $('#passwordBtn').on('click', function () {

                var PW = $('#userPW').val();
                var PW1 = $('#userPW1').val();
                var reg3 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}$/;

                var result = reg3.test(PW);
                if (PW.trim() == '') {
                    alert('비밀번호를 입력해주세요.');
                    return;
                } else if (result != true) {
                    alert('정확하게 입력해주세요.');
                    return;
                }
                if (PW != PW1) {
                    alert("비밀번호가 동일하지 않습니다.");
                    return;
                }
                var id = $('#userID').val();
                $.ajax({
                    type: 'post',
                    url: 'passwordChangePro.jsp',
                    data: {
                        id: id,
                        PW: PW
                    },
                    dataType: 'text',
                    success: function (data, textStatus) {
                        if (data == 1) {
                            alert('비밀번호가 변경되었습니다.');
                            window.close();
                        } else {
                            alert('실패하였습니다.')
                        }
                    },
                    error: function (data, textStatus) {
                        alert('ERROR');
                    }
                })
            });
        })
    </script>
</head>
<body>
<div>
    <div class="main_pass1">
        <div class="sub_pass1">Change Password</div>
        <div><input type="password" name="userPW" id="userPW" placeholder="PASSWORD"></div>
        <div class="sub_pass2">비밀번호(6~20자리 영어소대문자와 숫자혼합)</div>
        <div><input type="password" name="userPW1" id="userPW1" placeholder="PASSWORD"></div>
        <div>
            <button id="passwordBtn">PASSWORD CHANGE</button>
        </div>
        <input type="hidden" value="${param.id}" id="userID">
    </div>
</div>
</body>
</html>
