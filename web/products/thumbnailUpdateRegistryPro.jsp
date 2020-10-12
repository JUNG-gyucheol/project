<%@ page import="com.product.ThumbnailBean" %>
<%@ page import="com.product.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/04
  Time: 3:53 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

     int productnum = Integer.parseInt(request.getParameter("productNum"));
    String productName = request.getParameter("productName");
    String productPrice = request.getParameter("productPrice");
    String thumbnail = request.getParameter("thumbnail");

    ProductDAO productDAO = new ProductDAO();
    ThumbnailBean thumbnailBean = new ThumbnailBean();
    thumbnailBean.setThumbnail(thumbnail);
    thumbnailBean.setProductPrice(productPrice);
    thumbnailBean.setProductName(productName);
    thumbnailBean.setProductNum(productnum);

    int result = productDAO.updateThumbnail(thumbnailBean);

    out.print(result);
%>
