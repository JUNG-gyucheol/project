<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.member.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/27
  Time: 5:09 오후
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
    <link rel="stylesheet" href="css/memberList.css">
    <link rel="stylesheet" href="../footer/footer.css">
    <script>
        function idSearch() {
            var memberId = $("#memberId").val();
            // reg1 = /^[a-zA-Z0-9]{4,20}$/
            // var result = reg1.test(memberId);
            // // if(memberId == ''){
            // //     alert("아이디를 입력해주세요~~!");
            // //     return;
            // // } else
            // //     if(result == false){
            // //     alert("숫자와 영어만 입력해주세요...");
            // //     return;
            // //     }
            $.ajax({
                type: "post",
                url: "memberListPro.jsp",
                data: {memberId: memberId},
                dataType: "text",
                success: function (data, status) {
                    var result = eval('(' + data + ')');
                    var member = result.member;
                    $("#tbody").empty();
                    $("#noSearch").empty();
                    if (member.length != 0) {
                        for (var i = 0; i < member.length; i++) {
                            $("#tbody").append("<div class='member_con1'><div class=\"member_sub1\">" + member[i].num + "</div>"
                                + "<div class=\"member_sub2\">" + member[i].id + "</div>"
                                + "<div class=\"member_sub1\" style=\"font-family: NanumGothicCoding-Bold;\">" + member[i].name + "</div>"
                                + "<div class=\"member_sub1\" style=\"font-family: NanumGothicCoding-Bold;\">" + member[i].gender + "</div>"
                                + "<div class=\"member_sub2\">" + member[i].birth + "</div>"
                                + "<div class=\"member_sub3\">" + member[i].email + "</div>"
                                + "<div class=\"member_sub2\">" + member[i].phone + "</div>"
                                + "<div class=\"member_sub2\">" + member[i].post + "</div>"
                                + "<div  class=\"member_sub4\" style=\"font-family: NanumGothicCoding-Bold;\">" + member[i].address + "</div>"
                                + "<div class=\"member_sub2\">" + member[i].date + "</div>"
                                + "<div class=\"member_sub1\">" + member[i].grade + "</div></div><hr>");
                        }
                    } else {
                        $("#noSearch").append("<h1>아이디가 존재하지 않습니다.<h1>");
                    }
                },
                error: function () {
                    alert("에러발생!!!!!");
                }
            });
        }

        function autoList() {
            if ($("#memberId").val() == '') {
                idSearch();
            }
        }

        $(function () {
            idSearch();
        })
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
<div class="member_main">
    <div class="member_main1">
        <div class="topSub1">MEMBER</div>
        <div class="topSub2">MEMBER LIST</div>
        <hr>
        <div class="topSub3" >회원목록</div>
        <div class="member_search">
            <div>ID</div>
            <input type="text" id="memberId" placeholder="SEARCH" onkeyup="autoList();">
            <input type="button" id="search" value="SEARCH" onclick="idSearch()">
        </div>
        <div class="member_sub">
            <div class="member_sub1">회원번호</div>
            <div class="member_sub2" >회원아이디</div>
            <div class="member_sub1" >회원이름</div>
            <div class="member_sub1" >성별</div>
            <div class="member_sub2">생년월일</div>
            <div class="member_sub3">이메일</div>
            <div class="member_sub2">휴대폰번호</div>
            <div class="member_sub2">우편번호</div>
            <div class="member_sub4" >주소</div>
            <div class="member_sub2">가입날짜</div>
            <div class="member_sub1">등급</div>
        </div>
        <hr>
        <div id="tbody">
            <%--  <%
                  for(int i=0; i<list.size(); i++){
              %>
              <tr>
                  <th><%=list.get(i).getUserNum()%></th>
                  <th><%=list.get(i).getUserID()%></th>
                  <th><%=list.get(i).getUserName()%></th>
                  <th><%=list.get(i).getGender()%></th>
                  <th><%=list.get(i).getBirth()%></th>
                  <th><%=list.get(i).getUserEmail()%></th>
                  <th><%=list.get(i).getPhone()%></th>
                  <th><%=list.get(i).getPostCode()%></th>
                  <th><%=list.get(i).getAdress()%></th>
                  <th><%=list.get(i).getDate()%></th>
                  <th><%=list.get(i).getGrade()%></th>
              </tr>

              <%
                  }
              %>--%>

        </div>
        <div id="noSearch"></div>
        <div class="back_btn">
            <button onclick="history.back()">BACK</button>
        </div>
    </div>
</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
