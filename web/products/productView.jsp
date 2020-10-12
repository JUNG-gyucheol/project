<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/03
  Time: 1:14 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/productView.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function mainCategory(main){

            if(main == 'top'){
                $("#color").html('${productSizeBean.color}');
                $("#size").html("<div>XLarge : ${productSizeBean.XLarge}</div><div> Large : ${productSizeBean.large} </div><div>Medium : ${productSizeBean.medium}</div>"
                    +"<div>Small : ${productSizeBean.small}</div>");
            } else if(main == 'bottom'){
                $("#color").html('${bottomSizeBean.color}');
                $("#size").html("<div>26 : ${bottomSizeBean.size26} </div><div>27 : ${bottomSizeBean.size27}</div>"
                    + "<div>28 : ${bottomSizeBean.size28}</div>"
                    + "<div>29 : ${bottomSizeBean.size29}</div>"
                    + "<div>30 : ${bottomSizeBean.size30}</div>"
                    + "<div>31 : ${bottomSizeBean.size31}</div>"
                    + "<div>32 : ${bottomSizeBean.size32}</div>"
                    + "<div>33 : ${bottomSizeBean.size33}</div>");
            } else if(main == 'shoes'){
                $("#color").html('${productsShoesBean.color}');
                $("#size").html("<div>220 : ${productsShoesBean.size220}</div><div> 230 : ${productsShoesBean.size230}</div>"
                    + "<div>240 : ${productsShoesBean.size240}</div>"
                    + "<div>250 : ${productsShoesBean.size250}</div>"
                    + "<div>260 : ${productsShoesBean.size260}</div>"
                    + "<div>270 : ${productsShoesBean.size270}</div>"
                    + "<div>280 : ${productsShoesBean.size280}</div>"
                    + "<div>290 : ${productsShoesBean.size290}</div>");
            }
        }
        function productDelete(category){
            var productNum = ${productNum};
            $.ajax({
               type:"post",
                url:"deletePro.jsp",
                data:{productNum : productNum,
                        category : category},
                dataType:"text",
                success:function (data,textStatus) {
                    if(data == 1){
                        alert("delete complete!");
                        location.href='allProductsListPro.jsp';
                    } else{
                        alert("delete fail");
                    }
                },
                error:function (data, textStatus) {
                   alert("Error!!!");
                }
            });
        }
        $(function () {
            mainCategory('${productBean.mainCategory}');
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
<div class="mainView svar">
    <div class="mainView1">
    <div class="proUpdate1">VIEW</div>
    <div class="proUpdate2">VIEW</div>
    <hr>
    <div class="proUpdate3">VIEW</div>
<form method="post" id="productFrm" name="productFrm">
        <div class="view1">
            <div>Brand</div>
            <div>${productBean.brand}</div>
        </div>
        <div class="view1">
            <div>ModelName</div>
            <div>${productBean.productName}</div>
        </div>
        <div class="view1">
            <div>Price</div>
            <div>${productBean.productPrice}</div>
        </div>
        <div class="view1">
            <div>Color</div>
            <div id="color"></div>
        </div>
        <div class="view1">
            <div>Category</div>
            <div>${productBean.mainCategory}</div>
        </div>
            <div class="view2">STOCK</div>
            <div class="view3" id="size" onchange="mainCategory('${productBean.mainCategory}')"></div>
            <div class="view4">CONTENT</div>
            <div class="view5">
               ${fn:substringBefore(productBean.productContent,"style")}
            </div>
    <div class="view6">
    <input type="button" value="Update" onclick="location.href='updatePro.jsp?productNum=${productNum}'">
    <input type="button" value="delete" onclick="productDelete('${productBean.mainCategory}')">
    <input type="button" value="cancle" onclick="location.href='allProductsListPro.jsp'">
    </div>
</form>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>