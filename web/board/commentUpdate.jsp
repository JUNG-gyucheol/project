<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/29
  Time: 10:23 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int commNum = Integer.parseInt(request.getParameter("commNum"));
    String commContent = request.getParameter("commContent");

    BoradDAO boradDAO = new BoradDAO();
    int result = boradDAO.commUpdate(commNum,commContent);

    out.print(result);
%>