<%@ page import="javax.print.attribute.standard.ReferenceUriSchemesSupported" %>
<%@ page import="com.board.BoardBean" %>
<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/29
  Time: 12:26 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = (String) session.getAttribute("id");
    String comment = request.getParameter("comment");
    int boardNum =Integer.parseInt(request.getParameter("boardNum"));
    comment.replace("<br>", "\\n");
    BoradDAO boradDAO = new BoradDAO();
    int result = boradDAO.insertComment(id,comment,boardNum);

    out.print(result);

%>