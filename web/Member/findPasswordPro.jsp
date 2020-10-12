<%@ page import="com.member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/22
  Time: 1:55 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String id = request.getParameter("id");

    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.memberFind(name,id);
    out.print(result);
%>