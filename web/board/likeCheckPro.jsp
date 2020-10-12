<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/15
  Time: 10:28 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = (String)session.getAttribute("id");
    int gallNum = Integer.parseInt(request.getParameter("gallNum"));

    BoradDAO boradDAO = new BoradDAO();

    int result = boradDAO.likeCheck(id,gallNum);

    out.print(result);

%>
