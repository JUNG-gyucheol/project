<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/11
  Time: 1:36 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GGYÜ</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="../header/header.js"></script>
    <link rel="icon" href="http://localhost:8080/images/heart2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../header/header.css">
    <link rel="stylesheet" href="css/cartPurcase.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<c:if test="${empty sessionScope.id}" >
    <script>
        alert("권한이 없습니다❌");
        history.back()
    </script>
</c:if>
<form method="post" action="cartPurchaseProc.jsp">
    <div class="purMain svar">
        <div class="purMain1">
            <div class="topSub1">ORDER</div>
            <div class="topSub2">ORDER LIST</div>
            <hr>
            <div class="topSub3">구매목록</div>
            <c:set var="sumPrice" value="${0}"/>
            <c:forEach var="list" items="${list}">
                <div class="purCon">
                    <div class="purCon1">
                        <div>${fn:substringBefore(list.thumbnail,"style")}></div>
                        <input type="hidden" value='${list.thumbnail}' name="thumbnail">
                    </div>
                    <div class="purCon2">
                        <div class="purCon2-1">
                            <div>${list.productname} ${list.productColor}</div>
                            <input type="hidden" value="${list.productColor}" name="purchaseProductColor">
                            <input type="hidden" value="${list.productname}" name="purchaseProductName">
                        </div>
                        <div class="purCon3">
                            <div class="purCon3-1">SIZE</div>
                            <div>${list.size}</div>
                            <input type="hidden" value="${list.size}" name="size">
                        </div>
                        <div class="purCon3">
                            <div class="purCon3-1">PRICE</div>
                            <div>${list.price}</div>
                            <input type="hidden" value="${list.price}" name="purchaseProductPrice">
                        </div>
                        <div class="purCon3">
                            <div class="purCon3-1">STOCK</div>
                            <div>${list.stock}</div>
                            <input type="hidden" value="${list.stock}" name="stock">
                        </div>
                        <div class="purCon3">
                            <div class="purCon3-1">SUM</div>
                            <div>${list.price * list.stock}</div>
                        </div>
                        <input type="hidden" value="${list.category}" name="category">
                        <input type="hidden" value="${list.num}" name="productNum">
                        <input type="hidden" value="${list.num1}" name="countNum">
                        <c:set var="sumPrice" value="${sumPrice + list.price}"/>
                    </div>
                </div>
            </c:forEach>
            <div class="sum_price">
                <div class="sum_price1">SUM</div>
                <div>${sumPrice}</div>
            </div>
            <div class="mainPost">
                <div class="subAdd">ADDRESS</div>
                <div class="postCode">
                    <input class="postCode1" type="text" id="sample6_postcode" placeholder="POSTCODE"
                           readonly="readonly"
                           name="postCode">
                    <input class="postCode2" type="button" onclick="sample6_execDaumPostcode()" value="POSTCODE">
                </div>
                <div class="adress">
                    <input class="adress1" type="text" id="sample6_address" placeholder="ADDRESS" size="25"
                           readonly="readonly"
                           name="adress">
                </div>
                <div class="adress2">
                    <input class="adress3" type="text" id="sample6_detailAddress" placeholder="DetailAddress"
                           name="detailAddress">
                    <input class="adress4" type="text" id="sample6_extraAddress" placeholder="ExtraAddress"
                           name="extraAddress">
                </div>
            </div>
            <div class="payment">
                <input type="radio" name="payment" value="creditCard">신용카드
                <input type="radio" name="payment" value="deposit">무통장입금
                <input type="radio" name="payment" value="kakao">카카오페이
                <input type="radio" name="payment" value="naver">네이버페이
            </div>
            <div class="payBtn">
                <input type="submit" value="PURCHASE">
                <input type="button" onclick="history.back()" value="CANCLE"/>
            </div>
        </div>
    </div>
</form>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
