<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/07
  Time: 9:04 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/galleryWrite.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        var sel_file;
        $(document).ready(function () {
            $("#input_img").on("change", handleImgFileSelect);
        });

        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function (f) {
                if (!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
                sel_file = f;
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }

        function registry() {
            if ($("#gallery_sub").val().trim() == '') {
                alert("제목을 입력해주세요.");
                return;
            }
            if ($("#input_img").val() == '') {
                alert("이미지파일을 선택해주세요.")
                return;
            }
            var form = $("form")[0];
            var form1 = new FormData(form);
            $.ajax({
                type: "post",
                url: "galleryRegistryPro.jsp",
                processData: false,
                contentType: false,
                data: form1,
                dataType: "text",
                success: function (data, textStatus) {
                    if (data == 1) {
                        alert("success");
                        location.href = 'galleryList.jsp';
                    } else {
                        alert("No");
                    }
                },
                error: function (data, textStatus) {
                    alert("error");
                },
            });
            location.href = 'galleryList.jsp';
        }

        function fileCheck(obj) {
            var file_kind = obj.value().lastIndexOf('.');
            var file_name = obj.value().substring(file_kind + 1, obj.length);
            var file_type = file_name.toLowerCase();

            var check_file_type = new Array();
            check_file_type = ['jpg', 'gif', 'png', 'jpeg'];
            if (check_file_type.indexOf(file_type) == -1) {
                alert('이미지 파일만 선택 할 수 있습니다.');
                var parent_Obj = obj.parentNode;
                var node = parent_Obj.replaceChild(obj.cloneNode(true).obj);
                return false;
            }
        }
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${empty sessionScope.id}" >
    <script>
        alert("로그인 해주세요!");
        location.href='memberLogin.jsp';
    </script>
</c:if>
<div class="bigContent">
    <div class="content">
            <div class="topSub1">GALLERY</div>
            <div class="topSub2">GALLERY</div>
        <hr>
            <div class="topSub3">영문이미지명만 등록부탁드립니다.</div>
        <form method="post" enctype="multipart/form-data" id="imageForm">
            <div class="id_loc">
                <div class="id_loc1">ID</div>
                <div class="id_loc2">${sessionScope.id}</div>
            </div>
            <input type="hidden" value="${sessionScope.id}" name="galleryId">
            <div class="sub_loc">
            <div class="sub_loc1">SUBJECT</div>
            <div class="sub_loc2"><input type="text" name="subject" id="gallery_sub" size="30" placeholder="SUBJECT"></div>
            </div>
            <div class="file_box">
                <label for="input_img">IMAGE FILE</label>
                <input type="file" accept="image/jpg,image/jpeg,image/png,image/gif," name="image" id="input_img"
                       onchange="fileCheck(this)">
            </div>
            <div class="imgMain">
                <img id="img"/>
            </div>
            <div class="btn_loc">
            <button onclick="registry()">REGISTRY</button>
            <button type="button" onclick="location.href='galleryList.jsp'">CANCLE</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
