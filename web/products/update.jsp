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
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/update.css">
    <script>
        function update() {
            var productContent = CKEDITOR.instances["p_content"].getData();
            $('#p_content').val(productContent);
            var form = $("#productFrm").serialize();
            console.log(form);
            $.ajax({
                type: "post",
                url: "updateRegistryPro.jsp?productNum=${productNum}&maincategory=${productBean.mainCategory}",
                data: form,
                dataType: "text",
                success: function (data, textStatus) {
                    console.log(data);
                    var result = data;
                    if (result == 1) {
                        alert("update complete!!");
                        location.href = "thumbnailUpdatePro.jsp?productNum=" +${productNum};
                    } else {
                        alert("update failure!!");
                    }
                },
                error: function (data, textStatus) {
                    alert("error");
                }
            });
        }

        function mainCategory(main) {
            if (main == 'top') {
                $("#color").html('<input type="text" name="productColor" id="productColor" value="${productSizeBean.color}">');
                $("#size").html("XLarge : <input type='text'size='8' name='XLarge' value='${productSizeBean.XLarge}'> Large : <input type='text' name='Large'size='8' value='${productSizeBean.large}'> Medium : <input type='text' name='Medium' size='8' value='${productSizeBean.medium}'>"
                    + "Small : <input type='text' name='Small'size='8' value='${productSizeBean.small}'>");
            } else if (main == 'bottom') {
                $("#color").html('<input type="text" name="productColor" id="productColor" value="${bottomSizeBean.color}">');
                $("#size").html("26 : <input type='text' name='size26'size='8' value='${bottomSizeBean.size26}'> 27 : <input type='text' name='size27'size='8' value='${bottomSizeBean.size27}'>"
                    + "28 : <input type='text' name='size28'size='8' value='${bottomSizeBean.size28}'>"
                    + "29 : <input type='text' name='size29'size='8' value='${bottomSizeBean.size29}'>"
                    + "30 : <input type='text name='size30' size='8'value='${bottomSizeBean.size30}'>"
                    + "31 : <input type='text' name='size31'size='8' value='${bottomSizeBean.size31}'>"
                    + "32 : <input type='text' name='size32' size='8'value='${bottomSizeBean.size32}'>"
                    + "33 : <input type='text' name='size33' size='8' value='${bottomSizeBean.size33}'>");
            } else if (main == 'shoes') {
                $("#color").html("<input type='text' name='productColor' id='productColor' value='${productsShoesBean.color}'>");
                $("#size").html("220 : <input type='text'size='8' name='size220' value='${productsShoesBean.size220}'> 230 : <input type='text'size='8' name='size230' value='${productsShoesBean.size230}'>"
                    + "240 : <input type='text' size='8' name='size240' value='${productsShoesBean.size240}'>"
                    + "250 : <input type='text' size='8' name='size250' value='${productsShoesBean.size250}'>"
                    + "260 : <input type='text' size='8' name='size260' value='${productsShoesBean.size260}'>"
                    + "270 : <input type='text' size='8' name='size270' value='${productsShoesBean.size270}'>"
                    + "280 : <input type='text' size='8' name='size280' value='${productsShoesBean.size280}'>"
                    + "290 : <input type='text' size='8' name='size290' value='${productsShoesBean.size290}'>");
            }
        }

        $(function () {
            CKEDITOR.replace('p_content',{
                height: 350,
                removePlugins: 'resize'
            });
            mainCategory('${productBean.mainCategory}');
        });
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${sessionScope.grade ne 3}">
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<div class="all1 svar">
    <div class="regi1">UPDATE</div>
    <div class="regi2">UPDATE</div>
    <hr>
    <div class="regi3">상품수정</div>
    <form method="post" id="productFrm" name="productFrm">
        <div class="all2">
            <div class="all2-1">Brand</div>
            <div><input type="text" name="brand" value="${productBean.brand}"></div>
            <div class="all2-1">ModelName</div>
            <div><input type="text" name="productName" id="productName" value="${productBean.productName}"></div>
        </div>
        <div class="all3">
            <div class="all2-1">Color</div>
            <div id="color"></div>
            <div class="all2-1">Price</div>
            <div><input type="text" name="productPrice" id="productPrice" value="${productBean.productPrice}"></div>
        </div>
        <div class="all4">
            <div>Category</div>
            <div>${productBean.mainCategory}</div>
        </div>
        <div class="all5">재고량</div>
        <div class="all6" id="size"></div>
        <div class="all7">CONTENT</div>
        <div class="all8">
            <textarea id="p_content" name='productContent'>${productBean.productContent}</textarea>
        </div>
        <div class="all9">
            <input type="button" value="Update" onclick="update()">
            <input type="button" value="cancle" onclick="location.href='productViewPro.jsp?productNum=${productNum}'">
        </div>
    </form>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
