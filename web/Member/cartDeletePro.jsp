<%@ page import="java.beans.PropertyDescriptor" %>
<%@ page import="com.product.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/12
  Time: 12:51 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int num = Integer.parseInt(request.getParameter("num"));

    ProductDAO productDAO = new ProductDAO();
    int result = productDAO.cartDelete(num);
    out.print(result);
%>
