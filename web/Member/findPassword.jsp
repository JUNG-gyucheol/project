<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/22
  Time: 1:36 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FORGAT PASSWORD</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/findPassword.css">
    <script>
        $(function () {
            $('#check').on('click',function () {
                var name = $('#name').val();
                var id =  $('#id').val();
                if($('#name').val().trim() == ''){
                    alert("이름을 입력해주세요.");
                    return;
                }
                if($('#id').val().trim() == ''){
                    alert("아이디를 입력해주세요.");
                    return;
                }
                $.ajax({
                    type:"post",
                    url:'findPasswordPro.jsp',
                    data:{name : name,
                            id : id},
                    dataType:'text',
                    success:function (data, textStatus) {
                        if(data == 1 ){
                            location.href='findPasswordMail.jsp?id='+id;
                        } else {
                            alert("이름이나 아이디가 틀렸습니다.");
                        }
                    },
                    error:function (data, textStatus) {
                        alert("ERROR");
                    }
                })
            });
        })
    </script>
</head>
<body>
<div class="main_pass">
    <div class="main_pass1">
    <div class="sub_pass1">Find Password</div>
    <div><input id="name" type="text" name="name" placeholder="NAME"></div>
    <div><input id="id" type="text" name="id" placeholder="ID"></div>
    <div><input id='check' type="button" value="CHECK"></div>
    </div>
</div>
</body>
</html>
