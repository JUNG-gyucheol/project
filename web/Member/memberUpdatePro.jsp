<%@ page import="com.member.MemberDAO" %>
<%@ page import="com.member.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/09
  Time: 3:35 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");

    MemberDAO memberDAO = new MemberDAO();
    MemberBean memberBean = memberDAO.getOneMember(id);
    request.setAttribute("member", memberBean);
    RequestDispatcher dis = request.getRequestDispatcher("memberUpdate.jsp");
    dis.forward(request,response);
%>