<%@ page import="com.board.ContactBean" %>
<%@ page import="sun.font.EAttribute" %>
<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/07
  Time: 2:46 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = (String)session.getAttribute("id");
    String email = request.getParameter("email");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");

    ContactBean contactBean = new ContactBean();
    contactBean.setMemberId(id);
    contactBean.setEmail(email);
    contactBean.setSubject(subject);
    contactBean.setContent(content);

    BoradDAO boradDAO = new BoradDAO();
    int result = boradDAO.inserContact(contactBean);

    out.print(result);
%>