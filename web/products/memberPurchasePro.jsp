<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.ProductBean" %>
<%@ page import="com.product.ThumbnailBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/11
  Time: 12:48 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int price = Integer.parseInt(request.getParameter("price"));
    String[] size = request.getParameterValues("size");
    String[] stock = request.getParameterValues("stock");
    int productNum = Integer.parseInt(request.getParameter("productNum"));
    ProductDAO productDAO = new ProductDAO();
    ProductBean productBean= productDAO.getOneproduct(productNum);
    ThumbnailBean thumbnailBean = productDAO.getOneThumbnail(productNum);


    request.setAttribute("price",price);
    request.setAttribute("size",size);
    request.setAttribute("stock", stock);
    request.setAttribute("product",productBean);
    request.setAttribute("thumbnail",thumbnailBean);

    RequestDispatcher dis = request.getRequestDispatcher("memberPurchase.jsp");
    dis.forward(request,response);
%>