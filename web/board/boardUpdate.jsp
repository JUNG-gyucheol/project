<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/29
  Time: 4:19 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("id");
    if(id == null){
        out.println("<script>");
        out.println("alert('잘못된 접근방법입니다.')");
        out.println("location.href='../main.jsp'");
        out.println("</script>");
    }
    int boardNum = Integer.parseInt(request.getParameter("boardNum"));
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");

    BoradDAO boradDAO = new BoradDAO();
    int result = boradDAO.boardUpdate(boardNum,subject,content);

    out.print(result);

%>