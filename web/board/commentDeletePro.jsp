<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/29
  Time: 10:54 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = (String)session.getAttribute("id");
    Integer grade = (Integer) session.getAttribute("grade");
    String commId = request.getParameter("commId");
    int reSeq = Integer.parseInt(request.getParameter("reSeq"));
    int commNum = Integer.parseInt(request.getParameter("commNum"));
    BoradDAO boradDAO = new BoradDAO();
    int result = 0;
    if(!(id.equals(commId) || grade == 3)){
        out.print(result);
    } else{
        result = boradDAO.commentDelete(reSeq, commNum);
        out.print(result);
    }
%>