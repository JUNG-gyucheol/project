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
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/thumbnail.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function registry() {
            var thumbnail = CKEDITOR.instances['thumbnail_content'].getData().trim();
            var productName = '${productName}';
            var productPrice = '${productPrice}';
            var productColor = '${productColor}';
            var category = '${category}'
            if (thumbnail == '') {
                alert("입력해주세요!");
                return;
            }
            $.ajax({
                type: "post",
                url: "thumbnailRegistry.jsp",
                data: {
                    thumbnail: thumbnail,
                    productName: productName,
                    productPrice: productPrice,
                    productColor: productColor,
                    category: category
                },
                dataType: "text",
                success: function (data, textStatus) {
                    if (data == 1) {
                        alert("Thumbnail Complete!");
                        location.href = 'allProductsListPro.jsp'
                    } else {
                        alert("Thumbnail fail!");
                    }
                },
                error: function (data, textStatus) {
                    alert("error");
                }
            });
        }

        function cancle() {
            var productName = '${productName}';
            $.ajax({
                type: "post",
                url: "productCancle.jsp",
                data: {productName: productName},
                dataType: "text",
                success: function (data, textStatus) {
                    console.log(data);
                    if (data == 1) {
                        alert("cancle!!");
                        history.back();
                    } else {
                        alert("fail!!");
                    }
                },
                error: function (data, textStatus) {
                    alert("Error");
                }
            });
        }

        $(function () {
            CKEDITOR.replace('thumbnail_content', {
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
<div class="mainThumb svar">
    <div class="mainThumb1-1">
    <div class="mainSub1">Thumbnail</div>
    <div class="mainSub2">Thumbnail</div>
    <hr>
    <div class="mainSub3">썸네일</div>
            <div class="mainThumb1">
                <div>MODEL</div>
                <div>${productName}</div>
            </div>
            <div class="mainThumb2">
                <div>Color</div>
                <div>${productColor}</div>
            </div>
            <div class="mainThumb3">Thumbnail</div>
            <div class="mainThumb4">
                <textarea id="thumbnail_content" placeholder="이미지크기는 300px" nmae="thum"></textarea>
            </div>
            <div class="mainThumb5">
                <input type="button" value="Registry" onclick="registry()">
                <input type="button" value="cancle" onclick="cancle()">
            </div>
            </form>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>

