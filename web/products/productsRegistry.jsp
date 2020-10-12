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
    <link rel="stylesheet" href="css/productsRegistry.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <script>
        function registry(){
            var productContent = CKEDITOR.instances["p_content"].getData();
            $('#p_content').val(productContent);
            var form = $("#productFrm").serialize();
            $.ajax({
               type:"post",
                url:"registryProductPro.jsp",
                data: form,
                dataType:"text",
                success:function (data,textStatus) {
                    console.log(data);
                    var result = data;
                    if(result == 1){
                        alert("product complete!!");
                        location.href="thumbnailPro.jsp?productName="+$("#productName").val()
                                                +"&productPrice="+$("#productPrice").val()
                                                +"&productColor="+$("#productColor").val()
                                                +"&category="+$("#main_category").val();
                    } else{
                        alert("product failure!!");
                    }
               },
                error:function (data,textStatus) {
                    alert("error");
                }
            });
        }
        function mainCategory(main){
            if(main == 'top'){
                $("#size").html("XLarge : <input type='text' name='XLarge' size='8'> Large : <input type='text' name='Large' size='8'> Medium : <input type='text' name='Medium' size='8'>"
                    +"Small : <input type='text' name='Small' size='8'>");
            } else if(main == 'bottom'){
                $("#size").html("26 : <input type='text' name='size26' size='8'> 27 : <input type='text' name='size27' size='8'>"
                    + "28 : <input type='text' name='size28' size='8'>"
                    + "29 : <input type='text' name='size29' size='8'>"
                    + "30 : <input type='text' name='size30' size='8'>"
                    + "31 : <input type='text' name='size31' size='8'>"
                    + "32 : <input type='text' name='size32' size='8'>"
                    + "33 : <input type='text' name='size33' size='8'>");
            } else if(main == 'shoes'){
                $("#size").html("220 : <input type='text' name='size220' size='8'> 230 : <input type='text' name='size230' size='8'>"
                    + "240 : <input type='text' name='size240' size='8'>"
                    + "250 : <input type='text' name='size250' size='8'>"
                    + "260 : <input type='text' name='size260' size='8'>"
                    + "270 : <input type='text' name='size270' size='8'>"
                    + "280 : <input type='text' name='size280' size='8'>"
                    + "290 : <input type='text' name='size290' size='8'>");
            }
        }

        $(function () {
            CKEDITOR.replace( 'p_content',{
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
<form method="post" id="productFrm" name="productFrm">
    <div class="all1 svar">
        <div class="regi1">REGISTRY</div>
        <div class="regi2">REGISTRY</div>
        <hr>
        <div class="regi3">상품등록</div>
        <div class="all2">
            <div class="all2-1">Brand</div>
            <div><input type="text" name="brand"></div>
            <div class="all2-1">ModelName</div>
            <div><input type="text" name="productName" id="productName"></div>
        </div>
        <div class="all3">
            <div class="all2-1">Color</div>
            <div><input type="text" name="productColor" id="productColor"></div>
        <div class="all2-1">Price</div>
        <div><input type="text" name="productPrice" id="productPrice"></div>
        </div>
        <div class="all4">
          <div>Category</div>
         <div><select name="main_category" id="main_category" onchange="mainCategory(this.value)">
                <option value="top">Top</option>
                <option value="bottom">Bottom</option>
                <option value="shoes">Shoes</option>
            </select>
         </div>
        </div>
        <div class="all5">재고량</div>
        <div class="all5" id="size">XLarge : <input type="text" name="XLarge"  size="8"> Large : <input type="text" name="Large"  size="8"> Medium : <input type="text" name="Medium"  size="8">
            Small : <input type="text" name="Small" size="8"></div>
        <div class="all6">CONTENT</div>
        <div>
            <textarea id="p_content" name='productContent'></textarea>
        </div>
        <div class="all6">
    <input type="button" value="Registry" onclick="registry()">
    <input type="button" value="cancle" onclick="history.back()">
        </div>
    </div>
</form>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
