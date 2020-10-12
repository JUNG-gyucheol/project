<%@ page import="com.member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/09
  Time: 3:20 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.login(id,pass);

    out.print(result);

%>
