<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/02
  Time: 5:21 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    request.setCharacterEncoding("UTF-8");
    String category = request.getParameter("category");
    String productName = request.getParameter("productName");
    String productPrice = request.getParameter("productPrice");
    String productColor = request.getParameter("productColor");
    request.setAttribute("category",category);
    request.setAttribute("productColor",productColor);
    request.setAttribute("productName",productName);
    request.setAttribute("productPrice",productPrice);
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("thumbnail.jsp");
    requestDispatcher.forward(request,response);


%>