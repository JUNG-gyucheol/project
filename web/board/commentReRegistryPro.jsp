<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/30
  Time: 12:09 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = (String)session.getAttribute("id");
    int commNum = Integer.parseInt(request.getParameter("commNum"));
    int boardNum = Integer.parseInt(request.getParameter("boardNum"));
    String comment1 = request.getParameter("comment1");
    BoradDAO boradDAO = new BoradDAO();

    int result = boradDAO.commentReRegistry(id,comment1,commNum,boardNum);
    out.print(result);
%>