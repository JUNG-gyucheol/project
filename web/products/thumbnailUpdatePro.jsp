<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.ProductBean" %>
<%@ page import="com.product.ThumbnailBean" %>
<%@ page import="java.util.Set" %>
<%@ page import="javax.print.attribute.SetOfIntegerSyntax" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/04
  Time: 3:16 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int productNum = Integer.parseInt(request.getParameter("productNum"));
    ProductDAO productDAO = new ProductDAO();

    ThumbnailBean thumbnailBean = productDAO.getOneThumbnail(productNum);
    ProductBean productBean = productDAO.getOneproduct(productNum);

 request.setAttribute("productBean",productBean);
request.setAttribute("thumbnail", thumbnailBean);
RequestDispatcher dis = request.getRequestDispatcher("thumbnailUpdate.jsp");
dis.forward(request, response);
%>