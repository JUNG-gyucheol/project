<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/10
  Time: 3:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="listSide/listSide.css">
    <link rel="stylesheet" href="css/memberProductView.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function select(i) {

            console.log($('[class=cate]').eq(i).text());
            $('[class=cate]').eq(i).css("background", "black").fadeOut();
            $('[class=cate]').eq(i).css("color", "white");
            $('[class=cate]').eq(i).fadeIn('slow');
            $('[class=cate]').eq(i).removeAttr("onclick");
            $("#ad1").append("<div id='sizeG' class='" + $('[class=cate]').eq(i).text() + "'><div id='sizeG2'><div class='sizeG3'>" + $('[class=cate]').eq(i).text() + "</div><div class='deleteG' onclick='deleteLine(" + i + ")'>x</div></div>"
                + "<div class='sizeB1'><div class='sizeB2'>${productBean.productPrice}</div><div class='sizeB3'>STOCK</div>"
                + "<div class='sizeB4'><input type='text' id='stock" + i + "' name='stock' placeholder='NUM' size='5' onkeyup='st(" + i + ")'></div></div>"
                + "<input type='hidden' id='deleteLine" + i + "' name='size' value='" + $('[class=cate]').eq(i).text() + "'>"
                + "<div id='price' class='priceG'>PRICE <span id='price" + i + "'>0</span></div></div>");
        }

        function cart() {
            var num = ${productBean.productNum};
            var size = new Array();
            var stock = new Array();
            for (var i = 0; i < $("[name=stock]").length; i++) {
                size[i] = $("[name=size]").eq(i).val();
                stock[i] = $("[name=stock]").eq(i).val();
            }
            $.ajax({
                type: "post",
                url: "memeberCartPro.jsp",
                data: {
                    "size": size,
                    "stock": stock,
                    num: num
                },
                dataType: "text",
                success: function (data, textStatus) {
                    console.log(data);
                    if (data == 1) {
                        alert("CART!");
                    } else {
                        alert("fail!");
                    }
                },
                error: function (data, textStatus) {
                    alert("ERROR");
                }
            });
        }

        function deleteLine(i) {
            var size1 = $("#deleteLine" + i).val();
            $('[class=cate]').eq(i).attr("onclick", "select(" + i + ")");
            $('div').remove("." + size1 + "");
            $("#price1").text(0);
            $('[class=cate]').eq(i).css("background", "#dcdcdc");
            $('[class=cate]').eq(i).css("color", "black");
        }

        $(function () {
            if ('${productBean.mainCategory}' == 'top') {
                $("#size").empty();
                $("#size").append("<div class='cate' onclick='select(0)' >SMALL</div>"
                    + "<div class='cate' onclick='select(1)'>MEDIUM</div>"
                    + "<div class='cate' onclick='select(2)'>LARGE</div>"
                    + "<div class='cate' onclick='select(3)'>XLARGE</div>");
            } else if ('${productBean.mainCategory}' == 'bottom') {
                $("#size").empty();
                $("#size").append("<div class='cate' onclick='select(0)' >26</div>"
                    + "<div class='cate' onclick='select(1)'>27</div>"
                    + "<div class='cate' onclick='select(2)'>28</div>"
                    + "<div class='cate' onclick='select(3)'>29</div><br>"
                    + "<div class='cate' onclick='select(4)'>30</div>"
                    + "<div class='cate' onclick='select(5)'>31</div>"
                    + "<div class='cate' onclick='select(6)'>32</div>"
                    + "<div class='cate' onclick='select(7)'>33</div>");
            } else if ('${productBean.mainCategory}' == 'shoes') {
                $("#size").empty();
                $("#size").append("<div class='cate' onclick='select(0)' >220</div>"
                    + "<div class='cate' onclick='select(1)'>230</div>"
                    + "<div class='cate' onclick='select(2)'>240</div>"
                    + "<div class='cate' onclick='select(3)'>250</div><br>"
                    + "<div class='cate' onclick='select(4)'>260</div>"
                    + "<div class='cate' onclick='select(5)'>270</div>"
                    + "<div class='cate' onclick='select(6)'>280</div>"
                    + "<div class='cate' onclick='select(7)'>290</div>");
            }
        });

        function st(i) {
            $("#price" + i + "").empty();
            var sum = 0;
            var pri1 = parseInt($('#stock' + i + '').val() || 0);
            var price1 =
            ${productBean.productPrice} *
            pri1;
            var price2 = parseInt($("#price" + i + "").text() || 0);
            var price3 = price2 + price1;
            console.log(price3);
            $("#price" + i + "").empty();
            $("#price" + i + "").append(price3 + "<input id='sum" + i + "' type='hidden' name='priceProduct' value='" + price3 + "'>");
            for (i = 0; i < $("[name=priceProduct]").length; i++) {
                sum = sum + parseInt($("[name=priceProduct]").eq(i).val());
            }
            $("#sumPrice").html(sum + "<input type='hidden' name='price' value='" + sum + "'>");
        }
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<jsp:include page="listSide/listSide.jsp"/>
<c:if test="${empty sessionScope.id}">
    <script>
        alert("로그인 해주세요!!");
        history.back()
    </script>
</c:if>
<div class="productview">
    <div class="productview2">
        <div class="productview1">${productBean.mainCategory}</div>
        <hr>
        <div class="category1">${productBean.mainCategory}</div>
        <div class="brand0">
            <div class="brand1">${productBean.brand}&nbsp;${productBean.productName}&nbsp;&nbsp;${productBean.productColor}</div>
        </div>
        <div class="price1">${productBean.productPrice}</div>
        <div class="content">
            <div>${fn:substringBefore(productBean.productContent, "style")}</div>
        </div>
        <div id="bottom">
            <form id="form1" method="post" action="memberPurchasePro.jsp">
                <div class="bottombrand1">
                    <div class="bottombrand1-1">BRAND</div>
                    <div class="bottombrand1-2">${productBean.brand}</div>
                </div>
                <div class="bottombrand1">
                    <div class="bottombrand1-1">MODEL</div>
                    <div class="bottombrand1-2"> ${productBean.productName}</div>
                </div>
                <div class="bottombrand1">
                    <div class="bottombrand1-1">COLOR</div>
                    <div class="bottombrand1-2">${productBean.productColor}</div>
                </div>
                <div class="size1">SIZE</div>
                <div id="size"></div>

                <div id="ad1"></div>
                <div class="priceGG" id="price">PRICE <span id="sumPrice">0</span></div>
                <input type="hidden" value="${productBean.productNum}" name="productNum">
                <div class="last">
                    <div><input type="submit" value="CHECK"></div>
                    <div id="cart">
                        <button type="button" onclick="cart()" onsubmit="return false;">CART</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
