<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.*" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/03
  Time: 10:28 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    int productNum = Integer.parseInt(request.getParameter("productNum"));
    ProductDAO productDAO = new ProductDAO();
    ProductBean productBean = productDAO.getOneproduct(productNum);
    if(productBean.getMainCategory().equals("top")){
        ProductSizeBean productSizeBean = productDAO.productTop(productNum);
        request.setAttribute("productSizeBean", productSizeBean);
    } else if(productBean.getMainCategory().equals("bottom")){
       ProductsBottomSizeBean bottomSizeBean = productDAO.productBottom(productNum);
       request.setAttribute("bottomSizeBean", bottomSizeBean);
    } else if(productBean.getMainCategory().equals("shoes")){
       ProductsShoesBean productsShoesBean = productDAO.productShoes(productNum);
       request.setAttribute("productsShoesBean",productsShoesBean);
    }
    request.setAttribute("productBean", productBean);
    request.setAttribute("productNum",  productNum);
    RequestDispatcher dis = request.getRequestDispatcher("productView.jsp");
    dis.forward(request,response);
%>