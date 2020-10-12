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

    int boardNum = Integer.parseInt(request.getParameter("boardNum"));
    String id = (String) session.getAttribute("id");
    String memberId = request.getParameter("memberId");
    Integer grade = (Integer) session.getAttribute("grade");
    BoradDAO boradDAO = new BoradDAO();
    int result = 0;

    if( !(id.equals(memberId) || grade == 3)){
        out.print(result);
    } else{
     result = boradDAO.boardDelete(boardNum);
        out.print(result);
    }
%>
