<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.ProductBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/10
  Time: 11:15 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    int productNum = Integer.parseInt(request.getParameter("productNum"));

    ProductDAO productDAO = new ProductDAO();
    ProductBean productBean  = productDAO.getOneproduct(productNum);

    request.setAttribute("productBean",productBean);
    RequestDispatcher dis = request.getRequestDispatcher("memberProductView.jsp");
    dis.forward(request,response);
%>