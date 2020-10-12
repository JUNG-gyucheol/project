<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/21
  Time: 10:43 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>500ERROR</title>
    <style>
        @font-face {
            font-family: 'RedRose-Bold';
            src: url(../font/RedRose-Bold.ttf);
            font-weight: bold;
        }
        body{
            font-family:RedRose-Bold ;
            font-size: 23px;
        }
        img {
            width: 500px;
            height: 500px;
        }
        .error{
            width: 500px;
            margin: auto;
            text-align: center;
        }
        .error div{
            margin-bottom: 20px;
        }
        .error button{
            border: 1px solid peachpuff;
            background:peachpuff ;
            width: 100px;
            height: 30px;
            color: #9f7dcc;
            font-size: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div>
    <div class="error">
        <img src="../images/error_transparent.png">
        <div>500 ERROR PAGE</div>
        <div>Please check again</div>
        <button onclick="history.back()">BACK</button>
    </div>
</div>
</body>
</html>
