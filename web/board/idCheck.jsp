<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/28
  Time: 3:01 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = (String) session.getAttribute("id");
    int result = 0;
    if(id != null){
        result = 1;
    } else {
        result = 0;
    }
    out.print(result);
%>