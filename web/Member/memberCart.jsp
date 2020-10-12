<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/12
  Time: 1:45 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="myPageSide/myPageSide.css">
    <link rel="stylesheet" href="css/memberCart.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <script>
        function cartList(i) {
            $.ajax({
                type:"post",
                url:"memberCartPro.jsp",
                data:{pageNum : i},
                dataType:"text",
                success:function (data,textStatus) {
                    console.log(data);
                    var result = JSON.parse(data);
                    var cart = result.cart;
                    if(cart.length != 0){
                        $("#cart").empty();
                        $("#pageBlock").empty();
                    for(var i=0; i<cart.length; i++){
                        $("#cart").append(
                                        "<div id='cartList"+i+"' class='cartList'><div class='cartcheck'><input type='checkbox' id='check"+i+"' value='"+cart[i].num+"' name='check'></div>"
                                        + "<div><a href='../products/memberProductViewPro.jsp?productNum="+cart[i].productNum+"'>"+cart[i].thumbnail+"</a></div>"
                                        +"<div class='cartINFO'><div><a href='../products/memberProductViewPro.jsp?productNum="+cart[i].productNum+"'>"+cart[i].productName+"</a></div>"
                                        +"<div>COLOR : "+cart[i].productColor+"</div>"
                                        +"<div class='cartSize'>SIZE : "+cart[i].productSize+"</div></div>"
                                        +"<div class='cartPrice'>"+cart[i].productPrice+"</div>"
                                        +"<div class='cartPrice'>"+cart[i].productStock+"</div>"
                                        +"<div class='cartDate'><div class='carDate1'>"+cart[i].productDate+"</div>"
                                        +"<div><button type='button' onclick='cartDelete("+i+")'>DELETE</button></div></div></div><hr>"
                                        +"<input type='hidden' value='"+cart[i].num+"' id='cartnum"+i+"'>"
                                            );
                    }  for (var i = cart[0].startPage; i <= cart[0].endPage; i++) {
                        $("#pageBlock").append("<a onclick='cartList(" + i + ")'>" + "[" + i + "]" + "</a>");
                    }
                     } else {
                    $("#cart").append("<div class='subList2'> NO LIST😱!!!</div>");
                    }
                }
            });
        }
        function cartDelete(i){
               var num = $("#cartnum"+i).val();
              $.ajax({                  
                  type: "post",
                  url :  "cartDeletePro.jsp",
                  data : {num : num},
                  dataType:"text",
                  success:function (data,textStatus) {
                       if(data == 1){
                           $("#cartList"+i).remove('div');
                           alert('Delete!');
                           $("#cart").empty();
                           cartList();
                           return false;
                       } else {
                           alert('fail');
                       }
                  },
                  error:function (data,textStatus) {
                      alert('ERROR');
                  }
              });
        }

        $(function () {
                cartList();

        });
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<jsp:include page="myPageSide/myPageSide.jsp"/>
<c:if test="${empty sessionScope.id}" >
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<div class="cartsection svar">
    <div class="cartMain">CART LIST</div>
    <div class="cartMain1">CART LIST</div>
    <hr>
    <div class="cartMain2">장바구니</div>
<div class="cartSub">
    <div class="cartSub1">
        <div>CHECK</div>
        <div>PRODUCTINFO</div>
        <div>ORDERPRICE</div>
        <div>ORDERSTOCK</div>
        <div>CARTDATE</div>
    </div>
</div>
    <form action="cartPurchasePro.jsp" method="post">
    <div id="cart"></div>
    <div class="cartPur"><input type="submit" value="PURCHASE"></div>
    <div id="pageBlock"></div>
     </form>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
