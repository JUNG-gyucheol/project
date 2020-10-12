<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/28
  Time: 3:52 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="boardBean" class="com.board.BoardBean" scope="page"/>
<jsp:setProperty name="boardBean" property="*"/>
<%
    request.setCharacterEncoding("UTF-8");

    int result = new BoradDAO().insertBoard(boardBean);

    out.print(result);
%>
