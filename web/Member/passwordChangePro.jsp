<%@ page import="com.member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/22
  Time: 12:50 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("PW");

    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.passwordChange(id,pw);

    out.print(result);
%>
