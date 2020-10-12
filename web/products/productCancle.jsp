<%@ page import="com.product.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/03
  Time: 12:11 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String productName = request.getParameter("productName");

    ProductDAO productDAO = new ProductDAO();
    String category = productDAO.getCategory();
    int result = 0;
        if (category.equals("top")) {
            result = productDAO.productTopCancle();
            productDAO.productCancle();
            out.print(result);
        } else if (category.equals("bottom")) {
            result = productDAO.productBottomCancle();
            productDAO.productCancle();
            out.print(result);
        } else if (category.equals("shoes")) {
            result = productDAO.productShoesCancle();
            productDAO.productCancle();
            out.print(result);
    }else{
        result = 0;
        out.print(result);
    }

%>