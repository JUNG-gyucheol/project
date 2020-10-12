<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/27
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>

    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="swiper-4.5.1/dist/css/swiper.min.css">
    <link rel="stylesheet" href="main.css">
    <%--    <link rel="shortcut icon" href="images/favi.ico" type="image/x-icon">--%>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <script src="jquery-fadethis-master/dist/jquery.fadethis.min.js"></script>
    <script>
        var requestLogout = new XMLHttpRequest();

        function logout() {
            requestLogout.open("post", "Member/memberLogoutPro.jsp", true);
            requestLogout.onreadystatechange = callback;
            requestLogout.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
            requestLogout.send(null);
        }

        function callback() {
            if (requestLogout.readyState == 4 && requestLogout.status == 200) {
                var result = requestLogout.responseText;
                if (result == 0) {
                    alert('로그아웃 되셨습니다. bye!!');
                    location.reload();
                } else {
                    alert("오류발생 ㅠㅠ");
                }
            }
        }

        $(function () {
            $("#headerSearch").on("click", function () {
                if ($("#headerSearch").css("display") == "block") {
                    $("#headerSearch").css("display", "none");
                    $("#search1").css("display", "block");
                }
            });
            $('.svar').on('click', function () {
                if ($("#headerSearch").css("display") == "none") {
                    $("#headerSearch").css("display", "block");
                    $("#search1").css("display", "none");
                }
            });
            $("#enter").keyup(function (e) {
                console.log(e.keyCode);
                var search = $(this).val();
                if (e.keyCode == 13) {
                    location.href = '../products/searchProductPro.jsp?search=' + search;
                }
            });
            $(window).scroll(function () {
                var height = $(document).scrollTop(); //실시간으로 스크롤의 높이를 측정
                if (height > 195) {
                    $('.main2').addClass('fixinner');
                } else if (height <= 195) {
                    $('.main2').removeClass('fixinner');
                }
            });
            $(window).scroll(function () {
                var height = $(document).scrollTop(); //실시간으로 스크롤의 높이를 측정
                if (height > $('.fadeSlide').offset().top - window.innerHeight) {
                    $('.fadeSlide').fadeThis({speed: 2000});
                }
                if (height > $('.fadeSlide1').offset().top - window.innerHeight) {
                    $('.fadeSlide1').fadeThis({
                        speed: 2000, scrolledIn: 2,
                        scrolledOut: 2
                    });
                }
            });
        });

    </script>
