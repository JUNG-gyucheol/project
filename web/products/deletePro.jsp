<%@ page import="com.product.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/04
  Time: 4:54 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int productNum = Integer.parseInt(request.getParameter("productNum"));
    String category  = request.getParameter("category");

    ProductDAO productDAO = new ProductDAO();
    int result = productDAO.deleteProduct(productNum);
    if(result == 1 ){
        if(category.equals("top")){
            productDAO.deleteTop(productNum);
        } else if(category.equals("bottom")){
            productDAO.deleteBottom(productNum);
        }else if(category.equals("shoes")){
            productDAO.deleteShoes(productNum);
        }
        result = productDAO.deleteThumbnail(productNum);
    } else{
        result = 0;
    }
    out.print(result);

%>