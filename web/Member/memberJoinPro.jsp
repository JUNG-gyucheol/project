<%@ page import="com.member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/27
  Time: 1:16 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberBean" class="com.member.MemberBean" scope="page"/>
<jsp:setProperty name="memberBean" property="*"/>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    MemberDAO memberDAO = new MemberDAO();
    String p1 = request.getParameter("p1");
    String p2 = request.getParameter("p2");
    String p3 = request.getParameter("p3");
    String phone = p1+"-"+p2+"-"+p3;
    String address = request.getParameter("adress");
    String detailAddress = request.getParameter("detailAddress");
    String extraAddress = request.getParameter("extraAddress");
    String totaladdr = address+" "+detailAddress+" "+extraAddress;

    memberBean.setAdress(totaladdr);
    memberBean.setPhone(phone);
    int result = memberDAO.insertMember(memberBean);
    out.print(result);
%>