</head>
<body>
<div class="flexbox">
    <header class="box header">
        <div class="pi">
        </div>
        <div class="main1">
            <a href="index.jsp" class="mainlogo"><span>G&nbsp;G&nbsp;Y&nbsp;Ü&nbsp;S&nbsp;T&nbsp;O&nbsp;R&nbsp;E</span></a>
        </div>
        <div class="main2">
            <ul class="nav1" id="close">
                <li class="ggyu"><a href="index.jsp">GGYÜ</a></li>
                <li class="subnav1"><a href="products/memberProductsListPro.jsp">CLOTHS</a>
                    <ul class="subnav1-1" id="close">
                        <div class="subnav1-2">
                            <div>
                                <li><a href="products/memberProductsListPro.jsp">ALL</a></li>
                                <li><a href="products/memberTopListPro.jsp">TOP</a></li>
                                <li><a href="products/memberBottomListPro.jsp">BOTTOM</a></li>
                                <li><a href="products/memberShoesListPro.jsp">SHOES</a></li>
                            </div>
                        </div>
                    </ul>
                </li>
                <li><a href="board/mailList.jsp">CONTACT</a></li>
                <li><a href="board/boardList.jsp">BOARD</a></li>
                <li><a href="board/galleryList.jsp">GALLERY</a></li>
            </ul>
            <ul class="nav2">
                <li><a id="headerSearch">SEARCH</a></li>
                <li id="search1"><input type="text" id="enter" placeholder="SEARCH"></li>
                <c:if test="${empty sessionScope.id }">
                    <li><a href="Member/memberLogin.jsp">account</a></li>
                    <li><a href="Member/memberJoin.jsp">create account</a></li>
                </c:if>
                <c:if test="${sessionScope.id eq 'admin1' and sessionScope.id != null}">
                    <li>admin login</li>
                    <li><a onclick="logout()">logout</a></li>
                    <li><a href="Member/memberCheck.jsp">MYPAGE</a></li>
                    <li><a href="mana/managerMenuPro.jsp">adminpage</a></li>
                </c:if>
                <c:if test="${sessionScope.id != 'admin1' and sessionScope.id != null}">
                    <li>${sessionScope.id} LOGIN</li>
                    <li><a href="Member/memberCheck.jsp">MYPAGE</a></li>
                    <li>CART</li>
                    <li><a onclick="logout()">LOGOUT</a></li>
                </c:if>
            </ul>
        </div>
    </header>
    <article class="content svar">
        <div class="content1">
            <div class="swiper-container swiper1">
                <div class="swiper-wrapper swiper1-1">
                    <div class="swiper-slide">
                        <div class="logoText1">
                            <div class="logoText1-1">NIKE</div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="logoText2">
                            <div class="logoText2-1">SUPREME</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="headerSubject">
                <div class="movieList">TOP10</div>
            </div>
            <div class="box1">
                <div class="topSale">
                    <div class="topSale2">
                        <c:set var="count" value="${0}"/>
                        <c:forEach var="topTen" items="${topTen}">
                            <div class="topSale1">
                                <div>
                                    <a href="products/memberProductViewPro.jsp?productNum=${topTen.productnum}">${fn:substringBefore(topTen.thumbnail,"style")}></a>
                                </div>
                                <div id="sub">
                                    <div id="sub1">${topTen.purchaseitem}</div>
                                    <div id="sub1">${topTen.purchaseColor}</div>
                                    <div id="sub1">${topTen.productPrice}</div>
                                </div>
                            </div>
                            <c:set var="count" value="${count+1}"/>
                            <c:if test="${count%5 == 0}">
                                <br>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="raffle">raffle site</div>
            <div class="raffle1">
                <a class="" href="https://www.endclothing.com/kr/">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    END</a>
                <a href="https://bdgastore.com/">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    BODEGA</a>
                <a href="https://www.nike.com/kr/launch/">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    SNKRS</a>
                <a href="https://www.sneakersnstuff.com/">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    SNS</a>
                <a href="https://www.nakedcph.com/">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    NAKED</a>
            </div>
            <div class="slide-bottom fadeSlide">
                <div class="lanches">
                    <img src="images/jordan4xoffwhite.jpg">
                    <div class="release">
                        <div> 2020.07.24 RELEASE</div>
                        <div>NIKE x OFFWHITE</div>
                        <div>AIRJORDAN 4 RETRO</div>
                        <div>Sail & Muslin</div>
                        <div></div>
                    </div>
                </div>
            </div>
            <div class="slide-right fadeSlide1">
                <div class="lanches1">
                    <div class="release1">
                        <div> 2020.07.24 RELEASE</div>
                        <div>SB DUNK LOW PRO X GRATEFUL DEAD</div>
                        <div>OPTI YELLOW</div>
                        <div></div>
                    </div>
                    <img src="images/opti%20yellow.jpg">
                </div>
            </div>
        </div>
    </article>
    <footer>
        <div class="footer svar">
            <div class="sns_thumb">
                <img src="images/insta.jpg">
                <img src="images/twiter.jpg">
                <img src="images/face.jpg">
                <img src="images/vvv.jpg">
            </div>
            <div class="footer_menu">
                <div class="footer_menu1">NEWSLETTER</div>
                <div>
                    <div class="footer_menu2">© 2019 GGYÜ</div>
                </div>
                <div class="footer_menu3">
                    <div>CUSTOMER SERVICE</div>
                    <div>CHARPTERS</div>
                    <div>ARCHIVE</div>
                </div>
                <div class="footer_menu4">
                    상호: KOREA TRIBE, INC. | 대표: BAIK KYUHEE | 사업자등록번호: 561-87-00715 | 주소: 서울특별시 서초구<br>
                    서초중앙로 209, 8층(반포동)<br>
                    통신판매신고번호: 제 2018 - 서울서초 - 0860 호 [사업자정보확인] | 전화: 02-6105-4044 | 문의:<br>
                    INFO@STUSSY.CO.KR | 개인정보관리책임자: 백규희
                </div>
            </div>
        </div>
    </footer>
</div>
<script src="swiper-4.5.1/dist/js/swiper.min.js"></script>
<script>
    var swiper = new Swiper('.swiper1', {
        loop: true,
        autoplay: {
            delay: 3000,
        },
        effect: 'fade',
        speed: 1000,
    });

</script>
</body>
</html>
