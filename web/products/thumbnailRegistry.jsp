<%@ page import="com.product.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/02
  Time: 5:47 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String category = request.getParameter("category");
    String thumbnail = request.getParameter("thumbnail");
    String productName = request.getParameter("productName");
    String productPrice = request.getParameter("productPrice");
    String productColor = request.getParameter("productColor");
    ProductDAO productDAO = new ProductDAO();
    int result = productDAO.insertThumbnail(thumbnail,productName,productPrice,productColor,category);

    out.print(result);




%>
