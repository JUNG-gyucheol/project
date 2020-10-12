<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/29
  Time: 10:41 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String commId = request.getParameter("commId");
    String id = (String)session.getAttribute("id");
    if(!commId.equals(id)){
        out.print(0);
     }else{
        out.print(1);
    }
%>
