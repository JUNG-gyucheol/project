<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/08
  Time: 2:22 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>GGYÜ</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/galleryList.css">
    <script src="../header/header.js"></script>
    <link rel="stylesheet" href="../footer/footer.css">
<script>

    function modal(i) {
        var modal = $("#img" + i).attr("src");
        $("#myModal").css("display", "block");
        $("#img99").attr("src", modal);
        var num = $('.galleryId' + i).text();
        $.ajax({
            type: "post",
            url: "galleryCountPro.jsp",
            data: {num: num},
            dataType: "text",
            success: function (data, textStatus) {
                if (data != 1) {
                    alert("No Count!");
                    return;
                }
                var pageGallery = $('#pageGallery').val();
                if (pageGallery == 'undefined') {
                    pageGallery = 1;
                }
                $('#content').empty();
                gallery(pageGallery);
            },
            error: function (data, textStatus) {
                alert('Error');
            }
        });
    }

    function close1() {
        $("#myModal").css("display", "none");
    }

    // Get the <span> element that closes the modal
    // var span = document.getElementsByClassName("close")[0];
    //
    // // When the user clicks on <span> (x), close the modal
    // span.onclick = function() {
    //     modal.style.display = "none";
    // }


    function deleteNum(i) {
        var id = $("#galleryId" + i + "").val();
        var id1 = '${sessionScope.id}'
        if (id1 != id && '${sessionScope.grade}' != 3) {
            alert("권한이 없습니다.");
            return;
        }
        var num = i;
        $.ajax({
            type: "post",
            url: "galleryDeletePro.jsp",
            data: {num: num},
            dataType: "text",
            success: function (data, textStatus) {
                if (data == 1) {
                    alert("Delete complete!");
                    $(".content").empty();
                    gallery();
                } else {
                    alert("No Delete!!");
                }
            },
            error: function (data, textStatus) {
                alert("error!");
            }
        });

    }

    function gallery(a) {
        var subject = $("#subSearch").val();
        $.ajax({
            type: "post",
            url: "galleryListPro.jsp",
            data: {
                subject: subject,
                pageNum: a
            },
            dataType: "text",
            success: function (data, status) {
                var result = JSON.parse(data);
                var gallery = result.gallery;
                var j = 0;
                $("#content").empty();
                $("#pageBlock").empty();
                if (gallery.length != 0) {
                    for (var i = 0; i < gallery.length; i++) {
                        $("#content").append(
                            "<div class='topMail'><div class='galleryId" + i + "' style='display:none'>" + gallery[i].num + "</div>"
                            + "<div id='imgSize'><img onclick='modal(" + i + ")' id='img" + i + "' src='${pageContext.request.contextPath}/galleryImage/" + gallery[i].FileName + "'></div>"
                            + "<div class='topMail2'>" + gallery[i].subject + "</div>"
                            + "<div class='topMail1'><div class='sub'>ID</div> " + gallery[i].memberId + "</div>"
                            + "<div class='topMail1'><div class='sub'>DATE</div> " + gallery[i].date + "</div>"
                            + "<div class='topMail1'><div class='sub'>COUNT</div> " + gallery[i].count + "</div>"
                            + "<div id='likeCount" + gallery[i].num + "'><a id='like" + gallery[i].num + "'onclick='like(" + gallery[i].num + ")'><img id='heart' src='../images/heart1.jpg'></a></div>"
                            + "<div class='delete'><a href='${pageContext.request.contextPath}/galleryImage/" + gallery[i].FileName + "' download><button>DOWNLOAD</button></a><button  onclick='deleteNum(" + gallery[i].num + ")'>DELETE</button></div></div>"
                            + "<input type='hidden' value='" + gallery[i].memberId + "' id='galleryId" + gallery[i].num + "'>"
                            + "<input type='hidden' value='" + a + "' id='pageGallery'>");
                        checkLike(gallery[i].num);
                        likecount(gallery[i].num);
                        j++;
                        if (j % 4 == 0) {
                            $("#content").append("<br>");
                        }
                    }
                    for (var i = gallery[0].startPage; i <= gallery[0].endPage; i++) {
                        $("#pageBlock").append("<a onclick='gallery(" + i + ")'>" + "[" + i + "]" + "</a>");
                    }
                } else {
                    $("#content").append("<div class='noMailList'> NO LIST😱!!!</div>");
                }
            },
            error: function () {
                alert('에러발생!');
            }
        });
    }

    function like(i) {
        if ($("#like" + i + " img").attr("src") == '../images/heart1.jpg') {
            $("#like" + i + " img").attr("src", "../images/heart2.jpg");
            $.ajax({
                type: "post",
                url: "likePro.jsp",
                data: {galleryNum: i},
                dataType: "text",
                success: function (data, textStatus) {
                    if (data == 1)
                        var cnt = parseInt($("#likeCnt" + i + "").text());
                    $("#likeCnt" + i + "").text(cnt + 1);
                },
                error: function (data, textStatus) {
                    alert("ERROR");
                }
            });
        } else {
            $("#like" + i + " img").attr("src", "../images/heart1.jpg");
            $.ajax({
                type: "post",
                url: "hatePro.jsp",
                data: {galleryNum: i},
                dataType: "text",
                success: function (data, textStatus) {
                    if (data == 1)
                        var cnt = parseInt($("#likeCnt" + i + "").text());
                    $("#likeCnt" + i + "").text(cnt - 1);
                },
                error: function (data, textStatus) {
                    alert("ERROR");
                }
            });
        }
    }

    function checkLike(i) {
        $.ajax({
            type: "post",
            url: "likeCheckPro.jsp",
            data: {gallNum: i},
            dataType: "text",
            success: function (data, textStatus) {
                if (data == 1) {
                    $("#like" + i + " img").attr("src", "../images/heart2.jpg");

                }
            },
            error: function (data, textStatus) {
                alert("ERROR");
            }
        });

    }

    function likecount(i) {
        $.ajax({
            type: "post",
            url: "likeCount.jsp",
            data: {gallNum: i},
            dataType: "text",
            success: function (data, textStatus) {
                var count = data;
                $("#likeCount" + i + "").append("<div><div class='sub'>LIKE</div><div class='sub2' id='likeCnt" + i + "'> " + count + " </div></div>");
            },
            error: function (data, textStatus) {
                alert("ERROR");
            }
        });

    }

    function subjectSearch() {
        var sub = $("#subSearch").val();
        if (sub == '') {
            gallery();
        }
    }

    $(function () {
        gallery();
    })
</script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${empty sessionScope.id}">
    <script>
        alert("로그인해주세요..");
        location.href = '../Member/memberLogin.jsp';
    </script>
</c:if>
<div class="bigContent1">
    <div class="topBoard">GALLERY</div>
    <div class="topBoard1">GALLERY</div>
    <hr>
    <div class="topBoard2">갤러리</div>
    <div class="bigContent">
        <div id="content" class="content"></div>
    </div>
    <div id="pageBlock"></div>
    <div>
        <div id="bottomSub1">
            <div class="bottomSub">SUBJECT</div>
            <div><input type="text" id="subSearch" placeholder="SUBJECT" onkeydown="subjectSearch()"></div>
            <div>
                <button onclick="gallery()">SEARCH</button>
            </div>
        </div>
    </div>
    <div class="bottomSub2">
        <button onclick="location.href='GallaryWrite.jsp'">REGISTRY</button>
    </div>
</div>
<div id="myModal" class="modal" onclick="close1()">
    <span class="close" onclick="close1()">×</span>
    <img class="modal-content" id="img99">
    <div id="caption"></div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
