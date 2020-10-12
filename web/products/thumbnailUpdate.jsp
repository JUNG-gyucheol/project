<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.ProductBean" %>
<%@ page import="java.util.ArrayList" %><%--
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
    <script src="../header/header.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/thumbnailUpdate.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function update() {
            var thumbnail = CKEDITOR.instances['thumbnail_content'].getData().trim();
            var productName = '${productBean.productName}';
            var productPrice = '${productBean.productPrice}';
            var productNum = '${thumbnail.productNum}'
            if (thumbnail == '') {
                alert("입력해주세요!");
                return;
            }
            $.ajax({
                type: "post",
                url: "thumbnailUpdateRegistryPro.jsp",
                data: {
                    thumbnail: thumbnail,
                    productName: productName,
                    productPrice: productPrice,
                    productNum: productNum
                },
                dataType: "text",
                success: function (data, textStatus) {
                    if (data == 1) {
                        alert("Update Complete!");
                        location.href = 'allProductsListPro.jsp'
                    } else {
                        alert("Update fail!");
                    }
                },
                error: function (data, textStatus) {
                    alert("error");
                }
            });
        }

        $(function () {
            CKEDITOR.replace('thumbnail_content');
        });
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>

<c:if test="${sessionScope.grade != 3}">
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<div class="mainThumb svar">
    <div class="mainThumb1-1">
        <div class="mainSub1">Thumbnail</div>
        <div class="mainSub2">Thumbnail</div>
        <hr>
        <div class="mainSub3">썸네일</div>
        <div class="mainThumb1">

            <div>MODEL</div>
            <div>${productBean.productName}</div>
        </div>
        <div class="mainThumb3">Thumbnail</div>
        <div class="mainThumb4">
            <textarea id="thumbnail_content" placeholder="이미지크기는 300px" nmae="thum">${thumbnail.thumbnail}</textarea>
        </div>
        <div class="mainThumb5">
            <input type="button" value="Registry" onclick="update()">
        </div>
        </form>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>

