<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/29
  Time: 2:26 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.getParameter("UTF-8");

    String id = (String) session.getAttribute("id");
    String memberId = request.getParameter("memberId");
    Integer grade = (Integer) session.getAttribute("grade");

    if( !(id.equals(memberId) || grade == 3)){
        out.print(0);
    } else{
        out.print(1);
    }
%>
