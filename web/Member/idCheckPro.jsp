<%@ page import="java.lang.reflect.Member" %>
<%@ page import="com.member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/27
  Time: 1:57 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String id = request.getParameter("userid");

    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.idCheck(id);

    out.print(result);

%>
