<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.CartBean" %>
<%@ page import="com.product.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/12
  Time: 3:24 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
        String[] num = request.getParameterValues("check");


        ProductDAO productDAO = new ProductDAO();
        ArrayList<CartBean> list = new ArrayList<>();
        for(int i = 0; i < num.length; i++){
        CartBean cartBean = productDAO.getOneCart(Integer.parseInt(num[i]));
        list.add(cartBean);
    }
        request.setAttribute("list",list);
        RequestDispatcher dis = request.getRequestDispatcher("cartPurchase.jsp");
        dis.forward(request,response);
%>