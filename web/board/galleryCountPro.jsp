<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/09
  Time: 2:17 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int num = Integer.parseInt(request.getParameter("num"));

    BoradDAO boradDAO = new BoradDAO();

    int result = boradDAO.galleryCount(num);

    out.print(result);
%>
