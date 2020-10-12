<%@ page import="com.member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/27
  Time: 3:03 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html charset=UTF-8");

    String userId = request.getParameter("userID");
    String userPW = request.getParameter("userPW");

    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.login(userId , userPW);
    int grade = memberDAO.getGrade(userId);
    if(result == 1){
        HttpSession session1 = request.getSession();
        session1.setAttribute("id", userId);
        session1.setAttribute("grade", grade);
    }


    out.print(result);
%>