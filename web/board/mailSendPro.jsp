<%@ page import="com.board.BoradDAO" %>
<%@ page import="com.board.ContactBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/07
  Time: 10:52 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int num = Integer.parseInt(request.getParameter("contactNum"));

    BoradDAO boradDAO = new BoradDAO();
    ContactBean contactBean = boradDAO.getOneContact(num);

    request.setAttribute("contactBean", contactBean);
    RequestDispatcher dis = request.getRequestDispatcher("mailSend.jsp");
    dis.forward(request,response);
%>
